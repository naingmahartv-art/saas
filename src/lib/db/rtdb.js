// Firebase Realtime Database (RTDB) stub file
// RTDB has been completely disabled to eliminate network connectivity issues on Myanmar ISP networks.
// All operations now read and write directly to Google Cloud Firestore via standard HTTPS endpoints.

export function getRealtimeDb() {
  return null;
}

export function rtdbSessionRef() {
  return {
    once: async () => ({ exists: () => false, val: () => ({}) }),
    on: () => {},
    off: () => {},
    child: () => ({
      set: async () => {},
      once: async () => ({ exists: () => false, val: () => ({}) }),
    }),
  };
}

export function rtdbSessionTotalsRef() {
  return rtdbSessionRef();
}

export function rtdbSessionAgentTotalsRef() {
  return rtdbSessionRef();
}

export async function applyRtdbDelta() {
  // No-op: RTDB disabled
  return Promise.resolve();
}

export async function applyRtdbBuyDelta() {
  // No-op: RTDB disabled
  return Promise.resolve();
}
