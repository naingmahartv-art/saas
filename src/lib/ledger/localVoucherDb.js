'use client';

import { DB_NAME, DB_VERSION, STORES, initDbSchema } from './dbSchema.js';
import {
  toCanonicalVoucher,
  toIndexedDbRecord,
  fromIndexedDbRecord,
  fromFirestoreDoc,
} from './voucherAdapter.js';
import { toCanonicalSession, fromFirestoreSession } from './sessionAdapter.js';
import { toCanonicalLimit, resolveEffectiveLimits } from './limitAdapter.js';
import { toCanonicalAgent } from './agentAdapter.js';
import { toCanonicalMachine, allocateNextSerial } from './machineAdapter.js';

let dbPromise = null;

// Cross-tab / cross-window instant event bus
const SYNC_CHANNEL_NAME = 'lottery_ledger_sync';
let syncBroadcastChannel = null;

if (typeof window !== 'undefined' && typeof window.BroadcastChannel !== 'undefined') {
  try {
    syncBroadcastChannel = new BroadcastChannel(SYNC_CHANNEL_NAME);
  } catch (e) {
    console.warn('BroadcastChannel not supported or failed to init:', e);
  }
}

/**
 * Universal broadcast for any data change across all 5 stores.
 */
export function broadcastLocalChange(change = {}) {
  if (syncBroadcastChannel) {
    try {
      syncBroadcastChannel.postMessage(change);
    } catch (e) {
      console.warn('Failed to broadcast message:', e);
    }
  }
  if (typeof window !== 'undefined') {
    window.dispatchEvent(new CustomEvent('lottery_local_sync_change', { detail: change }));
    // Legacy event backward-compatibility
    if (change.store === STORES.VOUCHERS || change.type === 'save' || change.type === 'update' || change.type === 'delete') {
      window.dispatchEvent(new CustomEvent('lottery_local_voucher_change', { detail: change }));
    }
  }
}

export function broadcastVoucherChange(change) {
  broadcastLocalChange({ store: STORES.VOUCHERS, ...change });
}

/**
 * Universal subscriber for local data changes.
 */
export function onLocalSyncChange(callback) {
  if (typeof window === 'undefined') return () => {};

  const handleBroadcast = (event) => {
    if (event.data) callback(event.data);
  };

  const handleWindowCustomEvent = (event) => {
    if (event.detail) callback(event.detail);
  };

  if (syncBroadcastChannel) {
    syncBroadcastChannel.addEventListener('message', handleBroadcast);
  }
  window.addEventListener('lottery_local_sync_change', handleWindowCustomEvent);

  return () => {
    if (syncBroadcastChannel) {
      syncBroadcastChannel.removeEventListener('message', handleBroadcast);
    }
    window.removeEventListener('lottery_local_sync_change', handleWindowCustomEvent);
  };
}

export function onLocalVoucherChange(callback) {
  return onLocalSyncChange((data) => {
    if (!data.store || data.store === STORES.VOUCHERS) {
      callback(data);
    }
  });
}

function getDb() {
  if (typeof window === 'undefined' || !window.indexedDB) {
    return Promise.resolve(null);
  }
  if (!dbPromise) {
    dbPromise = new Promise((resolve) => {
      try {
        const request = window.indexedDB.open(DB_NAME, DB_VERSION);
        request.onupgradeneeded = (event) => {
          const db = event.target.result;
          const tx = event.target.transaction;
          initDbSchema(db, tx);
        };
        request.onsuccess = () => resolve(request.result);
        request.onerror = () => {
          console.warn('IndexedDB failed to open, fallback to localStorage', request.error);
          resolve(null);
        };
      } catch (err) {
        console.warn('IndexedDB exception:', err);
        resolve(null);
      }
    });
  }
  return dbPromise;
}

// ─────────────────────────────────────────────────────────────────────────────
// 1. SESSIONS STORE (local_sessions)
// ─────────────────────────────────────────────────────────────────────────────

const sessionsFallbackKey = (orgId) => `local_sessions_fallback_${orgId}`;

