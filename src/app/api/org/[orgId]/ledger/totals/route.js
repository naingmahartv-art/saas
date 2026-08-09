import { NextResponse } from 'next/server';
import { orgSessionDoc, orgSessionVouchersCol, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';
import { getActiveSession } from '@/lib/auth/permissions.js';

// GET /api/org/[orgId]/ledger/totals?onCount=&ampm=
//   -> { totals: { [num]: total } } — a single read of the session doc's
//      maintained `totals` map (kept up to date transactionally by every
//      voucher save/edit/delete — never recomputed by scanning vouchers).
// GET .../totals?onCount=&ampm=&num=62
//   -> { byAgent: [{ agentName, total }] } — per-agent breakdown for one
//      number (feeds the "Checking Agent" overlay); this one *does* need to
//      scan the session's vouchers, since per-agent breakdown isn't a
//      maintained aggregate — it's a rare, manually-triggered lookup, not
//      the hot path.
// Defaults to the active session when onCount/ampm aren't given.
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onCount = searchParams.get('onCount');
  const ampm = searchParams.get('ampm');
  const onDate = searchParams.get('onDate');
  const num = searchParams.get('num');

  // Callers today only ever ask for the currently active session and don't
  // pass onDate (matching the original Postgres route's behavior, which
  // didn't disambiguate by date either) — resolve via onDate+ampm+onCount
  // only when all three are explicitly given, otherwise use the active session.
  let sid;
  if (onCount && ampm && onDate) {
    sid = buildSessionId(onDate, ampm, onCount);
  } else {
    const active = await getActiveSession(orgId);
    if (!active) return NextResponse.json(num ? { byAgent: [] } : { totals: {} });
    sid = active.id;
  }

  if (num) {
    const snap = await orgSessionVouchersCol(orgId, sid).get();
    const byAgentMap = {};
    for (const doc of snap.docs) {
      const v = doc.data();
      const matchTotal = (v.details || []).filter(d => d.num1 === num).reduce((s, d) => s + d.value, 0);
      if (matchTotal > 0) byAgentMap[v.agentName] = (byAgentMap[v.agentName] || 0) + matchTotal;
    }
    const byAgent = Object.entries(byAgentMap).map(([agentName, total]) => ({ agentName, total }));
    return NextResponse.json({ byAgent });
  }

  const sessionSnap = await orgSessionDoc(orgId, sid).get();
  const totals = sessionSnap.exists ? (sessionSnap.data().totals || {}) : {};
  return NextResponse.json({ totals });
}
