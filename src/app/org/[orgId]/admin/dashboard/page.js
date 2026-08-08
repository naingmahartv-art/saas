import { getDb } from '@/lib/db/index';
import { users, activityLogs } from '@/lib/db/schema';
import { eq, and, desc } from 'drizzle-orm';
import Link from 'next/link';

export const dynamic = 'force-dynamic';

export default async function OrgAdminDashboard({ params }) {
  const { orgId } = await params;
  const db = getDb();

  const [orgUsers, recentLogs] = await Promise.all([
    db.select().from(users).where(eq(users.orgId, orgId)),
    db.select().from(activityLogs).where(eq(activityLogs.orgId, orgId)).orderBy(desc(activityLogs.createdAt)).limit(8),
  ]);

  const stats = {
    total: orgUsers.length,
    active: orgUsers.filter((u) => u.status !== 'suspended').length,
    suspended: orgUsers.filter((u) => u.status === 'suspended').length,
    supervisors: orgUsers.filter((u) => u.role === 'supervisor').length,
    cashiers: orgUsers.filter((u) => u.role === 'cashier').length,
  };

  return (
    <div className="max-w-5xl mx-auto px-6 py-8">
      <div className="mb-8">
        <h1 className="text-2xl font-bold text-gray-900">Admin Dashboard</h1>
        <p className="text-gray-500 text-sm mt-1">Organization users and activity</p>
      </div>

      <div className="grid grid-cols-2 md:grid-cols-5 gap-4 mb-8">
        {[
          { label: 'Total Users', value: stats.total },
          { label: 'Active', value: stats.active },
          { label: 'Suspended', value: stats.suspended },
          { label: 'Supervisors', value: stats.supervisors },
          { label: 'Cashiers', value: stats.cashiers },
        ].map((s) => (
          <div key={s.label} className="card text-center">
            <p className="text-2xl font-bold text-gray-900">{s.value}</p>
            <p className="text-xs text-gray-500 mt-1">{s.label}</p>
          </div>
        ))}
      </div>

      <div className="card mb-8">
        <h2 className="font-semibold text-gray-900 mb-4">Quick Actions</h2>
        <div className="flex flex-wrap gap-3">
          <Link href={`/org/${orgId}/admin/users`} className="btn-primary">Manage Users</Link>
          <Link href={`/org/${orgId}/admin/logs`} className="btn-secondary">View Activity Logs</Link>
        </div>
      </div>

      <div className="card">
        <h2 className="font-semibold text-gray-900 mb-4">Recent Activity</h2>
        {recentLogs.length === 0 ? (
          <p className="text-gray-400 text-sm">No activity yet.</p>
        ) : (
          <div className="divide-y divide-gray-50">
            {recentLogs.map((log) => (
              <div key={log.id} className="py-2.5 flex items-center justify-between text-sm">
                <div>
                  <span className="font-medium text-gray-900">{log.userName}</span>{' '}
                  <span className="text-gray-500">{log.action} {log.entity}</span>
                </div>
                <span className="text-xs text-gray-400">{new Date(log.createdAt).toLocaleString()}</span>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