function readSessionsFallback(orgId) {
  try {
    const raw = localStorage.getItem(sessionsFallbackKey(orgId));
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function writeSessionsFallback(orgId, items) {
  try {
    localStorage.setItem(sessionsFallbackKey(orgId), JSON.stringify(items));
  } catch (err) {
    console.error('Failed to write to sessions fallback storage:', err);
  }
}

export async function saveLocalSession(session, orgId = '') {
  const canonical = toCanonicalSession(session, orgId);
  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.SESSIONS, 'readwrite');
        const store = tx.objectStore(STORES.SESSIONS);
        const req = store.put(canonical);
        req.onsuccess = () => resolve(canonical);
        req.onerror = () => reject(req.error);
      });
    } catch (err) {
      console.warn('Failed to save session to IndexedDB, saving to fallback:', err);
    }
  }

  const list = readSessionsFallback(canonical.orgId).filter((s) => s.id !== canonical.id);
  writeSessionsFallback(canonical.orgId, [canonical, ...list]);

  broadcastLocalChange({
    store: STORES.SESSIONS,
    type: 'save',
    orgId: canonical.orgId,
    sessionId: canonical.sessionId,
    session: canonical,
  });

  return canonical;
}

export async function getLocalSession(orgId, sessionId) {
  if (!orgId || !sessionId) return null;
  const db = await getDb();
  const id = `${orgId}_${sessionId}`;
  if (db) {
    try {
      const res = await new Promise((resolve) => {
        const tx = db.transaction(STORES.SESSIONS, 'readonly');
        const store = tx.objectStore(STORES.SESSIONS);
        const req = store.get(id);
        req.onsuccess = () => resolve(req.result || null);
        req.onerror = () => resolve(null);
      });
      if (res) return res;
    } catch {
      // fallback
    }
  }

  const list = readSessionsFallback(orgId);
  return list.find((s) => s.id === id || s.sessionId === sessionId) || null;
}

export async function getLocalSessions(orgId) {
  if (!orgId) return [];
  const db = await getDb();
  if (db) {
    try {
      const list = await new Promise((resolve) => {
        const tx = db.transaction(STORES.SESSIONS, 'readonly');
        const store = tx.objectStore(STORES.SESSIONS);
        const index = store.index('orgId');
        const req = index.getAll(IDBKeyRange.only(orgId));
        req.onsuccess = () => resolve(req.result || []);
        req.onerror = () => resolve([]);
      });
      if (list && list.length > 0) return list;
    } catch {
      // fallback
    }
  }
  return readSessionsFallback(orgId);
}

// ─────────────────────────────────────────────────────────────────────────────
// 2. LIMITS STORE (local_limits)
// ─────────────────────────────────────────────────────────────────────────────

const limitsFallbackKey = (orgId, sessionId) => `local_limits_${orgId}_${sessionId}`;

function readLimitsFallback(orgId, sessionId) {
  try {
    const raw = localStorage.getItem(limitsFallbackKey(orgId, sessionId));
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function writeLimitsFallback(orgId, sessionId, items) {
  try {
    localStorage.setItem(limitsFallbackKey(orgId, sessionId), JSON.stringify(items));
  } catch (err) {
    console.error('Failed to write limits fallback:', err);
  }
}

export async function saveLocalLimit(orgId, sessionId, num, limitAmount, clearedAmount = 0) {
  const canonical = toCanonicalLimit(num, limitAmount, clearedAmount, orgId, sessionId);
  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.LIMITS, 'readwrite');
        const store = tx.objectStore(STORES.LIMITS);
        const req = store.put(canonical);
        req.onsuccess = () => resolve(canonical);
        req.onerror = () => reject(req.error);
      });
    } catch (err) {
      console.warn('Failed to save limit to IndexedDB:', err);
    }
  }

  const list = readLimitsFallback(orgId, sessionId).filter((l) => l.id !== canonical.id);
  writeLimitsFallback(orgId, sessionId, [canonical, ...list]);

  broadcastLocalChange({
    store: STORES.LIMITS,
    type: 'save',
    orgId,
    sessionId,
    limit: canonical,
  });

  return canonical;
}

