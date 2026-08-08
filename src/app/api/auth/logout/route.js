import { NextResponse } from 'next/server';
import { clearSession, getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { logActivity } from '@/lib/db/log-activity.js';

export async function POST(request) {
  const session = await getSession();
  const res = NextResponse.json({ ok: true });
  await clearSession(res);

  if (session) {
    const db = getDb();
    await logActivity(db, {
      orgId: session.orgId || 'platform',
      userId: session.id,
      userName: session.name,
      userRole: session.role,
      action: 'logout',
      entity: 'user',
      entityId: session.id,
    });
  }

  return res;
}
