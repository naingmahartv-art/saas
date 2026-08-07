import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { receive } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';

// GET /api/org/[orgId]/receive — list cash receipts
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const agentName = searchParams.get('agentName');
  const onDate = searchParams.get('onDate');

  const conditions = [eq(receive.orgId, orgId)];
  if (agentName) conditions.push(eq(receive.agentName, agentName));
  if (onDate) conditions.push(eq(receive.onDate, onDate));

  const db = getDb();
  const receives = await db
    .select()
    .from(receive)
    .where(and(...conditions))
    .orderBy(desc(receive.onDate));

  return NextResponse.json({ receives });
}

// POST /api/org/[orgId]/receive — record cash received from agent
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { agentName, amount, onDate, onCount, ampm } = await request.json();

  if (!agentName?.trim()) {
    return NextResponse.json({ error: 'Agent name is required' }, { status: 400 });
  }
  if (!(parseFloat(amount) > 0)) {
    return NextResponse.json({ error: 'Amount must be greater than 0' }, { status: 400 });
  }
  if (!onDate) {
    return NextResponse.json({ error: 'Date is required' }, { status: 400 });
  }

  const db = getDb();
  const id = randomUUID();
  const now = Date.now();

  await db.insert(receive).values({
    id,
    orgId,
    agentName: agentName.trim(),
    amount: parseFloat(amount),
    onDate,
    onCount: onCount != null && onCount !== '' ? parseInt(onCount, 10) : null,
    ampm: ampm || null,
    createdAt: now,
  });

  const [receiveRow] = await db.select().from(receive).where(eq(receive.id, id));
  return NextResponse.json({ success: true, receive: receiveRow });
}