export async function saveLocalLimitsBulk(orgId, sessionId, limitsArray) {
  if (!orgId || !sessionId || !Array.isArray(limitsArray)) return;
  const canonicals = limitsArray.map((l) =>
    toCanonicalLimit(l.num, l.limitAmount, l.clearedAmount, orgId, sessionId)
  );

  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.LIMITS, 'readwrite');
        const store = tx.objectStore(STORES.LIMITS);
        for (const item of canonicals) {
          store.put(item);
        }
        tx.oncomplete = () => resolve();
        tx.onerror = () => reject(tx.error);
      });
    } catch (err) {
      console.warn('Failed to bulk save limits:', err);
    }
  }

  writeLimitsFallback(orgId, sessionId, canonicals);

  broadcastLocalChange({
    store: STORES.LIMITS,
    type: 'bulk_save',
    orgId,
    sessionId,
    limits: canonicals,
  });
}

export async function getLocalLimits(orgId, sessionId) {
  if (!orgId || !sessionId) return [];
  const db = await getDb();
  if (db) {
    try {
      const list = await new Promise((resolve) => {
        const tx = db.transaction(STORES.LIMITS, 'readonly');
        const store = tx.objectStore(STORES.LIMITS);
        const index = store.index('orgId_sessionId');
        const req = index.getAll(IDBKeyRange.only([orgId, sessionId]));
        req.onsuccess = () => resolve(req.result || []);
        req.onerror = () => resolve([]);
      });
      if (list && list.length > 0) return list;
    } catch {
      // fallback
    }
  }
  return readLimitsFallback(orgId, sessionId);
}

export async function clearLocalLimitForNumber(orgId, sessionId, num, clearAmount) {
  const currentLimits = await getLocalLimits(orgId, sessionId);
  const numStr = String(num).padStart(2, '0');
  const existing = currentLimits.find((l) => l.num === numStr);
  const baseLimit = existing ? existing.limitAmount : 0;
  const newCleared = (existing ? existing.clearedAmount : 0) + Number(clearAmount);

  return saveLocalLimit(orgId, sessionId, numStr, baseLimit, newCleared);
}

export async function clearAllLocalLimitsForSession(orgId, sessionId) {
  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.LIMITS, 'readwrite');
        const store = tx.objectStore(STORES.LIMITS);
        const index = store.index('orgId_sessionId');
        const req = index.openKeyCursor(IDBKeyRange.only([orgId, sessionId]));
        req.onsuccess = (e) => {
          const cursor = e.target.result;
          if (cursor) {
            store.delete(cursor.primaryKey);
            cursor.continue();
          } else {
            resolve();
          }
        };
        req.onerror = () => reject(req.error);
      });
    } catch (err) {
      console.warn('Failed to clear limits in IndexedDB:', err);
    }
  }

  localStorage.removeItem(limitsFallbackKey(orgId, sessionId));

  broadcastLocalChange({
    store: STORES.LIMITS,
    type: 'clear_all',
    orgId,
    sessionId,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// 3. AGENTS STORE (local_agents)
// ─────────────────────────────────────────────────────────────────────────────

const agentsFallbackKey = (orgId) => `local_agents_fallback_${orgId}`;

function readAgentsFallback(orgId) {
  try {
    const raw = localStorage.getItem(agentsFallbackKey(orgId)) || localStorage.getItem(`agents_cache_${orgId}`);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function writeAgentsFallback(orgId, items) {
  try {
    localStorage.setItem(agentsFallbackKey(orgId), JSON.stringify(items));
    localStorage.setItem(`agents_cache_${orgId}`, JSON.stringify(items));
  } catch (err) {
    console.error('Failed to write to agent fallback storage:', err);
  }
}

export async function saveLocalAgent(agent, orgId = '') {
  const canonical = toCanonicalAgent(agent, orgId);
  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.AGENTS, 'readwrite');
        const store = tx.objectStore(STORES.AGENTS);
        const req = store.put(canonical);
        req.onsuccess = () => resolve(req.result);
        req.onerror = () => reject(req.error);
      });
    } catch (err) {
      console.warn('Failed to put agent to IndexedDB:', err);
    }
  }

  const list = readAgentsFallback(canonical.orgId);
  const idx = list.findIndex((a) => a.id === canonical.id || a.agentId === canonical.agentId);
  if (idx >= 0) list[idx] = canonical;
  else list.push(canonical);
  list.sort((a, b) => (a.agentName || '').localeCompare(b.agentName || ''));
  writeAgentsFallback(canonical.orgId, list);

  broadcastLocalChange({
    store: STORES.AGENTS,
    type: 'save',
    orgId: canonical.orgId,
    agent: canonical,
  });

  return canonical;
}

