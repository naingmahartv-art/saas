'use client';
import { useState, useEffect, useCallback, useRef } from 'react';
import { db } from '@/lib/db/firebase-client.js';
import { doc, collection, onSnapshot } from 'firebase/firestore';
import {
  computeSessionTotals,
  fromFirestoreDoc,
  buildSessionId,
} from './voucherAdapter.js';
import {
  fromFirestoreSession,
} from './sessionAdapter.js';
import {
  resolveEffectiveLimits,
  computeExceedsList,
} from './limitAdapter.js';
import {
  cacheRemoteVouchersIntoLocalDb,
  getLocalVouchers,
  getLocalVouchersForSession,
  getLocalLimits,
  getLocalSession,
  saveLocalSession,
  getOfflineMode,
  onLocalSyncChange,
} from './localVoucherDb.js';
import { onQueueEvent } from './voucherQueue.js';

/**
 * Pure Client-Side Firestore Snapshot & Multi-Store Local DB Sync Hook.
 * - Manages real-time synchronisation across Sessions, Limits, and Vouchers.
 * - Zero network latency for local changes (BroadcastChannel event bus).
 * - Bi-directional fallback for online and standalone offline modes.
 */
export default function useLiveSession(orgId, sessionInfo, options = {}) {
  const [data, setData] = useState({
    totals: {},
    buyTotals: {},
    exceedList: [],
    effectiveLimits: {},
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

  const canonicalSessionId =
    sessionId ||
    (sessionObj?.onDate && sessionObj?.ampm
      ? buildSessionId(sessionObj.onDate, sessionObj.ampm, sessionObj.onCount)
      : '');

  // Keep latest remote docs cache
  const remoteDocsRef = useRef([]);

  // Compute totals & dynamic limits
  const computeAndSetTotals = useCallback(async () => {
    if (!orgId) return;
    try {
      // 1. Fetch local vouchers for this session
      const targetDate = sessionObj?.onDate;
      const targetAmpm = sessionObj?.ampm;
      const targetOnCount = sessionObj?.onCount;

      let localList = [];
      if (canonicalSessionId) {
        localList = await getLocalVouchersForSession(orgId, canonicalSessionId);
      }
      if (!localList || localList.length === 0) {
        const allLocal = await getLocalVouchers(orgId);
        localList = allLocal.filter((v) => {
          if (canonicalSessionId && v.sessionId === canonicalSessionId) return true;
          if (targetDate && v.onDate && v.onDate !== targetDate) return false;
          if (targetAmpm && v.ampm && v.ampm !== targetAmpm) return false;
          if (targetOnCount && v.onCount && v.onCount !== targetOnCount) return false;
          return true;
        });
      }

      // 2. Fetch local limits & local session
      let localSessionData = null;
      let localLimitsList = [];
      if (canonicalSessionId) {
        localSessionData = await getLocalSession(orgId, canonicalSessionId);
        localLimitsList = await getLocalLimits(orgId, canonicalSessionId);
      }

      // 3. Map of vouchers by ID
      const voucherMap = new Map();
      const remoteKeys = new Set();

      // Remote snapshot docs
      for (const docSnap of remoteDocsRef.current) {
        const canonical = fromFirestoreDoc(docSnap, canonicalSessionId, orgId);
        if (canonical && canonical.id) {
          voucherMap.set(canonical.id, canonical);
          remoteKeys.add(canonical.id);
          if (canonical.clientId) {
            remoteKeys.add(canonical.clientId);
          }
        }
      }

      const isOfflineModeActive = remoteDocsRef.current.length === 0;

      // Local vouchers
      for (const loc of localList) {
        if (!loc || !loc.id) continue;

        if (loc.action === 'delete') {
          voucherMap.delete(loc.id);
          if (loc.clientId) voucherMap.delete(loc.clientId);
          continue;
        }

        // If offline standalone mode, add all local vouchers
        if (isOfflineModeActive) {
          voucherMap.set(loc.id, loc);
          continue;
        }

        // When online, only include pending/syncing items that have NOT yet appeared in remote snapshot
        if (loc.status === 'pending' || loc.status === 'syncing') {
          const alreadyInRemote = remoteKeys.has(loc.id) || (loc.clientId && remoteKeys.has(loc.clientId));
          if (!alreadyInRemote) {
            voucherMap.set(loc.id, loc);
          }
        }
      }

      const allSessionVouchers = Array.from(voucherMap.values());
      const computed = computeSessionTotals(allSessionVouchers);

      // Build limits map
      const customLimits = {};
      const clearedLimits = {};
      for (const l of localLimitsList) {
        if (l.num) {
          if (l.limitAmount) customLimits[l.num] = l.limitAmount;
          if (l.clearedAmount) clearedLimits[l.num] = l.clearedAmount;
        }
      }

      const baseLimit =
        localSessionData?.defaultLimit !== undefined
          ? localSessionData.defaultLimit
          : sessionObj?.limit || 0;

      const effectiveLimits = resolveEffectiveLimits(baseLimit, customLimits, clearedLimits);
      const exceedList = computeExceedsList(computed.totals, computed.buyTotals, effectiveLimits, baseLimit);

      setData((prev) => ({
        ...prev,
        totals: computed.totals,
        buyTotals: computed.buyTotals,
        exceedList,
        effectiveLimits,
        vouchersCount: computed.vouchersCount,
        buyVouchersCount: computed.buyVouchersCount,
        luckyNumber: localSessionData?.luckyNumber ?? prev.luckyNumber,
        hotNumbers: localSessionData?.hotNumbers ?? prev.hotNumbers,
        notBuyNumbers: localSessionData?.notBuyNumbers ?? prev.notBuyNumbers,
        limit: baseLimit,
      }));
    } catch (err) {
      console.warn('Error computing live session totals:', err);
    }
  }, [orgId, canonicalSessionId, sessionObj]);

  useEffect(() => {
    if (!orgId) return;

    // Listen to local BroadcastChannel across all stores (0ms cross-tab/cross-page synchronization)
    const unsubLocalChange = onLocalSyncChange((event) => {
      if (event.orgId === orgId) {
        if (!canonicalSessionId || !event.sessionId || event.sessionId === canonicalSessionId) {
          computeAndSetTotals();
        }
      }
    });

    // Listen to queue events
    const unsubQueue = onQueueEvent((event) => {
      if (event.orgId === orgId) {
        computeAndSetTotals();
      }
    });

    const isStandalone = getOfflineMode(orgId);
    if (isStandalone || !sessionId) {
      // Standalone mode: Compute from local DB without opening Firestore snapshots
      computeAndSetTotals();

      const onModeChange = (e) => {
        if (e.detail?.orgId === orgId) {
          if (e.detail?.enabled) {
            computeAndSetTotals();
          }
        }
      };

      if (typeof window !== 'undefined') {
        window.addEventListener('offline_mode_change', onModeChange);
      }

      return () => {
        unsubLocalChange();
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
            const sessionCanonical = fromFirestoreSession(docSnap, orgId);
            if (sessionCanonical) {
              saveLocalSession(sessionCanonical, orgId);
            }
            const sData = docSnap.data() || {};
            const luckyNo =
              sData.luckyNumber || sData.luckyNo || sData.winningNumber || sData.lucky || null;
            setData((prev) => ({
              ...prev,
              luckyNumber: luckyNo,
              hotNumbers: sData.hotNumbers || [],
              notBuyNumbers: sData.notBuyNumbers || [],
              limit: sData.limit || 0,
              isOfflineStandalone: false,
            }));
            computeAndSetTotals();
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
          remoteDocsRef.current = colSnap.docs || [];

          // Direct cache remote vouchers from snapshot into local IndexedDB
          try {
            cacheRemoteVouchersIntoLocalDb(orgId, colSnap.docs, canonicalSessionId);
          } catch (cacheErr) {
            console.warn('Failed to direct-cache snapshot into local DB:', cacheErr);
          }

          // Recalculate combined totals
          computeAndSetTotals();
        },
        (err) => {
          console.warn('Vouchers snapshot warning (falling back to local data):', err);
          computeAndSetTotals();
        }
      );
    } catch (vErr) {
      console.warn('Failed to init vouchers collection listener:', vErr);
      computeAndSetTotals();
    }

    // Initial immediate calculation
    computeAndSetTotals();

    return () => {
      unsubLocalChange();
      unsubQueue();
      unsubSession();
      unsubVouchers();
    };
  }, [orgId, sessionId, canonicalSessionId, computeAndSetTotals]);

  return data;
}
