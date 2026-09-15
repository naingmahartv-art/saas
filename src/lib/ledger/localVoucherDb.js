'use client';

const DB_NAME = 'lottery_local_vouchers_db';
const DB_VERSION = 2;
const STORE_NAME = 'local_vouchers';

let dbPromise = null;

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
          let store;
          if (!db.objectStoreNames.contains(STORE_NAME)) {
            store = db.createObjectStore(STORE_NAME, { keyPath: 'id' });
          } else {
            store = event.target.transaction.objectStore(STORE_NAME);
          }
          if (!store.indexNames.contains('orgId')) {
            store.createIndex('orgId', 'orgId', { unique: false });
          }
          if (!store.indexNames.contains('status')) {
            store.createIndex('status', 'status', { unique: false });
          }
          if (!store.indexNames.contains('orgId_status')) {
            store.createIndex('orgId_status', ['orgId', 'status'], { unique: false });
          }
          if (!store.indexNames.contains('createdAt')) {
            store.createIndex('createdAt', 'createdAt', { unique: false });
          }
          if (!store.indexNames.contains('onDate')) {
            store.createIndex('onDate', 'onDate', { unique: false });
          }
          if (!store.indexNames.contains('voucherType')) {
            store.createIndex('voucherType', 'voucherType', { unique: false });
          }
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

// Fallback localStorage key
const fallbackKey = (orgId) => `local_vouchers_fallback_${orgId}`;

function readFallback(orgId) {
  try {
    const raw = localStorage.getItem(fallbackKey(orgId));
    return raw ? JSON.parse(raw) : [];
  } catch {
    return [];
  }
}

function writeFallback(orgId, items) {
  try {
    localStorage.setItem(fallbackKey(orgId), JSON.stringify(items));
  } catch (err) {
    console.error('Failed to write to fallback storage:', err);
  }
}

/**
 * Save or insert a new voucher record into local storage.
 */
export async function saveLocalVoucher(voucher) {
  const isBuy = voucher.isBuyVoucher === true || voucher.voucherType === 'buy' || voucher.agentId === 'buy_offload';
  const record = {
    id: voucher.clientId || voucher.id || (typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : `v_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`),
    orgId: voucher.orgId,
    agentId: voucher.agentId || '',
    agentName: voucher.agentName || voucher.agentId || '',
    tokens: Array.isArray(voucher.tokens) ? voucher.tokens : [],
    entries: Array.isArray(voucher.entries) ? voucher.entries : [],
    items: Array.isArray(voucher.items) ? voucher.items : [],
    amount: typeof voucher.amount === 'number' ? voucher.amount : 0,
    onDate: voucher.onDate || '',
    ampm: voucher.ampm || '',
    onCount: voucher.onCount || 1,
    machineId: voucher.machineId || null,
    voucherType: isBuy ? 'buy' : 'sale',
    isBuyVoucher: isBuy,
    action: voucher.action || 'create', // 'create' | 'update' | 'delete'
    status: voucher.status || 'pending', // 'pending' | 'syncing' | 'synced' | 'failed'
    srNo: voucher.srNo || null,
    error: voucher.error || null,
    retryCount: voucher.retryCount || 0,
    createdAt: voucher.createdAt || Date.now(),
    syncedAt: voucher.syncedAt || null,
    lastAttemptAt: voucher.lastAttemptAt || null,
  };

  const db = await getDb();
  if (db) {
    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORE_NAME, 'readwrite');
        const store = tx.objectStore(STORE_NAME);
        const req = store.put(record);
        req.onsuccess = () => resolve(record);
        req.onerror = () => {
          const list = readFallback(voucher.orgId).filter(v => v.id !== record.id);
          writeFallback(voucher.orgId, [record, ...list]);
          resolve(record);
        };
      } catch (err) {
        console.warn('IndexedDB write error, saving to fallback', err);
        const list = readFallback(voucher.orgId).filter(v => v.id !== record.id);
        writeFallback(voucher.orgId, [record, ...list]);
        resolve(record);
      }
    });
  }

  const list = readFallback(voucher.orgId).filter(v => v.id !== record.id);
  writeFallback(voucher.orgId, [record, ...list]);
  return record;
}

