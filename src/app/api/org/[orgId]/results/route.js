import { NextResponse } from 'next/server';
import { orgSessionDoc, orgSessionVouchersCol, orgRatesDoc, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { isBeforeCutover, getLegacyResults } from '@/lib/db/legacy-reports.js';

const pad2 = (n) => String(n).padStart(2, '0');
const ALL_NUMBERS = Array.from({ length: 100 }, (_, i) => pad2(i));

// GET /api/org/[orgId]/results — calculate payout results for a session.
// The session doc already maintains a `totals` aggregate (kept up to date by
// every voucher write), but per-agent breakdowns aren't a maintained
// aggregate — this reads the session's vouchers once and aggregates in JS,
// same shape as the original Postgres route's app-side aggregation.
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onCountRaw = searchParams.get('onCount');
  const ampm = searchParams.get('ampm');
  const onDate = searchParams.get('onDate');

  if (!onCountRaw || !ampm || !onDate) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate are required' }, { status: 400 });
  }

  const onCount = parseInt(onCountRaw);
  if (Number.isNaN(onCount)) {
    return NextResponse.json({ error: 'onCount must be a number' }, { status: 400 });
  }

  if (isBeforeCutover(onDate)) {
    const results = await getLegacyResults(orgId, { onCount, ampm, onDate });
    return NextResponse.json(results);
  }

  const sid = buildSessionId(onDate, ampm, onCount);

  const [sessionSnap, vouchersSnap, rateSnap] = await Promise.all([
    orgSessionDoc(orgId, sid).get(),
    orgSessionVouchersCol(orgId, sid).get(),
    orgRatesDoc(orgId).get(),
  ]);

  const lNo = sessionSnap.exists ? (sessionSnap.data().luckyNumber ?? null) : null;
  const num1Rate = rateSnap.exists ? (rateSnap.data().num1Rate ?? 0) : 0;

  const vouchers = vouchersSnap.docs.map(d => d.data());
  const agentNames = [...new Set(vouchers.map(v => v.agentName))].sort();

  // Flatten every voucher's detail lines for per-number/per-agent aggregation.
  const details = vouchers.flatMap(v => (v.details || []).map(d => ({ ...d, agentName: v.agentName })));

  const numberTotals = new Map();
  for (const d of details) {
    numberTotals.set(d.num1, (numberTotals.get(d.num1) || 0) + d.value);
  }

  const totalBet = details.reduce((sum, d) => sum + d.value, 0);
  const totalWinnerBet = lNo ? (numberTotals.get(lNo) || 0) : 0;
  const totalPayout = totalWinnerBet * num1Rate;
  const profit = totalBet - totalPayout;

  const perAgent = agentNames.map(agentName => {
    const agentDetails = details.filter(d => d.agentName === agentName);
    const agentTotalBet = agentDetails.reduce((sum, d) => sum + d.value, 0);
    const winnerBet = lNo
      ? agentDetails.filter(d => d.num1 === lNo).reduce((sum, d) => sum + d.value, 0)
      : 0;
    const payout = winnerBet * num1Rate;
    return {
      agentName,
      totalBet: agentTotalBet,
      winnerBet,
      payout,
      net: agentTotalBet - payout,
    };
  });

  const numberSummary = ALL_NUMBERS.map(num => {
    const numTotalBet = numberTotals.get(num) || 0;
    const isWinner = lNo === num;
    return {
      num,
      totalBet: numTotalBet,
      isWinner,
      payout: isWinner ? numTotalBet * num1Rate : 0,
    };
  });

  return NextResponse.json({
    luckyNo: lNo,
    totalBet,
    winnerNum: lNo,
    totalWinnerBet,
    totalPayout,
    profit,
    perAgent,
    numberSummary,
  });
}
