import { NextResponse } from 'next/server';
import { orgActivityLogsCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { canAccessAdminPanel } from '@/lib/auth/permissions.js';

const PAGE_SIZE = 50;

// GET /api/org/[orgId]/logs — paginated, filterable activity log for the org.
// Admin-panel only (org_admin / super_admin). Filtering/sorting/pagination
// happen in JS rather than as a Firestore query — activity logs for one org
// are a bounded, modest volume (and a natural candidate for periodic
// archival), so this avoids needing a composite index per filter combination.
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

  const fromMs = from ? new Date(`${from}T00:00:00`).getTime() : null;
  const toMs = to ? new Date(`${to}T23:59:59.999`).getTime() : null;

  const snap = await orgActivityLogsCol(orgId).get();
  let rows = snap.docs.map(d => d.data());

  if (userId) rows = rows.filter(r => r.userId === userId);
  if (action) rows = rows.filter(r => r.action === action);
  if (entity) rows = rows.filter(r => r.entity === entity);
  if (fromMs != null) rows = rows.filter(r => r.createdAt >= fromMs);
  if (toMs != null) rows = rows.filter(r => r.createdAt <= toMs);

  rows.sort((a, b) => b.createdAt - a.createdAt);

  const total = rows.length;
  const paged = rows.slice((page - 1) * PAGE_SIZE, page * PAGE_SIZE);

  return NextResponse.json({
    logs: paged,
    page,
    pageSize: PAGE_SIZE,
    total,
    totalPages: Math.max(1, Math.ceil(total / PAGE_SIZE)),
  });
}