export async function saveLocalAgentsBulk(orgId, agents) {
  if (!orgId || !Array.isArray(agents)) return;
  const normalized = agents.map((a) => toCanonicalAgent(a, orgId));

  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.AGENTS, 'readwrite');
        const store = tx.objectStore(STORES.AGENTS);
        normalized.forEach((item) => store.put(item));
        tx.oncomplete = () => resolve();
        tx.onerror = () => reject(tx.error);
      });
    } catch (err) {
      console.warn('Failed to bulk put agents in IndexedDB:', err);
    }
  }

  writeAgentsFallback(orgId, normalized);

  broadcastLocalChange({
    store: STORES.AGENTS,
    type: 'bulk_save',
    orgId,
    agents: normalized,
  });
}

export async function getLocalAgents(orgId) {
  if (!orgId) return [];
  const db = await getDb();
  if (db) {
    try {
      const items = await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.AGENTS, 'readonly');
        const store = tx.objectStore(STORES.AGENTS);
        const index = store.index('orgId');
        const req = index.getAll(orgId);
        req.onsuccess = () => resolve(req.result || []);
        req.onerror = () => reject(req.error);
      });
      if (items && items.length > 0) {
        items.sort((a, b) => (a.agentName || '').localeCompare(b.agentName || ''));
        writeAgentsFallback(orgId, items);
        return items;
      }
    } catch (err) {
      console.warn('Failed to get agents from IndexedDB, using fallback:', err);
    }
  }

  const fallback = readAgentsFallback(orgId);
  fallback.sort((a, b) => (a.agentName || '').localeCompare(b.agentName || ''));
  return fallback;
}

