import { parseNumberExpression } from '@/lib/lottery/numberParser.js';

/**
 * Canonical Voucher Schema definition & adapter.
 * Bridges Firestore (cloud document DB) and IndexedDB (client local DB).
 */

/**
 * Helper to construct a canonical sessionId from components or string
 */
export function buildSessionId(onDate, ampm, onCount) {
  if (!onDate || !ampm) return '';
  return `${onDate}_${ampm}_${onCount || 1}`;
}

/**
 * Expand compressed token expressions into individual { num, amount } entries.
 */
export function expandVoucherTokens(tokens) {
  const expanded = [];
  if (!tokens || !Array.isArray(tokens)) return expanded;

  for (const tokenText of tokens) {
    if (!tokenText || typeof tokenText !== 'string') continue;
    const { entries, error } = parseNumberExpression(tokenText, { maxEntries: 10000 });
    if (!error && entries && entries.length > 0) {
      expanded.push(...entries);
    }
  }
  return expanded;
}

/**
 * Normalizes any voucher input (from Firestore, legacy IndexedDB, or UI)
 * into a standard CanonicalVoucher.
 */
export function toCanonicalVoucher(raw = {}, defaultSessionId = '') {
  const isBuy =
    raw.isBuyVoucher === true ||
    raw.voucherType === 'buy' ||
    raw.agentId === 'buy_offload' ||
    raw.isBuy === true;

  const onDate = raw.onDate || '';
  const ampm = raw.ampm || '';
  const onCount = Number(raw.onCount) || 1;

  const sessionId =
    raw.sessionId ||
    (onDate && ampm ? buildSessionId(onDate, ampm, onCount) : defaultSessionId || '');

  const id =
    raw.id ||
    raw.clientId ||
    raw.voucherId ||
    (typeof crypto !== 'undefined' && crypto.randomUUID
      ? crypto.randomUUID()
      : `v_${Date.now()}_${Math.random().toString(36).slice(2, 8)}`);

  // Normalize creation timestamp
  let createdAt = Date.now();
  if (raw.createdAt) {
    if (typeof raw.createdAt === 'number') {
      createdAt = raw.createdAt;
    } else if (raw.createdAt._seconds) {
      createdAt = raw.createdAt._seconds * 1000;
    } else if (raw.createdAt.seconds) {
      createdAt = raw.createdAt.seconds * 1000;
    } else if (typeof raw.createdAt.toDate === 'function') {
      createdAt = raw.createdAt.toDate().getTime();
    } else {
      const parsed = Date.parse(raw.createdAt);
      if (!isNaN(parsed)) createdAt = parsed;
    }
  }

  let syncedAt = raw.syncedAt || null;
  if (syncedAt && typeof syncedAt !== 'number') {
    if (syncedAt._seconds) syncedAt = syncedAt._seconds * 1000;
    else if (typeof syncedAt.toDate === 'function') syncedAt = syncedAt.toDate().getTime();
  }

  const tokens = Array.isArray(raw.tokens) ? raw.tokens : [];
  let entries = [];
  if (Array.isArray(raw.entries) && raw.entries.length > 0) {
    entries = raw.entries;
  } else if (Array.isArray(raw.details) && raw.details.length > 0) {
    entries = raw.details.map((d) => ({
      num: d.num1 !== undefined ? d.num1 : d.num,
      amount: d.value !== undefined ? d.value : d.amount,
    }));
  } else if (Array.isArray(raw.items) && raw.items.length > 0) {
    entries = raw.items.map((it) => ({
      num: it.num,
      amount: it.amount || it.value,
    }));
  }

  const amount =
    typeof raw.amount === 'number'
      ? raw.amount
      : entries.reduce((acc, e) => acc + (parseFloat(e.amount || e.value) || 0), 0);

  const clientId = raw.clientId || id;

  return {
    id,
    clientId,
    voucherId: raw.voucherId || id,
    orgId: raw.orgId || '',
    sessionId,
    onDate,
    ampm,
    onCount,
    voucherType: isBuy ? 'buy' : 'sale',
    isBuyVoucher: isBuy,
    agentId: raw.agentId || (isBuy ? 'buy_offload' : ''),
    agentName: raw.agentName || (isBuy ? 'Buy Offload (အဝယ်စာရင်း)' : raw.agentId || ''),
    machineId: raw.machineId !== undefined ? Number(raw.machineId) : null,
    tokens,
    entries,
    amount,
    srNo: raw.srNo !== undefined && raw.srNo !== null ? Number(raw.srNo) : null,
    status: raw.status || 'pending', // 'pending' | 'syncing' | 'synced' | 'failed'
    action: raw.action || 'create',
    error: raw.error || null,
    retryCount: Number(raw.retryCount) || 0,
    createdAt,
    syncedAt,
    lastAttemptAt: raw.lastAttemptAt || null,
  };
}

