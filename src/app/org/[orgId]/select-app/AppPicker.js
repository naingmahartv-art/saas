'use client';
import { useRouter } from 'next/navigation';

const APPS = [
  {
    key: '2d',
    label: '2D',
    subtitle: '2D ထီ',
    icon: '🔢',
    href: 'dashboard',
    available: true,
  },
  {
    key: 'football',
    label: 'Football Betting',
    subtitle: 'ဘောလုံးထိုး',
    icon: '⚽',
    available: false,
  },
  {
    key: '3d',
    label: '3D',
    subtitle: '3D ထီ',
    icon: '🎲',
    available: false,
  },
];

export default function AppPicker({ orgId, orgName, userName, role }) {
  const router = useRouter();

  async function logout() {
    await fetch('/api/auth/logout', { method: 'POST' });
    router.push('/login');
  }

  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white border-b border-gray-100 px-6 py-4 flex items-center justify-between">
        <div className="flex items-center gap-2.5">
          <div className="w-8 h-8 bg-brand-600 rounded-lg flex items-center justify-center">
            <svg className="w-5 h-5 text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
            </svg>
          </div>
          <span className="font-semibold text-gray-900">{orgName}</span>
        </div>
        <div className="flex items-center gap-4">
          <div className="text-right">
            <p className="text-sm font-medium text-gray-900">{userName}</p>
            <p className="text-xs text-gray-400">{role === 'super_admin' ? 'Project Owner' : 'Org Admin'}</p>
          </div>
          <button type="button" onClick={logout} className="btn-secondary text-sm py-1.5">
            Sign out
          </button>
        </div>
      </header>

      <main className="max-w-4xl mx-auto px-6 py-16 text-center">
        <h1 className="text-2xl font-bold text-gray-900 mb-2">Choose an app / အက်ပ်ရွေးပါ</h1>
        <p className="text-sm text-gray-500 mb-10">Pick which betting app you want to open.</p>

        <div className="grid grid-cols-1 sm:grid-cols-3 gap-5">
          {APPS.map(app => {
            const content = (
              <>
                <div className="text-4xl mb-3">{app.icon}</div>
                <p className="font-semibold text-gray-900">{app.label}</p>
                <p className="text-xs text-gray-400 mt-0.5">{app.subtitle}</p>
                {!app.available && (
                  <span className="inline-block mt-3 text-xs font-medium px-2 py-0.5 rounded-full bg-gray-100 text-gray-500">
                    Coming soon
                  </span>
                )}
              </>
            );

            if (!app.available) {
              return (
                <div
                  key={app.key}
                  aria-disabled="true"
                  className="bg-white rounded-xl border border-gray-200 shadow-sm p-8 opacity-50 cursor-not-allowed select-none"
                >
                  {content}
                </div>
              );
            }

            return (
              <a
                key={app.key}
                href={`/org/${orgId}/${app.key}/${app.href}`}
                className="bg-white rounded-xl border border-gray-200 shadow-sm p-8 hover:border-indigo-400 hover:shadow-md transition"
              >
                {content}
              </a>
            );
          })}
        </div>
      </main>
    </div>
  );
}
