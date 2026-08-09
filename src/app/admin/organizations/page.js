import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgsCol, PLAN_PRICES } from '@/lib/db/firestore.js';
import NavBar from '@/components/NavBar';
import OrgManager from './OrgManager';

export default async function OrganizationsPage() {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') redirect('/login');

  const snap = await orgsCol().orderBy('createdAt', 'asc').get();
  const orgs = snap.docs.map(d => d.data());

  return (
    <div className="min-h-screen bg-gray-50">
      <NavBar title="SaaS Platform" userName={session.name} role={session.role} />
      <main className="max-w-5xl mx-auto px-6 py-8">
        <div className="mb-6 flex items-center justify-between">
          <div>
            <h1 className="text-2xl font-bold text-gray-900">Organizations</h1>
            <p className="text-sm text-gray-500 mt-1">Create and manage all organizations</p>
          </div>
        </div>
        <OrgManager initialOrgs={orgs} plans={PLAN_PRICES} />
      </main>
    </div>
  );
}
