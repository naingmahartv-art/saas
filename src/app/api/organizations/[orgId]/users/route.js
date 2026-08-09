import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { usersCol } from '@/lib/db/firestore.js';
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

  const snap = await usersCol().where('orgId', '==', orgId).get();
  const orgUsers = snap.docs.map(d => {
    const { id, name, email, role, status, createdAt } = d.data();
    return { id, name, email, role, status, createdAt };
  });

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

  const emailLower = email.toLowerCase();
  const existing = await usersCol().where('email', '==', emailLower).limit(1).get();
  if (!existing.empty) {
    return NextResponse.json({ error: 'Email already exists' }, { status: 409 });
  }

  const newUser = {
    id: uuidv4(),
    name,
    email: emailLower,
    passwordHash: bcrypt.hashSync(password, 10),
    role,
    status: 'active',
    orgId,
    createdAt: Date.now(),
  };
  await usersCol().doc(newUser.id).set(newUser);

  await logActivity({
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
}
