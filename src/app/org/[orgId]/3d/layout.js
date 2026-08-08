import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import { canAccessOrgApp } from '@/lib/auth/permissions.js';

export default async function ThreeDLayout({ children, params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessOrgApp(session.role)) {
    redirect('/login');
  }

  const db = getDb();
  const [org] = await db.select().from(organizations).where(eq(organizations.id, orgId)).limit(1);
  if (!org) redirect('/login');

  return <div className="min-h-screen bg-gray-50">{children}</div>;
}
