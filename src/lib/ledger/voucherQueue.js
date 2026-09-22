'use client';

import {
  saveLocalVoucher,
  updateLocalVoucher,
  deleteLocalVoucher,
  getLocalVouchers,
  getLocalVoucherCounts,
  migrateLegacyLocalStorageQueue,
  getOfflineMode,
} from './localVoucherDb.js';

// Durable, per-org IndexedDB local storage & queue for voucher saves and updates.
// Lets the Save button return instantly while a background loop pushes
// vouchers to the server for partial-offline and online users.
// In Fully Offline Standalone Mode, background push is paused.

const draining = new Set(); // orgIds currently mid-drain, to avoid overlapping loops
const listeners = new Set(); // ({ type: 'saved'|'failed'|'syncing'|'updated', orgId, clientId, srNo?, error? }) => void

function emit(event) {
  for (const fn of listeners) {
    try {
      fn(event);
    } catch (err) {
      console.error('Error in queue listener:', err);
    }
  }
}

/** Subscribe to queue events. Returns an unsubscribe function. */
export function onQueueEvent(fn) {
  listeners.add(fn);
  return () => listeners.delete(fn);
}

/** Queue a voucher for saving/updating and kick off a drain attempt (not awaited). */
export function enqueue(orgId, voucher) {
  const clientId = voucher.clientId || voucher.id || (typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function'
    ? crypto.randomUUID()
    : 'v_' + Math.random().toString(36).substring(2, 11) + Date.now().toString(36));

  const isBuy = voucher.isBuyVoucher === true || voucher.voucherType === 'buy' || voucher.agentId === 'buy_offload';

  const payload = {
    clientId,
    id: clientId,
    voucherId: voucher.voucherId || clientId,
    orgId,
    tokens: voucher.tokens || [],
    entries: voucher.entries || [],
    items: voucher.items || [],
    agentId: voucher.agentId || (isBuy ? 'buy_offload' : ''),
    agentName: voucher.agentName || (isBuy ? 'Buy Offload (အဝယ်စာရင်း)' : voucher.agentId || ''),
    amount: typeof voucher.amount === 'number' ? voucher.amount : 0,
    onCount: voucher.onCount || 1,
    ampm: voucher.ampm || '',
    onDate: voucher.onDate || '',
    machineId: voucher.machineId || null,
    voucherType: isBuy ? 'buy' : 'sale',
    isBuyVoucher: isBuy,
    action: voucher.action || 'create', // 'create' | 'update' | 'delete'
    status: 'pending',
    srNo: voucher.srNo || null,
    createdAt: voucher.createdAt || Date.now(),
  };

  saveLocalVoucher(payload).then(() => {
    emit({ type: 'queued', orgId, clientId });
    if (!getOfflineMode(orgId)) {
      drainQueue(orgId);
    }
  }).catch((err) => {
    console.error('Failed to enqueue local voucher:', err);
  });

  return clientId;
}

export async function queueLength(orgId) {
  const counts = await getLocalVoucherCounts(orgId);
  return counts.pending + counts.failed;
}

export async function getVoucherCounts(orgId) {
  return getLocalVoucherCounts(orgId);
}

const MAX_AUTO_RETRIES = 3;

/**
 * Manually retry a specific voucher.
 */
export async function retryVoucher(orgId, id) {
  await updateLocalVoucher(id, { status: 'pending', retryCount: 0, error: null }, orgId);
  emit({ type: 'updated', orgId, clientId: id });
  if (!getOfflineMode(orgId)) {
    return drainQueue(orgId);
  }
}

/**
 * Manually retry all failed or pending vouchers for an organization.
 */
export async function retryAllPendingOrFailed(orgId) {
  const vouchers = await getLocalVouchers(orgId);
  for (const v of vouchers) {
    if (v.status === 'failed' || v.status === 'syncing' || v.status === 'pending') {
      await updateLocalVoucher(v.id, { status: 'pending', retryCount: 0, error: null }, orgId);
    }
  }
  emit({ type: 'updated', orgId });
  if (!getOfflineMode(orgId)) {
    return drainQueue(orgId);
  }
}

