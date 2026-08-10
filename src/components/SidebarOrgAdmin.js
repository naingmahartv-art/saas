'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useI18n } from '@/lib/i18n/index.js';

const NAV = [
  { key: 'dashboard', segment: 'dashboard', label: 'nav.dashboard' },
  { key: 'users', segment: 'users', label: 'nav.users' },
  { key: 'password-requests', segment: 'password-requests', label: 'nav.passwordRequests' },
  { key: 'logs', segment: 'logs', label: 'nav.logs' },
];

export default function SidebarOrgAdmin({ orgId, orgName, userName, role }) {
  const pathname = usePathname();
  const router = useRouter();
  const { t } = useI18n();
  const base = `/org/${orgId}/admin`;

  async function logout() {
    await fetch('/api/auth/logout', { method: 'POST' });
    router.push('/login');
  }

  return (
    <aside className="w-60 shrink-0 h-screen sticky top-0 flex flex-col bg-white border-r border-gray-200">
      <div className="px-3 py-4 border-b border-gray-100 flex items-center gap-2.5">
        <div className="w-8 h-8 bg-brand-600 rounded-lg flex items-center justify-center shrink-0">
          <svg className="w-5 h-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
          </svg>
        </div>
        <div className="min-w-0">
          <p className="text-sm font-semibold text-gray-900 truncate">{orgName}</p>
          <p className="text-xs text-gray-400">{t('nav.adminPanel')}</p>
        </div>
      </div>

      <nav className="flex-1 overflow-y-auto px-2 py-4 space-y-0.5">
        {NAV.map(({ key, segment, label }) => {
          const href = `${base}/${segment}`;
          const active = pathname === href || pathname?.startsWith(href + '/');
          return (
            <Link
              key={key}
              href={href}
              className={`flex items-center px-3 py-2 rounded-lg text-sm font-medium transition ${
                active ? 'bg-indigo-50 text-indigo-700' : 'text-gray-600 hover:bg-gray-50'
              }`}
            >
              {t(label)}
            </Link>
          );
        })}
      </nav>

      <div className="px-2 py-4 border-t border-gray-100 space-y-2">
        <Link
          href={`/org/${orgId}/2d/ledger`}
          className="flex items-center px-3 py-2 rounded-lg text-sm font-medium text-gray-500 hover:bg-gray-50"
        >
          {t('nav.openApp')}
        </Link>
        <div className="px-3">
          <p className="text-sm font-medium text-gray-900 truncate">{userName}</p>
          <p className="text-xs text-gray-400">{role === 'super_admin' ? 'Project Owner' : 'Org Admin'}</p>
        </div>
        <button
          type="button"
          onClick={logout}
          className="w-full flex items-center justify-center gap-2 px-3 text-sm font-medium py-1.5 border border-red-200 text-red-600 hover:bg-red-50 transition rounded-lg"
        >
          <span>🚪</span>
          {t('nav.signOut')}
        </button>
      </div>
    </aside>
  );
}
