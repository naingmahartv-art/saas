import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { lotterySessions } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';
import { computeOnCount, isValidSlotKey } from '@/lib/lottery/sessionSlots.js';

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

  return NextResponse.json({ session: created }, { status: 201 });
}
