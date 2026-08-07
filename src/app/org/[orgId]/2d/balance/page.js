import { getDb } from '@/lib/db/index.js';
import { agents, balance, receive } from '@/lib/db/schema.js';
import { eq, asc, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import BalanceManager from './BalanceManager.js';

export const dynamic = 'force-dynamic';

export default async function BalancePage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const db = getDb();

  const [agentsList, balances, receives] = await Promise.all([
    db.select().from(agents).where(eq(agents.orgId, orgId)).orderBy(asc(agents.agentName)),
    db.select().from(balance).where(eq(balance.orgId, orgId)).orderBy(desc(balance.onDate)),
    db.select().from(receive).where(eq(receive.orgId, orgId)).orderBy(desc(receive.onDate)),
  ]);

  const netByAgent = {};
  for (const row of balances) {
    netByAgent[row.agentName] = (netByAgent[row.agentName] || 0) + row.amount;
  }
  for (const row of receives) {
    netByAgent[row.agentName] = (netByAgent[row.agentName] || 0) - row.amount;
  }

  return (
    <div className="p-6">
      <BalanceManager
        orgId={orgId}
        initialAgents={agentsList}
        initialBalances={balances}
        initialReceives={receives}
        initialNetByAgent={netByAgent}
      />
    </div>
  );
}
