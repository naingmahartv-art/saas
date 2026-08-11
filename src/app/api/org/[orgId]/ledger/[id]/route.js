import { NextResponse } from 'next/server';
import { FieldValue } from 'firebase-admin/firestore';
import { getDb, orgSessionDoc, orgSessionVoucherDoc, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { applyRtdbDelta } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import { assertCashierWriteAllowed, getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText);
    if (error) {
      const err = new Error(error);
      err.token = tokenText;
      throw err;
    }
    expanded.push(...entries);
  }
  return expanded;
}

function parseSessionCoords(source) {
  const onCount = source.get ? source.get('onCount') : source.onCount;
  const ampm = source.get ? source.get('ampm') : source.ampm;
  const onDate = source.get ? source.get('onDate') : source.onDate;
  if (!onCount || !ampm || !onDate) return null;
  return { onCount, ampm, onDate };
}

// PUT /api/org/[orgId]/ledger/[id] — edit a voucher
export async function PUT(request, { params }) {
  const { orgId, id } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body = await request.json();
  const { tokens, agentId } = body;
  const coords = parseSessionCoords(body);
  if (!coords) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate are required' }, { status: 400 });
  }
  if (!Array.isArray(tokens) || tokens.length === 0) {
    return NextResponse.json({ error: 'tokens must be a non-empty array' }, { status: 400 });
  }

  const lockError = await assertCashierWriteAllowed(session, orgId);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const sid = buildSessionId(coords.onDate, coords.ampm, coords.onCount);
  const voucherRef = orgSessionVoucherDoc(orgId, sid, id);
  const sessionRef = orgSessionDoc(orgId, sid);

  let newEntries;
  try {
    newEntries = expandTokens(tokens);
  } catch (err) {
    return NextResponse.json({ error: `Could not parse "${err.token}": ${err.message}` }, { status: 400 });
  }
  if (newEntries.length === 0) {
    return NextResponse.json({ error: 'Tokens did not expand to any numbers' }, { status: 400 });
  }

  const newPerNum = {};
  for (const e of newEntries) {
    const amt = parseFloat(e.amount) || 0;
    newPerNum[e.num] = (newPerNum[e.num] || 0) + amt;
  }
  const newAmount = Object.values(newPerNum).reduce((sum, amt) => sum + amt, 0);

  const db = getDb();
  let slip;
  let deltaMap = {};
  let updatedAgentId;
  let updatedAgentName;

  await db.runTransaction(async (tx) => {
    const voucherSnap = await tx.get(voucherRef);
    if (!voucherSnap.exists) throw new Error('NOT_FOUND');
    slip = voucherSnap.data();

    updatedAgentId = slip.agentId;
    updatedAgentName = slip.agentName;

    if (agentId && agentId !== slip.agentId) {
      updatedAgentId = agentId;
      if (agentId === 'buy_offload') {
        updatedAgentName = 'Buy Offload (အဝယ်စာရင်း)';
      } else {
        const agentSnap = await orgAgentDoc(orgId, agentId).get();
        if (agentSnap.exists) {
          updatedAgentName = agentSnap.data().agentName;
        } else {
          updatedAgentName = agentId;
        }
      }
    }

    let oldEntries = [];
    if (slip.tokens && slip.tokens.length > 0) {
      try {
        oldEntries = expandTokens(slip.tokens);
      } catch (e) {}
    } else if (slip.details && slip.details.length > 0) {
      oldEntries = slip.details.map((d) => ({ num: d.num1, amount: d.value }));
    }

    const oldPerNum = {};
    for (const e of oldEntries) {
      const amt = parseFloat(e.amount) || 0;
      oldPerNum[e.num] = (oldPerNum[e.num] || 0) + amt;
    }

    // Compute net delta per number (new - old)
    const allNums = new Set([...Object.keys(oldPerNum), ...Object.keys(newPerNum)]);
    for (const num of allNums) {
      const diff = (newPerNum[num] || 0) - (oldPerNum[num] || 0);
      if (diff !== 0) deltaMap[num] = diff;
    }

    const totalsUpdate = {};
    for (const [num, amt] of Object.entries(deltaMap)) {
      totalsUpdate[`totals.${num}`] = FieldValue.increment(amt);
    }

    tx.update(voucherRef, {
      tokens,
      amount: newAmount,
      agentId: updatedAgentId,
      agentName: updatedAgentName,
    });
    if (Object.keys(totalsUpdate).length > 0) tx.update(sessionRef, totalsUpdate);
  }).catch(err => {
    if (err.message === 'NOT_FOUND') return null;
    throw err;
  });

  if (!slip) {
    return NextResponse.json({ error: 'Ledger entry not found' }, { status: 404 });
  }

  // Update Realtime DB
  if (Object.keys(deltaMap).length > 0 || updatedAgentId !== slip.agentId) {
    await applyRtdbDelta(orgId, sid, updatedAgentId || slip.agentId, deltaMap, 0);
  }

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'edit',
    entity: 'voucher',
    entityId: String(slip.srNo),
    details: { srNo: slip.srNo, onCount: coords.onCount, ampm: coords.ampm, amount: newAmount, tokens },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true });
}

// DELETE /api/org/[orgId]/ledger/[id]?onCount=&ampm=&onDate= — remove a saved voucher
export async function DELETE(request, { params }) {
  const { orgId, id } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const coords = parseSessionCoords({
    onCount: searchParams.get('onCount'),
    ampm: searchParams.get('ampm'),
    onDate: searchParams.get('onDate'),
  });
  if (!coords) {
    return NextResponse.json({ error: 'onCount, ampm, and onDate query params are required' }, { status: 400 });
  }

  const lockError = await assertCashierWriteAllowed(session, orgId);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const sid = buildSessionId(coords.onDate, coords.ampm, coords.onCount);
  const voucherRef = orgSessionVoucherDoc(orgId, sid, id);
  const sessionRef = orgSessionDoc(orgId, sid);

  const db = getDb();
  let slip;
  let deltaMap = {};

  await db.runTransaction(async (tx) => {
    const voucherSnap = await tx.get(voucherRef);
    if (!voucherSnap.exists) throw new Error('NOT_FOUND');
    slip = voucherSnap.data();

    let oldEntries = [];
    if (slip.tokens && slip.tokens.length > 0) {
      try {
        oldEntries = expandTokens(slip.tokens);
      } catch (e) {}
    } else if (slip.details && slip.details.length > 0) {
      oldEntries = slip.details.map((d) => ({ num: d.num1, amount: d.value }));
    }

    const totalsUpdate = {};
    for (const e of oldEntries) {
      const amt = parseFloat(e.amount) || 0;
      if (amt > 0) {
        deltaMap[e.num] = (deltaMap[e.num] || 0) - amt;
        totalsUpdate[`totals.${e.num}`] = FieldValue.increment(-amt);
      }
    }

    tx.delete(voucherRef);
    if (Object.keys(totalsUpdate).length > 0) tx.update(sessionRef, totalsUpdate);
  }).catch(err => {
    if (err.message === 'NOT_FOUND') return null;
    throw err;
  });

  if (!slip) {
    return NextResponse.json({ error: 'Ledger entry not found' }, { status: 404 });
  }

  // Update Realtime DB (decrements totals and removes zero keys)
  if (Object.keys(deltaMap).length > 0) {
    await applyRtdbDelta(orgId, sid, slip.agentId, deltaMap, -1);
  }

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'delete',
    entity: 'voucher',
    entityId: String(slip.srNo),
    details: { srNo: slip.srNo, onCount: coords.onCount, ampm: coords.ampm, agentName: slip.agentName, amount: slip.amount },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true });
}
