'use client';
import { useState } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

export default function PasswordRequestsManager({ orgId, initialRequests }) {
  const { t } = useI18n();
  const [requests, setRequests] = useState(initialRequests);
  const [busyId, setBusyId] = useState(null);
  const [tempPassword, setTempPassword] = useState(null); // { userName, password } | null

  const pendingCount = requests.filter(r => r.status === 'pending').length;
  const statusLabel = { pending: t('pwRequests.statusPending'), approved: t('pwRequests.statusApproved'), denied: t('pwRequests.statusDenied') };
  const statusClass = {
    pending: 'bg-amber-100 text-amber-700',
    approved: 'bg-green-100 text-green-700',
    denied: 'bg-red-100 text-red-700',
  };

  async function resolve(reqRow, action) {
    if (action === 'approve' && !confirm(t('pwRequests.approveConfirm', { name: reqRow.userName }))) return;
    if (action === 'deny' && !confirm(t('pwRequests.denyConfirm'))) return;

    setBusyId(reqRow.id);
    const res = await fetch(`/api/org/${orgId}/password-requests/${reqRow.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ action }),
    });
    const data = await res.json();
    if (res.ok) {
      setRequests(prev => prev.map(r => (r.id === reqRow.id ? { ...r, status: data.status } : r)));
      if (data.status === 'approved') setTempPassword({ userName: reqRow.userName, password: data.tempPassword });
    }
    setBusyId(null);
  }

  return (
    <div className="space-y-6">
      <div className="mb-2">
        <h1 className="text-2xl font-bold text-gray-900">{t('pwRequests.title')}</h1>
        <p className="text-sm text-gray-500 mt-1">{t('pwRequests.subtitle', { count: pendingCount })}</p>
      </div>

      <div className="card">
        {requests.length === 0 ? (
          <p className="text-gray-400 text-sm py-8 text-center">{t('pwRequests.noRequests')}</p>
        ) : (
          <div className="space-y-2">
            {requests.map(r => (
              <div key={r.id} className="flex items-center justify-between p-4 rounded-xl border border-gray-100 hover:border-gray-200 transition-colors">
                <div>
                  <p className="font-medium text-gray-900">{r.userName}</p>
                  <p className="text-xs text-gray-400 mt-0.5">{r.userEmail}</p>
                  <p className="text-xs text-gray-400 mt-0.5">{new Date(r.requestedAt).toLocaleString()}</p>
                </div>
                <div className="flex items-center gap-2">
                  <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${statusClass[r.status]}`}>
                    {statusLabel[r.status] || r.status}
                  </span>
                  {r.status === 'pending' && (
                    <>
                      <button onClick={() => resolve(r, 'approve')} disabled={busyId === r.id} className="btn-primary text-xs py-1 px-3">
                        {t('pwRequests.approve')}
                      </button>
                      <button onClick={() => resolve(r, 'deny')} disabled={busyId === r.id} className="btn-danger text-xs py-1 px-3">
                        {t('pwRequests.deny')}
                      </button>
                    </>
                  )}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {tempPassword && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4" onClick={() => setTempPassword(null)}>
          <div className="bg-white rounded-xl shadow-2xl max-w-sm w-full border border-gray-200 p-6" onClick={(e) => e.stopPropagation()}>
            <h3 className="font-semibold text-gray-900 mb-2">{t('users.tempPasswordTitle', { name: tempPassword.userName })}</h3>
            <p className="text-xs text-gray-500 mb-3">{t('users.tempPasswordHint')}</p>
            <p className="font-mono text-lg bg-gray-50 border border-gray-200 rounded-lg px-4 py-3 text-center select-all">{tempPassword.password}</p>
            <button onClick={() => setTempPassword(null)} className="btn-primary w-full mt-4">{t('common.close')}</button>
          </div>
        </div>
      )}
    </div>
  );
}
