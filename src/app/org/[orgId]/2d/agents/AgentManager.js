'use client';
import { useState, useEffect } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import SessionPicker from '../ledger/SessionPicker.js';
import {
  saveLocalAgent,
  saveLocalAgentsBulk,
  getLocalAgents,
  deleteLocalAgent,
  getOfflineMode,
} from '@/lib/ledger/localVoucherDb.js';

const emptyForm = {
  agentName: '',
  address: '',
  phone: '',
  commission: '',
  rate: '',
};

export default function AgentManager({ orgId, initialAgents, activeSession, machines = [] }) {
  const { t } = useI18n();
  const [agents, setAgents] = useState(initialAgents || []);
  const [sessionCommissions, setSessionCommissions] = useState(
    activeSession?.agentCommissions || {}
  );
  const [sessionRates, setSessionRates] = useState(
    activeSession?.agentRates || {}
  );
  const [form, setForm] = useState(emptyForm);
  const [editingId, setEditingId] = useState(null);
  const [search, setSearch] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [isSessionPickerOpen, setIsSessionPickerOpen] = useState(false);
  const [copying, setCopying] = useState(false);
  const [copySuccessMsg, setCopySuccessMsg] = useState('');

  // Sync / load agents with IndexedDB local DB
  useEffect(() => {
    async function initLocalAgents() {
      if (initialAgents && initialAgents.length > 0) {
        setAgents(initialAgents);
        await saveLocalAgentsBulk(orgId, initialAgents);
      } else {
        const localList = await getLocalAgents(orgId);
        if (localList && localList.length > 0) {
          setAgents(localList);
        }
      }
    }
    initLocalAgents();
  }, [orgId, initialAgents]);

  useEffect(() => {
    setSessionCommissions(activeSession?.agentCommissions || {});
    setSessionRates(activeSession?.agentRates || {});
    setCopySuccessMsg('');
  }, [activeSession]);

  async function handleCopyPrevious() {
    if (!activeSession) {
      alert('Please select an active session first.');
      return;
    }
    if (!confirm('Copy all agent commissions and rates from the previous session to this session?')) {
      return;
    }

    setCopying(true);
    setError('');
    setCopySuccessMsg('');

    try {
      const res = await fetch(`/api/org/${orgId}/settings/copy-previous-session`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          targetSessionId: activeSession.id,
          onDate: activeSession.onDate,
          ampm: activeSession.ampm,
        }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || 'Failed to copy previous session rates');
        return;
      }

      setSessionCommissions(data.agentCommissions || {});
      setSessionRates(data.agentRates || {});

      const sourceInfo = data.copiedFrom
        ? `${data.copiedFrom.onDate} (${data.copiedFrom.ampm})`
        : 'previous session';
      setCopySuccessMsg(`✓ Copied commissions & rates from ${sourceInfo}`);
      setTimeout(() => setCopySuccessMsg(''), 6000);
    } catch {
      setError(t('common.networkError'));
    } finally {
      setCopying(false);
    }
  }

  const filtered = agents.filter(a =>
    a.agentName.toLowerCase().includes(search.toLowerCase())
  );

  function handleChange(e) {
    setForm(prev => ({ ...prev, [e.target.name]: e.target.value }));
    setError('');
  }

  function startEdit(agent) {
    setEditingId(agent.id);
    const currCom = sessionCommissions[agent.id] !== undefined && sessionCommissions[agent.id] !== null && sessionCommissions[agent.id] !== ''
      ? sessionCommissions[agent.id]
      : (agent.commission ?? '');

    const currRate = sessionRates[agent.id] !== undefined && sessionRates[agent.id] !== null && sessionRates[agent.id] !== ''
      ? sessionRates[agent.id]
      : (agent.rate ?? 80);

    setForm({
      agentName: agent.agentName,
      address: agent.address || '',
      phone: agent.phone || '',
      commission: currCom,
      rate: currRate,
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

    const isOffline = getOfflineMode(orgId) || (typeof navigator !== 'undefined' && navigator.onLine === false);
    const targetAgentId = editingId || (typeof crypto !== 'undefined' && crypto.randomUUID ? crypto.randomUUID() : `ag_${Date.now()}_${Math.random().toString(36).slice(2, 6)}`);

    let savedAgent = {
      id: targetAgentId,
      agentId: targetAgentId,
      orgId,
      agentName: form.agentName.trim(),
      address: form.address.trim(),
      phone: form.phone.trim(),
      commission: form.commission !== '' ? parseFloat(form.commission) : 0,
      rate: form.rate !== '' ? parseFloat(form.rate) : 80,
      status: 'active',
      updatedAt: Date.now(),
    };

    try {
      if (!isOffline) {
        const url = editingId
          ? `/api/org/${orgId}/agents/${editingId}`
          : `/api/org/${orgId}/agents`;
        const method = editingId ? 'PUT' : 'POST';

        const res = await fetch(url, {
          method,
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            agentName: form.agentName,
            address: form.address,
            phone: form.phone,
            commission: form.commission,
            rate: form.rate,
          }),
        });
        const data = await res.json();

        if (!res.ok) {
          setError(data.error || t('agents.saveFailed'));
          setLoading(false);
          return;
        }

        if (data.agent) {
          savedAgent = { ...savedAgent, ...data.agent, orgId };
        }
      }

      // Always persist to IndexedDB local DB
      await saveLocalAgent(savedAgent);

      // Update local React agent list
      if (editingId) {
        setAgents(prev => prev.map(a => (a.id === editingId || a.agentId === editingId ? savedAgent : a)));
      } else {
        setAgents(prev =>
          [...prev, savedAgent].sort((a, b) => a.agentName.localeCompare(b.agentName))
        );
      }

      // If activeSession exists and online, update session commissions
      if (activeSession && targetAgentId && !isOffline) {
        const newComms = {
          ...sessionCommissions,
          [targetAgentId]: form.commission !== '' ? parseFloat(form.commission) : (savedAgent.commission ?? 0),
        };
        const newRates = {
          ...sessionRates,
          [targetAgentId]: form.rate !== '' ? parseFloat(form.rate) : (savedAgent.rate ?? 80),
        };

        try {
          await fetch(`/api/org/${orgId}/settings/session-commissions`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
              updates: [
                {
                  sessionId: activeSession.id,
                  agentCommissions: newComms,
                  agentRates: newRates,
                },
              ],
            }),
          });
          setSessionCommissions(newComms);
          setSessionRates(newRates);
        } catch {
          // Keep agent saved even if session update failed
        }
      }

      cancelEdit();
    } catch (err) {
      // Fallback: save to local IndexedDB even if network failed
      console.warn('Network error while saving agent, saving locally:', err);
      await saveLocalAgent(savedAgent);
      if (editingId) {
        setAgents(prev => prev.map(a => (a.id === editingId || a.agentId === editingId ? savedAgent : a)));
      } else {
        setAgents(prev =>
          [...prev, savedAgent].sort((a, b) => a.agentName.localeCompare(b.agentName))
        );
      }
      cancelEdit();
    } finally {
      setLoading(false);
    }
  }

  async function handleDelete(agentId, agentName) {
    if (!confirm(t('agents.deleteConfirm', { name: agentName }))) return;
    try {
      await deleteLocalAgent(orgId, agentId);
      setAgents(prev => prev.filter(a => a.id !== agentId && a.agentId !== agentId));
      if (editingId === agentId) cancelEdit();

      if (!getOfflineMode(orgId) && (typeof navigator === 'undefined' || navigator.onLine !== false)) {
        await fetch(`/api/org/${orgId}/agents/${agentId}`, { method: 'DELETE' }).catch(() => {});
      }
    } catch {
      alert(t('agents.deleteFailed'));
    }
  }

  return (
    <div className="max-w-6xl mx-auto space-y-5">
      {/* Session Top Navigation Bar */}
      <div className="bg-white dark:bg-slate-900 rounded-xl border border-gray-200 dark:border-slate-800 shadow-sm px-4 py-2.5 flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-3">
          {activeSession ? (
            <div className="flex flex-wrap items-center gap-3 text-sm font-medium text-gray-900 dark:text-slate-100">
              <span className="bg-emerald-100 dark:bg-emerald-950 text-emerald-800 dark:text-emerald-300 font-bold px-2.5 py-0.5 rounded-full text-xs">
                {activeSession.ampm || '12:00'}
              </span>
              <span className="text-gray-400">•</span>
              <span className="font-semibold text-slate-800 dark:text-slate-200">
                {activeSession.onDate}
              </span>
              <span className="text-gray-400">•</span>
              <span className="text-gray-500 font-medium">
                Machine {activeSession.machineId || 1}
              </span>
              <button
                type="button"
                onClick={() => setIsSessionPickerOpen(true)}
                className="text-xs text-indigo-600 dark:text-indigo-400 hover:text-indigo-800 font-bold px-2 py-0.5 rounded hover:bg-indigo-50 dark:hover:bg-indigo-950/60 transition cursor-pointer"
              >
                Change
              </button>
              <button
                type="button"
                onClick={handleCopyPrevious}
                disabled={copying}
                className="inline-flex items-center gap-1.5 px-3 py-1 text-xs font-bold text-indigo-700 dark:text-indigo-300 bg-indigo-50 dark:bg-indigo-950/70 hover:bg-indigo-100 dark:hover:bg-indigo-900/60 border border-indigo-200 dark:border-indigo-800 rounded-lg shadow-xs transition cursor-pointer disabled:opacity-50"
                title="Copy commissions and rates from previous session"
              >
                <span>📋</span>
                <span>{copying ? 'Copying...' : 'Copy From Previous Session'}</span>
              </button>
            </div>
          ) : (
            <div className="flex items-center gap-3">
              <p className="text-sm text-amber-600 font-medium">No Active Session Selected</p>
              <button
                type="button"
                onClick={() => setIsSessionPickerOpen(true)}
                className="text-xs bg-indigo-600 hover:bg-indigo-700 text-white font-medium px-2.5 py-1 rounded-lg transition cursor-pointer shadow-xs"
              >
                Pick Session
              </button>
            </div>
          )}
        </div>

        {activeSession && (
          <div className="text-xs text-slate-500 font-medium">
            Active Session: <span className="font-bold text-slate-800 dark:text-slate-200">{activeSession.ampm} ({activeSession.onDate})</span>
          </div>
        )}
      </div>

      {/* Copy Success Alert */}
      {copySuccessMsg && (
        <div className="p-3 bg-emerald-50 dark:bg-emerald-950/50 border border-emerald-200 dark:border-emerald-800 text-emerald-800 dark:text-emerald-200 rounded-xl text-xs font-semibold flex items-center justify-between shadow-xs">
          <span>{copySuccessMsg}</span>
          <button
            type="button"
            onClick={() => setCopySuccessMsg('')}
            className="text-emerald-600 hover:text-emerald-800 dark:text-emerald-400 font-bold px-1.5 py-0.5 rounded cursor-pointer"
          >
            ✕
          </button>
        </div>
      )}

      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-bold text-gray-900 dark:text-slate-100">{t('agents.title')}</h1>
          <p className="text-sm text-gray-500 dark:text-slate-400 mt-1">
            {t('agents.subtitleCount', { count: agents.length })}
          </p>
        </div>
      </div>

      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Form panel */}
        <div className="lg:col-span-1">
          <div className="bg-white dark:bg-slate-900 rounded-xl border border-gray-200 dark:border-slate-800 p-5 shadow-sm space-y-4">
            <h2 className="text-base font-semibold text-gray-800 dark:text-slate-100">
              {editingId ? t('agents.editAgent') : t('agents.newAgent')}
            </h2>

            <form onSubmit={handleSubmit} className="space-y-3">
              <div>
                <label className="block text-xs font-medium text-gray-600 dark:text-slate-300 mb-1">
                  {t('agents.agentName')} *
                </label>
                <input
                  name="agentName"
                  value={form.agentName}
                  onChange={handleChange}
                  required
                  className="w-full px-3 py-2 text-sm border border-gray-300 dark:border-slate-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white dark:bg-slate-800 text-gray-900 dark:text-slate-100"
                  placeholder={t('agents.namePlaceholder')}
                />
              </div>

              <div>
                <label className="block text-xs font-medium text-gray-600 dark:text-slate-300 mb-1">
                  {t('agents.address')}
                </label>
                <input
                  name="address"
                  value={form.address}
                  onChange={handleChange}
                  className="w-full px-3 py-2 text-sm border border-gray-300 dark:border-slate-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white dark:bg-slate-800 text-gray-900 dark:text-slate-100"
                  placeholder={t('agents.addressPlaceholder')}
                />
              </div>

              <div>
                <label className="block text-xs font-medium text-gray-600 dark:text-slate-300 mb-1">
                  {t('agents.phone')}
                </label>
                <input
                  name="phone"
                  value={form.phone}
                  onChange={handleChange}
                  className="w-full px-3 py-2 text-sm border border-gray-300 dark:border-slate-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white dark:bg-slate-800 text-gray-900 dark:text-slate-100"
                  placeholder={t('agents.phonePlaceholder')}
                />
              </div>

              {/* Commission & Rate Fields for Current Session */}
              <div className="grid grid-cols-2 gap-2">
                <div>
                  <label className="block text-xs font-medium text-gray-600 dark:text-slate-300 mb-1">
                    {t('agents.commission')} (%)
                  </label>
                  <input
                    name="commission"
                    type="number"
                    step="0.01"
                    min="0"
                    max="100"
                    value={form.commission}
                    onChange={handleChange}
                    className="w-full px-3 py-2 text-sm border border-gray-300 dark:border-slate-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white dark:bg-slate-800 text-gray-900 dark:text-slate-100 font-mono"
                    placeholder="0.00"
                  />
                </div>

                <div>
                  <label className="block text-xs font-medium text-gray-600 dark:text-slate-300 mb-1">
                    {t('agents.rate')}
                  </label>
                  <input
                    name="rate"
                    type="number"
                    step="0.01"
                    min="0"
                    value={form.rate}
                    onChange={handleChange}
                    className="w-full px-3 py-2 text-sm border border-gray-300 dark:border-slate-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-white dark:bg-slate-800 text-gray-900 dark:text-slate-100 font-mono"
                    placeholder="80"
                  />
                </div>
              </div>

              {error && (
                <p className="text-sm text-red-600 bg-red-50 dark:bg-red-950/50 rounded-lg px-3 py-2">{error}</p>
              )}

              <div className="flex gap-2 pt-2">
                <button
                  type="submit"
                  disabled={loading}
                  className="flex-1 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-60 text-white text-sm font-medium py-2 px-4 rounded-lg transition shadow-sm cursor-pointer"
                >
                  {loading ? t('common.saving') : editingId ? t('agents.update') : t('agents.addAgent')}
                </button>
                {editingId && (
                  <button
                    type="button"
                    onClick={cancelEdit}
                    className="px-4 py-2 text-sm border border-gray-300 dark:border-slate-700 rounded-lg hover:bg-gray-50 dark:hover:bg-slate-800 text-gray-700 dark:text-slate-200 transition cursor-pointer"
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
          <div className="bg-white dark:bg-slate-900 rounded-xl border border-gray-200 dark:border-slate-800 shadow-sm overflow-hidden">
            <div className="px-5 py-4 border-b border-gray-100 dark:border-slate-800">
              <input
                type="text"
                value={search}
                onChange={e => setSearch(e.target.value)}
                placeholder={t('agents.searchPlaceholder')}
                className="w-full px-3 py-2 text-sm border border-gray-200 dark:border-slate-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 bg-gray-50 dark:bg-slate-800 text-gray-900 dark:text-slate-100"
              />
            </div>

            {filtered.length === 0 ? (
              <div className="px-5 py-10 text-center text-gray-400 text-sm">
                {search ? t('agents.noMatch') : t('agents.noneYet')}
              </div>
            ) : (
              <div className="overflow-x-auto">
                <table className="w-full text-sm">
                  <thead>
                    <tr className="bg-gray-50 dark:bg-slate-800/60 text-xs text-gray-500 dark:text-slate-400 uppercase tracking-wide border-b border-gray-100 dark:border-slate-800">
                      <th className="text-left px-5 py-3 font-medium">{t('agents.nameCol')}</th>
                      <th className="text-left px-4 py-3 font-medium">{t('agents.phoneCol')}</th>
                      <th className="text-right px-4 py-3 font-medium">{t('agents.commissionCol')}</th>
                      <th className="text-right px-4 py-3 font-medium">{t('agents.rateCol')}</th>
                      <th className="px-4 py-3"></th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100 dark:divide-slate-800 font-mono text-xs">
                    {filtered.map(agent => {
                      const comVal = (sessionCommissions[agent.id] !== undefined && sessionCommissions[agent.id] !== null && sessionCommissions[agent.id] !== '')
                        ? sessionCommissions[agent.id]
                        : agent.commission;

                      const rateVal = (sessionRates[agent.id] !== undefined && sessionRates[agent.id] !== null && sessionRates[agent.id] !== '')
                        ? sessionRates[agent.id]
                        : (agent.rate || 80);

                      return (
                        <tr
                          key={agent.id}
                          className={`hover:bg-gray-50/80 dark:hover:bg-slate-800/40 transition ${
                            editingId === agent.id ? 'bg-indigo-50/70 dark:bg-indigo-950/40' : ''
                          }`}
                        >
                          <td className="px-5 py-3 font-sans">
                            <p className="font-semibold text-gray-900 dark:text-slate-100">{agent.agentName}</p>
                            {agent.address && (
                              <p className="text-xs text-gray-400 mt-0.5 truncate max-w-[160px] font-normal">{agent.address}</p>
                            )}
                          </td>
                          <td className="px-4 py-3 text-gray-600 dark:text-slate-400 font-sans">
                            {agent.phone || t('common.none')}
                          </td>
                          <td className="px-4 py-3 text-right text-gray-800 dark:text-slate-200 font-bold">
                            {comVal !== undefined && comVal !== null && comVal !== '' ? `${comVal}%` : t('common.none')}
                          </td>
                          <td className="px-4 py-3 text-right text-gray-800 dark:text-slate-200 font-bold">
                            {rateVal}
                          </td>
                          <td className="px-4 py-3 font-sans">
                            <div className="flex gap-2 justify-end">
                              <button
                                onClick={() => startEdit(agent)}
                                className="text-xs text-indigo-600 dark:text-indigo-400 hover:text-indigo-800 font-medium px-2 py-1 rounded hover:bg-indigo-50 dark:hover:bg-indigo-950/50 transition cursor-pointer"
                              >
                                {t('common.edit')}
                              </button>
                              <button
                                onClick={() => handleDelete(agent.id, agent.agentName)}
                                className="text-xs text-red-500 hover:text-red-700 font-medium px-2 py-1 rounded hover:bg-red-50 dark:hover:bg-red-950/50 transition cursor-pointer"
                              >
                                {t('common.delete')}
                              </button>
                            </div>
                          </td>
                        </tr>
                      );
                    })}
                  </tbody>
                </table>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Session Picker Modal */}
      {isSessionPickerOpen && (
        <SessionPicker
          orgId={orgId}
          activeSession={activeSession}
          machines={machines}
          onClose={() => setIsSessionPickerOpen(false)}
        />
      )}
    </div>
  );
}
