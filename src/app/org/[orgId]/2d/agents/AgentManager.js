'use client';
import { useState } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

const emptyForm = { agentName: '', address: '', phone: '', commission: '', rate: '' };

export default function AgentManager({ orgId, initialAgents }) {
  const { t } = useI18n();
  const [agents, setAgents] = useState(initialAgents || []);
  const [form, setForm] = useState(emptyForm);
  const [editingId, setEditingId] = useState(null);
  const [search, setSearch] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const filtered = agents.filter(a =>
    a.agentName.toLowerCase().includes(search.toLowerCase())
  );

  function handleChange(e) {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }));
    setError('');
  }

  function startEdit(agent) {
    setEditingId(agent.id);
    setForm({
      agentName: agent.agentName,
      address: agent.address || '',
      phone: agent.phone || '',
      commission: agent.commission ?? '',
      rate: agent.rate ?? '',
    });
    setError('');
  }

  function cancelEdit() {
    setEditingId(null);
    setForm(emptyForm);
    setError('');
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setLoading(true);
    setError('');

    const url = editingId
      ? `/api/org/${orgId}/agents/${editingId}`
      : `/api/org/${orgId}/agents`;
    const method = editingId ? 'PUT' : 'POST';

    try {
      const res = await fetch(url, {
        method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      });
      const data = await res.json();

      if (!res.ok) {
        setError(data.error || t('agents.saveFailed'));
        return;
      }

      if (editingId) {
        setAgents(prev => prev.map(a => a.id === editingId ? data.agent : a));
      } else {
        setAgents(prev => [...prev, data.agent].sort((a, b) => a.agentName.localeCompare(b.agentName)));
      }

      cancelEdit();
    } catch {
      setError(t('common.networkError'));
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(agentId, agentName) {
    if (!confirm(t('agents.deleteConfirm', { name: agentName }))) return;
    try {
      await fetch(`/api/org/${orgId}/agents/${agentId}`, { method: 'DELETE' });
      setAgents(prev => prev.filter(a => a.id !== agentId));
      if (editingId === agentId) cancelEdit();
    } catch {
      alert(t('agents.deleteFailed'));
    }
  }

  return (
    <div className="max-w-5xl mx-auto">
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">{t('agents.title')}</h1>
          <p className="text-sm text-gray-500 mt-1">
            {t('agents.subtitleCount', { count: agents.length })}
          </p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Form panel */}
        <div className="lg:col-span-1">
          <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
            <h2 className="text-base font-semibold text-gray-800 mb-4">
              {editingId ? t('agents.editAgent') : t('agents.newAgent')}
            </h2>

            <form onSubmit={handleSubmit} className="space-y-3">
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">
                  {t('agents.agentName')} *
                </label>
                <input
                  name="agentName"
                  value={form.agentName}
                  onChange={handleChange}
                  required
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  placeholder={t('agents.namePlaceholder')}
                />
              </div>

              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">
                  {t('agents.address')}
                </label>
                <input
                  name="address"
                  value={form.address}
                  onChange={handleChange}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  placeholder={t('agents.addressPlaceholder')}
                />
              </div>

              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">
                  {t('agents.phone')}
                </label>
                <input
                  name="phone"
                  value={form.phone}
                  onChange={handleChange}
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  placeholder={t('agents.phonePlaceholder')}
                />
              </div>

              <div className="grid grid-cols-2 gap-2">
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1">
                    {t('agents.commission')}
                  </label>
                  <input
                    name="commission"
                    type="number"
                    step="0.01"
                    min="0"
                    max="100"
                    value={form.commission}
                    onChange={handleChange}
                    className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                    placeholder="0.00"
                  />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1">
                    {t('agents.rate')}
                  </label>
                  <input
                    name="rate"
                    type="number"
                    step="0.01"
                    min="0"
                    value={form.rate}
                    onChange={handleChange}
                    className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                    placeholder="0.00"
                  />
                </div>
              </div>

              {error && (
                <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2">{error}</p>
              )}

              <div className="flex gap-2 pt-1">
                <button
                  type="submit"
                  disabled={loading}
                  className="flex-1 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white text-sm font-medium py-2 px-4 rounded-lg transition"
                >
                  {loading ? t('common.saving') : editingId ? t('agents.update') : t('agents.addAgent')}
                </button>
                {editingId && (
                  <button
                    type="button"
                    onClick={cancelEdit}
                    className="px-4 py-2 text-sm border border-gray-300 rounded-lg hover:bg-gray-50 transition"
                  >
                    {t('common.cancel')}
                  </button>
                )}
              </div>
            </form>
          </div>
        </div>

        {/* Agent list */}
        <div className="lg:col-span-2">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
            <div className="px-5 py-4 border-b border-gray-100">
              <input
                type="text"
                value={search}
                onChange={e => setSearch(e.target.value)}
                placeholder={t('agents.searchPlaceholder')}
                className="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-gray-50"
              />
            </div>

            {filtered.length === 0 ? (
              <div className="px-5 py-10 text-center text-gray-400 text-sm">
                {search ? t('agents.noMatch') : t('agents.noneYet')}
              </div>
            ) : (
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wide">
                    <th className="text-left px-5 py-3 font-medium">{t('agents.nameCol')}</th>
                    <th className="text-left px-4 py-3 font-medium">{t('agents.phoneCol')}</th>
                    <th className="text-right px-4 py-3 font-medium">{t('agents.commissionCol')}</th>
                    <th className="text-right px-4 py-3 font-medium">{t('agents.rateCol')}</th>
                    <th className="px-4 py-3"></th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-50">
                  {filtered.map(agent => (
                    <tr
                      key={agent.id}
                      className={`hover:bg-gray-50 transition ${editingId === agent.id ? 'bg-indigo-50' : ''}`}
                    >
                      <td className="px-5 py-3">
                        <p className="font-medium text-gray-900">{agent.agentName}</p>
                        {agent.address && (
                          <p className="text-xs text-gray-400 mt-0.5 truncate max-w-[160px]">{agent.address}</p>
                        )}
                      </td>
                      <td className="px-4 py-3 text-gray-600">{agent.phone || t('common.none')}</td>
                      <td className="px-4 py-3 text-right text-gray-700">
                        {agent.commission ? `${agent.commission}%` : t('common.none')}
                      </td>
                      <td className="px-4 py-3 text-right text-gray-700">
                        {agent.rate || t('common.none')}
                      </td>
                      <td className="px-4 py-3">
                        <div className="flex gap-2 justify-end">
                          <button
                            onClick={() => startEdit(agent)}
                            className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 transition"
                          >
                            {t('common.edit')}
                          </button>
                          <button
                            onClick={() => handleDelete(agent.id, agent.agentName)}
                            className="text-xs text-red-500 hover:text-red-700 font-medium px-2 py-1 rounded hover:bg-red-50 transition"
                          >
                            {t('common.delete')}
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
