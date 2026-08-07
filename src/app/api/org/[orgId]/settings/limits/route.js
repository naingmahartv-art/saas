import { NextResponse } from 'next/server';
import { getDb } from '@/lib/db/index.js';
import { limits } from '@/lib/db/schema.js';
import { eq } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { randomUUID } from 'crypto';

// POST /api/org/[orgId]/settings/limits — upsert bet limit
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { limitValue } = await request.json();

  if (limitValue === undefined) {
    return NextResponse.json({ error: 'limitValue is required' }, { status: 400 });
  }

  const db = getDb();
  const now = Date.now();

  const [existing] = await db.select().from(limits).where(eq(limits.orgId, orgId)).limit(1);

  if (existing) {
    await db
      .update(limits)
      .set({ limitValue: parseFloat(limitValue) || 0, updatedAt: now })
      .where(eq(limits.id, existing.id));
  } else {
    await db.insert(limits).values({
      id: randomUUID(),
      orgId,
      limitValue: parseFloat(limitValue) || 0,
      updatedAt: now,
    });
  }

  return NextResponse.json({ success: true });
}
