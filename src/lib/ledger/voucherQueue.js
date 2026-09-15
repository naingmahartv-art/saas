'use client';

import {
  saveLocalVoucher,
  updateLocalVoucher,
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

/**
 * Manually retry a specific voucher.
 */
export async function retryVoucher(orgId, id) {
  await updateLocalVoucher(id, { status: 'pending', error: null }, orgId);
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
    if (v.status === 'failed' || v.status === 'syncing') {
      await updateLocalVoucher(v.id, { status: 'pending', error: null }, orgId);
    }
  }
  emit({ type: 'updated', orgId });
  if (!getOfflineMode(orgId)) {
    return drainQueue(orgId);
  }
}

/**
 * Push every pending voucher for this org to the server, oldest first.
 */
export async function drainQueue(orgId) {
  if (getOfflineMode(orgId)) return; // Standalone offline mode: no network sync
  if (draining.has(orgId)) return;
  draining.add(orgId);

  try {
    // Check and migrate legacy localStorage items once
    await migrateLegacyLocalStorageQueue(orgId);

    // Drain all pending vouchers
    for (;;) {
      if (getOfflineMode(orgId)) return;

      const all = await getLocalVouchers(orgId);
      const pendingItems = all.filter(v => v.status === 'pending');

      if (pendingItems.length === 0) {
        return;
      }

      // Oldest first
      const item = pendingItems[pendingItems.length - 1];

      await updateLocalVoucher(item.id, {
        status: 'syncing',
        lastAttemptAt: Date.now(),
        retryCount: (item.retryCount || 0) + 1,
      }, orgId);

      emit({ type: 'syncing', orgId, clientId: item.id });

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
        // Network-level failure or abort timeout — revert status to 'pending'
        await updateLocalVoucher(item.id, {
          status: 'pending',
          error: networkErr?.name === 'AbortError' ? 'Request timed out' : 'Network disconnected / offline',
        }, orgId);
        emit({ type: 'network_offline', orgId, clientId: item.id });
        return;
      }

      const data = await res.json().catch(() => ({}));

      if (res.ok) {
        // Successfully saved on server — update status to synced (never delete)
        await updateLocalVoucher(item.id, {
          status: 'synced',
          srNo: data.srNo ?? item.srNo,
          syncedAt: Date.now(),
          error: null,
        }, orgId);

        emit({ type: 'saved', orgId, clientId: item.id, srNo: data.srNo ?? item.srNo });
      } else {
        const status = res.status;
        if (status >= 500 || status === 429) {
          // Temporary server error or rate limit — keep as pending to retry later
          await updateLocalVoucher(item.id, {
            status: 'pending',
            error: data.error || `Server temporary error (${status})`,
          }, orgId);
          emit({ type: 'server_error', orgId, clientId: item.id, error: data.error });
          return;
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

