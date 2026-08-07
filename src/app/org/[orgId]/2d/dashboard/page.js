import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations, users, subscriptions } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import DashboardView from './DashboardView';

export default async function OrgDashboard({ params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const db = getDb();
  const [[org], orgUsers, [sub]] = await Promise.all([
    db.select().from(organizations).where(eq(organizations.id, orgId)).limit(1),
    db.select().from(users).where(eq(users.orgId, orgId)),
    db.select().from(subscriptions).where(eq(subscriptions.orgId, orgId)).limit(1),
  ]);
  if (!org) redirect('/login');

  return <DashboardView orgId={orgId} org={org} orgUsers={orgUsers} sub={sub} />;
}
