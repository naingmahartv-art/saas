import { NextResponse } from 'next/server';
import { getDb, orgSessionsCol, orgSessionDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';

// GET /api/org/[orgId]/settings/session-commissions?startDate=...&endDate=...
// Returns sessions in date range with their agentCommissions map
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const startDate = searchParams.get('startDate');
  const endDate = searchParams.get('endDate');

  if (!startDate || !endDate) {
    return NextResponse.json({ error: 'startDate and endDate are required' }, { status: 400 });
  }

  try {
    const snap = await orgSessionsCol(orgId)
      .where('onDate', '>=', startDate)
      .where('onDate', '<=', endDate)
      .get();

    const sessions = snap.docs.map((docSnap) => {
      const d = docSnap.data() || {};
      return {
        id: docSnap.id,
        onDate: d.onDate,
        ampm: d.ampm || 'AM',
        onCount: d.onCount || 1,
        agentCommissions: d.agentCommissions || {},
      };
    });

    // Sort by onDate asc, onCount asc, ampm asc
    sessions.sort((a, b) => {
      if (a.onDate !== b.onDate) return a.onDate.localeCompare(b.onDate);
      if (a.onCount !== b.onCount) return a.onCount - b.onCount;
      return (a.ampm || '').localeCompare(b.ampm || '');
    });

    return NextResponse.json({ sessions });
  } catch (err) {
    console.error('Error fetching session commissions:', err);
    return NextResponse.json({ error: err.message || 'Failed to fetch sessions' }, { status: 500 });
  }
}

// PUT /api/org/[orgId]/settings/session-commissions
// Bulk updates agentCommissions for multiple sessions
export async function PUT(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const { updates } = await request.json();
    if (!Array.isArray(updates) || updates.length === 0) {
      return NextResponse.json({ error: 'updates array is required' }, { status: 400 });
    }

    const batch = getDb().batch();
    for (const item of updates) {
      const { sessionId, agentCommissions } = item;
      if (!sessionId || !agentCommissions) continue;

      const ref = orgSessionDoc(orgId, sessionId);
      batch.set(ref, { agentCommissions, updatedAt: new Date() }, { merge: true });
    }

    await batch.commit();
    return NextResponse.json({ success: true, count: updates.length });
  } catch (err) {
    console.error('Error updating session commissions:', err);
    return NextResponse.json({ error: err.message || 'Failed to update session commissions' }, { status: 500 });
  }
}
