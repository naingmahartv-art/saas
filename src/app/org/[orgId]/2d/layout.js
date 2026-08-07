import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import Sidebar2D from '@/components/Sidebar2D';

export default async function TwoDLayout({ children, params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const db = getDb();
  const [org] = await db.select().from(organizations).where(eq(organizations.id, orgId)).limit(1);
  if (!org) redirect('/login');

  return (
    <div className="min-h-screen flex bg-gray-50">
      <Sidebar2D orgId={orgId} orgName={org.name} userName={session.name} role={session.role} />
      <main className="flex-1 min-w-0">{children}</main>
    </div>
  );
}
