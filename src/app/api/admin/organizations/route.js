import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { getDb, PLAN_PRICES } from '@/lib/db/index';
import { organizations, subscriptions } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import { v4 as uuidv4 } from 'uuid';

// GET — list all organizations
export async function GET(request) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }
  const db = getDb();
  const orgs = await db.select().from(organizations).orderBy(organizations.createdAt);
  return NextResponse.json(orgs);
}

// POST — create organization
export async function POST(request) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { name, plan } = await request.json();
  if (!name || !plan) return NextResponse.json({ error: 'Name and plan required' }, { status: 400 });
  if (!['basic', 'advance'].includes(plan)) {
    return NextResponse.json({ error: 'Plan must be basic or advance' }, { status: 400 });
  }

  const slug = name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '');
  const db = getDb();

  const orgId = uuidv4();
  await db.insert(organizations).values({
    id: orgId,
    name,
    slug,
    plan,
    status: 'active',
    createdBy: session.id,
    createdAt: Date.now(),
  });

  await db.insert(subscriptions).values({
    id: uuidv4(),
    orgId,
    plan,
    amount: PLAN_PRICES[plan],
    status: 'active',
    createdAt: Date.now(),
  });

  return NextResponse.json({ id: orgId, name, plan, slug }, { status: 201 });
}
