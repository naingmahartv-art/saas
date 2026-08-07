import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth/session.js';
import { getDb } from '@/lib/db/index.js';
import { lotterySessions } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import ResultsPage from './ResultsPage.js';
import NoActiveSession from './NoActiveSession.js';

export const dynamic = 'force-dynamic';

export default async function OrgResultsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const db = getDb();

  const [activeSession] = await db
    .select()
    .from(lotterySessions)
    .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
    .orderBy(desc(lotterySessions.createdAt))
    .limit(1);

  return (
    <div className="px-4 py-6">
      {activeSession ? (
        <ResultsPage orgId={orgId} session={activeSession} />
      ) : (
        <NoActiveSession />
      )}
    </div>
  );
}
