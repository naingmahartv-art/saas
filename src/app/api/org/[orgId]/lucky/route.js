import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { luckyNo } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';
import { isValidSlotKey } from '@/lib/lottery/sessionSlots.js';
import { getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// GET /api/org/[orgId]/lucky — get lucky number(s) for a session
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onDate = searchParams.get('onDate');
  const ampm = searchParams.get('ampm');

  const db = getDb();

  const conditions = [eq(luckyNo.orgId, orgId)];
  if (onDate) conditions.push(eq(luckyNo.onDate, onDate));
  if (ampm) conditions.push(eq(luckyNo.ampm, ampm));

  const luckyNos = await db
    .select()
    .from(luckyNo)
    .where(and(...conditions))
    .orderBy(desc(luckyNo.createdAt));

  return NextResponse.json({ luckyNos });
}

// POST /api/org/[orgId]/lucky — save lucky number for current session
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

  const db = getDb();

  // Replace any existing lucky number for this org+onDate+ampm
  await db
    .delete(luckyNo)
    .where(
      and(
        eq(luckyNo.orgId, orgId),
        eq(luckyNo.onDate, onDate),
        eq(luckyNo.ampm, ampm),
      )
    );

  const id = randomUUID();
  const now = Date.now();

  await db.insert(luckyNo).values({
    id,
    orgId,
    onDate,
    ampm,
    lNo,
    createdAt: now,
  });

  const [inserted] = await db.select().from(luckyNo).where(eq(luckyNo.id, id));

  await logActivity(db, {
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'create',
    entity: 'lucky_no',
    entityId: id,
    details: { lNo, onDate, ampm },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ success: true, luckyNo: inserted });
}