/**
 * Firestore Document -> CanonicalVoucher
 */
export function fromFirestoreDoc(docSnapOrData, defaultSessionId = '', orgId = '') {
  if (!docSnapOrData) return null;
  const isDocSnap = typeof docSnapOrData.data === 'function';
  const data = isDocSnap ? docSnapOrData.data() : docSnapOrData;
  const id = isDocSnap ? docSnapOrData.id : (data.id || data.clientId);

  return toCanonicalVoucher({
    ...data,
    id,
    orgId: data.orgId || orgId,
    status: 'synced',
  }, defaultSessionId);
}

/**
 * CanonicalVoucher -> Firestore Document Payload
 */
export function toFirestoreDoc(canonical) {
  const isBuy = canonical.voucherType === 'buy' || canonical.isBuyVoucher;
  return {
    id: canonical.id,
    clientId: canonical.id,
    orgId: canonical.orgId,
    sessionId: canonical.sessionId,
    agentId: canonical.agentId,
    agentName: canonical.agentName,
    onDate: canonical.onDate,
    ampm: canonical.ampm,
    onCount: canonical.onCount,
    machineId: canonical.machineId,
    voucherType: canonical.voucherType,
    isBuyVoucher: isBuy,
    tokens: canonical.tokens,
    amount: canonical.amount,
    srNo: canonical.srNo,
    createdAt: new Date(canonical.createdAt),
    updatedAt: new Date(),
  };
}

/**
 * IndexedDB Record -> CanonicalVoucher
 */
export function fromIndexedDbRecord(record) {
  return toCanonicalVoucher(record);
}

/**
 * CanonicalVoucher -> IndexedDB Record
 */
export function toIndexedDbRecord(canonical) {
  return {
    ...canonical,
    // Ensure compound query keys are populated
    orgId_sessionId: [canonical.orgId, canonical.sessionId],
    orgId_status: [canonical.orgId, canonical.status],
    orgId_sessionId_type: [canonical.orgId, canonical.sessionId, canonical.voucherType],
  };
}

/**
 * Fast in-memory aggregator: Computes 00-99 sale and buy totals from any list of vouchers.
 */
export function computeSessionTotals(vouchers = []) {
  const totals = {};
  const buyTotals = {};
  let vouchersCount = 0;
  let buyVouchersCount = 0;
  let maxSrNo = 0;
  let grandSaleAmount = 0;
  let grandBuyAmount = 0;

  for (const raw of vouchers) {
    const v = raw.voucherType ? raw : toCanonicalVoucher(raw);
    const isBuy = v.voucherType === 'buy' || v.isBuyVoucher;

    if (typeof v.srNo === 'number' && v.srNo > maxSrNo) {
      maxSrNo = v.srNo;
    }

    if (isBuy) {
      buyVouchersCount++;
      grandBuyAmount += v.amount || 0;
    } else {
      vouchersCount++;
      grandSaleAmount += v.amount || 0;
    }

    let entries = [];
    if (v.tokens && v.tokens.length > 0) {
      entries = expandVoucherTokens(v.tokens);
    } else if (v.entries && v.entries.length > 0) {
      entries = v.entries;
    }

    for (const e of entries) {
      const amt = parseFloat(e.amount || e.value) || 0;
      if (amt > 0 && e.num !== undefined && e.num !== null) {
        const numStr = String(e.num).padStart(2, '0');
        if (isBuy) {
          buyTotals[numStr] = (buyTotals[numStr] || 0) + amt;
        } else {
          totals[numStr] = (totals[numStr] || 0) + amt;
        }
      }
    }
  }

  return {
    totals,
    buyTotals,
    vouchersCount,
    buyVouchersCount,
    maxSrNo,
    grandSaleAmount,
    grandBuyAmount,
  };
}
