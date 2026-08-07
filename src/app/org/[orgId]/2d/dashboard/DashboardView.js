'use client';
import Link from 'next/link';
import { useI18n } from '@/lib/i18n/index.js';

export default function DashboardView({ orgId, org, orgUsers, sub }) {
  const { t } = useI18n();
  const isAdvance = org.plan === 'advance';

  return (
    <div className="max-w-5xl mx-auto px-6 py-8">
        <div className="mb-8">
          <div className="flex items-center gap-3 mb-1">
            <h1 className="text-2xl font-bold text-gray-900">{org.name}</h1>
            <span className={isAdvance ? 'badge-advance' : 'badge-basic'}>
              {isAdvance ? t('dashboard.advancePlan') : t('dashboard.basicPlan')}
            </span>
            <span className={org.status === 'active' ? 'badge-active' : 'badge-suspended'}>
              {org.status}
            </span>
          </div>
          <p className="text-gray-500 text-sm">{t('dashboard.subtitle')}</p>
        </div>

        {/* Stats */}
        <div className="grid grid-cols-2 md:grid-cols-3 gap-4 mb-8">
          <div className="card text-center">
            <p className="text-3xl font-bold text-brand-600">{orgUsers.length}</p>
            <p className="text-xs text-gray-500 mt-1">{t('dashboard.totalMembers')}</p>
          </div>
          <div className="card text-center">
            <p className="text-3xl font-bold text-purple-600">{orgUsers.filter(u => u.role === 'org_admin').length}</p>
            <p className="text-xs text-gray-500 mt-1">{t('dashboard.admins')}</p>
          </div>
          <div className="card text-center">
            <p className="text-3xl font-bold text-green-600">${sub?.amount ?? 0}</p>
            <p className="text-xs text-gray-500 mt-1">{t('dashboard.monthlyPlan')}</p>
          </div>
        </div>

        {/* Subscription info */}
        <div className="card mb-6">
          <h2 className="font-semibold text-gray-900 mb-3">{t('dashboard.subscription')}</h2>
          <div className="flex items-center justify-between">
            <div>
              <p className="text-sm font-medium text-gray-900">
                {t('dashboard.planMonth', { plan: isAdvance ? t('dashboard.advancePlan') : t('dashboard.basicPlan'), amount: sub?.amount })}
              </p>
              <p className="text-xs text-gray-400 mt-0.5">
                {org.plan === 'basic' ? t('dashboard.basicDesc') : t('dashboard.advanceDesc')}
              </p>
            </div>
            <span className="badge-active">{t('dashboard.active')}</span>
          </div>
        </div>

        {/* Quick actions */}
        <div className="card">
          <h2 className="font-semibold text-gray-900 mb-4">{t('dashboard.manage')}</h2>
          <div className="flex gap-3">
            <Link href={`/org/${orgId}/2d/users`} className="btn-primary">{t('dashboard.manageUsers')}</Link>
            <Link href={`/org/${orgId}/2d/users?create=1`} className="btn-secondary">{t('dashboard.addUser')}</Link>
          </div>
        </div>
    </div>
  );
}
