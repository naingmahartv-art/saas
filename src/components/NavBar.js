'use client';
import { useRouter } from 'next/navigation';
import SyncStatusBadge from '@/components/SyncStatusBadge';

export default function NavBar({ title, userName, role, orgId }) {
  const router = useRouter();

  async function logout() {
    await fetch('/api/auth/logout', { method: 'POST' });
    router.push('/login');
  }

  const roleLabel = {
    super_admin: 'Project Owner',
    org_admin: 'Org Admin',
    user: 'Member',
  }[role] || role;

  return (
    <header className="bg-white border-b border-gray-100 px-6 py-4 flex items-center justify-between">
      <div className="flex items-center gap-4">
        <div className="w-8 h-8 bg-brand-600 rounded-lg flex items-center justify-center">
          <svg className="w-5 h-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
          </svg>
        </div>
        <span className="font-semibold text-gray-900">{title}</span>
      </div>
      <div className="flex items-center gap-4">
        <SyncStatusBadge />
        <div className="text-right">
          <p className="text-sm font-medium text-gray-900">{userName}</p>
          <p className="text-xs text-gray-400">{roleLabel}</p>
        </div>
        {role === 'super_admin' && (
          <nav className="hidden md:flex items-center gap-1 mr-2">
            <a href="/admin" className="text-sm px-3 py-1.5 rounded-lg hover:bg-gray-50 text-gray-600">Dashboard</a>
            <a href="/admin/organizations" className="text-sm px-3 py-1.5 rounded-lg hover:bg-gray-50 text-gray-600">Organizations</a>
          </nav>
        )}
        {role === 'org_admin' && orgId && (
          <nav className="hidden md:flex items-center gap-1 mr-2">
            <a href={`/org/${orgId}/select-app`} className="text-sm px-3 py-1.5 rounded-lg hover:bg-gray-50 text-gray-600">Switch App</a>
          </nav>
        )}
        <button onClick={logout} className="btn-secondary text-sm py-1.5">
          Sign out
        </button>
      </div>
    </header>
  );
}
