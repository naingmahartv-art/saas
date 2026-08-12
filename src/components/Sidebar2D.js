'use client';
import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';
import { useState, useEffect } from 'react';
import LanguageSwitcher from '@/components/LanguageSwitcher.js';
import ThemeToggle from '@/components/ThemeToggle.js';
import { useI18n } from '@/lib/i18n/index.js';

const STORAGE_KEY = 'sidebar_collapsed';

const ICONS = {
  dashboard: (
    <>
      <rect x="3" y="3" width="7" height="7" rx="1" />
      <rect x="14" y="3" width="7" height="7" rx="1" />
      <rect x="3" y="14" width="7" height="7" rx="1" />
      <rect x="14" y="14" width="7" height="7" rx="1" />
    </>
  ),
  session: (
    <>
      <circle cx="12" cy="12" r="9" />
      <polyline points="12 7 12 12 15 15" />
    </>
  ),
  agents: (
    <>
      <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2" />
      <circle cx="9" cy="7" r="4" />
      <path d="M23 21v-2a4 4 0 0 0-3-3.87" />
      <path d="M16 3.13a4 4 0 0 1 0 7.75" />
    </>
  ),
  ledger: (
    <>
      <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
      <polyline points="14 2 14 8 20 8" />
      <line x1="16" y1="13" x2="8" y2="13" />
      <line x1="16" y1="17" x2="8" y2="17" />
    </>
  ),
  reports: (
    <>
      <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
      <polyline points="14 2 14 8 20 8" />
      <line x1="16" y1="13" x2="8" y2="13" />
      <line x1="16" y1="17" x2="8" y2="17" />
      <line x1="10" y1="9" x2="8" y2="9" />
    </>
  ),
  results: (
    <polyline points="22 12 18 12 15 21 9 3 6 12 2 12" />
  ),
  balance: (
    <>
      <line x1="12" y1="1" x2="12" y2="23" />
      <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6" />
    </>
  ),
  users: (
    <>
      <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
      <circle cx="12" cy="7" r="4" />
    </>
  ),
  account: (
    <>
      <circle cx="12" cy="12" r="9" />
      <circle cx="12" cy="10" r="3" />
      <path d="M6.5 19a6 6 0 0 1 11 0" />
    </>
  ),
  settings: (
    <>
      <circle cx="12" cy="12" r="3" />
      <path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-4 0v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83-2.83l.06-.06A1.65 1.65 0 0 0 4.68 15a1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1 0-4h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 2.83-2.83l.06.06A1.65 1.65 0 0 0 9 4.68a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 4 0v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 2.83l-.06.06A1.65 1.65 0 0 0 19.4 9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1z" />
    </>
  ),
  switchApp: (
    <>
      <polyline points="15 3 21 3 21 9" />
      <polyline points="9 21 3 21 3 15" />
      <line x1="21" y1="3" x2="14" y2="10" />
      <line x1="3" y1="21" x2="10" y2="14" />
    </>
  ),
  logout: (
    <>
      <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4" />
      <polyline points="16 17 21 12 16 7" />
      <line x1="21" y1="12" x2="9" y2="12" />
    </>
  ),
};

function Icon({ name, className = 'w-[18px] h-[18px]' }) {
  return (
    <svg className={`${className} shrink-0`} fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={1.8} strokeLinecap="round" strokeLinejoin="round">
      {ICONS[name]}
    </svg>
  );
}

// Full app-level nav — every role (org_admin, supervisor, cashier,
// super_admin) gets all of these; org/user management lives in the separate
// admin panel now, not here.
const ROLE_LABEL = {
  super_admin: 'Project Owner',
  org_admin: 'Org Admin',
  supervisor: 'Supervisor',
  cashier: 'Cashier',
};

const NAV_SEGMENTS = [
  { key: 'ledger',    segment: 'ledger' },
  { key: 'agents',    segment: 'agents' },
  { key: 'reports',   segment: 'reports' },
  { key: 'balance',   segment: 'balance' },
  { key: 'settings',  segment: 'settings' },
  { key: 'account',   segment: 'user-settings' },
];

