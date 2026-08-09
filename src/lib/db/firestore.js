import { getApps, initializeApp, cert } from 'firebase-admin/app';
import { getFirestore, Timestamp } from 'firebase-admin/firestore';

// Singleton init — avoids re-initializing on every hot-reload / lambda warm invocation.
function initFirestore() {
  if (getApps().length === 0) {
    initializeApp({
      credential: cert({
        projectId: process.env.FIREBASE_PROJECT_ID,
        clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
        privateKey: process.env.FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n'),
      }),
    });
  }
  return getFirestore();
}

const db = initFirestore();

/** Returns the shared Firestore instance. */
export function getDb() {
  return db;
}

export { Timestamp };

export const PLAN_PRICES = {
  basic: 29,
  advance: 99,
};

// ─── Collection / doc path helpers ─────────────────────────────────────────
// Two top-level collections (organizations, users) — everything else nests
// under organizations/{orgId} as a subcollection, replacing `WHERE org_id = ...`.

export const orgsCol = () => db.collection('organizations');
export const orgDoc = (orgId) => db.collection('organizations').doc(orgId);

export const usersCol = () => db.collection('users');
export const userDoc = (userId) => db.collection('users').doc(userId);

export const orgAgentsCol = (orgId) => orgDoc(orgId).collection('agents');
export const orgAgentDoc = (orgId, agentId) => orgAgentsCol(orgId).doc(agentId);

export const orgMachinesCol = (orgId) => orgDoc(orgId).collection('machines');

// Single doc, not a collection — matches today's one-row-per-org `rates` table.
export const orgRatesDoc = (orgId) => orgDoc(orgId).collection('rates').doc('current');

// One doc per restriction/reference-list type, collapsing ~12 tiny Postgres
// tables (hotNumbers, notBuyNumbers, limits, brade, power, aPoo, netKhat,
// netKhatThai, part, small, sm, serieM, serieS) into one small subcollection.
export const orgRestrictionDoc = (orgId, type) => orgDoc(orgId).collection('restrictions').doc(type);

export const orgBalanceCol = (orgId) => orgDoc(orgId).collection('balance');
export const orgReceiveCol = (orgId) => orgDoc(orgId).collection('receive');
export const orgPasswordResetRequestsCol = (orgId) => orgDoc(orgId).collection('passwordResetRequests');
export const orgUserPreferencesCol = (orgId) => orgDoc(orgId).collection('userPreferences');
export const orgActivityLogsCol = (orgId) => orgDoc(orgId).collection('activityLogs');
export const orgSubscriptionsCol = (orgId) => orgDoc(orgId).collection('subscriptions');

export const orgSessionsCol = (orgId) => orgDoc(orgId).collection('sessions');
export const orgSessionDoc = (orgId, sessionId) => orgSessionsCol(orgId).doc(sessionId);
export const orgSessionVouchersCol = (orgId, sessionId) => orgSessionDoc(orgId, sessionId).collection('vouchers');
export const orgSessionVoucherDoc = (orgId, sessionId, voucherId) =>
  orgSessionVouchersCol(orgId, sessionId).doc(voucherId);

/** `{onDate}_{ampm}_{onCount}` — deterministic session doc ID, e.g. "2026-08-09_PM_5". */
export function sessionId(onDate, ampm, onCount) {
  return `${onDate}_${ampm}_${onCount}`;
}
