import { NextResponse } from 'next/server';
import { orgSessionDoc, orgSessionVouchersCol, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { rtdbSessionRef } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';
import { getActiveSession } from '@/lib/auth/permissions.js';

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

  let sid;
  if (onCount && ampm && onDate) {
    sid = buildSessionId(onDate, ampm, onCount);
  } else {
    const active = await getActiveSession(orgId);
    if (!active) return NextResponse.json(num ? { byAgent: [] } : { totals: {} });
    sid = active.id;
  }

  // 1. Try reading from Realtime DB first
  try {
    const rtdbSnap = await rtdbSessionRef(orgId, sid).once('value');
    if (rtdbSnap.exists()) {
      const val = rtdbSnap.val() || {};
      if (num) {
        const agentTotals = val.agentTotals || {};
        const byAgent = [];
        for (const [agentId, aTotals] of Object.entries(agentTotals)) {
          if (aTotals && aTotals[num] > 0) {
            byAgent.push({ agentName: agentId, total: aTotals[num] });
          }
        }
        if (byAgent.length > 0) {
          return NextResponse.json({ byAgent });
        }
      } else if (val.totals) {
        return NextResponse.json({ totals: val.totals || {}, buyTotals: val.buyTotals || {} });
      }
    }
  } catch (err) {
    console.error('RTDB totals read error fallback to Firestore:', err);
  }

  // 2. Fallback to Firestore session doc / vouchers
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
  const sessionData = sessionSnap.exists ? sessionSnap.data() : {};
  const totals = sessionData.totals || {};
  const buyTotals = sessionData.buyTotals || {};
  return NextResponse.json({ totals, buyTotals });
}
