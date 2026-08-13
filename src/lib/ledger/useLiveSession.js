'use client';
import { useState, useEffect } from 'react';

/**
 * Realtime DB session sync hook for Ledger and Buy Workspaces.
 * Periodically syncs live Realtime DB totals, lucky number, and voucher counts
 * so data across all client machines updates automatically in real-time.
 */
export default function useLiveSession(orgId, sessionInfo, pollIntervalMs = 2500) {
  const [data, setData] = useState(null);

  useEffect(() => {
    if (!orgId) return;

    let isMounted = true;

    async function fetchLiveTotals() {
      try {
        let url = `/api/org/${orgId}/ledger/totals`;
        if (typeof sessionInfo === 'object' && sessionInfo?.onCount) {
          url += `?onCount=${sessionInfo.onCount}&ampm=${sessionInfo.ampm}&onDate=${sessionInfo.onDate}`;
        } else if (typeof sessionInfo === 'string' && sessionInfo) {
          url += `?sessionId=${encodeURIComponent(sessionInfo)}`;
        }

        const res = await fetch(url);
        if (!res.ok) return;
        const resData = await res.json();
        if (isMounted && resData) {
          setData(resData);
        }
      } catch {
        // Silently retain last known data on network glitch
      }
    }

    fetchLiveTotals();
    const timer = setInterval(fetchLiveTotals, pollIntervalMs);

    return () => {
      isMounted = false;
      clearInterval(timer);
    };
  }, [orgId, sessionInfo, pollIntervalMs]);

  return data;
}
