'use client';
import { useState } from 'react';

export default function OrgManager({ initialOrgs = [], initialShowCreate = false }) {
  const [orgs, setOrgs] = useState(initialOrgs);
  const [showCreate, setShowCreate] = useState(initialShowCreate);
  const [name, setName] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  async function createOrg(e) {
    e.preventDefault();
    setLoading(true);
    setError('');
    try {
      const res = await fetch('/api/admin/organizations', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || 'Failed to create organization');
        setLoading(false);
        return;
      }
      setOrgs([...orgs, { ...data, status: 'active', createdAt: Date.now() }]);
      setName('');
      setShowCreate(false);
    } catch {
      setError('Network error');
    } finally {
      setLoading(false);
    }
  }

  async function deleteOrg(id) {
    if (!confirm('Delete this organization and all its users?')) return;
    const res = await fetch(`/api/admin/organizations/${id}`, { method: 'DELETE' });
    if (res.ok) setOrgs(orgs.filter(o => o.id !== id));
  }

  return (
    <div className="space-y-6">
      {/* Create form */}
      <div className="card">
        <div className="flex items-center justify-between mb-4">
          <h2 className="font-semibold text-gray-900">Create Organization</h2>
          <button onClick={() => setShowCreate(!showCreate)} className="btn-primary text-sm py-1.5">
            {showCreate ? 'Cancel' : '+ New Organization'}
          </button>
        </div>

        {showCreate && (
          <form onSubmit={createOrg} className="space-y-4">
            {error && <p className="text-sm text-red-600 bg-red-50 px-4 py-2 rounded-lg">{error}</p>}
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Organization Name *</label>
              <input
                type="text"
                required
                className="input max-w-md"
                placeholder="Acme Corp"
                value={name}
                onChange={e => setName(e.target.value)}
              />
            </div>

            <button type="submit" disabled={loading} className="btn-primary">
              {loading ? 'Creating…' : 'Create Organization'}
            </button>
          </form>
        )}
      </div>

      {/* Org list */}
      <div className="card">
        <h2 className="font-semibold text-gray-900 mb-4">All Organizations ({orgs.length})</h2>
        {orgs.length === 0 ? (
          <p className="text-gray-400 text-sm py-8 text-center">No organizations yet. Create one above.</p>
        ) : (
          <div className="space-y-2">
            {orgs.map(org => (
              <div key={org.id} className="flex items-center justify-between p-4 rounded-xl border border-gray-100 hover:border-gray-200 transition-colors">
                <div>
                  <p className="font-medium text-gray-900">{org.name}</p>
                  <p className="text-xs text-gray-400 mt-0.5">/{org.slug} · Created {new Date(org.createdAt).toLocaleDateString()}</p>
                </div>
                <div className="flex items-center gap-3">
                  <span className={org.status === 'active' ? 'badge-active' : 'badge-suspended'}>
                    {org.status}
                  </span>
                  <a href={`/org/${org.id}/admin/users`} className="btn-secondary text-xs py-1 px-3">Users</a>
                  <button onClick={() => deleteOrg(org.id)} className="btn-danger text-xs py-1 px-3">Delete</button>
                </div>
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}
