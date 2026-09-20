import { NextResponse } from 'next/server';
import { orgDoc, orgRestrictionDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';

// GET /api/org/[orgId]/settings/operating-mode — get current operating mode from DB
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const orgSnap = await orgDoc(orgId).get();
    const data = orgSnap.exists ? orgSnap.data() : {};
    const operatingMode = data.operatingMode || (data.isOfflineMode ? 'offline' : 'online');
    const isOfflineMode = operatingMode === 'offline' || Boolean(data.isOfflineMode);

    return NextResponse.json({
      operatingMode,
      isOfflineMode,
    });
  } catch (err) {
    console.error('Error fetching operating mode:', err);
    return NextResponse.json({ error: 'Failed to fetch operating mode' }, { status: 500 });
  }
}

// POST /api/org/[orgId]/settings/operating-mode — save operating mode (online/offline) in DB
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  try {
    const body = await request.json();
    const mode = body.operatingMode || (body.isOfflineMode ? 'offline' : 'online');
    const isOffline = mode === 'offline' || Boolean(body.isOfflineMode);
    const now = Date.now();

    const updatePayload = {
      operatingMode: mode,
      isOfflineMode: isOffline,
      updatedAt: now,
    };

    // Update both orgDoc and orgRestrictionDoc for fast multi-query support
    await Promise.all([
      orgDoc(orgId).set(updatePayload, { merge: true }),
      orgRestrictionDoc(orgId, 'operatingMode').set(
        { orgId, ...updatePayload },
        { merge: true }
      ),
    ]);

    return NextResponse.json({
      success: true,
      operatingMode: mode,
      isOfflineMode: isOffline,
    });
  } catch (err) {
    console.error('Error saving operating mode:', err);
    return NextResponse.json({ error: 'Failed to save operating mode in DB' }, { status: 500 });
  }
}
