import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { hotNumbers } from '@/lib/db/schema.js';
import { eq, and } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';

// GET /api/org/[orgId]/settings/hot-numbers?onCount=... — list hot numbers for a session
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
    .from(hotNumbers)
    .where(and(eq(hotNumbers.orgId, orgId), eq(hotNumbers.onCount, parseInt(onCount))));

  return NextResponse.json({ hotNumbers: list });
}

// POST /api/org/[orgId]/settings/hot-numbers — add a hot number
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
    .from(hotNumbers)
    .where(and(eq(hotNumbers.orgId, orgId), eq(hotNumbers.onCount, onCountInt), eq(hotNumbers.num, num)))
    .limit(1);

  if (existing) {
    return NextResponse.json({ error: 'Number already in hot list' }, { status: 409 });
  }

  await db.insert(hotNumbers).values({
    id: randomUUID(),
    orgId,
    onCount: onCountInt,
    num,
    createdAt: Date.now(),
  });

  return NextResponse.json({ success: true });
}

// DELETE /api/org/[orgId]/settings/hot-numbers — remove a hot number
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

  await db.delete(hotNumbers).where(and(eq(hotNumbers.id, id), eq(hotNumbers.orgId, orgId)));

  return NextResponse.json({ success: true });
}
