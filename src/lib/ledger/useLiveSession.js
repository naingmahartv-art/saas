'use client';
import { useState, useEffect, useCallback } from 'react';
import { db } from '@/lib/db/firebase-client.js';
import { doc, collection, onSnapshot } from 'firebase/firestore';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import {
  cacheRemoteVouchersIntoLocalDb,
  getLocalVouchers,
  getOfflineMode,
} from './localVoucherDb.js';
import { onQueueEvent } from './voucherQueue.js';

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText, { maxEntries: 10000 });
    if (!error && entries) expanded.push(...entries);
  }
  return expanded;
}

/**
 * Pure Client-Side Firestore Snapshot & Local DB Sync Hook.
 * - Online/Partial Offline: listens to Firestore session vouchers, direct-caches
 *   all remote vouchers into local IndexedDB, and recalculates grid totals in memory.
 * - Fully Offline Standalone Mode: completely skips remote Firestore listeners and
 *   computes 00-99 totals & voucher counts directly from local IndexedDB.
 * - Cleans up all snapshot listeners on unmount when user exits ledger.
 */
export default function useLiveSession(orgId, sessionInfo, options = {}) {
  const { scope = 'all' } = options; // 'all' | 'sale' | 'buy'

  const [data, setData] = useState({
    totals: {},
    buyTotals: {},
    luckyNumber: null,
    vouchersCount: 0,
    buyVouchersCount: 0,
    hotNumbers: [],
    notBuyNumbers: [],
    limit: 0,
    isOfflineStandalone: false,
  });

  const sessionId =
    typeof sessionInfo === 'object' && sessionInfo?.id
      ? sessionInfo.id
      : typeof sessionInfo === 'string'
      ? sessionInfo
      : null;

  const sessionObj = typeof sessionInfo === 'object' ? sessionInfo : null;

  // Local calculation from IndexedDB when offline standalone mode is active
  const computeFromLocalDb = useCallback(async () => {
    if (!orgId) return;
    try {
      const all = await getLocalVouchers(orgId);
      const totals = {};
      const buyTotals = {};
      let saleVouchersCount = 0;
      let buyVouchersCount = 0;

      const targetDate = sessionObj?.onDate;
      const targetAmpm = sessionObj?.ampm;
      const targetOnCount = sessionObj?.onCount;

      for (const v of all) {
        // Filter by session attributes if available
        if (targetDate && v.onDate && v.onDate !== targetDate) continue;
        if (targetAmpm && v.ampm && v.ampm !== targetAmpm) continue;
        if (targetOnCount && v.onCount && v.onCount !== targetOnCount) continue;

        const isBuy = v.isBuyVoucher === true || v.voucherType === 'buy' || v.agentId === 'buy_offload';
        if (isBuy) {
          buyVouchersCount++;
        } else {
          saleVouchersCount++;
        }

        if (scope === 'sale' && isBuy) continue;
        if (scope === 'buy' && !isBuy) continue;

        let entries = [];
        if (v.tokens && v.tokens.length > 0) {
          entries = expandTokens(v.tokens);
        } else if (v.entries && v.entries.length > 0) {
          entries = v.entries;
        } else if (v.items && v.items.length > 0) {
          entries = v.items;
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

      setData((prev) => ({
        ...prev,
        totals,
        buyTotals,
        vouchersCount: saleVouchersCount,
        buyVouchersCount,
        isOfflineStandalone: true,
      }));
    } catch (err) {
      console.warn('Error computing totals from local DB:', err);
    }
  }, [orgId, sessionObj, scope]);

  useEffect(() => {
    if (!orgId) return;

    const isStandalone = getOfflineMode(orgId);
    if (isStandalone || !sessionId) {
      // Standalone mode: Compute from local DB without opening Firestore snapshots
      computeFromLocalDb();

      const unsubQueue = onQueueEvent(() => {
        computeFromLocalDb();
      });

      const onModeChange = (e) => {
        if (e.detail?.orgId === orgId) {
          if (e.detail?.enabled) {
            computeFromLocalDb();
          }
        }
      };

      if (typeof window !== 'undefined') {
        window.addEventListener('offline_mode_change', onModeChange);
      }

      return () => {
        unsubQueue();
        if (typeof window !== 'undefined') {
          window.removeEventListener('offline_mode_change', onModeChange);
        }
      };
    }

    // Online / Partial Offline: Listen to live Firestore snapshots
    let unsubSession = () => {};
    let unsubVouchers = () => {};

    // 1. Listen to Session Document (luckyNumber, limit, hotNumbers, etc.)
    try {
      const sessionDocRef = doc(db, 'organizations', orgId, 'sessions', sessionId);
      unsubSession = onSnapshot(
        sessionDocRef,
        (docSnap) => {
          if (docSnap.exists()) {
            const sData = docSnap.data() || {};
            const luckyNo = sData.luckyNumber || sData.luckyNo || sData.winningNumber || sData.lucky || null;
            setData((prev) => ({
              ...prev,
              luckyNumber: luckyNo,
              hotNumbers: sData.hotNumbers || [],
              notBuyNumbers: sData.notBuyNumbers || [],
              limit: sData.limit || 0,
              isOfflineStandalone: false,
            }));
          }
        },
        (err) => {
          console.warn('Session doc snapshot warning:', err);
        }
      );
    } catch (sErr) {
      console.warn('Failed to init session doc listener:', sErr);
    }

    // 2. Listen to Vouchers Collection (Realtime 00-99 totals calculation & local DB mirroring)
    try {
      const vouchersColRef = collection(db, 'organizations', orgId, 'sessions', sessionId, 'vouchers');
      unsubVouchers = onSnapshot(
        vouchersColRef,
        (colSnap) => {
          const totals = {};
          const buyTotals = {};
          let maxSrNo = 0;
          let saleVouchersCount = 0;
          let buyVouchersCount = 0;

          // Direct cache remote vouchers from snapshot into local IndexedDB
          try {
            cacheRemoteVouchersIntoLocalDb(orgId, colSnap.docs);
          } catch (cacheErr) {
            console.warn('Failed to direct-cache snapshot into local DB:', cacheErr);
          }

          for (const docSnap of colSnap.docs) {
            const v = docSnap.data();
            if (typeof v.srNo === 'number' && v.srNo > maxSrNo) {
              maxSrNo = v.srNo;
            }

            const isBuy = v.isBuyVoucher === true || v.voucherType === 'buy' || v.agentId === 'buy_offload';
            if (isBuy) {
              buyVouchersCount++;
            } else {
              saleVouchersCount++;
            }

            if (scope === 'sale' && isBuy) continue;
            if (scope === 'buy' && !isBuy) continue;

            let entries = [];
            if (v.tokens && v.tokens.length > 0) {
              entries = expandTokens(v.tokens);
            } else if (v.details && v.details.length > 0) {
              entries = v.details.map((d) => ({
                num: d.num1 || d.num,
                amount: d.value || d.amount,
              }));
            }

            for (const e of entries) {
              const amt = parseFloat(e.amount) || 0;
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

          setData((prev) => ({
            ...prev,
            totals,
            buyTotals,
            vouchersCount: saleVouchersCount,
            buyVouchersCount,
            isOfflineStandalone: false,
          }));
        },
        (err) => {
          console.warn('Vouchers snapshot warning (falling back to local data):', err);
          computeFromLocalDb();
        }
      );
    } catch (vErr) {
      console.warn('Failed to init vouchers collection listener:', vErr);
      computeFromLocalDb();
    }

    // Cleanup: Strictly terminate Firestore snapshot listeners when unmounted
    return () => {
      unsubSession();
      unsubVouchers();
    };
  }, [orgId, sessionId, computeFromLocalDb, scope]);

  return data;
}

