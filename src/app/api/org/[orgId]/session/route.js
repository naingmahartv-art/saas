import { NextResponse } from 'next/server';
import { getDb, orgSessionsCol, orgSessionDoc, orgRestrictionDoc, orgAgentsCol, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { computeOnCount, isValidSlotKey } from '@/lib/lottery/sessionSlots.js';
import { getClientIp, getActiveSession } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// GET /api/org/[orgId]/session — get the current active session + recent history
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const [current, historySnap] = await Promise.all([
    getActiveSession(orgId),
    orgSessionsCol(orgId).orderBy('onCount', 'desc').limit(50).get(),
  ]);

  const history = historySnap.docs.map(d => {
    const { onCount, onDate, ampm } = d.data();
    return { onCount, onDate, ampm };
  });

  return NextResponse.json({ current, history });
}

// POST /api/org/[orgId]/session — set or create the active session. Reopening
// a previously-closed session keeps its existing voucherCount/totals; only
// one session per org is ever active, so the previously-active one (if any
// and if different) is deactivated in the same transaction.
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { ampm, onDate, machineId } = await request.json();

  if (!ampm || !onDate) {
    return NextResponse.json({ error: 'ampm and onDate are required' }, { status: 400 });
  }
  if (!isValidSlotKey(ampm)) {
    return NextResponse.json({ error: 'ampm must be one of the fixed daily slots' }, { status: 400 });
  }

  const onCount = computeOnCount(onDate, ampm);
  const sid = buildSessionId(onDate, ampm, onCount);
  const targetRef = orgSessionDoc(orgId, sid);
  const limitRef = orgRestrictionDoc(orgId, 'limits');
  const now = Date.now();
  const resolvedMachineId = parseInt(machineId) || 1;

  const db = getDb();
  const [agentsSnap, prevSessionsSnap] = await Promise.all([
    orgAgentsCol(orgId).get(),
    orgSessionsCol(orgId).orderBy('onCount', 'desc').limit(10).get(),
  ]);

  let inheritedCommissions = {};
  let inheritedRates = {};

  // Baseline defaults from agent profiles
  for (const doc of agentsSnap.docs) {
    const a = doc.data() || {};
    if (a.commission !== undefined && a.commission !== null && a.commission !== '') {
      inheritedCommissions[doc.id] = parseFloat(a.commission) || 0;
    }
    if (a.rate !== undefined && a.rate !== null && a.rate !== '') {
      inheritedRates[doc.id] = parseFloat(a.rate) || 80;
    } else {
      inheritedRates[doc.id] = 80;
    }
  }

  // Inherit from the most recent previous session with commissions/rates
  for (const doc of prevSessionsSnap.docs) {
    if (doc.id === sid) continue;
    const sData = doc.data() || {};
    const hasComms = sData.agentCommissions && Object.keys(sData.agentCommissions).length > 0;
    const hasRates = sData.agentRates && Object.keys(sData.agentRates).length > 0;
    if (hasComms) {
      inheritedCommissions = { ...inheritedCommissions, ...sData.agentCommissions };
    }
    if (hasRates) {
      inheritedRates = { ...inheritedRates, ...sData.agentRates };
    }
    if (hasComms || hasRates) {
      break;
    }
  }

  const result = await db.runTransaction(async (tx) => {
    const [targetSnap, activeSnap] = await Promise.all([
      tx.get(targetRef),
      orgSessionsCol(orgId).where('isActive', '==', true).limit(1).get(),
    ]);

    const currentlyActive = activeSnap.empty ? null : { ref: activeSnap.docs[0].ref, id: activeSnap.docs[0].id };
    if (currentlyActive && currentlyActive.id !== sid) {
      tx.update(currentlyActive.ref, { isActive: false });
      // Reset limit amount so it does not carry over to another session
      tx.set(limitRef, { orgId, limitValue: 0, updatedAt: now }, { merge: true });
    }

    if (targetSnap.exists) {
      const existing = targetSnap.data() || {};
      const patched = {
        isActive: true,
        machineId: resolvedMachineId,
      };
      if (!existing.agentCommissions || Object.keys(existing.agentCommissions).length === 0) {
        patched.agentCommissions = inheritedCommissions;
      }
      if (!existing.agentRates || Object.keys(existing.agentRates).length === 0) {
        patched.agentRates = inheritedRates;
      }
      tx.update(targetRef, patched);
      return { reopened: true, data: { ...existing, ...patched } };
    }

    const created = {
      id: sid,
      orgId,
      onCount,
      ampm,
      onDate,
      machineId: resolvedMachineId,
      isActive: true,
      voucherCount: 0,
      totals: {},
      luckyNumber: null,
      agentCommissions: inheritedCommissions,
      agentRates: inheritedRates,
      createdAt: now,
    };
    tx.set(targetRef, created);
    return { reopened: false, data: created };
  });

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: result.reopened ? 'edit' : 'create',
    entity: 'session',
    entityId: sid,
    details: { onCount, ampm, onDate, reopened: result.reopened || undefined },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ session: result.data }, { status: result.reopened ? 200 : 201 });
}

// PATCH /api/org/[orgId]/session — close the active session (isActive -> false).
// While no session is active, cashiers are locked to read-only (see
// assertCashierWriteAllowed) — this is how a shift gets locked down.
export async function PATCH(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { action } = await request.json();
  if (action !== 'close') {
    return NextResponse.json({ error: "action must be 'close'" }, { status: 400 });
  }

  const active = await getActiveSession(orgId);
  if (!active) {
    return NextResponse.json({ error: 'No active session to close' }, { status: 400 });
  }

  await orgSessionDoc(orgId, active.id).update({ isActive: false });
  // Reset limit amount so closed session limits do not carry over to future session
  await orgRestrictionDoc(orgId, 'limits').set({ orgId, limitValue: 0, updatedAt: Date.now() }, { merge: true });

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'edit',
    entity: 'session',
    entityId: active.id,
    details: { onCount: active.onCount, ampm: active.ampm, onDate: active.onDate, closed: true },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ ok: true });
}