/**
 * Push every pending voucher for this org to the server, oldest first.
 * If an item fails repeatedly (>= 3 retries), it is marked as 'failed' and skipped
 * so subsequent pending vouchers are not blocked.
 */
export async function drainQueue(orgId) {
  if (getOfflineMode(orgId)) return; // Standalone offline mode: no network sync
  if (draining.has(orgId)) return;
  draining.add(orgId);

  try {
    // Check and migrate legacy localStorage items once
    await migrateLegacyLocalStorageQueue(orgId);

    // Self-healing: check any vouchers stuck in 'syncing' status from prior interruptions
    const initialVouchers = await getLocalVouchers(orgId);
    for (const v of initialVouchers) {
      if (v.status === 'syncing') {
        if ((v.retryCount || 0) >= MAX_AUTO_RETRIES) {
          await updateLocalVoucher(v.id, {
            status: 'failed',
            error: v.error || `Failed after ${MAX_AUTO_RETRIES} attempts`,
          }, orgId);
        } else {
          await updateLocalVoucher(v.id, { status: 'pending' }, orgId);
        }
      }
    }

    // Track items that failed during this pass to avoid infinite looping within a single drain
    const failedThisPass = new Set();

    // Drain all pending vouchers
    for (;;) {
      if (getOfflineMode(orgId)) return;

      const all = await getLocalVouchers(orgId);
      const pendingItems = all.filter(v => v.status === 'pending' && !failedThisPass.has(v.id));

      if (pendingItems.length === 0) {
        return;
      }

      // Oldest first
      const item = pendingItems[pendingItems.length - 1];
      const newRetryCount = (item.retryCount || 0) + 1;

      await updateLocalVoucher(item.id, {
        status: 'syncing',
        lastAttemptAt: Date.now(),
        retryCount: newRetryCount,
      }, orgId);

      emit({ type: 'syncing', orgId, clientId: item.id });

      try {
        let res;
        try {
          const controller = new AbortController();
          const timeoutId = setTimeout(() => controller.abort(), 12000);

          const isBuy = item.voucherType === 'buy' || item.isBuyVoucher === true;

          if (item.action === 'delete') {
            const qs = new URLSearchParams({
              onCount: String(item.onCount || 1),
              ampm: item.ampm || '',
              onDate: item.onDate || '',
            }).toString();
            res = await fetch(`/api/org/${orgId}/ledger/${item.voucherId || item.id}?${qs}`, {
              method: 'DELETE',
              signal: controller.signal,
            });
          } else if (item.action === 'update') {
            res = await fetch(`/api/org/${orgId}/ledger/${item.voucherId || item.id}`, {
              method: 'PUT',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({
                agentId: item.agentId,
                tokens: item.tokens,
                onCount: item.onCount,
                ampm: item.ampm,
                onDate: item.onDate,
              }),
              signal: controller.signal,
            });
          } else if (isBuy) {
            res = await fetch(`/api/org/${orgId}/ledger/buy-voucher`, {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({
                clientId: item.id,
                agentId: item.agentId || 'buy_offload',
                tokens: item.tokens,
                items: item.items || item.entries || [],
                onCount: item.onCount,
                ampm: item.ampm,
                onDate: item.onDate,
                machineId: item.machineId,
              }),
              signal: controller.signal,
            });
          } else {
            res = await fetch(`/api/org/${orgId}/ledger`, {
              method: 'POST',
              headers: { 'Content-Type': 'application/json' },
              body: JSON.stringify({
                clientId: item.id,
                agentId: item.agentId,
                tokens: item.tokens,
                onCount: item.onCount,
                ampm: item.ampm,
                onDate: item.onDate,
                machineId: item.machineId,
              }),
              signal: controller.signal,
            });
          }
          clearTimeout(timeoutId);
        } catch (networkErr) {
          const isTimeout = networkErr?.name === 'AbortError';
          const errMsg = isTimeout ? 'Request timed out' : 'Network disconnected / offline';

          if (newRetryCount >= MAX_AUTO_RETRIES) {
            await updateLocalVoucher(item.id, {
              status: 'failed',
              error: `${errMsg} (Failed after ${MAX_AUTO_RETRIES} retries)`,
            }, orgId);
            emit({ type: 'failed', orgId, clientId: item.id, error: errMsg });
          } else {
            await updateLocalVoucher(item.id, {
              status: 'pending',
              error: errMsg,
            }, orgId);
            failedThisPass.add(item.id);
            emit({ type: 'network_offline', orgId, clientId: item.id });
          }
          continue;
        }

        const data = await res.json().catch(() => ({}));

        if (res.ok) {
          if (item.action === 'delete') {
            await deleteLocalVoucher(item.id, orgId);
            emit({ type: 'deleted', orgId, clientId: item.id });
          } else {
            // Successfully saved or updated on server — update status to synced
            await updateLocalVoucher(item.id, {
              status: 'synced',
              srNo: data.srNo ?? item.srNo,
              syncedAt: Date.now(),
              error: null,
            }, orgId);

            emit({ type: 'saved', orgId, clientId: item.id, srNo: data.srNo ?? item.srNo });
          }
        } else {
          const status = res.status;
          if (status >= 500 || status === 429) {
            const errMsg = data.error || `Server temporary error (${status})`;
            if (newRetryCount >= MAX_AUTO_RETRIES) {
              // Exceeded max retries: mark as failed and skip so it doesn't block other vouchers
              await updateLocalVoucher(item.id, {
                status: 'failed',
                error: `${errMsg} (Failed after ${MAX_AUTO_RETRIES} retries)`,
              }, orgId);
              emit({ type: 'failed', orgId, clientId: item.id, error: errMsg });
            } else {
              // Under retry limit: keep pending, skip for this pass so other vouchers can sync
              await updateLocalVoucher(item.id, {
                status: 'pending',
                error: errMsg,
              }, orgId);
              failedThisPass.add(item.id);
              emit({ type: 'server_error', orgId, clientId: item.id, error: errMsg });
            }
          } else {
            // Client/Validation rejection (4xx) — mark as failed so user can inspect and resolve
            const errorMsg = data.error || 'Server validation failed';
            await updateLocalVoucher(item.id, {
              status: 'failed',
              error: errorMsg,
            }, orgId);

            emit({
              type: 'failed',
              orgId,
              clientId: item.id,
              tokens: item.tokens,
              error: errorMsg,
            });
          }
        }
      } catch (itemErr) {
        console.error('Unexpected error processing queue item:', itemErr);
        const errMsg = itemErr?.message || 'Processing error';
        if (newRetryCount >= MAX_AUTO_RETRIES) {
          await updateLocalVoucher(item.id, {
            status: 'failed',
            error: `${errMsg} (Failed after ${MAX_AUTO_RETRIES} retries)`,
          }, orgId);
          emit({ type: 'failed', orgId, clientId: item.id, error: errMsg });
        } else {
          await updateLocalVoucher(item.id, {
            status: 'pending',
            error: errMsg,
          }, orgId);
          failedThisPass.add(item.id);
        }
      }
    }
  } finally {
    draining.delete(orgId);
  }
}

/** Wire up automatic draining (page load, reconnect, periodic safety net). Returns a cleanup function. */
export function startAutoDrain(orgId) {
  if (!getOfflineMode(orgId)) {
    drainQueue(orgId);
  }

  const onOnline = () => {
    if (!getOfflineMode(orgId)) {
      drainQueue(orgId);
    }
  };

  const onModeChange = (e) => {
    if (e.detail?.orgId === orgId && !e.detail?.enabled) {
      drainQueue(orgId);
    }
  };

  if (typeof window !== 'undefined') {
    window.addEventListener('online', onOnline);
    window.addEventListener('offline_mode_change', onModeChange);
    const interval = setInterval(() => {
      if (!getOfflineMode(orgId) && (typeof navigator === 'undefined' || navigator.onLine !== false)) {
        drainQueue(orgId);
      }
    }, 5000);

    return () => {
      window.removeEventListener('online', onOnline);
      window.removeEventListener('offline_mode_change', onModeChange);
      clearInterval(interval);
    };
  }

  return () => {};
}

