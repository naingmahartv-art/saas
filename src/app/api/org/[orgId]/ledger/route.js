import { NextResponse } from 'next/server';
import { FieldValue } from 'firebase-admin/firestore';
import {
  getDb,
  orgSessionDoc,
  orgSessionVouchersCol,
  orgAgentDoc,
  sessionId as buildSessionId,
} from '@/lib/db/firestore.js';
import { applyRtdbDelta } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import { assertCashierWriteAllowed, getClientIp, getActiveSession } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';
import { isBeforeCutover, getLegacyLedgerSlips } from '@/lib/db/legacy-reports.js';

// GET /api/org/[orgId]/ledger — list saved ledger slips for a session
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  let onCount = searchParams.get('onCount');
  let ampm = searchParams.get('ampm');
  const onDate = searchParams.get('onDate');
  const agentName = searchParams.get('agentName');

  if (onDate && isBeforeCutover(onDate)) {
    const slips = await getLegacyLedgerSlips(orgId, { onCount, ampm, onDate, agentName });
    return NextResponse.json({ slips });
  }

  let sid;
  if (onCount && ampm && onDate) {
    sid = buildSessionId(onDate, ampm, onCount);
  } else {
    const active = await getActiveSession(orgId);
    if (!active) return NextResponse.json({ slips: [] });
    sid = active.id;
  }

  const sortDir = searchParams.get('sort') === 'desc' ? 'desc' : 'asc';
  const snap = await orgSessionVouchersCol(orgId, sid).orderBy('srNo', sortDir).get();

  let slips = snap.docs.map(d => d.data());
  if (agentName) {
    const needle = agentName.trim().toLowerCase();
    slips = slips.filter(s => s.agentName?.trim().toLowerCase() === needle);
  }

  return NextResponse.json({ slips });
}

function expandTokens(tokens) {
  const expanded = [];
  for (const tokenText of tokens || []) {
    const { entries, error } = parseNumberExpression(tokenText, { maxEntries: 10000 });
    if (error) {
      const err = new Error(error);
      err.token = tokenText;
      throw err;
    }
    expanded.push(...entries);
  }
  return expanded;
}

// POST /api/org/[orgId]/ledger — save a voucher
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { agentId, onCount, ampm, onDate, machineId, tokens, clientId } = await request.json();

  if (!agentId || !onCount || !ampm || !onDate) {
    return NextResponse.json({ error: 'agentId, onCount, ampm, and onDate are required' }, { status: 400 });
  }
  if (!Array.isArray(tokens) || tokens.length === 0) {
    return NextResponse.json({ error: 'tokens must be a non-empty array' }, { status: 400 });
  }

  const lockError = await assertCashierWriteAllowed(session, orgId);
  if (lockError) return NextResponse.json({ error: lockError.error }, { status: lockError.status });

  const sid = buildSessionId(onDate, ampm, onCount);
  const sessionRef = orgSessionDoc(orgId, sid);
  const sessionSnap = await sessionRef.get();
  if (!sessionSnap.exists || !sessionSnap.data().isActive) {
    return NextResponse.json({ error: 'No active session' }, { status: 400 });
  }

  const agentSnap = await orgAgentDoc(orgId, agentId).get();
  if (!agentSnap.exists) {
    return NextResponse.json({ error: 'Agent not found for this organization' }, { status: 400 });
  }
  const agent = agentSnap.data();

  let entries;
  try {
    entries = expandTokens(tokens);
  } catch (err) {
    return NextResponse.json({ error: `Could not parse "${err.token}": ${err.message}` }, { status: 400 });
  }
  if (entries.length === 0) {
    return NextResponse.json({ error: 'Tokens did not expand to any numbers' }, { status: 400 });
  }

  const perNumber = {};
  for (const e of entries) {
    const amt = parseFloat(e.amount) || 0;
    perNumber[e.num] = (perNumber[e.num] || 0) + amt;
  }
  const amount = Object.values(perNumber).reduce((sum, amt) => sum + amt, 0);
  const now = Date.now();

  const db = getDb();
  const voucherRef = clientId ? orgSessionVouchersCol(orgId, sid).doc(clientId) : orgSessionVouchersCol(orgId, sid).doc();

  const { srNo, created } = await db.runTransaction(async (tx) => {
    const [sSnap, existingVoucherSnap] = await Promise.all([tx.get(sessionRef), tx.get(voucherRef)]);
    if (!sSnap.exists) throw new Error('SESSION_NOT_FOUND');
    if (existingVoucherSnap.exists) {
      return { srNo: existingVoucherSnap.data().srNo, created: false };
    }
    const nextSrNo = (sSnap.data().voucherCount || 0) + 1;

    // Save ultra-light voucher document to Firestore (tokens array only, omit details)
    tx.set(voucherRef, {
      id: voucherRef.id,
      orgId,
      sessionId: sid,
      srNo: nextSrNo,
      onCount: parseInt(onCount),
      ampm,
      onDate,
      machineId: parseInt(machineId) || 1,
      agentId,
      agentName: agent.agentName,
      amount,
      tokens,
      createdAt: now,
      createdBy: session.id,
    });
    tx.update(sessionRef, { voucherCount: nextSrNo });
    return { srNo: nextSrNo, created: true };
  });

  if (created) {
    await logActivity({
      orgId,
      userId: session.id,
      userName: session.name,
      userRole: session.role,
      action: 'create',
      entity: 'voucher',
      entityId: srNo != null ? String(srNo) : null,
      details: { srNo, onCount, ampm, agentName: agent.agentName, amount, tokens },
      ipAddress: getClientIp(request),
    });
  }

  return NextResponse.json({ success: true, srNo });
}
