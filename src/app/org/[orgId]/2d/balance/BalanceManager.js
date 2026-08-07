'use client';
import { useState, useMemo } from 'react';
import { useI18n } from '@/lib/i18n/index.js';

function todayStr() {
  return new Date().toISOString().slice(0, 10);
}

const emptyForm = { agentName: '', amount: '', onDate: todayStr(), onCount: '', ampm: '' };

export default function BalanceManager({ orgId, initialAgents, initialBalances, initialReceives }) {
  const { t } = useI18n();
  const [agents] = useState(initialAgents || []);
  const [balances, setBalances] = useState(initialBalances || []);
  const [receives, setReceives] = useState(initialReceives || []);
  const [selectedAgent, setSelectedAgent] = useState('');
  const [form, setForm] = useState(emptyForm);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const filteredBalances = useMemo(
    () => (selectedAgent ? balances.filter(b => b.agentName === selectedAgent) : balances),
    [balances, selectedAgent]
  );
  const filteredReceives = useMemo(
    () => (selectedAgent ? receives.filter(r => r.agentName === selectedAgent) : receives),
    [receives, selectedAgent]
  );

  const totalOwed = filteredBalances.reduce((sum, b) => sum + b.amount, 0);
  const totalReceived = filteredReceives.reduce((sum, r) => sum + r.amount, 0);
  const netBalance = totalOwed - totalReceived;

  function handleChange(e) {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }));
    setError('');
  }

  async function refresh() {
    const res = await fetch(`/api/org/${orgId}/balance`);
    if (res.ok) {
      const data = await res.json();
      setBalances(data.balances);
      setReceives(data.receives);
    }
  }

  async function handleSubmit(e) {
    e.preventDefault();
    setError('');

    if (!form.agentName) {
      setError(t('balance.agentRequired'));
      return;
    }
    if (!(parseFloat(form.amount) > 0)) {
      setError(t('balance.amountRequired'));
      return;
    }

    setLoading(true);
    try {
      const res = await fetch(`/api/org/${orgId}/receive`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          agentName: form.agentName,
          amount: form.amount,
          onDate: form.onDate,
          onCount: form.onCount,
          ampm: form.ampm,
        }),
      });
      const data = await res.json();

      if (!res.ok) {
        setError(data.error || t('balance.saveFailed'));
        return;
      }

      setForm(prev => ({ ...emptyForm, agentName: prev.agentName }));
      await refresh();
    } catch {
      setError(t('common.networkError'));
    } finally {
      setLoading(false);
    }
  }

  return (
    <div className="max-w-6xl mx-auto">
      {/* Header */}
      <div className="flex items-center justify-between mb-6">
        <div>
          <h1 className="text-2xl font-bold text-gray-900">{t('balance.title')}</h1>
          <p className="text-sm text-gray-500 mt-1">{t('balance.subtitle')}</p>
        </div>
        <div>
          <select
            value={selectedAgent}
            onChange={e => setSelectedAgent(e.target.value)}
            className="px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white"
          >
            <option value="">{t('balance.allAgents')}</option>
            {agents.map(a => (
              <option key={a.id} value={a.agentName}>{a.agentName}</option>
            ))}
          </select>
        </div>
      </div>

      {/* Summary cards */}
      <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 mb-6">
        <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
          <p className="text-xs font-medium text-gray-500 mb-1">{t('balance.balanceDue')}</p>
          <p className="text-2xl font-bold text-gray-900">{totalOwed.toLocaleString()}</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
          <p className="text-xs font-medium text-gray-500 mb-1">{t('balance.received')}</p>
          <p className="text-2xl font-bold text-gray-900">{totalReceived.toLocaleString()}</p>
        </div>
        <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
          <p className="text-xs font-medium text-gray-500 mb-1">{t('balance.netBalance')}</p>
          <p className={`text-2xl font-bold ${netBalance > 0 ? 'text-red-600' : 'text-green-600'}`}>
            {netBalance.toLocaleString()}
          </p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Record payment form */}
        <div className="lg:col-span-1">
          <div className="bg-white rounded-xl border border-gray-200 p-5 shadow-sm">
            <h2 className="text-base font-semibold text-gray-800 mb-4">
              {t('balance.recordPayment')}
            </h2>

            <form onSubmit={handleSubmit} className="space-y-3">
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">
                  {t('balance.selectAgent')} *
                </label>
                <select
                  name="agentName"
                  value={form.agentName}
                  onChange={handleChange}
                  required
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                >
                  <option value="">{t('balance.selectAgentOpt')}</option>
                  {agents.map(a => (
                    <option key={a.id} value={a.agentName}>{a.agentName}</option>
                  ))}
                </select>
              </div>

              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">
                  {t('balance.amount')} *
                </label>
                <input
                  name="amount"
                  type="number"
                  step="0.01"
                  min="0"
                  value={form.amount}
                  onChange={handleChange}
                  required
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  placeholder="0.00"
                />
              </div>

              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">
                  {t('balance.date')} *
                </label>
                <input
                  name="onDate"
                  type="date"
                  value={form.onDate}
                  onChange={handleChange}
                  required
                  className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                />
              </div>

              <div className="grid grid-cols-2 gap-2">
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1">
                    {t('balance.sessionOptional')}
                  </label>
                  <input
                    name="onCount"
                    type="number"
                    min="0"
                    value={form.onCount}
                    onChange={handleChange}
                    className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                    placeholder="#"
                  />
                </div>
                <div>
                  <label className="block text-xs font-medium text-gray-600 mb-1">
                    {t('balance.ampmOptional')}
                  </label>
                  <select
                    name="ampm"
                    value={form.ampm}
                    onChange={handleChange}
                    className="w-full px-3 py-2 text-sm border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  >
                    <option value="">—</option>
                    <option value="AM">AM</option>
                    <option value="PM">PM</option>
                  </select>
                </div>
              </div>

              {error && (
                <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2">{error}</p>
              )}

              <button
                type="submit"
                disabled={loading}
                className="w-full bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white text-sm font-medium py-2 px-4 rounded-lg transition"
              >
                {loading ? t('common.saving') : t('balance.submit')}
              </button>
            </form>
          </div>
        </div>

        {/* Tables */}
        <div className="lg:col-span-2 grid grid-cols-1 md:grid-cols-2 gap-6">
          {/* Balance entries */}
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
            <div className="px-5 py-4 border-b border-gray-100">
              <h3 className="text-sm font-semibold text-gray-800">{t('balance.balanceDueTitle')}</h3>
            </div>
            {filteredBalances.length === 0 ? (
              <div className="px-5 py-10 text-center text-gray-400 text-sm">{t('balance.noBalanceEntries')}</div>
            ) : (
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wide">
                    <th className="text-left px-4 py-2 font-medium">{t('balance.dateCol')}</th>
                    <th className="text-right px-4 py-2 font-medium">{t('balance.amountCol')}</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-50">
                  {filteredBalances.map(b => (
                    <tr key={b.id} className="hover:bg-gray-50 transition">
                      <td className="px-4 py-2 text-gray-700">{b.onDate}</td>
                      <td className="px-4 py-2 text-right font-medium text-red-600">
                        {b.amount.toLocaleString()}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </div>

          {/* Receive entries */}
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden">
            <div className="px-5 py-4 border-b border-gray-100">
              <h3 className="text-sm font-semibold text-gray-800">{t('balance.receivedTitle')}</h3>
            </div>
            {filteredReceives.length === 0 ? (
              <div className="px-5 py-10 text-center text-gray-400 text-sm">{t('balance.noReceiptsYet')}</div>
            ) : (
              <table className="w-full text-sm">
                <thead>
                  <tr className="bg-gray-50 text-xs text-gray-500 uppercase tracking-wide">
                    <th className="text-left px-4 py-2 font-medium">{t('balance.dateCol')}</th>
                    <th className="text-right px-4 py-2 font-medium">{t('balance.amountCol')}</th>
                    <th className="text-left px-4 py-2 font-medium">{t('balance.sessionCol')}</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-50">
                  {filteredReceives.map(r => (
                    <tr key={r.id} className="hover:bg-gray-50 transition">
                      <td className="px-4 py-2 text-gray-700">{r.onDate}</td>
                      <td className="px-4 py-2 text-right font-medium text-green-600">
                        {r.amount.toLocaleString()}
                      </td>
                      <td className="px-4 py-2 text-gray-500 text-xs">
                        {r.onCount != null ? `#${r.onCount} ${r.ampm || ''}` : t('common.none')}
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
