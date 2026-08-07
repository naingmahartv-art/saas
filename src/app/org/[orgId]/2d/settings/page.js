import { getDb } from '@/lib/db/index.js';
import { organizations, lotterySessions, rates, limits, hotNumbers, notBuyNumbers } from '@/lib/db/schema.js';
import { eq, and, desc } from 'drizzle-orm';
import { getSession } from '@/lib/auth/session.js';
import { redirect } from 'next/navigation';
import SettingsPanel from './SettingsPanel.js';

export const dynamic = 'force-dynamic';

export default async function SettingsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    if (session && session.role === 'user') {
      redirect(`/org/${orgId}`);
    }
    redirect('/login');
  }

  const db = getDb();

  const [[org], [activeSession], [ratesRow], [limitsRow]] = await Promise.all([
    db.select().from(organizations).where(eq(organizations.id, orgId)).limit(1),
    db
      .select()
      .from(lotterySessions)
      .where(and(eq(lotterySessions.orgId, orgId), eq(lotterySessions.isActive, 1)))
      .orderBy(desc(lotterySessions.createdAt))
      .limit(1),
    db.select().from(rates).where(eq(rates.orgId, orgId)).limit(1),
    db.select().from(limits).where(eq(limits.orgId, orgId)).limit(1),
  ]);
  if (!org) redirect('/login');

  const onCount = activeSession?.onCount ?? null;

  const [hotNumbersList, notBuyNumbersList] = onCount !== null
    ? await Promise.all([
        db.select().from(hotNumbers).where(and(eq(hotNumbers.orgId, orgId), eq(hotNumbers.onCount, onCount))),
        db.select().from(notBuyNumbers).where(and(eq(notBuyNumbers.orgId, orgId), eq(notBuyNumbers.onCount, onCount))),
      ])
    : [[], []];

  return (
    <div className="max-w-4xl mx-auto px-6 py-8">
      <SettingsPanel
        orgId={orgId}
        onCount={onCount}
        initialRates={ratesRow ?? null}
        initialLimits={limitsRow ?? null}
        initialHotNumbers={hotNumbersList}
        initialNotBuyNumbers={notBuyNumbersList}
      />
    </div>
  );
}
