import { NextResponse } from 'next/server';
import { orgSessionsCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

// GET /api/org/[orgId]/weekly-lucky?startDate=YYYY-MM-DD&endDate=YYYY-MM-DD
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const startDate = searchParams.get('startDate');
  const endDate = searchParams.get('endDate');

  try {
    let query = orgSessionsCol(orgId);

    if (startDate && endDate) {
      query = query
        .where('onDate', '>=', startDate)
        .where('onDate', '<=', endDate)
        .orderBy('onDate', 'asc')
        .orderBy('onCount', 'asc');
    } else {
      query = query.orderBy('onCount', 'desc').limit(250);
    }

    const snap = await query.get();
    const sessions = snap.docs.map((d) => {
      const data = d.data() || {};
      return {
        id: d.id,
        onDate: data.onDate,
        ampm: data.ampm,
        onCount: data.onCount,
        luckyNumber: data.luckyNumber ?? null,
        luckyNumberSetAt: data.luckyNumberSetAt ?? null,
      };
    });

    return NextResponse.json({ sessions });
  } catch (err) {
    // Fallback if composite index is pending: fetch recent and filter in JS
    try {
      const fallbackSnap = await orgSessionsCol(orgId).orderBy('onCount', 'desc').limit(250).get();
      let sessions = fallbackSnap.docs.map((d) => {
        const data = d.data() || {};
        return {
          id: d.id,
          onDate: data.onDate,
          ampm: data.ampm,
          onCount: data.onCount,
          luckyNumber: data.luckyNumber ?? null,
          luckyNumberSetAt: data.luckyNumberSetAt ?? null,
        };
      });

      if (startDate && endDate) {
        sessions = sessions.filter((s) => s.onDate >= startDate && s.onDate <= endDate);
      }

      sessions.sort((a, b) => a.onCount - b.onCount);
      return NextResponse.json({ sessions });
    } catch (fallbackErr) {
      return NextResponse.json({ error: fallbackErr.message }, { status: 500 });
    }
  }
}
