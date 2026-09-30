'use client';
import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { useI18n } from '@/lib/i18n/index.js';

export default function UserManager({ orgId, orgName, initialUsers, currentUserRole }) {
  const { t } = useI18n();
  const router = useRouter();
  const [users, setUsers] = useState(initialUsers);
  const [showCreate, setShowCreate] = useState(false);
  const [form, setForm] = useState({ name: '', email: '', password: '', role: 'cashier' });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [statusMsg, setStatusMsg] = useState('');
  const [busyId, setBusyId] = useState(null);
  const [tempPassword, setTempPassword] = useState(null); // { userName, password } | null
  const [dynamicRoles, setDynamicRoles] = useState([]);

  // Role Edit Modal state
  const [editingUser, setEditingUser] = useState(null); // { user, newRole } | null
  const [updatingRole, setUpdatingRole] = useState(false);
  const [editRoleError, setEditRoleError] = useState('');

  // Sync users if initialUsers changes
  useEffect(() => {
    setUsers(initialUsers);
  }, [initialUsers]);

  useEffect(() => {
    async function loadRoles() {
      try {
        const res = await fetch(`/api/org/${orgId}/roles`, { cache: 'no-store' });
        if (res.ok) {
          const data = await res.json();
          if (data.roles && Array.isArray(data.roles)) {
            setDynamicRoles(data.roles);
          }
        }
      } catch {}
    }
    loadRoles();
  }, [orgId]);

  const assignableRoles = currentUserRole === 'super_admin'
    ? (dynamicRoles.length > 0 ? dynamicRoles.map(r => r.id) : ['org_admin', 'supervisor', 'cashier'])
    : (dynamicRoles.length > 0 ? dynamicRoles.filter(r => r.id !== 'org_admin').map(r => r.id) : ['supervisor', 'cashier']);

  const roleLabelMap = {
    org_admin: t('users.orgAdmin') || 'Org Admin',
    supervisor: t('users.supervisor') || 'Supervisor',
    cashier: t('users.cashier') || 'Cashier',
  };
  dynamicRoles.forEach((r) => {
    roleLabelMap[r.id] = r.name;
  });

  async function createUser(e) {
    e.preventDefault();
    setLoading(true);
    setError('');
    setStatusMsg('');
    try {
      const res = await fetch(`/api/organizations/${orgId}/users`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error);
        setLoading(false);
        return;
      }
      setUsers([...users, { ...data, createdAt: Date.now() }]);
      setForm({ name: '', email: '', password: '', role: 'cashier' });
      setShowCreate(false);
      setStatusMsg(`✓ User "${data.name}" added successfully.`);
      setTimeout(() => setStatusMsg(''), 4000);
      router.refresh();
    } catch {
      setError('Network error adding user');
    } finally {
      setLoading(false);
    }
  }

  async function deleteUser(id) {
    if (!confirm(t('users.removeConfirm'))) return;
    setBusyId(id);
    try {
      const res = await fetch(`/api/organizations/${orgId}/users/${id}`, { method: 'DELETE' });
      if (res.ok) {
        setUsers(users.filter((u) => u.id !== id));
        router.refresh();
      }
    } catch {}
    setBusyId(null);
  }

  async function toggleSuspend(u) {
    const nextStatus = u.status === 'suspended' ? 'active' : 'suspended';
    setBusyId(u.id);
    try {
      const res = await fetch(`/api/organizations/${orgId}/users/${u.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status: nextStatus }),
      });
      if (res.ok) {
        setUsers(users.map((x) => (x.id === u.id ? { ...x, status: nextStatus } : x)));
        router.refresh();
      }
    } catch {}
    setBusyId(null);
  }

  async function resetPassword(u) {
    if (!confirm(t('users.resetPasswordConfirm', { name: u.name }))) return;
    setBusyId(u.id);
    try {
      const res = await fetch(`/api/organizations/${orgId}/users/${u.id}/reset-password`, { method: 'POST' });
      const data = await res.json();
      if (res.ok) setTempPassword({ userName: u.name, password: data.tempPassword });
    } catch {}
    setBusyId(null);
  }

  // Handle user role update
  async function handleSaveUserRole(e) {
    e.preventDefault();
    if (!editingUser) return;

    setUpdatingRole(true);
    setEditRoleError('');

    try {
      const res = await fetch(`/api/organizations/${orgId}/users/${editingUser.user.id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ role: editingUser.newRole }),
      });

      const data = await res.json();
      if (!res.ok) {
        throw new Error(data.error || 'Failed to update user role');
      }

      setUsers((prev) =>
        prev.map((u) => (u.id === editingUser.user.id ? { ...u, role: editingUser.newRole } : u))
      );
      setStatusMsg(t('users.roleUpdated') || `✓ Role updated for "${editingUser.user.name}"`);
      setTimeout(() => setStatusMsg(''), 4000);
      setEditingUser(null);
      router.refresh();
    } catch (err) {
      setEditRoleError(err.message || 'Error updating user role');
    } finally {
      setUpdatingRole(false);
    }
  }

  return (
    <div className="space-y-6">
      <div className="mb-2">
        <h1 className="text-2xl font-bold text-gray-900">{t('nav.users')}</h1>
        <p className="text-sm text-gray-500 mt-1">{orgName} · {t('users.memberCount', { count: users.length })}</p>
      </div>

      {statusMsg && (
        <div className="p-3 bg-emerald-50 border border-emerald-200 text-emerald-800 rounded-xl text-xs font-semibold flex items-center justify-between">
          <span>{statusMsg}</span>
          <button type="button" onClick={() => setStatusMsg('')} className="font-bold">✕</button>
        </div>
      )}

      {/* Create user */}
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <h2 className="font-semibold text-gray-900">{t('users.addMember')}</h2>
          <button onClick={() => setShowCreate(!showCreate)} className="btn-primary text-sm py-1.5 cursor-pointer">
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
                    <option key={r} value={r}>{roleLabelMap[r] || r}</option>
                  ))}
                </select>
              </div>
            </div>
            <button type="submit" disabled={loading} className="btn-primary cursor-pointer">
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
              const isCustom = !['org_admin', 'supervisor', 'cashier'].includes(u.role);
              return (
                <div key={u.id} className="flex flex-col sm:flex-row sm:items-center justify-between p-4 rounded-xl border border-gray-100 hover:border-gray-200 transition-colors gap-3">
                  <div>
                    <div className="flex items-center gap-2">
                      <p className="font-medium text-gray-900">{u.name}</p>
                      {isCustom && (
                        <span className="text-[10px] bg-slate-100 text-slate-600 px-1.5 py-0.5 rounded font-mono">
                          Custom
                        </span>
                      )}
                    </div>
                    <p className="text-xs text-gray-400 mt-0.5">{u.email}</p>
                  </div>
                  <div className="flex flex-wrap items-center gap-2">
                    <span className={`text-xs font-semibold px-2.5 py-0.5 rounded-full ${
                      u.role === 'org_admin'
                        ? 'bg-purple-100 text-purple-700 border border-purple-200'
                        : u.role === 'supervisor'
                        ? 'bg-blue-100 text-blue-700 border border-blue-200'
                        : isCustom
                        ? 'bg-emerald-100 text-emerald-800 border border-emerald-200'
                        : 'bg-gray-100 text-gray-700 border border-gray-200'
                    }`}>
                      {roleLabelMap[u.role] || u.role}
                    </span>
                    <span className={`text-xs font-medium px-2 py-0.5 rounded-full ${isSuspended ? 'bg-red-100 text-red-700' : 'bg-green-100 text-green-700'}`}>
                      {isSuspended ? t('users.suspended') : t('users.active')}
                    </span>
                    {!locked && (
                      <>
                        <button
                          type="button"
                          onClick={() => setEditingUser({ user: u, newRole: u.role })}
                          disabled={busyId === u.id}
                          className="btn-secondary text-xs py-1 px-3 flex items-center gap-1 cursor-pointer"
                        >
                          <span>⚙️</span>
                          <span>{t('users.changeRole') || 'Change Role'}</span>
                        </button>
                        <button
                          type="button"
                          onClick={() => resetPassword(u)}
                          disabled={busyId === u.id}
                          className="btn-secondary text-xs py-1 px-3 cursor-pointer"
                        >
                          {t('users.resetPassword')}
                        </button>
                        <button
                          type="button"
                          onClick={() => toggleSuspend(u)}
                          disabled={busyId === u.id}
                          className="btn-secondary text-xs py-1 px-3 cursor-pointer"
                        >
                          {isSuspended ? t('users.unsuspend') : t('users.suspend')}
                        </button>
                        <button
                          type="button"
                          onClick={() => deleteUser(u.id)}
                          disabled={busyId === u.id}
                          className="btn-danger text-xs py-1 px-3 cursor-pointer"
                        >
                          {t('common.remove')}
                        </button>
                      </>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        )}
      </div>

      {/* Edit User Role Modal */}
      {editingUser && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-xs z-50 flex items-center justify-center p-4" onClick={() => setEditingUser(null)}>
          <div className="bg-white rounded-2xl p-6 shadow-2xl border border-gray-200 max-w-md w-full space-y-4" onClick={(e) => e.stopPropagation()}>
            <div className="flex items-center justify-between border-b border-gray-100 pb-3">
              <h3 className="text-base font-bold text-gray-900 flex items-center gap-2">
                <span>🛡️</span>
                <span>{t('users.editRole') || 'Change User Role'}</span>
              </h3>
              <button
                type="button"
                onClick={() => setEditingUser(null)}
                className="text-gray-400 hover:text-gray-600 font-bold px-2 cursor-pointer"
              >
                ✕
              </button>
            </div>

            {editRoleError && (
              <div className="p-3 bg-red-50 border border-red-200 text-red-700 rounded-xl text-xs font-semibold">
                ⚠️ {editRoleError}
              </div>
            )}

            <form onSubmit={handleSaveUserRole} className="space-y-4">
              <div>
                <p className="text-xs text-gray-500 font-medium">User</p>
                <p className="text-sm font-bold text-gray-900">{editingUser.user.name}</p>
                <p className="text-xs text-gray-400">{editingUser.user.email}</p>
              </div>

              <div>
                <label className="block text-xs font-bold text-gray-700 mb-1">
                  {t('users.selectRole') || 'Select New Role'} *
                </label>
                <select
                  value={editingUser.newRole}
                  onChange={(e) => setEditingUser({ ...editingUser, newRole: e.target.value })}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
                >
                  {assignableRoles.map((r) => {
                    const dynamicRoleObj = dynamicRoles.find(dr => dr.id === r);
                    const permCount = dynamicRoleObj?.permissions?.length;
                    return (
                      <option key={r} value={r}>
                        {roleLabelMap[r] || r} {permCount !== undefined ? `(${permCount} perms)` : ''}
                      </option>
                    );
                  })}
                </select>
              </div>

              {/* Role explanation */}
              {(() => {
                const targetRole = dynamicRoles.find(r => r.id === editingUser.newRole);
                if (targetRole && targetRole.description) {
                  return (
                    <div className="p-3 bg-slate-50 border border-slate-200 rounded-xl text-xs text-slate-600">
                      <p className="font-semibold text-slate-800 mb-0.5">{targetRole.name}</p>
                      <p>{targetRole.description}</p>
                    </div>
                  );
                }
                return null;
              })()}

              <div className="flex items-center justify-end gap-2 pt-3 border-t border-gray-100">
                <button
                  type="button"
                  onClick={() => setEditingUser(null)}
                  className="btn-secondary text-xs px-3.5 py-2 cursor-pointer"
                >
                  {t('common.cancel')}
                </button>
                <button
                  type="submit"
                  disabled={updatingRole || editingUser.newRole === editingUser.user.role}
                  className="btn-primary text-xs px-4 py-2 disabled:opacity-50 cursor-pointer"
                >
                  {updatingRole ? t('common.saving') || 'Updating...' : t('users.saveRole') || 'Update Role'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}

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
