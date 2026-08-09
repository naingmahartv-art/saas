'use client';

// Durable, per-org local queue for voucher saves — lets the Save button
// return instantly (write to localStorage, no network wait) while a
// background loop pushes queued vouchers to the server. Survives a reload or
// crash: anything still queued when the page comes back is drained again.
// Each item carries a client-generated id used as the server's Firestore
// document id, so a retried request (e.g. the ack was lost but the write
// actually landed) is a safe no-op rather than a duplicate voucher.

const queueKey = (orgId) => `voucher_queue_${orgId}`;
const draining = new Set(); // orgIds currently mid-drain, to avoid overlapping loops
const listeners = new Set(); // ({ type: 'saved'|'failed', orgId, clientId, srNo?, error? }) => void

function readQueue(orgId) {
  try {
    const raw = localStorage.getItem(queueKey(orgId));
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function writeQueue(orgId, items) {
  try {
    localStorage.setItem(queueKey(orgId), JSON.stringify(items));
  } catch {
    // localStorage unavailable/full — the in-flight enqueue still gets
    // attempted via drainQueue's immediate call, just isn't durable.
  }
}

function emit(event) {
  for (const fn of listeners) fn(event);
}

/** Subscribe to per-item drain outcomes. Returns an unsubscribe function. */
export function onQueueEvent(fn) {
  listeners.add(fn);
  return () => listeners.delete(fn);
}

/** Queue a voucher for saving and kick off a drain attempt (not awaited). */
export function enqueue(orgId, voucher) {
  const clientId = typeof crypto !== 'undefined' && typeof crypto.randomUUID === 'function'
    ? crypto.randomUUID()
    : Math.random().toString(36).substring(2, 15) + Date.now().toString(36);
  const item = { clientId, queuedAt: Date.now(), ...voucher };
  writeQueue(orgId, [...readQueue(orgId), item]);
  drainQueue(orgId);
  return clientId;
}

export function queueLength(orgId) {
  return readQueue(orgId).length;
}

/** Push every queued voucher for this org to the server, oldest first. */
export async function drainQueue(orgId) {
  if (draining.has(orgId)) return;
  draining.add(orgId);
  try {
    // Re-read each loop — enqueue() may have added more while we're running.
    for (;;) {
      const queue = readQueue(orgId);
      if (queue.length === 0) return;
      const item = queue[0];

      let res;
      try {
        res = await fetch(`/api/org/${orgId}/ledger`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(item),
        });
      } catch {
        // Network-level failure — stop for now, everything still queued, a
        // later trigger (interval/online event) will pick up where we left off.
        return;
      }

      const data = await res.json().catch(() => ({}));

      if (res.ok) {
        writeQueue(orgId, readQueue(orgId).filter(q => q.clientId !== item.clientId));
        emit({ type: 'saved', orgId, clientId: item.clientId, srNo: data.srNo });
      } else {
        // Server rejected it outright (bad session, validation, etc.) —
        // retrying the same request would just fail again, so drop it and
        // surface the failure instead of leaving it stuck in the queue forever.
        writeQueue(orgId, readQueue(orgId).filter(q => q.clientId !== item.clientId));
        emit({ type: 'failed', orgId, clientId: item.clientId, tokens: item.tokens, error: data.error || 'Failed to save' });
      }
    }
  } finally {
    draining.delete(orgId);
  }
}

/** Wire up automatic draining (page load, reconnect, periodic safety net). Returns a cleanup function. */
export function startAutoDrain(orgId) {
  drainQueue(orgId);

  const onOnline = () => drainQueue(orgId);
  window.addEventListener('online', onOnline);
  const interval = setInterval(() => drainQueue(orgId), 4000);

  return () => {
    window.removeEventListener('online', onOnline);
    clearInterval(interval);
  };
}
