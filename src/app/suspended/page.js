'use client';
import { useRouter } from 'next/navigation';
import { useI18n } from '@/lib/i18n/index.js';

export default function SuspendedPage() {
  const router = useRouter();
  const { t } = useI18n();

  async function backToLogin() {
    await fetch('/api/auth/logout', { method: 'POST' });
    router.push('/login');
  }

  return (
    <div className="min-h-screen flex items-center justify-center bg-gray-50 px-4">
      <div className="max-w-sm w-full text-center">
        <div className="w-14 h-14 bg-red-100 rounded-full mx-auto mb-4 flex items-center justify-center">
          <svg className="w-7 h-7 text-red-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M18.364 18.364A9 9 0 005.636 5.636m12.728 12.728A9 9 0 015.636 5.636m12.728 12.728L5.636 5.636" />
          </svg>
        </div>
        <h1 className="text-xl font-bold text-gray-900 mb-2">{t('suspended.title')}</h1>
        <p className="text-sm text-gray-500 mb-6">{t('suspended.message')}</p>
        <button onClick={backToLogin} className="btn-primary">{t('suspended.backToLogin')}</button>
      </div>
    </div>
  );
}
