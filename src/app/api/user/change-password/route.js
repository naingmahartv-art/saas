import { NextResponse } from 'next/server';
import { userDoc } from '@/lib/db/firestore.js';
import bcrypt from 'bcryptjs';
import { getSession } from '@/lib/auth/session.js';
import { getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// POST /api/user/change-password — self-service password change for the logged-in user
export async function POST(request) {
  const session = await getSession();
  if (!session) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const { currentPassword, newPassword } = await request.json();
  if (!currentPassword || !newPassword) {
    return NextResponse.json({ error: 'Current and new password are required' }, { status: 400 });
  }
  if (newPassword.length < 8) {
    return NextResponse.json({ error: 'New password must be at least 8 characters' }, { status: 400 });
  }

  const ref = userDoc(session.id);
  const snap = await ref.get();
  const user = snap.exists ? snap.data() : null;
  if (!user) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  if (!bcrypt.compareSync(currentPassword, user.passwordHash)) {
    return NextResponse.json({ error: 'Current password is incorrect' }, { status: 400 });
  }

  await ref.update({ passwordHash: bcrypt.hashSync(newPassword, 10) });

  await logActivity({
    orgId: user.orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'edit',
    entity: 'user',
    entityId: session.id,
    details: { selfChangedPassword: true },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ ok: true });
}
