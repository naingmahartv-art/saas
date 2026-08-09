import { redirect } from 'next/navigation';
import { getSession } from '@/lib/auth/session.js';
import { canAccessOrgApp } from '@/lib/auth/permissions.js';
import UserSettingsPanel from './UserSettingsPanel.js';

export const dynamic = 'force-dynamic';

export default async function UserSettingsPage({ params }) {
  const { orgId } = await params;
  const session = await getSession();

  if (!session || (session.role !== 'super_admin' && session.orgId !== orgId)) {
    redirect('/login');
  }
  if (!canAccessOrgApp(session.role)) {
    redirect('/login');
  }

  return (
    <div className="max-w-3xl mx-auto px-6 py-8">
      <UserSettingsPanel />
    </div>
  );
}