export async function deleteLocalAgent(orgId, agentId) {
  if (!orgId || !agentId) return;
  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.AGENTS, 'readwrite');
        const store = tx.objectStore(STORES.AGENTS);
        const req = store.delete(agentId);
        req.onsuccess = () => resolve();
        req.onerror = () => reject(req.error);
      });
    } catch (err) {
      console.warn('Failed to delete agent from IndexedDB:', err);
    }
  }

  const list = readAgentsFallback(orgId).filter((a) => a.id !== agentId && a.agentId !== agentId);
  writeAgentsFallback(orgId, list);

  broadcastLocalChange({
    store: STORES.AGENTS,
    type: 'delete',
    orgId,
    agentId,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// 4. MACHINES STORE (local_machines)
// ─────────────────────────────────────────────────────────────────────────────

const machinesFallbackKey = (orgId) => `local_machines_fallback_${orgId}`;

function readMachinesFallback(orgId) {
  try {
    const raw = localStorage.getItem(machinesFallbackKey(orgId)) || localStorage.getItem(`machines_cache_${orgId}`);
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function writeMachinesFallback(orgId, items) {
  try {
    localStorage.setItem(machinesFallbackKey(orgId), JSON.stringify(items));
    localStorage.setItem(`machines_cache_${orgId}`, JSON.stringify(items));
  } catch (err) {
    console.error('Failed to write machines fallback:', err);
  }
}

export async function saveLocalMachines(orgId, machines) {
  if (!orgId || !Array.isArray(machines)) return;
  const canonicals = machines.map((m) => toCanonicalMachine(m, orgId));

  const db = await getDb();
  if (db) {
    try {
      await new Promise((resolve, reject) => {
        const tx = db.transaction(STORES.MACHINES, 'readwrite');
        const store = tx.objectStore(STORES.MACHINES);
        canonicals.forEach((item) => store.put(item));
        tx.oncomplete = () => resolve();
        tx.onerror = () => reject(tx.error);
      });
    } catch (err) {
      console.warn('Failed to save machines to IndexedDB:', err);
    }
  }

  writeMachinesFallback(orgId, canonicals);

  broadcastLocalChange({
    store: STORES.MACHINES,
    type: 'bulk_save',
    orgId,
    machines: canonicals,
  });
}

export async function getLocalMachines(orgId) {
  if (!orgId) return [];
  const db = await getDb();
  if (db) {
    try {
      const items = await new Promise((resolve) => {
        const tx = db.transaction(STORES.MACHINES, 'readonly');
        const store = tx.objectStore(STORES.MACHINES);
        const index = store.index('orgId');
        const req = index.getAll(IDBKeyRange.only(orgId));
        req.onsuccess = () => resolve(req.result || []);
        req.onerror = () => resolve([]);
      });
      if (items && items.length > 0) return items;
    } catch {
      // fallback
    }
  }
  return readMachinesFallback(orgId);
}

export async function allocateLocalMachineSerial(orgId, machineId) {
  const machines = await getLocalMachines(orgId);
  const mid = Number(machineId) || 1;
  const target = machines.find((m) => m.machineId === mid) || toCanonicalMachine({ machineId: mid }, orgId);
  const { srNo, updatedMachine } = allocateNextSerial(target);

  await saveLocalMachines(orgId, [
    ...machines.filter((m) => m.machineId !== mid),
    updatedMachine,
  ]);

  return srNo;
}

// ─────────────────────────────────────────────────────────────────────────────
// 5. VOUCHERS STORE (local_vouchers)
// ─────────────────────────────────────────────────────────────────────────────

const vouchersFallbackKey = (orgId) => `local_vouchers_fallback_${orgId}`;

function readFallback(orgId) {
  try {
    const raw = localStorage.getItem(vouchersFallbackKey(orgId));
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function writeFallback(orgId, items) {
  try {
    localStorage.setItem(vouchersFallbackKey(orgId), JSON.stringify(items));
  } catch (err) {
    console.error('Failed to write to vouchers fallback storage:', err);
  }
}

export async function saveLocalVoucher(voucher) {
  const canonical = toCanonicalVoucher(voucher);
  const record = toIndexedDbRecord(canonical);

  const db = await getDb();
  if (db) {
    const res = await new Promise((resolve) => {
      try {
        const tx = db.transaction(STORES.VOUCHERS, 'readwrite');
        const store = tx.objectStore(STORES.VOUCHERS);
        const req = store.put(record);
        req.onsuccess = () => resolve(canonical);
        req.onerror = () => {
          const list = readFallback(canonical.orgId).filter((v) => v.id !== record.id);
          writeFallback(canonical.orgId, [record, ...list]);
          resolve(canonical);
        };
      } catch (err) {
        console.warn('IndexedDB write error, saving to fallback', err);
        const list = readFallback(canonical.orgId).filter((v) => v.id !== record.id);
        writeFallback(canonical.orgId, [record, ...list]);
        resolve(canonical);
      }
    });

    broadcastVoucherChange({
      type: 'save',
      orgId: canonical.orgId,
      sessionId: canonical.sessionId,
      voucher: canonical,
    });
    return res;
  }

  const list = readFallback(canonical.orgId).filter((v) => v.id !== record.id);
  writeFallback(canonical.orgId, [record, ...list]);

  broadcastVoucherChange({
    type: 'save',
    orgId: canonical.orgId,
    sessionId: canonical.sessionId,
    voucher: canonical,
  });
  return canonical;
}

export async function updateLocalVoucher(id, updates, orgId) {
  const db = await getDb();
  if (db) {
    const updated = await new Promise((resolve) => {
      try {
        const tx = db.transaction(STORES.VOUCHERS, 'readwrite');
        const store = tx.objectStore(STORES.VOUCHERS);
        const getReq = store.get(id);
        getReq.onsuccess = () => {
          const existing = getReq.result;
          if (!existing) {
            resolve(null);
            return;
          }
          const mergedCanonical = toCanonicalVoucher({ ...existing, ...updates });
          const mergedRecord = toIndexedDbRecord(mergedCanonical);
          const putReq = store.put(mergedRecord);
          putReq.onsuccess = () => resolve(mergedCanonical);
          putReq.onerror = () => resolve(fromIndexedDbRecord(existing));
        };
        getReq.onerror = () => resolve(null);
      } catch {
        resolve(null);
      }
    });

    if (updated) {
      broadcastVoucherChange({
        type: 'update',
        orgId: updated.orgId || orgId,
        sessionId: updated.sessionId,
        voucher: updated,
      });
    }
    return updated;
  }

  if (orgId) {
    const list = readFallback(orgId);
    let updatedRecord = null;
    const newList = list.map((v) => {
      if (v.id === id) {
        const mergedCanonical = toCanonicalVoucher({ ...v, ...updates });
        updatedRecord = toIndexedDbRecord(mergedCanonical);
        return updatedRecord;
      }
      return v;
    });
    writeFallback(orgId, newList);

    if (updatedRecord) {
      broadcastVoucherChange({
        type: 'update',
        orgId,
        sessionId: updatedRecord.sessionId,
        voucher: fromIndexedDbRecord(updatedRecord),
      });
    }
    return updatedRecord ? fromIndexedDbRecord(updatedRecord) : null;
  }
  return null;
}

export async function deleteLocalVoucher(id, orgId, sessionId = '') {
  const db = await getDb();
  if (db) {
    const success = await new Promise((resolve) => {
      try {
        const tx = db.transaction(STORES.VOUCHERS, 'readwrite');
        const store = tx.objectStore(STORES.VOUCHERS);
        const delReq = store.delete(id);
        delReq.onsuccess = () => resolve(true);
        delReq.onerror = () => resolve(false);
      } catch {
        resolve(false);
      }
    });

    if (success) {
      broadcastVoucherChange({
        type: 'delete',
        orgId,
        sessionId,
        voucherId: id,
      });
    }
    return success;
  }

  if (orgId) {
    const list = readFallback(orgId).filter((v) => v.id !== id);
    writeFallback(orgId, list);
    broadcastVoucherChange({
      type: 'delete',
      orgId,
      sessionId,
      voucherId: id,
    });
    return true;
  }
  return false;
}

export async function getLocalVouchersForSession(orgId, sessionId, filter = {}) {
  if (!orgId) return [];
  const db = await getDb();
  if (db && sessionId) {
    try {
      const items = await new Promise((resolve) => {
        const tx = db.transaction(STORES.VOUCHERS, 'readonly');
        const store = tx.objectStore(STORES.VOUCHERS);
        if (store.indexNames.contains('orgId_sessionId')) {
          const index = store.index('orgId_sessionId');
          const req = index.getAll(IDBKeyRange.only([orgId, sessionId]));
          req.onsuccess = () => resolve(req.result || []);
          req.onerror = () => resolve(null);
        } else {
          resolve(null);
        }
      });

      if (Array.isArray(items)) {
        let results = items.map(fromIndexedDbRecord);
        if (filter.status) {
          results = results.filter((v) => v.status === filter.status);
        }
        if (filter.voucherType) {
          results = results.filter((v) => v.voucherType === filter.voucherType);
        }
        if (filter.agentId) {
          results = results.filter((v) => v.agentId === filter.agentId || v.agentName === filter.agentId);
        }
        results.sort((a, b) => (b.createdAt || 0) - (a.createdAt || 0));
        return results;
      }
    } catch {
      // fallback
    }
  }

  return getLocalVouchers(orgId, { ...filter, sessionId });
}

export async function getLocalVouchers(orgId, filter = {}) {
  const db = await getDb();
  if (db) {
    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORES.VOUCHERS, 'readonly');
        const store = tx.objectStore(STORES.VOUCHERS);
        const index = store.index('orgId');
        const req = index.getAll(IDBKeyRange.only(orgId));
        req.onsuccess = () => {
          let results = (req.result || []).map(fromIndexedDbRecord);
          if (filter.sessionId) {
            results = results.filter((v) => v.sessionId === filter.sessionId);
          }
          if (filter.status) {
            results = results.filter((v) => v.status === filter.status);
          }
          if (filter.voucherType) {
            results = results.filter((v) => v.voucherType === filter.voucherType);
          }
          if (filter.onDate) {
            results = results.filter((v) => v.onDate === filter.onDate);
          }
          if (filter.ampm) {
            results = results.filter((v) => v.ampm === filter.ampm);
          }
          if (filter.agentId) {
            results = results.filter((v) => v.agentId === filter.agentId || v.agentName === filter.agentId);
          }
          results.sort((a, b) => (b.createdAt || 0) - (a.createdAt || 0));
          resolve(results);
        };
        req.onerror = () => {
          const fb = readFallback(orgId).map(fromIndexedDbRecord);
          resolve(fb);
        };
      } catch {
        const fb = readFallback(orgId).map(fromIndexedDbRecord);
        resolve(fb);
      }
    });
  }

  let list = readFallback(orgId).map(fromIndexedDbRecord);
  if (filter.sessionId) list = list.filter((v) => v.sessionId === filter.sessionId);
  if (filter.status) list = list.filter((v) => v.status === filter.status);
  if (filter.voucherType) list = list.filter((v) => v.voucherType === filter.voucherType);
  if (filter.onDate) list = list.filter((v) => v.onDate === filter.onDate);
  if (filter.ampm) list = list.filter((v) => v.ampm === filter.ampm);
  if (filter.agentId) list = list.filter((v) => v.agentId === filter.agentId || v.agentName === filter.agentId);
  list.sort((a, b) => (b.createdAt || 0) - (a.createdAt || 0));
  return list;
}

export async function cacheRemoteVouchersIntoLocalDb(orgId, remoteDocs, defaultSessionId = '') {
  if (!orgId || !Array.isArray(remoteDocs) || remoteDocs.length === 0) return 0;
  const db = await getDb();
  if (!db) return 0;

  return new Promise((resolve) => {
    try {
      const tx = db.transaction(STORES.VOUCHERS, 'readwrite');
      const store = tx.objectStore(STORES.VOUCHERS);
      let cachedCount = 0;

      for (const d of remoteDocs) {
        const canonical = fromFirestoreDoc(d, defaultSessionId, orgId);
        if (!canonical || !canonical.id) continue;
        const record = toIndexedDbRecord(canonical);
        store.put(record);
        cachedCount++;
      }

      tx.oncomplete = () => resolve(cachedCount);
      tx.onerror = () => resolve(0);
    } catch {
      resolve(0);
    }
  });
}

export async function getLocalVoucherCounts(orgId) {
  const all = await getLocalVouchers(orgId);
  let pending = 0;
  let failed = 0;
  let synced = 0;
  for (const v of all) {
    if (v.status === 'pending' || v.status === 'syncing') pending++;
    else if (v.status === 'failed') failed++;
    else if (v.status === 'synced') synced++;
  }
  return { pending, failed, synced, total: all.length };
}

export async function cleanLocalVouchersBeforeDate(orgId, targetDate) {
  if (!orgId || !targetDate) return 0;
  const db = await getDb();
  if (db) {
    const all = await getLocalVouchers(orgId);
    const toDelete = all.filter((v) => v.onDate && v.onDate <= targetDate);
    if (toDelete.length === 0) return 0;

    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORES.VOUCHERS, 'readwrite');
        const store = tx.objectStore(STORES.VOUCHERS);
        for (const item of toDelete) {
          store.delete(item.id);
        }
        tx.oncomplete = () => resolve(toDelete.length);
        tx.onerror = () => resolve(0);
      } catch {
        resolve(0);
      }
    });
  }

  const list = readFallback(orgId);
  const remaining = list.filter((v) => !v.onDate || v.onDate > targetDate);
  const removedCount = list.length - remaining.length;
  writeFallback(orgId, remaining);
  return removedCount;
}

