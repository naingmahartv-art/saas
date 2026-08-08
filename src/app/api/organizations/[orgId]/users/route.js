import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { users } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import bcrypt from 'bcryptjs';
import { v4 as uuidv4 } from 'uuid';
import { canManageOrgUsers, getClientIp } from '@/lib/auth/permissions.js';
import { logActivity } from '@/lib/db/log-activity.js';

// GET — list users in org
export async function GET(request, { params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();
  const orgUsers = await db
    .select({ id: users.id, name: users.name, email: users.email, role: users.role, status: users.status, createdAt: users.createdAt })
    .from(users)
    .where(eq(users.orgId, orgId));

  return NextResponse.json(orgUsers);
}

// POST — create user in org. org_admin can only hand out supervisor/cashier
// (never org_admin); super_admin can additionally create org_admins.
export async function POST(request, { params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }
  if (!canManageOrgUsers(session.role)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { name, email, password, role } = await request.json();
  if (!name || !email || !password) {
    return NextResponse.json({ error: 'Name, email and password required' }, { status: 400 });
  }

  const allowedRoles = session.role === 'super_admin' ? ['org_admin', 'supervisor', 'cashier'] : ['supervisor', 'cashier'];
  if (!allowedRoles.includes(role)) {
    return NextResponse.json({ error: `Role must be one of: ${allowedRoles.join(', ')}` }, { status: 400 });
  }

  const db = getDb();

  try {
    const newUser = {
      id: uuidv4(),
      name,
      email: email.toLowerCase(),
      passwordHash: bcrypt.hashSync(password, 10),
      role,
      status: 'active',
      orgId,
      createdAt: Date.now(),
    };
    await db.insert(users).values(newUser);

    await logActivity(db, {
      orgId,
      userId: session.id,
      userName: session.name,
      userRole: session.role,
      action: 'create',
      entity: 'user',
      entityId: newUser.id,
      details: { name: newUser.name, email: newUser.email, role: newUser.role },
      ipAddress: getClientIp(request),
    });

    return NextResponse.json({ id: newUser.id, name: newUser.name, email: newUser.email, role: newUser.role, status: newUser.status, createdAt: newUser.createdAt }, { status: 201 });
  } catch (err) {
    if (err.code === '23505' || err.message?.includes('unique')) {
      return NextResponse.json({ error: 'Email already exists' }, { status: 409 });
    }
    throw err;
  }
}
