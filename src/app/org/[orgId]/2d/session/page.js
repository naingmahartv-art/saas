import { getDb } from '@/lib/db/index.js';
import { lotterySessions, machineConfig } from '@/lib/db/schema.js';
import { eq, and, desc, asc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import SessionSetup from './SessionSetup.js';

export const dynamic = 'force-dynamic';

export default async function SessionPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  const db = getDb();

  const [[current], machines] = await Promise.all([
    db
      .select()
      .from(lotterySessions)
      .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
      .orderBy(desc(lotterySessions.createdAt))
      .limit(1),
    db
      .select()
      .from(machineConfig)
      .where(eq(machineConfig.orgId, orgId))
      .orderBy(asc(machineConfig.machineId)),
  ]);

  // Default machine if none configured
  const machineList = machines.length > 0
    ? machines
    : [{ machineId: 1, minSerial: 1, maxSerial: 999, label: 'Machine 1' }];

  return (
    <div className="p-6">
      <SessionSetup
        orgId={orgId}
        current={current ?? null}
        machines={machineList}
      />
    </div>
  );
}
