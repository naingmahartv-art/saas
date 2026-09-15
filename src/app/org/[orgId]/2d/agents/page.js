import { orgAgentsCol, orgMachinesCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { getActiveSession } from '@/lib/auth/permissions.js';
import { redirect } from 'next/navigation';
import AgentManager from './AgentManager.js';

export const dynamic = 'force-dynamic';

export default async function AgentsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    redirect('/login');
  }

  function toPlainObject(obj) {
    if (!obj) return obj;
    return JSON.parse(
      JSON.stringify(obj, (key, value) => {
        if (value && typeof value === 'object' && ('_seconds' in value || typeof value.toDate === 'function')) {
          return value._seconds ? value._seconds * 1000 : String(value);
        }
        return value;
      })
    );
  }

  let activeSession = null;
  let agentsList = [];
  let machinesList = [];

  try {
    const fetchPromise = Promise.all([
      getActiveSession(orgId),
      orgAgentsCol(orgId).orderBy('agentName', 'asc').get(),
      orgMachinesCol(orgId).orderBy('machineId', 'asc').get(),
    ]);
    const timeoutPromise = new Promise((_, reject) =>
      setTimeout(() => reject(new Error('Firestore timeout')), 2000)
    );
    const [activeSessionRes, agentsSnap, machinesSnap] = await Promise.race([
      fetchPromise,
      timeoutPromise,
    ]);

    activeSession = toPlainObject(activeSessionRes) ?? null;
    agentsList = toPlainObject(agentsSnap.docs.map(d => d.data())) || [];
    machinesList = toPlainObject(machinesSnap.docs.map(d => d.data())) || [];
  } catch {
    // Offline fallback
  }
  const machines = machinesList.length > 0
    ? machinesList
    : [{ machineId: 1, minSerial: 1, maxSerial: 999, label: 'Machine 1' }];

  return (
    <div className="p-4 sm:p-6 max-w-6xl mx-auto">
      <AgentManager
        orgId={orgId}
        initialAgents={agentsList}
        activeSession={toPlainObject(activeSession) ?? null}
        machines={machines}
      />
    </div>
  );
}
