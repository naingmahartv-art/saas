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
  const ampmFilter = searchParams.get('ampm');

  if (!startDate || !endDate) {
    return NextResponse.json({ error: 'startDate and endDate are required' }, { status: 400 });
  }

  // Query all sessions for org and filter by date range & slot
  const sessionsSnap = await orgSessionsCol(orgId).get();

  const allSlips = [];
  const sessionList = [];

  function matchesSlot(sData, docId, filter) {
    if (!filter) return true;
    const ampmVal = sData.ampm || (docId.includes('_') ? docId.split('_')[1] : '');
    const onCountVal = sData.onCount || (docId.includes('_') ? parseInt(docId.split('_')[2], 10) : null);

    if (ampmVal === filter) return true;
    if (filter === '12:00' && (ampmVal === '12:00' || ampmVal === 'AM' || (typeof onCountVal === 'number' && onCountVal % 10 === 2))) return true;
    if (filter === '04:00' && (ampmVal === '04:00' || ampmVal === 'PM' || (typeof onCountVal === 'number' && onCountVal % 10 === 3))) return true;
    if (filter === '09:00' && (ampmVal === '09:00' || (typeof onCountVal === 'number' && onCountVal % 10 === 1))) return true;
    return false;
  }

  for (const doc of sessionsSnap.docs) {
    const sData = doc.data() || {};
    const sessionDate = sData.onDate || (doc.id.includes('_') ? doc.id.split('_')[0] : '');

    // Filter by date range
    if (!sessionDate || sessionDate < startDate || sessionDate > endDate) continue;
    // Filter by slot
    if (!matchesSlot(sData, doc.id, ampmFilter)) continue;

    const resolvedAmpm = sData.ampm || (doc.id.includes('_') ? doc.id.split('_')[1] : '12:00');
    const resolvedOnCount = sData.onCount || (doc.id.includes('_') ? parseInt(doc.id.split('_')[2], 10) : 1);

    sessionList.push({
      id: doc.id,
      ...sData,
      onDate: sessionDate,
      ampm: resolvedAmpm,
      onCount: resolvedOnCount,
    });

    const vouchersSnap = await orgSessionVouchersCol(orgId, doc.id).get();

    for (const vDoc of vouchersSnap.docs) {
      const v = vDoc.data();
      if (!agentName || v.agentName?.trim().toLowerCase() === agentName.trim().toLowerCase()) {
        allSlips.push({
          ...v,
          onDate: sessionDate,
          ampm: resolvedAmpm,
          onCount: resolvedOnCount,
          luckyNo: sData.luckyNumber || sData.luckyNo || sData.winningNumber || null,
          rate: sData.rate || 80,
          agentCommissions: sData.agentCommissions || {},
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