export async function pruneSyncedLocalVouchers(orgId, daysOld = 3) {
  const cutoff = Date.now() - daysOld * 24 * 60 * 60 * 1000;
  const db = await getDb();
  if (db) {
    const all = await getLocalVouchers(orgId);
    const toDelete = all.filter((v) => v.status === 'synced' && v.syncedAt && v.syncedAt < cutoff);
    if (toDelete.length === 0) return 0;

    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORES.VOUCHERS, 'readwrite');
        const store = tx.objectStore(STORES.VOUCHERS);
        for (const item of toDelete) {
          store.delete(item.id);
        }
        tx.oncomplete = () => resolve(toDelete.length);
        tx.onerror = () => resolve(0);
      } catch {
        resolve(0);
      }
    });
  }

  const list = readFallback(orgId);
  const remaining = list.filter((v) => !(v.status === 'synced' && v.syncedAt && v.syncedAt < cutoff));
  const removedCount = list.length - remaining.length;
  writeFallback(orgId, remaining);
  return removedCount;
}

export function getOfflineMode(orgId) {
  if (typeof window === 'undefined') return false;
  try {
    return localStorage.getItem(`standalone_offline_mode_${orgId}`) === 'true';
  } catch {
    return false;
  }
}

export function setOfflineMode(orgId, enabled) {
  if (typeof window === 'undefined' || !orgId) return;
  try {
    const current = localStorage.getItem(`standalone_offline_mode_${orgId}`) === 'true';
    const next = Boolean(enabled);
    localStorage.setItem(`standalone_offline_mode_${orgId}`, next ? 'true' : 'false');
    if (current !== next) {
      window.dispatchEvent(
        new CustomEvent('offline_mode_change', {
          detail: { orgId, enabled: next },
        })
      );
    }
  } catch (err) {
    console.error('Failed to set offline mode:', err);
  }
}

