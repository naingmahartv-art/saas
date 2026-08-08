import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations, users } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import UserManager from './UserManager';

export const dynamic = 'force-dynamic';

export default async function OrgUsersPage({ params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const db = getDb();
  const [[org], orgUsers] = await Promise.all([
    db.select().from(organizations).where(eq(organizations.id, orgId)).limit(1),
    db.select().from(users).where(eq(users.orgId, orgId)),
  ]);
  if (!org) redirect('/login');

  return (
    <div className="max-w-5xl mx-auto px-6 py-8">
      <UserManager orgId={orgId} orgName={org.name} initialUsers={orgUsers} currentUserRole={session.role} />
    </div>
  );
}
