import { NextResponse } from 'next/server';
import bcrypt from 'bcryptjs';
import { getDb } from '@/lib/db/index';
import { users } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import { setSession } from '@/lib/auth';
import { logActivity } from '@/lib/db/log-activity.js';
import { getClientIp } from '@/lib/auth/permissions.js';

export async function POST(request) {
  try {
    const { email, password } = await request.json();
    if (!email || !password) {
      return NextResponse.json({ error: 'Email and password required' }, { status: 400 });
    }

    const db = getDb();
    const [user] = await db.select().from(users).where(eq(users.email, email.toLowerCase())).limit(1);

    if (!user || !bcrypt.compareSync(password, user.passwordHash)) {
      return NextResponse.json({ error: 'Invalid email or password' }, { status: 401 });
    }

    if (user.status === 'suspended') {
      return NextResponse.json({ error: 'This account has been suspended' }, { status: 403 });
    }

    const payload = {
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role,
      orgId: user.orgId,
      status: user.status,
    };

    const res = NextResponse.json({ role: user.role, orgId: user.orgId });
    await setSession(res, payload);

    await logActivity(db, {
      orgId: user.orgId || 'platform',
      userId: user.id,
      userName: user.name,
      userRole: user.role,
      action: 'login',
      entity: 'user',
      entityId: user.id,
      ipAddress: getClientIp(request),
    });

    return res;
  } catch (err) {
    console.error('Login error:', err);
    return NextResponse.json({ error: 'Internal server error' }, { status: 500 });
  }
}
