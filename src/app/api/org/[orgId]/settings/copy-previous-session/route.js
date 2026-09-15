import { NextResponse } from 'next/server';
import { getDb, orgSessionsCol, orgSessionDoc, orgAgentsCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';

// POST /api/org/[orgId]/settings/copy-previous-session
// Manually copies agent commissions and rates from the previous session to the target session
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const { targetSessionId, onDate, ampm } = await request.json();
    if (!targetSessionId) {
      return NextResponse.json({ error: 'targetSessionId is required' }, { status: 400 });
    }

    const [agentsSnap, sessionsSnap] = await Promise.all([
      orgAgentsCol(orgId).get(),
      orgSessionsCol(orgId).orderBy('onDate', 'desc').limit(20).get(),
    ]);

    let defaultCommissions = {};
    let defaultRates = {};

    // Fallback baseline from agent profiles
    for (const doc of agentsSnap.docs) {
      const a = doc.data() || {};
      if (a.commission !== undefined && a.commission !== null && a.commission !== '') {
        defaultCommissions[doc.id] = parseFloat(a.commission) || 0;
      }
      if (a.rate !== undefined && a.rate !== null && a.rate !== '') {
        defaultRates[doc.id] = parseFloat(a.rate) || 80;
      } else {
        defaultRates[doc.id] = 80;
      }
    }

    let copiedCommissions = { ...defaultCommissions };
    let copiedRates = { ...defaultRates };
    let sourceSessionInfo = null;

    // Filter and sort sessions to find the nearest prior session before (onDate, ampm)
    const validSessions = sessionsSnap.docs
      .map(d => ({ id: d.id, ...d.data() }))
      .filter(s => s.id !== targetSessionId);

    validSessions.sort((a, b) => {
      if (a.onDate !== b.onDate) return (b.onDate || '').localeCompare(a.onDate || '');
      if (a.onCount !== b.onCount) return (b.onCount || 0) - (a.onCount || 0);
      return (b.ampm || '').localeCompare(a.ampm || '');
    });

    // Find the closest previous session (prefer before target onDate/ampm if specified)
    let found = null;
    if (onDate) {
      found = validSessions.find(s => {
        if (!s.onDate) return false;
        if (s.onDate < onDate) return true;
        if (s.onDate === onDate && ampm && s.ampm < ampm) return true;
        return false;
      });
    }

    // If no prior by date, take the most recent available session
    if (!found && validSessions.length > 0) {
      found = validSessions[0];
    }

    if (found) {
      sourceSessionInfo = {
        id: found.id,
        onDate: found.onDate,
        ampm: found.ampm,
      };
      if (found.agentCommissions && Object.keys(found.agentCommissions).length > 0) {
        copiedCommissions = { ...copiedCommissions, ...found.agentCommissions };
      }
      if (found.agentRates && Object.keys(found.agentRates).length > 0) {
        copiedRates = { ...copiedRates, ...found.agentRates };
      }
    }

    // Save copied commissions and rates to the target session doc in Firestore
    const targetRef = orgSessionDoc(orgId, targetSessionId);
    await targetRef.set(
      {
        agentCommissions: copiedCommissions,
        agentRates: copiedRates,
        updatedAt: Date.now(),
      },
      { merge: true }
    );

    return NextResponse.json({
      success: true,
      copiedFrom: sourceSessionInfo,
      agentCommissions: copiedCommissions,
      agentRates: copiedRates,
    });
  } catch (err) {
    console.error('Error copying from previous session:', err);
    return NextResponse.json(
      { error: err.message || 'Failed to copy previous session rates' },
      { status: 500 }
    );
  }
}
