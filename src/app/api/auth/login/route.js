import { NextResponse } from 'next/server';
import bcrypt from 'bcryptjs';
import { usersCol } from '@/lib/db/firestore.js';
import { setSession } from '@/lib/auth';
import { logActivity } from '@/lib/db/log-activity.js';
import { getClientIp } from '@/lib/auth/permissions.js';

export async function POST(request) {
  try {
    const { email, password } = await request.json();
    if (!email || !password) {
      return NextResponse.json({ error: 'Email and password required' }, { status: 400 });
    }

    const snap = await usersCol().where('email', '==', email.toLowerCase()).limit(1).get();
    const user = snap.empty ? null : { id: snap.docs[0].id, ...snap.docs[0].data() };

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

    await logActivity({
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