/**
 * Update an existing local voucher's status or metadata.
 */
export async function updateLocalVoucher(id, updates, orgId) {
  const db = await getDb();
  if (db) {
    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORE_NAME, 'readwrite');
        const store = tx.objectStore(STORE_NAME);
        const getReq = store.get(id);
        getReq.onsuccess = () => {
          const existing = getReq.result;
          if (!existing) {
            resolve(null);
            return;
          }
          const updated = { ...existing, ...updates };
          const putReq = store.put(updated);
          putReq.onsuccess = () => resolve(updated);
          putReq.onerror = () => resolve(existing);
        };
        getReq.onerror = () => resolve(null);
      } catch {
        resolve(null);
      }
    });
  }

  if (orgId) {
    const list = readFallback(orgId);
    let updatedRecord = null;
    const newList = list.map(v => {
      if (v.id === id) {
        updatedRecord = { ...v, ...updates };
        return updatedRecord;
      }
      return v;
    });
    writeFallback(orgId, newList);
    return updatedRecord;
  }
  return null;
}

/**
 * Delete a voucher record from local storage.
 */
export async function deleteLocalVoucher(id, orgId) {
  const db = await getDb();
  if (db) {
    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORE_NAME, 'readwrite');
        const store = tx.objectStore(STORE_NAME);
        const delReq = store.delete(id);
        delReq.onsuccess = () => resolve(true);
        delReq.onerror = () => resolve(false);
      } catch {
        resolve(false);
      }
    });
  }

  if (orgId) {
    const list = readFallback(orgId).filter(v => v.id !== id);
    writeFallback(orgId, list);
    return true;
  }
  return false;
}

/**
 * Retrieve all vouchers for an organization with optional filtering.
 */
export async function getLocalVouchers(orgId, filter = {}) {
  const db = await getDb();
  if (db) {
    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORE_NAME, 'readonly');
        const store = tx.objectStore(STORE_NAME);
        const index = store.index('orgId');
        const req = index.getAll(IDBKeyRange.only(orgId));
        req.onsuccess = () => {
          let results = req.result || [];
          if (filter.status) {
            results = results.filter(v => v.status === filter.status);
          }
          if (filter.voucherType) {
            results = results.filter(v => (v.voucherType || (v.isBuyVoucher ? 'buy' : 'sale')) === filter.voucherType);
          }
          if (filter.onDate) {
            results = results.filter(v => v.onDate === filter.onDate);
          }
          if (filter.ampm) {
            results = results.filter(v => v.ampm === filter.ampm);
          }
          if (filter.agentId) {
            results = results.filter(v => v.agentId === filter.agentId || v.agentName === filter.agentId);
          }
          // Sort newest first
          results.sort((a, b) => (b.createdAt || 0) - (a.createdAt || 0));
          resolve(results);
        };
        req.onerror = () => {
          resolve(readFallback(orgId));
        };
      } catch {
        resolve(readFallback(orgId));
      }
    });
  }

  let list = readFallback(orgId);
  if (filter.status) {
    list = list.filter(v => v.status === filter.status);
  }
  if (filter.voucherType) {
    list = list.filter(v => (v.voucherType || (v.isBuyVoucher ? 'buy' : 'sale')) === filter.voucherType);
  }
  if (filter.onDate) {
    list = list.filter(v => v.onDate === filter.onDate);
  }
  if (filter.ampm) {
    list = list.filter(v => v.ampm === filter.ampm);
  }
  if (filter.agentId) {
    list = list.filter(v => v.agentId === filter.agentId || v.agentName === filter.agentId);
  }
  list.sort((a, b) => (b.createdAt || 0) - (a.createdAt || 0));
  return list;
}

/**
 * Direct cache remote snapshot documents into IndexedDB.
 * Ensures local IndexedDB is kept fresh with server changes without overriding
 * locally queued pending changes.
 */
