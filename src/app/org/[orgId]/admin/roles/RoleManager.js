'use client';

import { useState, useMemo } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

export default function RoleManager({
  orgId,
  orgName,
  initialRoles = [],
  permissionGroups = [],
  currentUserRole,
}) {
  const { t } = useI18n();
  const [roles, setRoles] = useState(initialRoles);
  const [selectedRoleId, setSelectedRoleId] = useState(initialRoles[0]?.id || 'cashier');
  const [searchFilter, setSearchFilter] = useState('');

  // Creation modal state
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [newRoleName, setNewRoleName] = useState('');
  const [newRoleDesc, setNewRoleDesc] = useState('');
  const [cloneTemplate, setCloneTemplate] = useState('cashier');

  // Status & feedback
  const [saving, setSaving] = useState(false);
  const [deleting, setDeleting] = useState(false);
  const [statusMsg, setStatusMsg] = useState('');
  const [errorMsg, setErrorMsg] = useState('');

  const activeRole = useMemo(() => {
    return roles.find((r) => r.id === selectedRoleId) || roles[0] || null;
  }, [roles, selectedRoleId]);

  const activePermissions = useMemo(() => {
    return new Set(activeRole?.permissions || []);
  }, [activeRole]);

  // Toggle single permission for the active role
  function handleTogglePermission(key) {
    if (!activeRole) return;
    const nextPerms = new Set(activePermissions);
    if (nextPerms.has(key)) {
      nextPerms.delete(key);
    } else {
      nextPerms.add(key);
    }

    setRoles((prev) =>
      prev.map((r) =>
        r.id === activeRole.id ? { ...r, permissions: Array.from(nextPerms) } : r
      )
    );
  }

  // Toggle all permissions in a specific group
  function handleToggleGroup(group, selectAll) {
    if (!activeRole) return;
    const nextPerms = new Set(activePermissions);
    for (const p of group.permissions) {
      if (selectAll) {
        nextPerms.add(p.key);
      } else {
        nextPerms.delete(p.key);
      }
    }

    setRoles((prev) =>
      prev.map((r) =>
        r.id === activeRole.id ? { ...r, permissions: Array.from(nextPerms) } : r
      )
    );
  }

  // Select / Deselect All permissions globally
  function handleToggleAll(selectAll) {
    if (!activeRole) return;
    const allKeys = permissionGroups.flatMap((g) => g.permissions.map((p) => p.key));
    const nextPerms = selectAll ? allKeys : [];

    setRoles((prev) =>
      prev.map((r) =>
        r.id === activeRole.id ? { ...r, permissions: nextPerms } : r
      )
    );
  }

  // Save changes to server
  async function handleSavePermissions() {
    if (!activeRole) return;
    setSaving(true);
    setStatusMsg('');
    setErrorMsg('');

    try {
      const res = await fetch(`/api/org/${orgId}/roles/${activeRole.id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          name: activeRole.name,
          description: activeRole.description,
          permissions: activeRole.permissions,
        }),
      });

      const data = await res.json();
      if (!res.ok) {
        throw new Error(data.error || 'Failed to save role permissions');
      }

      setStatusMsg(`✓ Permissions for role "${activeRole.name}" updated successfully!`);
      setTimeout(() => setStatusMsg(''), 4000);
    } catch (err) {
      setErrorMsg(err.message || 'Network error while saving role');
    } finally {
      setSaving(false);
    }
  }

  // Create a new custom role
  async function handleCreateRole(e) {
    e.preventDefault();
    if (!newRoleName.trim()) return;

    setSaving(true);
    setErrorMsg('');

    const templateRole = roles.find((r) => r.id === cloneTemplate);
    const initialPerms = templateRole ? [...templateRole.permissions] : [];

    try {
      const res = await fetch(`/api/org/${orgId}/roles`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          name: newRoleName.trim(),
          description: newRoleDesc.trim(),
          permissions: initialPerms,
        }),
      });

      const data = await res.json();
      if (!res.ok) {
        throw new Error(data.error || 'Failed to create role');
      }

      const created = data.role;
      setRoles((prev) => [...prev, created]);
      setSelectedRoleId(created.id);
      setShowCreateModal(false);
      setNewRoleName('');
      setNewRoleDesc('');
      setStatusMsg(`✓ Custom role "${created.name}" created successfully!`);
      setTimeout(() => setStatusMsg(''), 4000);
    } catch (err) {
      setErrorMsg(err.message || 'Failed to create custom role');
    } finally {
      setSaving(false);
    }
  }

  // Delete custom role
  async function handleDeleteRole() {
    if (!activeRole) return;
    if (activeRole.isSystem) {
      if (!confirm(`Reset system role "${activeRole.name}" to factory default permissions?`)) return;
    } else {
      if (!confirm(`Are you sure you want to permanently delete custom role "${activeRole.name}"?`)) return;
    }

    setDeleting(true);
    setErrorMsg('');

    try {
      const res = await fetch(`/api/org/${orgId}/roles/${activeRole.id}`, {
        method: 'DELETE',
      });

      const data = await res.json();
      if (!res.ok) {
        throw new Error(data.error || 'Failed to delete role');
      }

      if (activeRole.isSystem) {
        setStatusMsg(`✓ Reset role "${activeRole.name}" to default.`);
        window.location.reload();
      } else {
        setRoles((prev) => prev.filter((r) => r.id !== activeRole.id));
        setSelectedRoleId(roles[0]?.id || 'cashier');
        setStatusMsg(`✓ Deleted custom role "${activeRole.name}".`);
      }
      setTimeout(() => setStatusMsg(''), 4000);
    } catch (err) {
      setErrorMsg(err.message || 'Error deleting role');
    } finally {
      setDeleting(false);
    }
  }

  // Filter permission groups & items by search query
  const filteredGroups = useMemo(() => {
    if (!searchFilter.trim()) return permissionGroups;
    const q = searchFilter.toLowerCase().trim();

    return permissionGroups
      .map((g) => {
        const matchesGroup = g.groupName.toLowerCase().includes(q) || g.description.toLowerCase().includes(q);
        const filteredPerms = g.permissions.filter(
          (p) =>
            p.name.toLowerCase().includes(q) ||
            p.key.toLowerCase().includes(q) ||
            p.description.toLowerCase().includes(q)
        );

        if (matchesGroup) return g;
        if (filteredPerms.length > 0) return { ...g, permissions: filteredPerms };
        return null;
      })
      .filter(Boolean);
  }, [permissionGroups, searchFilter]);

  const totalPermissionsCount = useMemo(() => {
    return permissionGroups.reduce((sum, g) => sum + g.permissions.length, 0);
  }, [permissionGroups]);

  return (
    <div className="space-y-6">
      {/* Page Header */}
      <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">User Roles & Permissions</h1>
          <p className="text-sm text-gray-500 mt-1">
            {orgName} · Customize role privileges and dynamic access control for staff members
          </p>
        </div>

        <button
          type="button"
          onClick={() => setShowCreateModal(true)}
          className="btn-primary flex items-center gap-2 text-sm py-2 px-4 shadow-sm cursor-pointer"
        >
          <span>➕</span>
          <span>Add Custom Role</span>
        </button>
      </div>

      {/* Role Selection Tabs */}
      <div className="bg-white rounded-2xl border border-gray-200 p-2 shadow-sm flex flex-wrap gap-2 items-center">
        {roles.map((r) => {
          const isActive = r.id === selectedRoleId;
          const permCount = (r.permissions || []).length;
          return (
            <button
              key={r.id}
              type="button"
              onClick={() => setSelectedRoleId(r.id)}
              className={`flex items-center gap-2.5 px-4 py-2.5 rounded-xl font-semibold text-sm transition cursor-pointer ${
                isActive
                  ? 'bg-indigo-600 text-white shadow-md'
                  : 'bg-gray-50 text-gray-700 hover:bg-gray-100 hover:text-gray-900'
              }`}
            >
              <span>{r.name}</span>
              <span
                className={`text-[11px] px-2 py-0.5 rounded-full font-mono font-bold ${
                  isActive
                    ? 'bg-white/20 text-white'
                    : 'bg-gray-200 text-gray-600'
                }`}
              >
                {permCount} / {totalPermissionsCount}
              </span>
              {r.isSystem && (
                <span className={`text-[10px] uppercase font-bold tracking-wider opacity-75`}>
                  System
                </span>
              )}
            </button>
          );
        })}
      </div>

      {/* Role Overview & Actions Toolbar */}
      {activeRole && (
        <div className="bg-white rounded-2xl border border-gray-200 p-5 shadow-sm space-y-4">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 border-b border-gray-100 pb-4">
            <div>
              <div className="flex items-center gap-2">
                <h2 className="text-lg font-bold text-gray-900">{activeRole.name}</h2>
                <span
                  className={`text-xs px-2.5 py-0.5 rounded-full font-semibold ${
                    activeRole.isSystem
                      ? 'bg-purple-100 text-purple-700 border border-purple-200'
                      : 'bg-emerald-100 text-emerald-700 border border-emerald-200'
                  }`}
                >
                  {activeRole.isSystem ? 'System Template' : 'Custom Role'}
                </span>
              </div>
              <p className="text-xs text-gray-500 mt-1">
                {activeRole.description || 'Configured access permissions for this role.'}
              </p>
            </div>

            <div className="flex flex-wrap items-center gap-2">
              <button
                type="button"
                onClick={() => handleToggleAll(true)}
                className="btn-secondary text-xs py-1.5 px-3"
              >
                Select All
              </button>
              <button
                type="button"
                onClick={() => handleToggleAll(false)}
                className="btn-secondary text-xs py-1.5 px-3"
              >
                Clear All
              </button>
              {!activeRole.isSystem && (
                <button
                  type="button"
                  onClick={handleDeleteRole}
                  disabled={deleting}
                  className="btn-danger text-xs py-1.5 px-3"
                >
                  {deleting ? 'Deleting...' : 'Delete Role'}
                </button>
              )}
              <button
                type="button"
                onClick={handleSavePermissions}
                disabled={saving}
                className="btn-primary text-xs py-1.5 px-4 shadow-sm flex items-center gap-1.5"
              >
                <span>💾</span>
                <span>{saving ? 'Saving...' : 'Save Permissions'}</span>
              </button>
            </div>
          </div>

          {/* Feedback Alerts */}
          {statusMsg && (
            <div className="p-3 bg-emerald-50 border border-emerald-200 text-emerald-800 rounded-xl text-xs font-semibold flex items-center justify-between">
              <span>{statusMsg}</span>
              <button type="button" onClick={() => setStatusMsg('')} className="font-bold">✕</button>
            </div>
          )}
          {errorMsg && (
            <div className="p-3 bg-red-50 border border-red-200 text-red-700 rounded-xl text-xs font-semibold flex items-center justify-between">
              <span>⚠️ {errorMsg}</span>
              <button type="button" onClick={() => setErrorMsg('')} className="font-bold">✕</button>
            </div>
          )}

          {/* Search Filter for Permissions */}
          <div className="relative max-w-sm">
            <input
              type="text"
              value={searchFilter}
              onChange={(e) => setSearchFilter(e.target.value)}
              placeholder="Search permission or task action..."
              className="w-full pl-9 pr-3 py-1.5 text-xs border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-gray-50 text-gray-900"
            />
            <span className="absolute left-3 top-2 text-gray-400 text-xs">🔍</span>
          </div>

          {/* Permission Matrix Accordion / Cards */}
          <div className="space-y-4 pt-2">
            {filteredGroups.map((group) => {
              const groupPerms = group.permissions;
              const grantedInGroup = groupPerms.filter((p) => activePermissions.has(p.key)).length;
              const allGranted = grantedInGroup === groupPerms.length && groupPerms.length > 0;

              return (
                <div
                  key={group.groupId}
                  className="border border-gray-200 rounded-2xl overflow-hidden bg-white shadow-xs"
                >
                  {/* Group Header */}
                  <div className="px-4 py-3 bg-slate-50 border-b border-gray-200 flex flex-wrap items-center justify-between gap-3">
                    <div className="flex items-center gap-2.5">
                      <span className="text-base font-bold text-gray-900">{group.groupName}</span>
                      <span className="text-xs font-mono font-bold px-2 py-0.5 rounded-full bg-slate-200 text-slate-700">
                        {grantedInGroup} / {groupPerms.length}
                      </span>
                    </div>

                    <div className="flex items-center gap-2">
                      <button
                        type="button"
                        onClick={() => handleToggleGroup(group, !allGranted)}
                        className={`text-xs px-2.5 py-1 rounded-lg font-semibold transition cursor-pointer ${
                          allGranted
                            ? 'bg-rose-50 text-rose-700 hover:bg-rose-100 border border-rose-200'
                            : 'bg-indigo-50 text-indigo-700 hover:bg-indigo-100 border border-indigo-200'
                        }`}
                      >
                        {allGranted ? 'Deselect Group' : 'Select All in Group'}
                      </button>
                    </div>
                  </div>

                  {/* Group Permissions Checkboxes */}
                  <div className="p-4 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                    {groupPerms.map((perm) => {
                      const isChecked = activePermissions.has(perm.key);
                      return (
                        <label
                          key={perm.key}
                          className={`flex items-start gap-3 p-3 rounded-xl border transition cursor-pointer select-none ${
                            isChecked
                              ? 'bg-indigo-50/50 border-indigo-200 text-indigo-950 shadow-xs'
                              : 'bg-white border-gray-200 text-gray-700 hover:bg-gray-50/80 opacity-70'
                          }`}
                        >
                          <input
                            type="checkbox"
                            checked={isChecked}
                            onChange={() => handleTogglePermission(perm.key)}
                            className="mt-0.5 rounded border-gray-300 text-indigo-600 focus:ring-indigo-500 w-4 h-4 cursor-pointer"
                          />
                          <div className="min-w-0 flex-1">
                            <p className="text-xs font-bold leading-tight text-gray-900">
                              {perm.name}
                            </p>
                            <p className="text-[11px] font-mono text-indigo-600 mt-0.5 font-medium">
                              {perm.key}
                            </p>
                            <p className="text-[11px] text-gray-500 mt-1 leading-snug">
                              {perm.description}
                            </p>
                          </div>
                        </label>
                      );
                    })}
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* Create Custom Role Modal */}
      {showCreateModal && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-xs z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl p-6 shadow-2xl border border-gray-200 max-w-md w-full space-y-4">
            <div className="flex items-center justify-between border-b border-gray-100 pb-3">
              <h3 className="text-base font-bold text-gray-900 flex items-center gap-2">
                <span>➕</span> Create Custom Role
              </h3>
              <button
                type="button"
                onClick={() => setShowCreateModal(false)}
                className="text-gray-400 hover:text-gray-600 font-bold px-2"
              >
                ✕
              </button>
            </div>

            <form onSubmit={handleCreateRole} className="space-y-3">
              <div>
                <label className="block text-xs font-bold text-gray-700 mb-1">
                  Role Name *
                </label>
                <input
                  type="text"
                  required
                  value={newRoleName}
                  onChange={(e) => setNewRoleName(e.target.value)}
                  placeholder="e.g. Senior Accountant / Floor Manager"
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-gray-700 mb-1">
                  Description
                </label>
                <textarea
                  rows={2}
                  value={newRoleDesc}
                  onChange={(e) => setNewRoleDesc(e.target.value)}
                  placeholder="Responsibilities and access scope..."
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>

              <div>
                <label className="block text-xs font-bold text-gray-700 mb-1">
                  Clone Initial Permissions From:
                </label>
                <select
                  value={cloneTemplate}
                  onChange={(e) => setCloneTemplate(e.target.value)}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
                >
                  {roles.map((r) => (
                    <option key={r.id} value={r.id}>
                      {r.name} ({(r.permissions || []).length} permissions)
                    </option>
                  ))}
                </select>
              </div>

              <div className="flex items-center justify-end gap-2 pt-3 border-t border-gray-100">
                <button
                  type="button"
                  onClick={() => setShowCreateModal(false)}
                  className="btn-secondary text-xs px-3.5 py-2"
                >
                  Cancel
                </button>
                <button
                  type="submit"
                  disabled={saving || !newRoleName.trim()}
                  className="btn-primary text-xs px-4 py-2 disabled:opacity-50"
                >
                  {saving ? 'Creating...' : 'Create Role'}
                </button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
