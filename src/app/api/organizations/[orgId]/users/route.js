import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { users } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import bcrypt from 'bcryptjs';
import { v4 as uuidv4 } from 'uuid';

// GET — list users in org
export async function GET(request, { params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const db = getDb();
  const orgUsers = await db
    .select({ id: users.id, name: users.name, email: users.email, role: users.role, createdAt: users.createdAt })
    .from(users)
    .where(eq(users.orgId, orgId));

  return NextResponse.json(orgUsers);
}

// POST — create user in org
export async function POST(request, { params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { name, email, password, role } = await request.json();
  if (!name || !email || !password) {
    return NextResponse.json({ error: 'Name, email and password required' }, { status: 400 });
  }

  const assignedRole = role === 'org_admin' ? 'org_admin' : 'user';
  const db = getDb();

  try {
    const newUser = {
      id: uuidv4(),
      name,
      email: email.toLowerCase(),
      passwordHash: bcrypt.hashSync(password, 10),
      role: assignedRole,
      orgId,
      createdAt: Date.now(),
    };
    await db.insert(users).values(newUser);
    return NextResponse.json({ id: newUser.id, name: newUser.name, email: newUser.email, role: newUser.role, createdAt: newUser.createdAt }, { status: 201 });
  } catch (err) {
    if (err.code === '23505' || err.message?.includes('unique')) {
      return NextResponse.json({ error: 'Email already exists' }, { status: 409 });
    }
    throw err;
  }
}
