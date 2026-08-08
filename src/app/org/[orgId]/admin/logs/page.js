import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { users } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import LogsViewer from './LogsViewer';

export const dynamic = 'force-dynamic';

export default async function ActivityLogsPage({ params }) {
  const session = await getSession();
  const { orgId } = await params;

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const db = getDb();
  const orgUsers = await db
    .select({ id: users.id, name: users.name })
    .from(users)
    .where(eq(users.orgId, orgId));

  return (
    <div className="max-w-6xl mx-auto px-6 py-8">
      <LogsViewer orgId={orgId} orgUsers={orgUsers} />
    </div>
  );
}
