import { getApps, initializeApp, cert } from 'firebase-admin/app';
import { getFirestore, Timestamp } from 'firebase-admin/firestore';

let firestoreInstance = null;

/** Returns the shared Firestore instance, initializing lazily on first access. */
export function getDb() {
  if (!firestoreInstance) {
    if (getApps().length === 0) {
      const projectId = process.env.FIREBASE_PROJECT_ID;
      const clientEmail = process.env.FIREBASE_CLIENT_EMAIL;
      const privateKey = process.env.FIREBASE_PRIVATE_KEY?.replace(/\\n/g, '\n');

      initializeApp({
        credential: cert({
          projectId: projectId || 'build-time-fallback-project-id',
          clientEmail: clientEmail || 'build-time-fallback@example.com',
          privateKey:
            privateKey ||
            '-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC...\n-----END PRIVATE KEY-----\n',
        }),
      });
    }
    firestoreInstance = getFirestore();
  }
  return firestoreInstance;
}

export { Timestamp };

export const PLAN_PRICES = {
  basic: 29,
  advance: 99,
};

// ─── Collection / doc path helpers ─────────────────────────────────────────
// Two top-level collections (organizations, users) — everything else nests
// under organizations/{orgId} as a subcollection.

export const orgsCol = () => getDb().collection('organizations');
export const orgDoc = (orgId) => getDb().collection('organizations').doc(orgId);

export const usersCol = () => getDb().collection('users');
export const userDoc = (userId) => getDb().collection('users').doc(userId);

export const systemResourcesCol = () => getDb().collection('systemResources');

export const orgAgentsCol = (orgId) => orgDoc(orgId).collection('agents');
export const orgAgentDoc = (orgId, agentId) => orgAgentsCol(orgId).doc(agentId);

export const orgMachinesCol = (orgId) => orgDoc(orgId).collection('machines');

export const orgRatesDoc = (orgId) => orgDoc(orgId).collection('rates').doc('current');

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
