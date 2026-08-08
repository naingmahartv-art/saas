import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { activityLogs } from '@/lib/db/schema.js';
import { eq, and, desc, gte, lte, count } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { canAccessAdminPanel } from '@/lib/auth/permissions.js';

const PAGE_SIZE = 50;

// GET /api/org/[orgId]/logs — paginated, filterable activity log for the org.
// Admin-panel only (org_admin / super_admin).
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }
  if (!canAccessAdminPanel(session.role)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const userId = searchParams.get('userId');
  const action = searchParams.get('action');
  const entity = searchParams.get('entity');
  const from = searchParams.get('from'); // yyyy-mm-dd
  const to = searchParams.get('to');
  const page = Math.max(1, parseInt(searchParams.get('page')) || 1);

  const db = getDb();
  const conditions = [eq(activityLogs.orgId, orgId)];
  if (userId) conditions.push(eq(activityLogs.userId, userId));
  if (action) conditions.push(eq(activityLogs.action, action));
  if (entity) conditions.push(eq(activityLogs.entity, entity));
  if (from) conditions.push(gte(activityLogs.createdAt, new Date(`${from}T00:00:00`).getTime()));
  if (to) conditions.push(lte(activityLogs.createdAt, new Date(`${to}T23:59:59.999`).getTime()));

  const where = and(...conditions);

  const [[{ value: total }], rows] = await Promise.all([
    db.select({ value: count() }).from(activityLogs).where(where),
    db
      .select()
      .from(activityLogs)
      .where(where)
      .orderBy(desc(activityLogs.createdAt))
      .limit(PAGE_SIZE)
      .offset((page - 1) * PAGE_SIZE),
  ]);

  return NextResponse.json({
    logs: rows,
    page,
    pageSize: PAGE_SIZE,
    total,
    totalPages: Math.max(1, Math.ceil(total / PAGE_SIZE)),
  });
}
