import { NextResponse } from 'next/server';
import { orgSessionDoc, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { rtdbSessionRef } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth/session.js';
import { computeOnCount, isValidSlotKey } from '@/lib/lottery/sessionSlots.js';
import { getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// GET /api/org/[orgId]/lucky?onDate=&ampm= — the winning number for one session.
// Lucky number lives as a field on that session's own document (folded in per
// the Firestore data model), not a separate collection — one doc read, no query.
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onDate = searchParams.get('onDate');
  const ampm = searchParams.get('ampm');
  if (!onDate || !ampm) {
    return NextResponse.json({ luckyNos: [] });
  }

  const onCount = computeOnCount(onDate, ampm);
  const sid = buildSessionId(onDate, ampm, onCount);
  const snap = await orgSessionDoc(orgId, sid).get();
  const data = snap.exists ? snap.data() : null;

  const luckyNos = data?.luckyNumber
    ? [{ id: sid, orgId, onDate, ampm, lNo: data.luckyNumber, createdAt: data.luckyNumberSetAt }]
    : [];

  return NextResponse.json({ luckyNos });
}

// POST /api/org/[orgId]/lucky — save the winning number for a session,
// replacing any previous value for the same org+onDate+ampm.
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { lNo, onDate, ampm } = await request.json();

  if (!lNo || !/^\d{2}$/.test(lNo)) {
    return NextResponse.json({ error: 'lNo must be a 2-digit string ("00"-"99")' }, { status: 400 });
  }
  if (!onDate) {
    return NextResponse.json({ error: 'onDate is required' }, { status: 400 });
  }
  if (!isValidSlotKey(ampm)) {
    return NextResponse.json({ error: 'ampm must be a valid time slot' }, { status: 400 });
  }

  const onCount = computeOnCount(onDate, ampm);
  const sid = buildSessionId(onDate, ampm, onCount);
  const now = Date.now();

  await orgSessionDoc(orgId, sid).set(
    { luckyNumber: lNo, luckyNumberSetAt: now },
    { merge: true }
  );

  try {
    await rtdbSessionRef(orgId, sid).child('luckyNumber').set(lNo);
  } catch (err) {
    console.error('Error updating luckyNumber in RTDB:', err);
  }

  await logActivity({
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'create',
    entity: 'lucky_no',
    entityId: sid,
    details: { lNo, onDate, ampm },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true, luckyNo: { lNo, onDate, ampm } });
}
