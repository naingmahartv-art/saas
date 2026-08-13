'use client';
import { useState, useEffect } from 'react';
import { db } from '@/lib/db/firebase-client.js';
import { doc, collection, onSnapshot } from 'firebase/firestore';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText, { maxEntries: 10000 });
    if (!error && entries) expanded.push(...entries);
  }
  return expanded;
}

/**
 * Pure Client-Side Firestore Snapshot Sync Hook.
 * Listens to live Firestore session vouchers and session config doc via HTTPS/gRPC.
 * Recalculates 00-99 totals grid, lucky numbers, and voucher counts in local memory
 * without relying on RTDB or server-side precalculated totals.
 */
export default function useLiveSession(orgId, sessionInfo) {
  const [data, setData] = useState({
    totals: {},
    buyTotals: {},
    luckyNumber: null,
    vouchersCount: 0,
    hotNumbers: [],
    notBuyNumbers: [],
    limit: 0,
  });

  const sessionId =
    typeof sessionInfo === 'object' && sessionInfo?.id
      ? sessionInfo.id
      : typeof sessionInfo === 'string'
      ? sessionInfo
      : null;

  useEffect(() => {
    if (!orgId || !sessionId) return;

    // 1. Listen to Session Document (luckyNumber, limit, hotNumbers, etc.)
    const sessionDocRef = doc(db, 'organizations', orgId, 'sessions', sessionId);
    const unsubSession = onSnapshot(
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
          }));
        }
      },
      (err) => {
        console.warn('Session doc snapshot warning:', err);
      }
    );

    // 2. Listen to Vouchers Collection (Realtime 00-99 totals calculation)
    const vouchersColRef = collection(db, 'organizations', orgId, 'sessions', sessionId, 'vouchers');
    const unsubVouchers = onSnapshot(
      vouchersColRef,
      (colSnap) => {
        const totals = {};
        const buyTotals = {};
        let maxSrNo = 0;

        for (const docSnap of colSnap.docs) {
          const v = docSnap.data();
          if (typeof v.srNo === 'number' && v.srNo > maxSrNo) {
            maxSrNo = v.srNo;
          }

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
            if (amt > 0 && e.num) {
              totals[e.num] = (totals[e.num] || 0) + amt;
            }
          }
        }

        const count = colSnap.docs.length > maxSrNo ? colSnap.docs.length : maxSrNo;
        setData((prev) => ({
          ...prev,
          totals,
          buyTotals,
          vouchersCount: count,
        }));
      },
      (err) => {
        console.warn('Vouchers snapshot warning:', err);
      }
    );

    return () => {
      unsubSession();
      unsubVouchers();
    };
  }, [orgId, sessionId]);

  return data;
}
