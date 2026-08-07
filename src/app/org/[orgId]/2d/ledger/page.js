import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index.js';
import {
  lotterySessions,
  agents,
  rates,
  notBuyNumbers,
  hotNumbers,
  limits,
  luckyNo,
  machineConfig,
} from '@/lib/db/schema.js';
import { eq, and, desc, asc } from 'drizzle-orm';
import LedgerWorkspace from './LedgerWorkspace.js';

export const dynamic = 'force-dynamic';

export default async function LedgerPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const db = getDb();

  const [[activeSession], agentsList, [rateRow], [limitRow], machinesList] = await Promise.all([
    db
      .select()
      .from(lotterySessions)
      .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
      .orderBy(desc(lotterySessions.createdAt))
      .limit(1),
    db
      .select()
      .from(agents)
      .where(eq(agents.orgId, orgId))
      .orderBy(asc(agents.agentName)),
    db.select().from(rates).where(eq(rates.orgId, orgId)).limit(1),
    db.select().from(limits).where(eq(limits.orgId, orgId)).limit(1),
    db
      .select()
      .from(machineConfig)
      .where(eq(machineConfig.orgId, orgId))
      .orderBy(asc(machineConfig.machineId)),
  ]);

  const machines = machinesList.length > 0
    ? machinesList
    : [{ machineId: 1, minSerial: 1, maxSerial: 999, label: 'Machine 1' }];

  let notBuyList = [];
  let hotList = [];
  let luckyRow = null;

  if (activeSession) {
    [notBuyList, hotList, [luckyRow]] = await Promise.all([
      db
        .select()
        .from(notBuyNumbers)
        .where(and(eq(notBuyNumbers.orgId, orgId), eq(notBuyNumbers.onCount, activeSession.onCount))),
      db
        .select()
        .from(hotNumbers)
        .where(and(eq(hotNumbers.orgId, orgId), eq(hotNumbers.onCount, activeSession.onCount))),
      db
        .select()
        .from(luckyNo)
        .where(and(
          eq(luckyNo.orgId, orgId),
          eq(luckyNo.onDate, activeSession.onDate),
          eq(luckyNo.ampm, activeSession.ampm),
        ))
        .orderBy(desc(luckyNo.createdAt))
        .limit(1),
    ]);
  }

  return (
    <LedgerWorkspace
      orgId={orgId}
      activeSession={activeSession ?? null}
      agents={agentsList}
      rate={rateRow ?? null}
      limit={limitRow ?? null}
      notBuyNumbers={notBuyList.map(n => n.num)}
      hotNumbers={hotList.map(n => n.num)}
      luckyNumber={luckyRow?.lNo ?? null}
      machines={machines}
    />
  );
}