export async function syncOfflineModeWithDb(orgId) {
  if (typeof window === 'undefined' || !orgId) return getOfflineMode(orgId);
  try {
    if (typeof navigator !== 'undefined' && navigator.onLine === false) {
      return getOfflineMode(orgId);
    }
    const res = await fetch(`/api/org/${orgId}/settings/operating-mode`);
    if (res.ok && res.headers.get('content-type')?.includes('application/json')) {
      const data = await res.json();
      if (typeof data.isOfflineMode === 'boolean') {
        setOfflineMode(orgId, data.isOfflineMode);
        return data.isOfflineMode;
      }
    }
  } catch {
    // Offline fallback
  }
  return getOfflineMode(orgId);
}

export async function migrateLegacyLocalStorageQueue(orgId) {
  if (typeof window === 'undefined') return;
  try {
    const legacyKey = `voucher_queue_${orgId}`;
    const raw = localStorage.getItem(legacyKey);
    if (!raw) return;
    const items = JSON.parse(raw);
    if (Array.isArray(items) && items.length > 0) {
      for (const item of items) {
        await saveLocalVoucher({
          clientId: item.clientId,
          orgId,
          agentId: item.agentId,
          tokens: item.tokens,
          onDate: item.onDate,
          ampm: item.ampm,
          onCount: item.onCount,
          machineId: item.machineId,
          status: 'pending',
          voucherType: item.isBuyVoucher ? 'buy' : 'sale',
          createdAt: item.queuedAt || Date.now(),
        });
      }
      localStorage.removeItem(legacyKey);
    }
  } catch (err) {
    console.warn('Migration from localStorage queue skipped/failed:', err);
  }
}
