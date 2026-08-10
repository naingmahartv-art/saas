import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { orgsCol, usersCol } from '@/lib/db/firestore.js';
import NavBar from '@/components/NavBar';
import Link from 'next/link';

export const dynamic = 'force-dynamic';

export default async function AdminDashboard() {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') redirect('/login');

  const [orgsSnap, usersSnap] = await Promise.all([orgsCol().get(), usersCol().get()]);
  const orgs = orgsSnap.docs.map(d => d.data());
  const allUsers = usersSnap.docs.map(d => d.data());

  const stats = {
    totalOrgs: orgs.length,
    activeOrgs: orgs.filter((o) => o.status === 'active').length,
    totalUsers: allUsers.filter((u) => u.role !== 'super_admin').length,
  };

  return (
    <div className="min-h-screen bg-gray-50">
      <NavBar title="SaaS Platform" userName={session.name} role={session.role} />

      <main className="max-w-5xl mx-auto px-6 py-8">
        <div className="mb-8">
          <h1 className="text-2xl font-bold text-gray-900">Project Owner Dashboard</h1>
          <p className="text-gray-500 text-sm mt-1">Manage all organizations and users</p>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
          {[
            { label: 'Total Organizations', value: stats.totalOrgs, color: 'bg-blue-50 text-blue-700' },
            { label: 'Active Organizations', value: stats.activeOrgs, color: 'bg-green-50 text-green-700' },
            { label: 'Total Users', value: stats.totalUsers, color: 'bg-indigo-50 text-indigo-700' },
          ].map((s) => (
            <div key={s.label} className="card text-center">
              <p className={`text-3xl font-bold ${s.color.split(' ')[1]}`}>{s.value}</p>
              <p className="text-xs text-gray-500 mt-1">{s.label}</p>
            </div>
          ))}
        </div>

        {/* Quick actions */}
        <div className="card mb-8">
          <h2 className="font-semibold text-gray-900 mb-4">Quick Actions</h2>
          <div className="flex flex-wrap gap-3">
            <Link href="/admin/organizations" className="btn-primary">
              Manage Organizations
            </Link>
            <Link href="/admin/organizations?create=1" className="btn-secondary">
              + Create Organization
            </Link>
            <Link href="/admin/resources" className="btn-secondary bg-purple-50 text-purple-700 hover:bg-purple-100 border-purple-200 flex items-center gap-1.5 font-medium">
              🎬 EXE & Tutorial Videos Manager
            </Link>
          </div>
        </div>

        {/* Recent orgs */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-4">Recent Organizations</h2>
          {orgs.length === 0 ? (
            <p className="text-gray-400 text-sm">No organizations yet.</p>
          ) : (
            <div className="divide-y divide-gray-50">
              {orgs.slice(-5).reverse().map((org) => (
                <div key={org.id} className="py-3 flex items-center justify-between">
                  <div>
                    <p className="text-sm font-medium text-gray-900">{org.name}</p>
                    <p className="text-xs text-gray-400">/{org.slug}</p>
                  </div>
                  <div className="flex items-center gap-2">
                    <span className={org.status === 'active' ? 'badge-active' : 'badge-suspended'}>
                      {org.status}
                    </span>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      </main>
    </div>
  );
}
