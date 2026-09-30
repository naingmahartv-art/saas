import { buildSessionId } from './voucherAdapter.js';

/**
 * Session Adapter for normalizing session metadata between Firestore and IndexedDB.
 */

export function toCanonicalSession(raw = {}, defaultOrgId = '') {
  const orgId = raw.orgId || defaultOrgId || '';
  const onDate = raw.onDate || '';
  const ampm = raw.ampm || '';
  const onCount = Number(raw.onCount) || 1;

  const sessionId =
    raw.id ||
    raw.sessionId ||
    (onDate && ampm ? buildSessionId(onDate, ampm, onCount) : '');

  const id = `${orgId}_${sessionId}`;

  const luckyNumber =
    raw.luckyNumber ||
    raw.luckyNo ||
    raw.winningNumber ||
    raw.lucky ||
    null;

  return {
    id,
    orgId,
    sessionId,
    onDate,
    ampm,
    onCount,
    status: raw.status || 'open', // 'open' | 'closed'
    luckyNumber,
    defaultLimit: typeof raw.limit === 'number' ? raw.limit : typeof raw.defaultLimit === 'number' ? raw.defaultLimit : 0,
    hotNumbers: Array.isArray(raw.hotNumbers) ? raw.hotNumbers : [],
    notBuyNumbers: Array.isArray(raw.notBuyNumbers) ? raw.notBuyNumbers : [],
    commissions: raw.commissions || {},
    rates: raw.rates || {},
    p_close: raw.p_close || null,
    p_auto_clear: raw.p_auto_clear || false,
    updatedAt: raw.updatedAt ? (typeof raw.updatedAt === 'number' ? raw.updatedAt : Date.now()) : Date.now(),
  };
}

export function fromFirestoreSession(docSnapOrData, orgId = '') {
  if (!docSnapOrData) return null;
  const isDocSnap = typeof docSnapOrData.data === 'function';
  const data = isDocSnap ? docSnapOrData.data() : docSnapOrData;
  const sessionId = isDocSnap ? docSnapOrData.id : (data.id || data.sessionId);

  return toCanonicalSession({
    ...data,
    sessionId,
    id: sessionId,
  }, orgId || data.orgId);
}

export function toFirestoreSession(canonical) {
  return {
    id: canonical.sessionId,
    orgId: canonical.orgId,
    onDate: canonical.onDate,
    ampm: canonical.ampm,
    onCount: canonical.onCount,
    status: canonical.status,
    luckyNumber: canonical.luckyNumber,
    limit: canonical.defaultLimit,
    hotNumbers: canonical.hotNumbers,
    notBuyNumbers: canonical.notBuyNumbers,
    commissions: canonical.commissions,
    rates: canonical.rates,
    p_close: canonical.p_close,
    p_auto_clear: canonical.p_auto_clear,
    updatedAt: new Date(canonical.updatedAt),
  };
}
