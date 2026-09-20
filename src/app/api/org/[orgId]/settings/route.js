import { NextResponse } from 'next/server';
import { orgRatesDoc, orgRestrictionDoc, orgDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

// GET /api/org/[orgId]/settings — load all settings for the org
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const [ratesSnap, limitsSnap, orgSnap] = await Promise.all([
    orgRatesDoc(orgId).get(),
    orgRestrictionDoc(orgId, 'limits').get(),
    orgDoc(orgId).get(),
  ]);

  const orgData = orgSnap?.exists ? orgSnap.data() : {};
  const operatingMode = orgData.operatingMode || (orgData.isOfflineMode ? 'offline' : 'online');
  const isOfflineMode = operatingMode === 'offline' || Boolean(orgData.isOfflineMode);

  return NextResponse.json({
    rates: ratesSnap?.exists ? ratesSnap.data() : null,
    limits: limitsSnap?.exists ? limitsSnap.data() : null,
    operatingMode,
    isOfflineMode,
  });
}

// POST /api/org/[orgId]/settings — upsert rates and operatingMode
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const body = await request.json();
  const { num1Rate, num2Rate, operatingMode, isOfflineMode } = body;
  const now = Date.now();

  let updatedRates = null;
  if (num1Rate !== undefined && num2Rate !== undefined) {
    updatedRates = { orgId, num1Rate: parseFloat(num1Rate) || 0, num2Rate: parseFloat(num2Rate) || 0, updatedAt: now };
    await orgRatesDoc(orgId).set(updatedRates, { merge: true });
  }

  let updatedMode = null;
  if (operatingMode !== undefined || isOfflineMode !== undefined) {
    const mode = operatingMode || (isOfflineMode ? 'offline' : 'online');
    const isOffline = mode === 'offline' || Boolean(isOfflineMode);
    updatedMode = { operatingMode: mode, isOfflineMode: isOffline };

    await Promise.all([
      orgDoc(orgId).set({ ...updatedMode, updatedAt: now }, { merge: true }),
      orgRestrictionDoc(orgId, 'operatingMode').set({ orgId, ...updatedMode, updatedAt: now }, { merge: true }),
    ]);
  }

  return NextResponse.json({
    success: true,
    rates: updatedRates,
    ...(updatedMode || {}),
  });
}
