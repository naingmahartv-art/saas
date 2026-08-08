'use client';
import { useState, useEffect, useCallback } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

const ACTIONS = ['create', 'edit', 'delete', 'login', 'logout', 'view', 'suspend'];
const ENTITIES = ['voucher', 'session', 'agent', 'user', 'lucky_no'];

export default function LogsViewer({ orgId, orgUsers }) {
  const { t } = useI18n();
  const [filters, setFilters] = useState({ userId: '', action: '', entity: '', from: '', to: '' });
  const [page, setPage] = useState(1);
  const [data, setData] = useState({ logs: [], total: 0, totalPages: 1 });
  const [loading, setLoading] = useState(true);
  const [expanded, setExpanded] = useState(null);

  const load = useCallback(async () => {
    setLoading(true);
    const params = new URLSearchParams({ page: String(page) });
    Object.entries(filters).forEach(([k, v]) => { if (v) params.set(k, v); });
    try {
      const res = await fetch(`/api/org/${orgId}/logs?${params.toString()}`);
      const json = await res.json();
      setData(json);
    } finally {
      setLoading(false);
    }
  }, [orgId, filters, page]);

  useEffect(() => { load(); }, [load]);

  function updateFilter(key, value) {
    setPage(1);
    setFilters((f) => ({ ...f, [key]: value }));
  }

  return (
    <div className="space-y-6">
      <div className="mb-2">
        <h1 className="text-2xl font-bold text-gray-900">{t('nav.logs')}</h1>
        <p className="text-sm text-gray-500 mt-1">{t('logs.subtitle', { count: data.total })}</p>
      </div>

      <div className="card">
        <div className="grid grid-cols-2 md:grid-cols-5 gap-3">
          <select className="input" value={filters.userId} onChange={(e) => updateFilter('userId', e.target.value)}>
            <option value="">{t('logs.allUsers')}</option>
            {orgUsers.map((u) => <option key={u.id} value={u.id}>{u.name}</option>)}
          </select>
          <select className="input" value={filters.action} onChange={(e) => updateFilter('action', e.target.value)}>
            <option value="">{t('logs.allActions')}</option>
            {ACTIONS.map((a) => <option key={a} value={a}>{a}</option>)}
          </select>
          <select className="input" value={filters.entity} onChange={(e) => updateFilter('entity', e.target.value)}>
            <option value="">{t('logs.allEntities')}</option>
            {ENTITIES.map((en) => <option key={en} value={en}>{en}</option>)}
          </select>
          <input type="date" className="input" value={filters.from} onChange={(e) => updateFilter('from', e.target.value)} />
          <input type="date" className="input" value={filters.to} onChange={(e) => updateFilter('to', e.target.value)} />
        </div>
      </div>

      <div className="card overflow-x-auto">
        {loading ? (
          <p className="text-gray-400 text-sm py-8 text-center">{t('common.loading')}</p>
        ) : data.logs.length === 0 ? (
          <p className="text-gray-400 text-sm py-8 text-center">{t('logs.noLogs')}</p>
        ) : (
          <table className="w-full text-sm">
            <thead>
              <tr className="text-left text-xs text-gray-400 uppercase border-b border-gray-100">
                <th className="py-2 pr-4">{t('logs.timeCol')}</th>
                <th className="py-2 pr-4">{t('logs.userCol')}</th>
                <th className="py-2 pr-4">{t('logs.roleCol')}</th>
                <th className="py-2 pr-4">{t('logs.actionCol')}</th>
                <th className="py-2 pr-4">{t('logs.entityCol')}</th>
                <th className="py-2 pr-4"></th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-50">
              {data.logs.map((log) => (
                <tr key={log.id} className="align-top">
                  <td className="py-2 pr-4 whitespace-nowrap text-gray-500">{new Date(log.createdAt).toLocaleString()}</td>
                  <td className="py-2 pr-4 text-gray-900 font-medium">{log.userName}</td>
                  <td className="py-2 pr-4 text-gray-500">{log.userRole}</td>
                  <td className="py-2 pr-4">
                    <span className="text-xs font-medium px-2 py-0.5 rounded-full bg-indigo-50 text-indigo-700">{log.action}</span>
                  </td>
                  <td className="py-2 pr-4 text-gray-500">{log.entity}{log.entityId ? ` (${log.entityId.slice(0, 8)})` : ''}</td>
                  <td className="py-2 pr-4">
                    {log.details && (
                      <button
                        type="button"
                        className="text-xs text-indigo-600 hover:underline"
                        onClick={() => setExpanded(expanded === log.id ? null : log.id)}
                      >
                        {expanded === log.id ? t('common.close') : t('logs.details')}
                      </button>
                    )}
                    {expanded === log.id && log.details && (
                      <pre className="mt-1 text-xs bg-gray-50 rounded-lg p-2 max-w-xs overflow-x-auto">{log.details}</pre>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </div>

      {data.totalPages > 1 && (
        <div className="flex items-center justify-center gap-3">
          <button
            type="button"
            disabled={page <= 1}
            onClick={() => setPage((p) => Math.max(1, p - 1))}
            className="btn-secondary text-sm py-1.5 px-3 disabled:opacity-50"
          >
            {t('logs.prev')}
          </button>
          <span className="text-sm text-gray-500">{t('logs.pageOf', { page, total: data.totalPages })}</span>
          <button
            type="button"
            disabled={page >= data.totalPages}
            onClick={() => setPage((p) => Math.min(data.totalPages, p + 1))}
            className="btn-secondary text-sm py-1.5 px-3 disabled:opacity-50"
          >
            {t('logs.next')}
          </button>
        </div>
      )}
    </div>
  );
}
