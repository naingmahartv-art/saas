import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth';
import { getDb } from '@/lib/db/index';
import { organizations } from '@/lib/db/schema';
import { eq } from 'drizzle-orm';
import NavBar from '@/components/NavBar';

export default async function UserDashboard() {
  const session = await getSession();
  if (!session) redirect('/login');
  if (session.role === 'super_admin') redirect('/admin');
  if (session.role === 'org_admin') redirect(`/org/${session.orgId}/select-app`);

  let org = null;
  if (session.orgId) {
    const db = getDb();
    const [found] = await db.select().from(organizations).where(eq(organizations.id, session.orgId)).limit(1);
    org = found ?? null;
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <NavBar title={org?.name ?? 'SaaS Platform'} userName={session.name} role={session.role} orgId={session.orgId} />

      <main className="max-w-4xl mx-auto px-6 py-8">
        <div className="mb-8">
          <h1 className="text-2xl font-bold text-gray-900">Welcome, {session.name}!</h1>
          <p className="text-gray-500 text-sm mt-1">
            {org ? `Member of ${org.name}` : 'Your personal dashboard'}
          </p>
        </div>

        {/* Welcome card */}
        <div className="card mb-6 bg-gradient-to-br from-brand-500 to-brand-700 text-white">
          <div className="flex items-center gap-4">
            <div className="w-12 h-12 bg-white/20 rounded-xl flex items-center justify-center text-2xl font-bold">
              {session.name?.[0]?.toUpperCase()}
            </div>
            <div>
              <p className="font-semibold text-lg">{session.name}</p>
              <p className="text-brand-100 text-sm">{session.email}</p>
            </div>
          </div>
        </div>

        {/* Org info */}
        {org && (
          <div className="card mb-6">
            <h2 className="font-semibold text-gray-900 mb-3">Your Organization</h2>
            <div className="flex items-center justify-between">
              <div>
                <p className="font-medium text-gray-900">{org.name}</p>
                <p className="text-xs text-gray-400 mt-0.5">/{org.slug}</p>
              </div>
              <div className="flex items-center gap-2">
                <span className={org.plan === 'advance' ? 'badge-advance' : 'badge-basic'}>
                  {org.plan === 'advance' ? 'Advance' : 'Basic'} Plan
                </span>
                <span className={org.status === 'active' ? 'badge-active' : 'badge-suspended'}>
                  {org.status}
                </span>
              </div>
            </div>
          </div>
        )}

        {/* Placeholder content area */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-4">Overview</h2>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
            {[
              { label: 'Projects', value: '—', icon: '📁' },
              { label: 'Activity', value: '—', icon: '📊' },
              { label: 'Notifications', value: '0', icon: '🔔' },
            ].map((item) => (
              <div key={item.label} className="border border-gray-100 rounded-xl p-4 text-center hover:border-brand-200 transition-colors">
                <div className="text-2xl mb-2">{item.icon}</div>
                <p className="text-xl font-bold text-gray-900">{item.value}</p>
                <p className="text-xs text-gray-400 mt-1">{item.label}</p>
              </div>
            ))}
          </div>
          <p className="text-xs text-gray-400 mt-4 text-center">
            Your workspace is ready. Build your features here.
          </p>
        </div>
      </main>
    </div>
  );
}
