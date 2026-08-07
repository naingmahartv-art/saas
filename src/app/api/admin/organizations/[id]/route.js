import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';

// DELETE — remove organization (cascades to users + subscriptions)
export async function DELETE(request, { params }) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { id } = await params;
  const db = getDb();
  await db.delete(organizations).where(eq(organizations.id, id));
  return NextResponse.json({ ok: true });
}
