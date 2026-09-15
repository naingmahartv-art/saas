'use client';

import {
  saveLocalVoucher,
  updateLocalVoucher,
  getLocalVouchers,
  getLocalVoucherCounts,
  migrateLegacyLocalStorageQueue,
} from './localVoucherDb.js';

// Durable, per-org IndexedDB local storage & queue for voucher saves.
// Lets the Save button return instantly while a background loop pushes
// vouchers to the server.
// Vouchers are NEVER deleted on sync finish or failure, ensuring full auditability,
// offline safety, and the ability to manually inspect & retry from the Local Vouchers page.

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

/** Queue a voucher for saving and kick off a drain attempt (not awaited). */
export function enqueue(orgId, voucher) {
  const clientId = typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function'
    ? crypto.randomUUID()
    : 'v_' + Math.random().toString(36).substring(2, 11) + Date.now().toString(36);

  const payload = {
    clientId,
    orgId,
    tokens: voucher.tokens || [],
    agentId: voucher.agentId || '',
    onCount: voucher.onCount || 1,
    ampm: voucher.ampm || '',
    onDate: voucher.onDate || '',
    machineId: voucher.machineId || null,
    status: 'pending',
    createdAt: Date.now(),
  };

  saveLocalVoucher(payload).then(() => {
    emit({ type: 'queued', orgId, clientId });
    drainQueue(orgId);
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
  return drainQueue(orgId);
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
  return drainQueue(orgId);
}

/**
 * Push every pending voucher for this org to the server, oldest first.
 */
export async function drainQueue(orgId) {
  if (draining.has(orgId)) return;
  draining.add(orgId);

  try {
    // Check and migrate legacy localStorage items once
    await migrateLegacyLocalStorageQueue(orgId);

    // Drain all pending vouchers
    for (;;) {
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
          srNo: data.srNo,
          syncedAt: Date.now(),
          error: null,
        }, orgId);

        emit({ type: 'saved', orgId, clientId: item.id, srNo: data.srNo });
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
  drainQueue(orgId);

  const onOnline = () => {
    drainQueue(orgId);
  };

  if (typeof window !== 'undefined') {
    window.addEventListener('online', onOnline);
    const interval = setInterval(() => {
      if (typeof navigator === 'undefined' || navigator.onLine !== false) {
        drainQueue(orgId);
      }
    }, 5000);

    return () => {
      window.removeEventListener('online', onOnline);
      clearInterval(interval);
    };
  }

  return () => {};
}
