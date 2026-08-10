import { NextResponse } from 'next/server';
import { orgSessionVouchersCol, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { rtdbSessionRef } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText);
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
  const onCount = searchParams.get('onCount');
  const ampm = searchParams.get('ampm');
  const onDate = searchParams.get('onDate');

  if (!onCount || !ampm || !onDate) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate are required' }, { status: 400 });
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

  const sessionRef = rtdbSessionRef(orgId, sid);
  await sessionRef.child('totals').set(totals);
  await sessionRef.child('agentTotals').set(agentTotals);
  await sessionRef.child('voucherCount').set(maxSrNo);

  return NextResponse.json({
    success: true,
    sessionId: sid,
    totalNumbersCount: Object.keys(totals).length,
    vouchersCount: snap.docs.length,
    totals,
  });
}
