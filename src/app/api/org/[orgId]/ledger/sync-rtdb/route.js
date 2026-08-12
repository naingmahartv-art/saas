import { NextResponse } from 'next/server';
import { orgSessionDoc, orgSessionVouchersCol, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { rtdbSessionRef } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';
import { getActiveSession } from '@/lib/auth/permissions.js';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText, { maxEntries: 10000 });
    if (!error && entries) {
      expanded.push(...entries);
    }
  }
  return expanded;
}

// POST /api/org/[orgId]/ledger/sync-rtdb?onCount=&ampm=&onDate=
// Re-calculates and overwrites Realtime DB session totals directly from active Firestore vouchers.
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  let onCount = searchParams.get('onCount');
  let ampm = searchParams.get('ampm');
  let onDate = searchParams.get('onDate');

  if (!onCount || !ampm || !onDate) {
    const active = await getActiveSession(orgId);
    if (active) {
      onCount = active.onCount;
      ampm = active.ampm;
      onDate = active.onDate || active.date || new Date().toISOString().slice(0, 10);
    }
  }

  if (!onCount || !ampm || !onDate) {
    return NextResponse.json({ error: 'No active session found' }, { status: 400 });
  }

  const sid = buildSessionId(onDate, ampm, onCount);
  const snap = await orgSessionVouchersCol(orgId, sid).get();

  const totals = {};
  const agentTotals = {};
  let maxSrNo = 0;

  for (const doc of snap.docs) {
    const v = doc.data();
    if (v.srNo > maxSrNo) maxSrNo = v.srNo;

    let entries = [];
    if (v.tokens && v.tokens.length > 0) {
      entries = expandTokens(v.tokens);
    } else if (v.details && v.details.length > 0) {
      entries = v.details.map((d) => ({ num: d.num1, amount: d.value }));
    }

    const agentId = v.agentId || 'default';
    agentTotals[agentId] = agentTotals[agentId] || {};

    for (const e of entries) {
      const amt = parseFloat(e.amount) || 0;
      if (amt > 0) {
        totals[e.num] = (totals[e.num] || 0) + amt;
        agentTotals[agentId][e.num] = (agentTotals[agentId][e.num] || 0) + amt;
      }
    }
  }

  // Clean up any zero entries
  for (const num of Object.keys(totals)) {
    if (totals[num] <= 0) delete totals[num];
  }
  for (const agentId of Object.keys(agentTotals)) {
    for (const num of Object.keys(agentTotals[agentId])) {
      if (agentTotals[agentId][num] <= 0) delete agentTotals[agentId][num];
    }
    if (Object.keys(agentTotals[agentId]).length === 0) delete agentTotals[agentId];
  }

  const rtdbRef = rtdbSessionRef(orgId, sid);
  await rtdbRef.child('totals').set(totals);
  await rtdbRef.child('agentTotals').set(agentTotals);
  await rtdbRef.child('voucherCount').set(maxSrNo);

  const sessionRef = orgSessionDoc(orgId, sid);
  const sessionSnap = await sessionRef.get();
  const sData = sessionSnap.exists ? sessionSnap.data() || {} : {};
  const luckyNo = sData.luckyNumber || sData.luckyNo || sData.winningNumber || sData.lucky || null;
  if (luckyNo) {
    await rtdbRef.child('luckyNumber').set(luckyNo);
  }

  await sessionRef.set({ totals, vouchersCount: snap.docs.length }, { merge: true });

  return NextResponse.json({
    success: true,
    sessionId: sid,
    totalNumbersCount: Object.keys(totals).length,
    vouchersCount: snap.docs.length,
    luckyNumber: luckyNo,
    totals,
  });
}
