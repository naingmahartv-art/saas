import { getApps, initializeApp, cert } from 'firebase-admin/app';
import { getDatabase } from 'firebase-admin/database';

let rtdbInstance = null;

export function getRealtimeDb() {
  const databaseURL =
    process.env.FIREBASE_DATABASE_URL || 'https://saas-2d-3d-default-rtdb.asia-southeast1.firebasedatabase.app';

  if (!rtdbInstance) {
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
        databaseURL,
      });
    }
    const app = getApps()[0];
    rtdbInstance = getDatabase(app, databaseURL);
  }
  return rtdbInstance;
}

export function rtdbSessionRef(orgId, sessionId) {
  return getRealtimeDb().ref(`organizations/${orgId}/sessions/${sessionId}`);
}

export function rtdbSessionTotalsRef(orgId, sessionId) {
  return getRealtimeDb().ref(`organizations/${orgId}/sessions/${sessionId}/totals`);
}

export function rtdbSessionAgentTotalsRef(orgId, sessionId, agentId) {
  return getRealtimeDb().ref(`organizations/${orgId}/sessions/${sessionId}/agentTotals/${agentId}`);
}

/**
 * Applies delta changes to real-time totals and per-agent totals in Realtime DB.
 * If a number's total reaches <= 0, setting value to null removes the key from RTDB.
 */
export async function applyRtdbDelta(orgId, sessionId, agentId, deltaMap = {}, voucherCountDelta = 0) {
  try {
    const sessionRef = rtdbSessionRef(orgId, sessionId);

    await sessionRef.transaction((currentData) => {
      const data = currentData || {};
      const totals = data.totals || {};
      const agentTotals = (data.agentTotals && data.agentTotals[agentId]) || {};

      for (const [num, deltaAmt] of Object.entries(deltaMap)) {
        if (!deltaAmt) continue;

        // 1. Update session main totals
        const newTotal = (totals[num] || 0) + deltaAmt;
        if (newTotal > 0) {
          totals[num] = newTotal;
        } else {
          delete totals[num]; // Setting key to undefined/delete removes key from RTDB JSON tree
        }

        // 2. Update per-agent totals if agentId provided
        if (agentId) {
          const newAgentTotal = (agentTotals[num] || 0) + deltaAmt;
          if (newAgentTotal > 0) {
            agentTotals[num] = newAgentTotal;
          } else {
            delete agentTotals[num];
          }
        }
      }

      data.totals = totals;
      if (agentId) {
        data.agentTotals = data.agentTotals || {};
        if (Object.keys(agentTotals).length > 0) {
          data.agentTotals[agentId] = agentTotals;
        } else {
          delete data.agentTotals[agentId];
        }
      }

      if (voucherCountDelta !== 0) {
        data.voucherCount = Math.max(0, (data.voucherCount || 0) + voucherCountDelta);
      }

      return data;
    });
  } catch (err) {
    console.error(`[applyRtdbDelta Error] orgId=${orgId} sessionId=${sessionId}:`, err);
  }
}

/**
 * Applies buyTotals deltas to Realtime DB so live SSE streams update buyTotals in real-time.
 */
export async function applyRtdbBuyDelta(orgId, sessionId, buyDeltaMap = {}) {
  try {
    const sessionRef = rtdbSessionRef(orgId, sessionId);

    await sessionRef.transaction((currentData) => {
      const data = currentData || {};
      const buyTotals = data.buyTotals || {};

      for (const [num, amt] of Object.entries(buyDeltaMap)) {
        if (!amt) continue;
        const newBuy = (buyTotals[num] || 0) + amt;
        if (newBuy > 0) {
          buyTotals[num] = newBuy;
        } else {
          delete buyTotals[num];
        }
      }

      data.buyTotals = buyTotals;
      return data;
    });
  } catch (err) {
    console.error(`[applyRtdbBuyDelta Error] orgId=${orgId} sessionId=${sessionId}:`, err);
  }
}
