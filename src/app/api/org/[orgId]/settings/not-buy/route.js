import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { notBuyNumbers } from '@/lib/db/schema.js';
import { eq, and } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';

// GET /api/org/[orgId]/settings/not-buy?onCount=... — list not-buy numbers for a session
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onCount = searchParams.get('onCount');

  if (!onCount) {
    return NextResponse.json({ error: 'onCount is required' }, { status: 400 });
  }

  const db = getDb();

  const list = await db
    .select()
    .from(notBuyNumbers)
    .where(and(eq(notBuyNumbers.orgId, orgId), eq(notBuyNumbers.onCount, parseInt(onCount))));

  return NextResponse.json({ notBuyNumbers: list });
}

// POST /api/org/[orgId]/settings/not-buy — add a not-buy number
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { num, onCount } = await request.json();

  if (!num || !/^\d{2}$/.test(num)) {
    return NextResponse.json({ error: 'num must be a 2-digit string ("00"-"99")' }, { status: 400 });
  }
  if (!onCount) {
    return NextResponse.json({ error: 'onCount is required' }, { status: 400 });
  }

  const db = getDb();
  const onCountInt = parseInt(onCount);

  const [existing] = await db
    .select()
    .from(notBuyNumbers)
    .where(and(eq(notBuyNumbers.orgId, orgId), eq(notBuyNumbers.onCount, onCountInt), eq(notBuyNumbers.num, num)))
    .limit(1);

  if (existing) {
    return NextResponse.json({ error: 'Number already in not-buy list' }, { status: 409 });
  }

  await db.insert(notBuyNumbers).values({
    id: randomUUID(),
    orgId,
    onCount: onCountInt,
    num,
    createdAt: Date.now(),
  });

  return NextResponse.json({ success: true });
}

// DELETE /api/org/[orgId]/settings/not-buy — remove a not-buy number
export async function DELETE(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { id } = await request.json();

  if (!id) {
    return NextResponse.json({ error: 'id is required' }, { status: 400 });
  }

  const db = getDb();

  await db.delete(notBuyNumbers).where(and(eq(notBuyNumbers.id, id), eq(notBuyNumbers.orgId, orgId)));

  return NextResponse.json({ success: true });
}