export default function Sidebar2D({ orgId, orgName, userName, role }) {
  const pathname = usePathname();
  const router = useRouter();
  const { t } = useI18n();
  const [collapsed, setCollapsed] = useState(false);

  const [isElectron, setIsElectron] = useState(false);

  useEffect(() => {
    try {
      setCollapsed(localStorage.getItem(STORAGE_KEY) === 'true');
    } catch {
      // localStorage unavailable
    }
    if (
      process.env.NEXT_PUBLIC_APP_MODE === 'electron' ||
      (typeof window !== 'undefined' &&
        (window.isElectronApp || window.navigator?.userAgent?.toLowerCase().includes('electron')))
    ) {
      setIsElectron(true);
    }
  }, []);

  function toggleCollapsed() {
    setCollapsed((prev) => {
      const next = !prev;
      try {
        localStorage.setItem(STORAGE_KEY, String(next));
      } catch {
        // ignore
      }
      return next;
    });
  }

  const base = `/org/${orgId}/2d`;
  const canAccessAdmin = role === 'org_admin' || role === 'super_admin';

  async function logout() {
    await fetch('/api/auth/logout', { method: 'POST' });
    router.push('/login');
  }

  const showAdminLink = canAccessAdmin && !isElectron;

  const navSegments = NAV_SEGMENTS.filter(s => {
    if (isElectron && s.key === 'reports') return false;
    return true;
  });

  return (
    <aside className={`${collapsed ? 'w-14' : 'w-60'} shrink-0 h-screen sticky top-0 flex flex-col bg-white dark:bg-slate-900 border-r border-gray-200 dark:border-slate-800 transition-[width] duration-200 overflow-hidden`}>
      <div className={`px-2.5 py-3.5 border-b border-gray-100 dark:border-slate-800 flex items-center ${collapsed ? 'justify-center' : 'justify-between gap-2'}`}>
        {collapsed ? (
          <button
            type="button"
            onClick={toggleCollapsed}
            title={t('nav.expand')}
            className="w-9 h-9 rounded-lg bg-indigo-50 dark:bg-slate-800 text-indigo-600 dark:text-indigo-400 hover:bg-indigo-100 dark:hover:bg-slate-700 flex items-center justify-center transition shrink-0"
          >
            <svg className="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2} strokeLinecap="round" strokeLinejoin="round">
              <polyline points="9 18 15 12 9 6" />
            </svg>
          </button>
        ) : (
          <>
            <div className="flex items-center gap-2.5 min-w-0">
              <div className="w-8 h-8 bg-brand-600 rounded-lg flex items-center justify-center shrink-0">
                <svg className="w-5 h-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
                </svg>
              </div>
              <div className="min-w-0">
                <p className="text-sm font-semibold text-gray-900 dark:text-slate-100 truncate">{orgName}</p>
                <p className="text-xs text-gray-400 dark:text-slate-500">2D</p>
              </div>
            </div>
            <button
              type="button"
              onClick={toggleCollapsed}
              title={t('nav.collapse')}
              className="shrink-0 p-1.5 rounded-lg text-gray-400 hover:bg-gray-100 dark:hover:bg-slate-800 hover:text-gray-600 dark:hover:text-slate-300 transition"
            >
              <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2} strokeLinecap="round" strokeLinejoin="round">
                <polyline points="15 18 9 12 15 6" />
              </svg>
            </button>
          </>
        )}
      </div>

      <nav className="flex-1 overflow-y-auto px-2 py-4 space-y-0.5">
        {navSegments.map(({ key, segment }) => {
          const href = `${base}/${segment}`;
          const active = pathname === href || pathname?.startsWith(href + '/');
          return (
            <Link
              key={segment}
              href={href}
              title={collapsed ? t(`nav.${key}`) : undefined}
              className={`flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm font-medium transition ${
                collapsed ? 'justify-center' : ''
              } ${active ? 'bg-indigo-50 dark:bg-slate-800 text-indigo-700 dark:text-indigo-300 font-semibold' : 'text-gray-600 dark:text-slate-400 hover:bg-gray-50 dark:hover:bg-slate-800/60 dark:hover:text-slate-200'}`}
            >
              <Icon name={key} />
              {!collapsed && <span>{t(`nav.${key}`)}</span>}
            </Link>
          );
        })}
      </nav>

      <div className="px-2 py-4 border-t border-gray-100 dark:border-slate-800 space-y-2">
        <ThemeToggle collapsed={collapsed} />
        {!collapsed && (
          <div className="px-1 pb-1">
            <LanguageSwitcher />
          </div>
        )}
        {showAdminLink && (
          <Link
            href={`/org/${orgId}/admin/dashboard`}
            title={collapsed ? t('nav.adminPanel') : undefined}
            className={`flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm font-medium text-gray-500 dark:text-slate-400 hover:bg-gray-50 dark:hover:bg-slate-800 ${
              collapsed ? 'justify-center' : ''
            }`}
          >
            <Icon name="users" />
            {!collapsed && <span>{t('nav.adminPanel')}</span>}
          </Link>
        )}
        <Link
          href="/tutorial"
          target="_blank"
          title={collapsed ? "Tutorials & Website" : undefined}
          className={`flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm font-medium text-indigo-600 dark:text-indigo-400 hover:bg-indigo-50 dark:hover:bg-slate-800 transition ${
            collapsed ? 'justify-center' : ''
          }`}
        >
          <span className="text-base">📚</span>
          {!collapsed && <span>Tutorials / App Info</span>}
        </Link>
        <Link
          href={`/org/${orgId}/select-app`}
          title={collapsed ? t('nav.switchApp') : undefined}
          className={`flex items-center gap-2.5 px-3 py-2 rounded-lg text-sm font-medium text-gray-500 dark:text-slate-400 hover:bg-gray-50 dark:hover:bg-slate-800 ${
            collapsed ? 'justify-center' : ''
          }`}
        >
          <Icon name="switchApp" />
          {!collapsed && <span>{t('nav.switchApp')}</span>}
        </Link>
        {!collapsed && (
          <div className="px-3">
            <p className="text-sm font-medium text-gray-900 dark:text-slate-200 truncate">{userName}</p>
            <p className="text-xs text-gray-400 dark:text-slate-500">{ROLE_LABEL[role] || role}</p>
          </div>
        )}
        <button
          type="button"
          onClick={() => window.location.reload()}
          title={collapsed ? t('ledger.refreshBtn') : t('ledger.refreshHint')}
          className={`w-full flex items-center gap-2.5 text-sm py-1.5 font-medium border border-gray-300 dark:border-slate-700 text-gray-700 dark:text-slate-200 hover:bg-gray-50 dark:hover:bg-slate-800 transition rounded-lg ${
            collapsed ? 'justify-center px-0' : 'px-3'
          }`}
        >
          <svg className="w-[18px] h-[18px] text-gray-600 dark:text-slate-400 shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor" strokeWidth={2} strokeLinecap="round" strokeLinejoin="round">
            <path d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
          </svg>
          {!collapsed && <span>{t('ledger.refreshBtn')} (Alt+R)</span>}
        </button>
        <button
          type="button"
          onClick={async () => {
            try {
              const res = await fetch(`/api/org/${orgId}/ledger/sync-rtdb`, { method: 'POST' });
              const data = await res.json();
              if (data.success) {
                alert(`Successfully recalculated ledger by voucher!\nSynced ${data.vouchersCount || 0} vouchers and ${data.totalNumbersCount || 0} number totals to RTDB.`);
                window.location.reload();
              } else {
                alert(data.error || 'Failed to recalculate ledger');
              }
            } catch {
              alert('Error recalculating ledger by voucher');
            }
          }}
          title={collapsed ? 'Recalculate Ledger by Voucher' : 'Recalculate and populate all Firestore vouchers into RTDB totals'}
          className={`w-full flex items-center gap-2.5 text-sm py-1.5 font-medium border border-amber-300 dark:border-amber-700/60 bg-amber-50 dark:bg-amber-950/30 text-amber-800 dark:text-amber-300 hover:bg-amber-100 dark:hover:bg-amber-900/50 transition rounded-lg cursor-pointer ${
            collapsed ? 'justify-center px-0' : 'px-3'
          }`}
        >
          <span className="text-amber-600 dark:text-amber-400">🔄</span>
          {!collapsed && <span>Recalculate Ledger by Voucher</span>}
        </button>
        <button
          type="button"
          onClick={logout}
          title={collapsed ? t('nav.signOut') : undefined}
          className={`w-full flex items-center gap-2.5 text-sm py-1.5 font-medium border border-red-200 dark:border-red-900/50 text-red-600 dark:text-red-400 hover:bg-red-50 dark:hover:bg-red-950/40 transition rounded-lg ${
            collapsed ? 'justify-center px-0' : 'px-3'
          }`}
        >
          <Icon name="logout" className="w-[18px] h-[18px] text-red-600 dark:text-red-400 shrink-0" />
          {!collapsed && <span>{t('nav.signOut')}</span>}
        </button>
      </div>
    </aside>
  );
}
