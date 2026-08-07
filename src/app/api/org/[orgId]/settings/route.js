import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { rates, limits } from '@/lib/db/schema.js';
import { eq } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';

// GET /api/org/[orgId]/settings — load all settings for the org
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();

  const [ratesRow] = await db.select().from(rates).where(eq(rates.orgId, orgId)).limit(1);
  const [limitsRow] = await db.select().from(limits).where(eq(limits.orgId, orgId)).limit(1);

  return NextResponse.json({ rates: ratesRow ?? null, limits: limitsRow ?? null });
}

// POST /api/org/[orgId]/settings — upsert rates
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { num1Rate, num2Rate } = await request.json();

  if (num1Rate === undefined || num2Rate === undefined) {
    return NextResponse.json({ error: 'num1Rate and num2Rate are required' }, { status: 400 });
  }

  const db = getDb();
  const now = Date.now();

  const [existing] = await db.select().from(rates).where(eq(rates.orgId, orgId)).limit(1);

  if (existing) {
    await db
      .update(rates)
      .set({ num1Rate: parseFloat(num1Rate) || 0, num2Rate: parseFloat(num2Rate) || 0, updatedAt: now })
      .where(eq(rates.id, existing.id));
  } else {
    await db.insert(rates).values({
      id: randomUUID(),
      orgId,
      num1Rate: parseFloat(num1Rate) || 0,
      num2Rate: parseFloat(num2Rate) || 0,
      updatedAt: now,
    });
  }

  const [updatedRow] = await db.select().from(rates).where(eq(rates.orgId, orgId)).limit(1);

  return NextResponse.json({ success: true, rates: updatedRow });
}
