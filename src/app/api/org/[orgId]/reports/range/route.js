import { NextResponse } from 'next/server';
import { orgSessionsCol, orgSessionVouchersCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { isBeforeCutover, getLegacyLedgerSlips } from '@/lib/db/legacy-reports.js';

// GET /api/org/[orgId]/reports/range?startDate=YYYY-MM-DD&endDate=YYYY-MM-DD&agentName=...
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const startDate = searchParams.get('startDate');
  const endDate = searchParams.get('endDate');
  const agentName = searchParams.get('agentName');

  if (!startDate || !endDate) {
    return NextResponse.json({ error: 'startDate and endDate are required' }, { status: 400 });
  }

  // Query sessions within date range from Firestore
  const sessionsSnap = await orgSessionsCol(orgId)
    .where('onDate', '>=', startDate)
    .where('onDate', '<=', endDate)
    .get();

  const allSlips = [];
  const sessionList = [];

  for (const doc of sessionsSnap.docs) {
    const sData = doc.data();
    sessionList.push({ id: doc.id, ...sData });

    const vouchersSnap = await orgSessionVouchersCol(orgId, doc.id)
      .orderBy('srNo', 'desc')
      .get();

    for (const vDoc of vouchersSnap.docs) {
      const v = vDoc.data();
      if (!agentName || v.agentName?.toLowerCase().includes(agentName.toLowerCase())) {
        allSlips.push({
          ...v,
          onDate: sData.onDate,
          ampm: sData.ampm,
          onCount: sData.onCount,
          luckyNo: sData.luckyNo || sData.winningNumber || null,
          rate: sData.rate || 80,
        });
      }
    }
  }

  // Handle legacy slips if startDate touches pre-cutover dates
  if (isBeforeCutover(startDate)) {
    try {
      const legacySlips = await getLegacyLedgerSlips(orgId, { agentName });
      const filteredLegacy = legacySlips.filter(
        s => s.onDate >= startDate && s.onDate <= endDate
      );
      allSlips.push(...filteredLegacy);
    } catch {
      // ignore legacy error if table unconfigured
    }
  }

  // Sort slips by created time descending
  allSlips.sort((a, b) => (b.createdAt || 0) - (a.createdAt || 0));

  return NextResponse.json({
    slips: allSlips,
    sessions: sessionList,
  });
}
