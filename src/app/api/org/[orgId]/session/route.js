import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { lotterySessions } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';
import { computeOnCount, isValidSlotKey } from '@/lib/lottery/sessionSlots.js';
import { getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// GET /api/org/[orgId]/session — get the current active session
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();

  const [current] = await db
    .select()
    .from(lotterySessions)
    .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
    .orderBy(desc(lotterySessions.createdAt))
    .limit(1);

  // Return list of distinct recent sessions for the dropdown
  const history = await db
    .selectDistinct({
      onCount: lotterySessions.onCount,
      onDate: lotterySessions.onDate,
      ampm: lotterySessions.ampm,
    })
    .from(lotterySessions)
    .where(eq(lotterySessions.orgId, orgId))
    .orderBy(desc(lotterySessions.onCount))
    .limit(50);

  return NextResponse.json({ current: current ?? null, history });
}

// POST /api/org/[orgId]/session — set or create active session
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
  const db = getDb();

  // Deactivate all existing sessions for this org
  await db
    .update(lotterySessions)
    .set({ isActive: 0 })
    .where(eq(lotterySessions.orgId, orgId));

  // onCount is now a deterministic function of (onDate, ampm), so it alone identifies the session
  const [existing] = await db
    .select()
    .from(lotterySessions)
    .where(
      and(
        eq(lotterySessions.orgId, orgId),
        eq(lotterySessions.onCount, onCount),
      )
    )
    .limit(1);

  if (existing) {
    await db
      .update(lotterySessions)
      .set({ isActive: 1, machineId: parseInt(machineId) || existing.machineId })
      .where(eq(lotterySessions.id, existing.id));

    await logActivity(db, {
      orgId,
      userId: session.id,
      userName: session.name,
      userRole: session.role,
      action: 'edit',
      entity: 'session',
      entityId: existing.id,
      details: { onCount, ampm, onDate, reopened: true },
      ipAddress: getClientIp(request),
    });

    return NextResponse.json({ session: { ...existing, isActive: 1, machineId: parseInt(machineId) || existing.machineId } });
  }

  const id = randomUUID();
  const now = Date.now();

  await db.insert(lotterySessions).values({
    id,
    orgId,
    onCount,
    ampm,
    onDate,
    machineId: parseInt(machineId) || 1,
    isActive: 1,
    createdAt: now,
  });

  const [created] = await db
    .select()
    .from(lotterySessions)
    .where(eq(lotterySessions.id, id));

  await logActivity(db, {
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'create',
    entity: 'session',
    entityId: id,
    details: { onCount, ampm, onDate },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ session: created }, { status: 201 });
}

// PATCH /api/org/[orgId]/session — close the active session (isActive -> 0).
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

  const db = getDb();

  const [active] = await db
    .select()
    .from(lotterySessions)
    .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
    .limit(1);

  if (!active) {
    return NextResponse.json({ error: 'No active session to close' }, { status: 400 });
  }

  await db.update(lotterySessions).set({ isActive: 0 }).where(eq(lotterySessions.id, active.id));

  await logActivity(db, {
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
