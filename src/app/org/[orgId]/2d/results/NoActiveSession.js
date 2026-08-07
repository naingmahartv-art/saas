'use client';
import { useI18n } from '@/lib/i18n/index.js';

export default function NoActiveSession() {
  const { t } = useI18n();
  return (
    <div className="max-w-2xl mx-auto bg-white rounded-xl border border-gray-200 shadow-sm p-8 text-center">
      <p className="text-sm text-red-600 font-medium">
        {t('ledger.noActiveSession')}
      </p>
    </div>
  );
}
