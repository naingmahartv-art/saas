import { NextResponse } from 'next/server';
import { orgSessionDoc, orgSessionVouchersCol, orgAgentsCol, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { rtdbSessionRef } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';
import { getActiveSession } from '@/lib/auth/permissions.js';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText, { maxEntries: 10000 });
    if (!error && entries) expanded.push(...entries);
  }
  return expanded;
}

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
        const agentKeys = Object.keys(agentTotals);
        if (agentKeys.length > 0) {
          const agentsSnap = await orgAgentsCol(orgId).get();
          const agentNameMap = {};
          agentsSnap.docs.forEach(d => {
            const data = d.data();
            if (data.agentName) agentNameMap[d.id] = data.agentName;
          });

          const byAgent = [];
          for (const [agentId, aTotals] of Object.entries(agentTotals)) {
            if (aTotals && aTotals[num] > 0) {
              const displayName = agentNameMap[agentId] || agentId;
              byAgent.push({ agentName: displayName, total: aTotals[num] });
            }
          }
          if (byAgent.length > 0) {
            return NextResponse.json({ byAgent });
          }
        }
      } else if (val.totals) {
        return NextResponse.json({
          totals: val.totals || {},
          buyTotals: val.buyTotals || {},
          luckyNumber: val.luckyNumber || null,
          vouchersCount: val.voucherCount || 0,
        });
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
      let entries = [];
      if (v.tokens && v.tokens.length > 0) entries = expandTokens(v.tokens);
      else if (v.details) entries = v.details.map((d) => ({ num: d.num1, amount: d.value }));
      
      const matchTotal = entries.filter(d => String(d.num) === String(num)).reduce((s, d) => s + (parseFloat(d.amount) || 0), 0);
      if (matchTotal > 0) {
        const name = v.agentName || v.agentId || 'Unknown';
        byAgentMap[name] = (byAgentMap[name] || 0) + matchTotal;
      }
    }
    const byAgent = Object.entries(byAgentMap).map(([agentName, total]) => ({ agentName, total }));
    return NextResponse.json({ byAgent });
  }

  const [sessionSnap, vouchersSnap] = await Promise.all([
    orgSessionDoc(orgId, sid).get(),
    orgSessionVouchersCol(orgId, sid).get(),
  ]);
  const vouchersCount = vouchersSnap.size;
  const sData = sessionSnap.exists ? sessionSnap.data() || {} : {};
  const luckyNumber = sData.luckyNumber || sData.luckyNo || sData.winningNumber || sData.lucky || null;

  const totals = {};
  const buyTotals = {};

  for (const doc of vouchersSnap.docs) {
    const v = doc.data();
    let entries = [];
    if (v.tokens && v.tokens.length > 0) entries = expandTokens(v.tokens);
    else if (v.details) entries = v.details.map((d) => ({ num: d.num1, amount: d.value }));

    for (const e of entries) {
      const amt = parseFloat(e.amount) || 0;
      if (amt > 0) totals[e.num] = (totals[e.num] || 0) + amt;
    }
  }

  // Auto-sync calculated totals to RTDB for future fast loads
  try {
    const rtdbRef = rtdbSessionRef(orgId, sid);
    await rtdbRef.child('totals').set(totals);
    await rtdbRef.child('voucherCount').set(vouchersCount);
    if (luckyNumber) await rtdbRef.child('luckyNumber').set(luckyNumber);
  } catch (err) {}

  return NextResponse.json({ totals, buyTotals, luckyNumber, vouchersCount });
}
