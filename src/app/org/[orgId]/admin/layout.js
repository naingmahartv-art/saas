import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations, users } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import { canAccessAdminPanel } from '@/lib/auth/permissions.js';
import SidebarOrgAdmin from '@/components/SidebarOrgAdmin';

export default async function OrgAdminLayout({ children, params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessAdminPanel(session.role)) {
    redirect(`/org/${orgId}/2d/dashboard`);
  }

  const db = getDb();
  const [[org], [me]] = await Promise.all([
    db.select().from(organizations).where(eq(organizations.id, orgId)).limit(1),
    db.select({ status: users.status }).from(users).where(eq(users.id, session.id)).limit(1),
  ]);
  if (!org) redirect('/login');
  // Authoritative, always-fresh suspension check — the JWT-carried status
  // middleware checks can be stale for up to 7 days.
  if (me?.status === 'suspended') redirect('/suspended');

  return (
    <div className="min-h-screen flex bg-gray-50">
      <SidebarOrgAdmin orgId={orgId} orgName={org.name} userName={session.name} role={session.role} />
      <main className="flex-1 min-w-0">{children}</main>
    </div>
  );
}
