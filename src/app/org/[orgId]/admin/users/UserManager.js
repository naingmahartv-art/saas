'use client';
import { useState } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

export default function UserManager({ orgId, orgName, initialUsers, currentUserRole }) {
  const { t } = useI18n();
  const [users, setUsers] = useState(initialUsers);
  const [showCreate, setShowCreate] = useState(false);
  const [form, setForm] = useState({ name: '', email: '', password: '', role: 'cashier' });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [busyId, setBusyId] = useState(null);
  const [tempPassword, setTempPassword] = useState(null); // { userName, password } | null

  const assignableRoles = currentUserRole === 'super_admin'
    ? ['org_admin', 'supervisor', 'cashier']
    : ['supervisor', 'cashier'];

  const roleLabel = { org_admin: t('users.orgAdmin'), supervisor: t('users.supervisor'), cashier: t('users.cashier') };

  async function createUser(e) {
    e.preventDefault();
    setLoading(true); setError('');
    const res = await fetch(`/api/organizations/${orgId}/users`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(form),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error); setLoading(false); return; }
    setUsers([...users, { ...data, createdAt: Date.now() }]);
    setForm({ name: '', email: '', password: '', role: 'cashier' });
    setShowCreate(false);
    setLoading(false);
  }

  async function deleteUser(id) {
    if (!confirm(t('users.removeConfirm'))) return;
    setBusyId(id);
    const res = await fetch(`/api/organizations/${orgId}/users/${id}`, { method: 'DELETE' });
    if (res.ok) setUsers(users.filter((u) => u.id !== id));
    setBusyId(null);
  }

  async function toggleSuspend(u) {
    const nextStatus = u.status === 'suspended' ? 'active' : 'suspended';
    setBusyId(u.id);
    const res = await fetch(`/api/organizations/${orgId}/users/${u.id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ status: nextStatus }),
    });
    if (res.ok) {
      setUsers(users.map((x) => (x.id === u.id ? { ...x, status: nextStatus } : x)));
    }
    setBusyId(null);
  }

  async function resetPassword(u) {
    if (!confirm(t('users.resetPasswordConfirm', { name: u.name }))) return;
    setBusyId(u.id);
    const res = await fetch(`/api/organizations/${orgId}/users/${u.id}/reset-password`, { method: 'POST' });
    const data = await res.json();
    if (res.ok) setTempPassword({ userName: u.name, password: data.tempPassword });
    setBusyId(null);
  }

  return (
    <div className="space-y-6">
      <div className="mb-2">
        <h1 className="text-2xl font-bold text-gray-900">{t('nav.users')}</h1>
        <p className="text-sm text-gray-500 mt-1">{orgName} · {t('users.memberCount', { count: users.length })}</p>
      </div>

      {/* Create user */}
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <h2 className="font-semibold text-gray-900">{t('users.addMember')}</h2>
          <button onClick={() => setShowCreate(!showCreate)} className="btn-primary text-sm py-1.5">
            {showCreate ? t('common.cancel') : t('users.addUser')}
          </button>
        </div>

        {showCreate && (
          <form onSubmit={createUser} className="space-y-4">
            {error && <p className="text-sm text-red-600 bg-red-50 px-4 py-2 rounded-lg">{error}</p>}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">{t('users.fullName')}</label>
                <input
                  type="text" required className="input"
                  placeholder={t('users.namePlaceholder')}
                  value={form.name}
                  onChange={(e) => setForm({ ...form, name: e.target.value })}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">{t('auth.email')}</label>
                <input
                  type="email" required className="input"
                  placeholder={t('users.emailPlaceholder')}
                  value={form.email}
                  onChange={(e) => setForm({ ...form, email: e.target.value })}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">{t('auth.password')}</label>
                <input
                  type="password" required className="input"
                  placeholder={t('users.passwordPlaceholder')}
                  minLength={8}
                  value={form.password}
                  onChange={(e) => setForm({ ...form, password: e.target.value })}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">{t('users.role')}</label>
                <select
                  className="input"
                  value={form.role}
                  onChange={(e) => setForm({ ...form, role: e.target.value })}
                >
                  {assignableRoles.map((r) => (
                    <option key={r} value={r}>{roleLabel[r]}</option>
                  ))}
                </select>
              </div>
            </div>
            <button type="submit" disabled={loading} className="btn-primary">
              {loading ? t('common.adding') : t('users.addUserBtn')}
            </button>
          </form>
        )}
      </div>

      {/* Users list */}
      <div className="card">
        <h2 className="font-semibold text-gray-900 mb-4">{t('users.membersTitle', { count: users.length })}</h2>
        {users.length === 0 ? (
          <p className="text-gray-400 text-sm py-8 text-center">{t('users.noMembers')}</p>
        ) : (
          <div className="space-y-2">
            {users.map((u) => {
              const isSuspended = u.status === 'suspended';
              const locked = currentUserRole !== 'super_admin' && ['org_admin', 'super_admin'].includes(u.role);
              return (
                <div key={u.id} className="flex items-center justify-between p-4 rounded-xl border border-gray-100 hover:border-gray-200 transition-colors">
                  <div>
                    <p className="font-medium text-gray-900">{u.name}</p>
                    <p className="text-xs text-gray-400 mt-0.5">{u.email}</p>
                  </div>
                  <div className="flex items-center gap-2">
                    <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${u.role === 'org_admin' ? 'bg-purple-100 text-purple-700' : u.role === 'supervisor' ? 'bg-blue-100 text-blue-700' : 'bg-gray-100 text-gray-600'}`}>
                      {roleLabel[u.role] || u.role}
                    </span>
                    <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${isSuspended ? 'bg-red-100 text-red-700' : 'bg-green-100 text-green-700'}`}>
                      {isSuspended ? t('users.suspended') : t('users.active')}
                    </span>
                    {!locked && (
                      <>
                        <button
                          onClick={() => resetPassword(u)}
                          disabled={busyId === u.id}
                          className="btn-secondary text-xs py-1 px-3"
                        >
                          {t('users.resetPassword')}
                        </button>
                        <button
                          onClick={() => toggleSuspend(u)}
                          disabled={busyId === u.id}
                          className="btn-secondary text-xs py-1 px-3"
                        >
                          {isSuspended ? t('users.unsuspend') : t('users.suspend')}
                        </button>
                        <button onClick={() => deleteUser(u.id)} disabled={busyId === u.id} className="btn-danger text-xs py-1 px-3">{t('common.remove')}</button>
                      </>
                    )}
                  </div>
                </div>
              );
            })}
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
