import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import AppPicker from './AppPicker.js';

export default async function SelectAppPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && (session.role !== 'org_admin' || session.orgId !== orgId))) {
    redirect('/login');
  }

  const db = getDb();
  const [org] = await db.select().from(organizations).where(eq(organizations.id, orgId)).limit(1);
  if (!org) redirect('/login');

  return <AppPicker orgId={orgId} orgName={org.name} userName={session.name} role={session.role} />;
}