export async function cacheRemoteVouchersIntoLocalDb(orgId, remoteDocs) {
  if (!orgId || !Array.isArray(remoteDocs) || remoteDocs.length === 0) return 0;
  const db = await getDb();
  if (!db) return 0;

  return new Promise((resolve) => {
    try {
      const tx = db.transaction(STORE_NAME, 'readwrite');
      const store = tx.objectStore(STORE_NAME);
      let cachedCount = 0;

      for (const d of remoteDocs) {
        const v = typeof d.data === 'function' ? d.data() : d;
        const id = d.id || v.id || v.clientId;
        if (!id) continue;

        const isBuy = v.isBuyVoucher === true || v.voucherType === 'buy' || v.agentId === 'buy_offload';
        const record = {
          id,
          orgId,
          agentId: v.agentId || '',
          agentName: v.agentName || v.agentId || '',
          tokens: Array.isArray(v.tokens) ? v.tokens : [],
          entries: Array.isArray(v.details) ? v.details : Array.isArray(v.entries) ? v.entries : [],
          amount: typeof v.amount === 'number' ? v.amount : 0,
          onDate: v.onDate || '',
          ampm: v.ampm || '',
          onCount: v.onCount || 1,
          machineId: v.machineId || null,
          voucherType: isBuy ? 'buy' : 'sale',
          isBuyVoucher: isBuy,
          status: 'synced',
          srNo: v.srNo ?? null,
          createdAt: v.createdAt ? (v.createdAt._seconds ? v.createdAt._seconds * 1000 : Number(v.createdAt)) : Date.now(),
          syncedAt: Date.now(),
        };

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

/**
 * Get count summary of pending and failed vouchers for quick badge display.
 */
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

/**
 * Clean local vouchers on or before a chosen date (Date-based partial cleanup).
 * Does NOT wipe current or future operational data.
 */
export async function cleanLocalVouchersBeforeDate(orgId, targetDate) {
  if (!orgId || !targetDate) return 0;
  const db = await getDb();
  if (db) {
    const all = await getLocalVouchers(orgId);
    // targetDate is 'YYYY-MM-DD'
    const toDelete = all.filter(v => {
      if (!v.onDate) return false;
      return v.onDate <= targetDate;
    });

    if (toDelete.length === 0) return 0;

    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORE_NAME, 'readwrite');
        const store = tx.objectStore(STORE_NAME);
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
  const remaining = list.filter(v => !v.onDate || v.onDate > targetDate);
  const removedCount = list.length - remaining.length;
  writeFallback(orgId, remaining);
  return removedCount;
}

/**
 * Delete confirmed synced vouchers older than N days (maintenance cleanup).
 */
export async function pruneSyncedLocalVouchers(orgId, daysOld = 3) {
  const cutoff = Date.now() - daysOld * 24 * 60 * 60 * 1000;
  const db = await getDb();
  if (db) {
    const all = await getLocalVouchers(orgId);
    const toDelete = all.filter(v => v.status === 'synced' && v.syncedAt && v.syncedAt < cutoff);
    if (toDelete.length === 0) return 0;

    return new Promise((resolve) => {
      try {
        const tx = db.transaction(STORE_NAME, 'readwrite');
        const store = tx.objectStore(STORE_NAME);
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
  const remaining = list.filter(v => !(v.status === 'synced' && v.syncedAt && v.syncedAt < cutoff));
  const removedCount = list.length - remaining.length;
  writeFallback(orgId, remaining);
  return removedCount;
}

/**
 * Standalone / Fully Offline Mode state helpers.
 */
export function getOfflineMode(orgId) {
  if (typeof window === 'undefined') return false;
  try {
    return localStorage.getItem(`standalone_offline_mode_${orgId}`) === 'true';
  } catch {
    return false;
  }
}

export function setOfflineMode(orgId, enabled) {
  if (typeof window === 'undefined') return;
  try {
    localStorage.setItem(`standalone_offline_mode_${orgId}`, enabled ? 'true' : 'false');
    window.dispatchEvent(
      new CustomEvent('offline_mode_change', {
        detail: { orgId, enabled: Boolean(enabled) },
      })
    );
  } catch (err) {
    console.error('Failed to set offline mode:', err);
  }
}

/**
 * Migrate legacy queue items from localStorage `voucher_queue_${orgId}` to IndexedDB.
 */
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

