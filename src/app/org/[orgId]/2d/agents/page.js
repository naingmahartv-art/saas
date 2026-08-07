import { getDb } from '@/lib/db/index.js';
import { agents } from '@/lib/db/schema.js';
import { eq, asc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import AgentManager from './AgentManager.js';

export const dynamic = 'force-dynamic';

export default async function AgentsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const db = getDb();
  const agentsList = await db
    .select()
    .from(agents)
    .where(eq(agents.orgId, orgId))
    .orderBy(asc(agents.agentName));

  return (
    <div className="p-6">
      <AgentManager orgId={orgId} initialAgents={agentsList} />
    </div>
  );
}
