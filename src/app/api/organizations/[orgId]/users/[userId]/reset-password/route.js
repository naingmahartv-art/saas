import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { users } from '@/lib/db/schema';
import { eq, and } from 'drizzle-orm';
import bcrypt from 'bcryptjs';
import { randomBytes } from 'crypto';
import { getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

function generateTempPassword() {
  // 12 URL-safe chars, no confusable padding — shown once to the admin.
  return randomBytes(9).toString('base64url');
}

// POST — reset a user's password to a freshly generated one, returned once.
export async function POST(request, { params }) {
  const session = await getSession();
  const { orgId, userId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();
  const [target] = await db.select().from(users).where(and(eq(users.id, userId), eq(users.orgId, orgId))).limit(1);
  if (!target) {
    return NextResponse.json({ error: 'User not found' }, { status: 404 });
  }
  if (session.role !== 'super_admin' && ['org_admin', 'super_admin'].includes(target.role)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const tempPassword = generateTempPassword();
  await db.update(users).set({ passwordHash: bcrypt.hashSync(tempPassword, 10) }).where(eq(users.id, userId));

  await logActivity(db, {
    orgId,
    userId: session.id,
    userName: session.name,
    userRole: session.role,
    action: 'edit',
    entity: 'user',
    entityId: userId,
    details: { name: target.name, resetPassword: true },
    ipAddress: getClientIp(request),
  });

  return NextResponse.json({ ok: true, tempPassword });
}
