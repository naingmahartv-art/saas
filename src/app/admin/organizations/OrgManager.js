'use client';
import { useState } from 'react';

export default function OrgManager({ initialOrgs, plans }) {
  const [orgs, setOrgs] = useState(initialOrgs);
  const [showCreate, setShowCreate] = useState(false);
  const [form, setForm] = useState({ name: '', plan: 'basic' });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  async function createOrg(e) {
    e.preventDefault();
    setLoading(true); setError('');
    const res = await fetch('/api/admin/organizations', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(form),
    });
    const data = await res.json();
    if (!res.ok) { setError(data.error); setLoading(false); return; }
    setOrgs([...orgs, { ...data, status: 'active', createdAt: Date.now() }]);
    setForm({ name: '', plan: 'basic' });
    setShowCreate(false);
    setLoading(false);
  }

  async function deleteOrg(id) {
    if (!confirm('Delete this organization and all its users?')) return;
    const res = await fetch(`/api/admin/organizations/${id}`, { method: 'DELETE' });
    if (res.ok) setOrgs(orgs.filter((o) => o.id !== id));
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
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Organization Name</label>
                <input
                  type="text" required className="input"
                  placeholder="Acme Corp"
                  value={form.name}
                  onChange={(e) => setForm({ ...form, name: e.target.value })}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Subscription Plan</label>
                <select
                  className="input"
                  value={form.plan}
                  onChange={(e) => setForm({ ...form, plan: e.target.value })}
                >
                  <option value="basic">Basic Plan — ${plans.basic}/mo</option>
                  <option value="advance">Advance Plan — ${plans.advance}/mo</option>
                </select>
              </div>
            </div>

            {/* Plan comparison */}
            <div className="grid grid-cols-2 gap-3 text-sm">
              <div className={`border-2 rounded-xl p-4 cursor-pointer transition-all ${form.plan === 'basic' ? 'border-brand-500 bg-brand-50' : 'border-gray-100'}`}
                onClick={() => setForm({ ...form, plan: 'basic' })}>
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold">Basic Plan</span>
                  <span className="badge-basic">${plans.basic}/mo</span>
                </div>
                <ul className="text-gray-500 space-y-1 text-xs">
                  <li>✓ Up to 10 users</li>
                  <li>✓ Core features</li>
                  <li>✓ Email support</li>
                </ul>
              </div>
              <div className={`border-2 rounded-xl p-4 cursor-pointer transition-all ${form.plan === 'advance' ? 'border-purple-500 bg-purple-50' : 'border-gray-100'}`}
                onClick={() => setForm({ ...form, plan: 'advance' })}>
                <div className="flex items-center justify-between mb-2">
                  <span className="font-semibold">Advance Plan</span>
                  <span className="badge-advance">${plans.advance}/mo</span>
                </div>
                <ul className="text-gray-500 space-y-1 text-xs">
                  <li>✓ Unlimited users</li>
                  <li>✓ All features</li>
                  <li>✓ Priority support</li>
                </ul>
              </div>
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
            {orgs.map((org) => (
              <div key={org.id} className="flex items-center justify-between p-4 rounded-xl border border-gray-100 hover:border-gray-200 transition-colors">
                <div>
                  <p className="font-medium text-gray-900">{org.name}</p>
                  <p className="text-xs text-gray-400 mt-0.5">/{org.slug} · Created {new Date(org.createdAt).toLocaleDateString()}</p>
                </div>
                <div className="flex items-center gap-3">
                  <span className={org.plan === 'advance' ? 'badge-advance' : 'badge-basic'}>
                    {org.plan === 'advance' ? 'Advance' : 'Basic'} ${org.plan === 'advance' ? 99 : 29}/mo
                  </span>
                  <span className={org.status === 'active' ? 'badge-active' : 'badge-suspended'}>
                    {org.status}
                  </span>
                  <a href={`/org/${org.id}/2d/users`} className="btn-secondary text-xs py-1 px-3">Users</a>
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
