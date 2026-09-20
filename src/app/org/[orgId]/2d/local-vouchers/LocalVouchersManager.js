'use client';

import { useState, useEffect, useMemo, useCallback } from 'react';
import { useI18n } from '@/lib/i18n/index.js';
import {
  getLocalVouchers,
  pruneSyncedLocalVouchers,
  getLocalAgents,
  saveLocalAgentsBulk,
} from '@/lib/ledger/localVoucherDb.js';
import {
  retryVoucher,
  retryAllPendingOrFailed,
  onQueueEvent,
  startAutoDrain,
} from '@/lib/ledger/voucherQueue.js';
export default function LocalVouchersManager({ orgId, agents, initialAgents, activeSession, onClose }) {
  const { t } = useI18n();
  const [vouchers, setVouchers] = useState([]);
  const effectiveInitial = (initialAgents && initialAgents.length > 0) ? initialAgents : (agents && agents.length > 0) ? agents : [];
  const [agentsList, setAgentsList] = useState(effectiveInitial);
  const [loading, setLoading] = useState(true);
  const [activeTab, setActiveTab] = useState('all'); // 'all' | 'pending' | 'failed' | 'synced'
  const [searchQuery, setSearchQuery] = useState('');
  const [retryingId, setRetryingId] = useState(null);
  const [retryingAll, setRetryingAll] = useState(false);
  const [selectedVoucher, setSelectedVoucher] = useState(null);
  const [notification, setNotification] = useState(null);
  const [isOnline, setIsOnline] = useState(true);

  // Load agents from props or IndexedDB local DB
  useEffect(() => {
    async function loadAgents() {
      if (effectiveInitial && effectiveInitial.length > 0) {
        setAgentsList(effectiveInitial);
        await saveLocalAgentsBulk(orgId, effectiveInitial);
      } else {
        // Read from IndexedDB first
        const local = await getLocalAgents(orgId);
        if (local && local.length > 0) {
          setAgentsList(local);
        }
      }

      // Fetch from API to ensure up to date
      try {
        const res = await fetch(`/api/org/${orgId}/agents`);
        if (res.ok) {
          const data = await res.json();
          if (data.agents && Array.isArray(data.agents) && data.agents.length > 0) {
            setAgentsList(data.agents);
            await saveLocalAgentsBulk(orgId, data.agents);
          }
        }
      } catch {}
    }
    loadAgents();

    const handleAgentsUpdate = (e) => {
      if (e.detail?.orgId === orgId) {
        getLocalAgents(orgId).then((list) => {
          if (list && list.length > 0) setAgentsList(list);
        });
      }
    };
    window.addEventListener('local_agents_updated', handleAgentsUpdate);
    return () => window.removeEventListener('local_agents_updated', handleAgentsUpdate);
  }, [orgId, initialAgents, agents]);

  const agentMap = useMemo(() => {
    const map = new Map();
    map.set('buy_offload', 'Buy Offload');
    for (const a of agentsList) {
      if (!a) continue;
      const name = a.agentName || a.name || a.agent_name || '';
      if (!name) continue;
      if (a.id) map.set(String(a.id), name);
      if (a.agentId) map.set(String(a.agentId), name);
      if (a._id) map.set(String(a._id), name);
    }
    return map;
  }, [agentsList]);

  const loadVouchers = useCallback(async () => {
    try {
      const list = await getLocalVouchers(orgId);
      setVouchers(list);
    } catch (err) {
      console.error('Failed to load local vouchers:', err);
    } finally {
      setLoading(false);
    }
  }, [orgId]);

  useEffect(() => {
    loadVouchers();
    const stopDrain = startAutoDrain(orgId);

    const unsub = onQueueEvent((event) => {
      if (event.orgId === orgId) {
        loadVouchers();
      }
    });

    const handleOnline = () => setIsOnline(true);
    const handleOffline = () => setIsOnline(false);

    if (typeof window !== 'undefined') {
      setIsOnline(navigator.onLine !== false);
      window.addEventListener('online', handleOnline);
      window.addEventListener('offline', handleOffline);
    }

    return () => {
      stopDrain();
      unsub();
      if (typeof window !== 'undefined') {
        window.removeEventListener('online', handleOnline);
        window.removeEventListener('offline', handleOffline);
      }
    };
  }, [orgId, loadVouchers]);

  const counts = useMemo(() => {
    let pending = 0;
    let failed = 0;
    let synced = 0;
    for (const v of vouchers) {
      if (v.status === 'pending' || v.status === 'syncing') pending++;
      else if (v.status === 'failed') failed++;
      else if (v.status === 'synced') synced++;
    }
    return { all: vouchers.length, pending, failed, synced };
  }, [vouchers]);

  const filteredVouchers = useMemo(() => {
    let list = vouchers;
    if (activeTab === 'pending') {
      list = list.filter(v => v.status === 'pending' || v.status === 'syncing');
    } else if (activeTab === 'failed') {
      list = list.filter(v => v.status === 'failed');
    } else if (activeTab === 'synced') {
      list = list.filter(v => v.status === 'synced');
    }

    if (searchQuery.trim()) {
      const q = searchQuery.toLowerCase().trim();
      list = list.filter(v => {
        const agentName = (agentMap.get(v.agentId) || v.agentId || '').toLowerCase();
        const tokensStr = (v.tokens || []).join(' ').toLowerCase();
        const id = (v.id || '').toLowerCase();
        const srNo = String(v.srNo || '');
        return agentName.includes(q) || tokensStr.includes(q) || id.includes(q) || srNo.includes(q);
      });
    }

    return list;
  }, [vouchers, activeTab, searchQuery, agentMap]);

  async function handleRetryOne(voucher) {
    setRetryingId(voucher.id);
    try {
      await retryVoucher(orgId, voucher.id);
      await loadVouchers();
      showNotification('success', t('localVouchers.retryStarted', { count: 1 }));
    } catch (err) {
      showNotification('error', err.message || 'Retry failed');
    } finally {
      setRetryingId(null);
    }
  }

  async function handleRetryAll() {
    setRetryingAll(true);
    try {
      const targetCount = counts.pending + counts.failed;
      await retryAllPendingOrFailed(orgId);
      await loadVouchers();
      showNotification('success', t('localVouchers.retryStarted', { count: targetCount }));
    } catch (err) {
      showNotification('error', err.message || 'Retry failed');
    } finally {
      setRetryingAll(false);
    }
  }

  async function handlePruneSynced() {
    if (!window.confirm(t('localVouchers.clearSyncedConfirm'))) return;
    try {
      const removed = await pruneSyncedLocalVouchers(orgId, 3);
      await loadVouchers();
      showNotification('success', t('localVouchers.prunedCount', { count: removed }));
    } catch (err) {
      showNotification('error', err.message || 'Prune failed');
    }
  }

  function showNotification(type, message) {
    setNotification({ type, message });
    setTimeout(() => setNotification(null), 4000);
  }

  function calculateVoucherTotal(tokens = []) {
    let total = 0;
    for (const token of tokens) {
      try {
        const { entries } = parseNumberExpression(token, { maxEntries: MAX_ENTRIES });
        if (entries) {
          total += entries.reduce((sum, e) => sum + (e.amount || 0), 0);
        }
      } catch {
        // ignore parsing error
      }
    }
    return total;
  }

  function getParsedEntries(tokens = []) {
    const list = [];
    for (const token of tokens) {
      try {
        const { entries } = parseNumberExpression(token, { maxEntries: MAX_ENTRIES });
        if (entries) {
          list.push(...entries);
        }
      } catch {
        // ignore
      }
    }
    return list;
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4 bg-white dark:bg-slate-900 p-5 rounded-2xl border border-gray-200 dark:border-slate-800 shadow-sm">
        <div>
          <div className="flex items-center gap-3">
            <h1 className="text-xl font-bold text-gray-900 dark:text-slate-100">
              {t('localVouchers.title')}
            </h1>
            <span
              className={`inline-flex items-center gap-1.5 px-2.5 py-0.5 rounded-full text-xs font-semibold ${
                isOnline
                  ? 'bg-emerald-50 text-emerald-700 dark:bg-emerald-950/60 dark:text-emerald-300 border border-emerald-200 dark:border-emerald-800'
                  : 'bg-red-50 text-red-700 dark:bg-red-950/60 dark:text-red-300 border border-red-200 dark:border-red-800 animate-pulse'
              }`}
            >
              <span className={`w-2 h-2 rounded-full ${isOnline ? 'bg-emerald-500' : 'bg-red-500'}`} />
              {isOnline ? t('localVouchers.networkOnline') : t('localVouchers.networkOffline')}
            </span>
          </div>
          <p className="text-sm text-gray-500 dark:text-slate-400 mt-1">
            {t('localVouchers.subtitle')}
          </p>
        </div>

        {/* Top Action Buttons */}
        <div className="flex flex-wrap items-center gap-2.5">
          <button
            type="button"
            onClick={loadVouchers}
            className="px-3.5 py-2 text-sm font-medium bg-gray-100 dark:bg-slate-800 text-gray-700 dark:text-slate-200 hover:bg-gray-200 dark:hover:bg-slate-700 rounded-xl transition flex items-center gap-1.5"
          >
            <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
            Refresh
          </button>

          {(counts.pending > 0 || counts.failed > 0) && (
            <button
              type="button"
              onClick={handleRetryAll}
              disabled={retryingAll || !isOnline}
              className="px-4 py-2 text-sm font-semibold bg-brand-600 hover:bg-brand-700 disabled:opacity-50 text-white rounded-xl transition shadow-sm flex items-center gap-2"
            >
              {retryingAll ? (
                <>
                  <svg className="animate-spin w-4 h-4" fill="none" viewBox="0 0 24 24">
                    <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                    <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z" />
                  </svg>
                  {t('localVouchers.retrying')}
                </>
              ) : (
                <>
                  <svg className="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12" />
                  </svg>
                  {t('localVouchers.retryAll')} ({counts.pending + counts.failed})
                </>
              )}
            </button>
          )}

          {counts.synced > 0 && (
            <button
              type="button"
              onClick={handlePruneSynced}
              className="px-3 py-2 text-xs font-medium text-gray-500 dark:text-slate-400 hover:text-red-600 dark:hover:text-red-400 border border-gray-200 dark:border-slate-800 rounded-xl transition"
            >
              {t('localVouchers.clearSynced')}
            </button>
          )}

          {onClose && (
            <button
              type="button"
              onClick={onClose}
              className="px-3.5 py-2 text-sm font-semibold bg-gray-200 dark:bg-slate-700 text-gray-700 dark:text-slate-200 hover:bg-gray-300 dark:hover:bg-slate-600 rounded-xl transition"
            >
              ✕ Close
            </button>
          )}
        </div>
      </div>

      {/* Notification toast */}
      {notification && (
        <div
          className={`p-4 rounded-xl border flex items-center justify-between text-sm font-medium ${
            notification.type === 'error'
              ? 'bg-red-50 border-red-200 text-red-700 dark:bg-red-950/50 dark:border-red-900/50 dark:text-red-300'
              : 'bg-emerald-50 border-emerald-200 text-emerald-700 dark:bg-emerald-950/50 dark:border-emerald-900/50 dark:text-emerald-300'
          }`}
        >
          <span>{notification.message}</span>
          <button type="button" onClick={() => setNotification(null)} className="text-xs opacity-75 hover:opacity-100">
            ✕
          </button>
        </div>
      )}

      {/* Filter Tabs & Search */}
      <div className="flex flex-col sm:flex-row items-stretch sm:items-center justify-between gap-3">
        <div className="flex flex-wrap items-center gap-1.5 p-1 bg-gray-100 dark:bg-slate-800/80 rounded-xl">
          <button
            type="button"
            onClick={() => setActiveTab('all')}
            className={`px-3 py-1.5 text-xs sm:text-sm font-semibold rounded-lg transition ${
              activeTab === 'all'
                ? 'bg-white dark:bg-slate-900 text-gray-900 dark:text-slate-100 shadow-sm'
                : 'text-gray-600 dark:text-slate-400 hover:text-gray-900 dark:hover:text-slate-200'
            }`}
          >
            {t('localVouchers.allTab', { count: counts.all })}
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('pending')}
            className={`px-3 py-1.5 text-xs sm:text-sm font-semibold rounded-lg transition ${
              activeTab === 'pending'
                ? 'bg-white dark:bg-slate-900 text-amber-600 dark:text-amber-400 shadow-sm'
                : 'text-gray-600 dark:text-slate-400 hover:text-amber-600'
            }`}
          >
            {t('localVouchers.pendingTab', { count: counts.pending })}
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('failed')}
            className={`px-3 py-1.5 text-xs sm:text-sm font-semibold rounded-lg transition ${
              activeTab === 'failed'
                ? 'bg-white dark:bg-slate-900 text-red-600 dark:text-red-400 shadow-sm'
                : 'text-gray-600 dark:text-slate-400 hover:text-red-600'
            }`}
          >
            {t('localVouchers.failedTab', { count: counts.failed })}
          </button>
          <button
            type="button"
            onClick={() => setActiveTab('synced')}
            className={`px-3 py-1.5 text-xs sm:text-sm font-semibold rounded-lg transition ${
              activeTab === 'synced'
                ? 'bg-white dark:bg-slate-900 text-emerald-600 dark:text-emerald-400 shadow-sm'
                : 'text-gray-600 dark:text-slate-400 hover:text-emerald-600'
            }`}
          >
            {t('localVouchers.syncedTab', { count: counts.synced })}
          </button>
        </div>

        <div className="relative">
          <input
            type="text"
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            placeholder="Search agent, tokens, Sr No…"
            className="w-full sm:w-64 pl-9 pr-3 py-1.5 text-sm bg-white dark:bg-slate-900 border border-gray-200 dark:border-slate-800 rounded-xl focus:outline-none focus:ring-2 focus:ring-brand-500"
          />
          <svg className="w-4 h-4 text-gray-400 absolute left-3 top-2.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </div>
      </div>

      {/* Vouchers Table */}
      <div className="bg-white dark:bg-slate-900 rounded-2xl border border-gray-200 dark:border-slate-800 overflow-hidden shadow-sm">
        <div className="overflow-x-auto">
          <table className="w-full text-left text-sm">
            <thead className="bg-gray-50 dark:bg-slate-800/50 text-xs font-semibold text-gray-500 dark:text-slate-400 uppercase tracking-wider border-b border-gray-100 dark:border-slate-800">
              <tr>
                <th className="py-3 px-4">{t('localVouchers.statusCol')}</th>
                <th className="py-3 px-4">{t('localVouchers.actionTypeCol')}</th>
                <th className="py-3 px-4">{t('localVouchers.timeCol')}</th>
                <th className="py-3 px-4">{t('localVouchers.sessionCol')}</th>
                <th className="py-3 px-4">{t('localVouchers.agentCol')}</th>
                <th className="py-3 px-4">{t('localVouchers.tokensCol')}</th>
                <th className="py-3 px-4">{t('localVouchers.srNoCol')}</th>
                <th className="py-3 px-4">{t('localVouchers.errorCol')}</th>
                <th className="py-3 px-4 text-right">{t('localVouchers.actionsCol')}</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-gray-100 dark:divide-slate-800">
              {loading ? (
                <tr>
                  <td colSpan={9} className="py-8 text-center text-gray-400 dark:text-slate-500">
                    Loading vouchers…
                  </td>
                </tr>
              ) : filteredVouchers.length === 0 ? (
                <tr>
                  <td colSpan={9} className="py-12 text-center text-gray-400 dark:text-slate-500">
                    <div className="space-y-2">
                      <p className="text-2xl">📦</p>
                      <p>{t('localVouchers.noVouchers')}</p>
                    </div>
                  </td>
                </tr>
              ) : (
                filteredVouchers.map((v) => {
                  const agentName = (v.agentId === 'buy_offload' || v.isBuyVoucher)
                    ? 'Buy Offload'
                    : (agentMap.get(String(v.agentId)) || agentMap.get(String(v.id)) || (v.agentName && v.agentName !== v.agentId ? v.agentName : null) || '—');
                  const totalAmt = calculateVoucherTotal(v.tokens);
                  const isPending = v.status === 'pending';
                  const isSyncing = v.status === 'syncing';
                  const isFailed = v.status === 'failed';
                  const isSynced = v.status === 'synced';
                  const actionType = v.action || 'create';
                  const isBuy = v.voucherType === 'buy' || v.isBuyVoucher;

                  return (
                    <tr
                      key={v.id}
                      className="hover:bg-gray-50/75 dark:hover:bg-slate-800/50 transition-colors"
                    >
                      {/* Status */}
                      <td className="py-3 px-4 whitespace-nowrap">
                        {isSynced && (
                          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-emerald-50 text-emerald-700 dark:bg-emerald-950/60 dark:text-emerald-300 border border-emerald-200 dark:border-emerald-800">
                            <span className="w-1.5 h-1.5 rounded-full bg-emerald-500" />
                            Synced
                          </span>
                        )}
                        {isPending && (
                          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-amber-50 text-amber-700 dark:bg-amber-950/60 dark:text-amber-300 border border-amber-200 dark:border-amber-800">
                            <span className="w-1.5 h-1.5 rounded-full bg-amber-500 animate-pulse" />
                            Pending
                          </span>
                        )}
                        {isSyncing && (
                          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-blue-50 text-blue-700 dark:bg-blue-950/60 dark:text-blue-300 border border-blue-200 dark:border-blue-800">
                            <svg className="animate-spin w-3 h-3 text-blue-500" fill="none" viewBox="0 0 24 24">
                              <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4" />
                              <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8H4z" />
                            </svg>
                            Syncing…
                          </span>
                        )}
                        {isFailed && (
                          <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-red-50 text-red-700 dark:bg-red-950/60 dark:text-red-300 border border-red-200 dark:border-red-800">
                            <span className="w-1.5 h-1.5 rounded-full bg-red-500" />
                            Failed
                          </span>
                        )}
                      </td>

                      {/* Operation / Action */}
                      <td className="py-3 px-4 whitespace-nowrap text-xs">
                        {actionType === 'update' ? (
                          <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-md font-semibold bg-indigo-50 text-indigo-700 dark:bg-indigo-950/60 dark:text-indigo-300 border border-indigo-200 dark:border-indigo-800">
                            ✏️ {t('localVouchers.actionUpdate')} {v.srNo ? `#${v.srNo}` : ''}
                            <span className="text-[10px] opacity-75 font-normal">({isBuy ? t('localVouchers.typeBuy') : t('localVouchers.typeSale')})</span>
                          </span>
                        ) : actionType === 'delete' ? (
                          <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-md font-semibold bg-rose-50 text-rose-700 dark:bg-rose-950/60 dark:text-rose-300 border border-rose-200 dark:border-rose-800">
                            🗑️ {t('localVouchers.actionDelete')} {v.srNo ? `#${v.srNo}` : ''}
                          </span>
                        ) : (
                          <span className="inline-flex items-center gap-1 px-2 py-0.5 rounded-md font-semibold bg-sky-50 text-sky-700 dark:bg-sky-950/60 dark:text-sky-300 border border-sky-200 dark:border-sky-800">
                            ➕ {t('localVouchers.actionCreate')}
                            <span className="text-[10px] opacity-75 font-normal">({isBuy ? t('localVouchers.typeBuy') : t('localVouchers.typeSale')})</span>
                          </span>
                        )}
                      </td>

                      {/* Time */}
                      <td className="py-3 px-4 whitespace-nowrap text-xs text-gray-500 dark:text-slate-400">
                        {v.createdAt ? new Date(v.createdAt).toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit' }) : '—'}
                        <div className="text-[10px] text-gray-400">
                          {v.createdAt ? new Date(v.createdAt).toLocaleDateString() : ''}
                        </div>
                      </td>

                      {/* Session */}
                      <td className="py-3 px-4 whitespace-nowrap text-xs text-gray-700 dark:text-slate-300">
                        <span className="font-medium">{v.onDate || '—'}</span>
                        <div className="text-[10px] text-gray-400 uppercase">
                          {v.ampm || ''} #{v.onCount || 1}
                        </div>
                      </td>

                      {/* Agent */}
                      <td className="py-3 px-4 whitespace-nowrap font-medium text-gray-900 dark:text-slate-100">
                        {agentName}
                      </td>

                      {/* Tokens & Total */}
                      <td className="py-3 px-4 max-w-xs">
                        <div className="truncate font-mono text-xs text-gray-700 dark:text-slate-300">
                          {(v.tokens || []).join(', ')}
                        </div>
                        <div className="text-xs font-semibold text-brand-600 dark:text-brand-400">
                          Total: {totalAmt.toLocaleString()}
                        </div>
                      </td>

                      {/* Server Sr No */}
                      <td className="py-3 px-4 whitespace-nowrap text-xs font-semibold text-gray-800 dark:text-slate-200">
                        {v.srNo ? `#${v.srNo}` : <span className="text-gray-400 font-normal">—</span>}
                      </td>

                      {/* Error */}
                      <td className="py-3 px-4 text-xs max-w-xs text-red-600 dark:text-red-400">
                        {v.error ? (
                          <span className="truncate block" title={v.error}>
                            {v.error}
                          </span>
                        ) : (
                          <span className="text-gray-400 font-normal">—</span>
                        )}
                      </td>

                      {/* Actions */}
                      <td className="py-3 px-4 text-right whitespace-nowrap space-x-2">
                        {(isFailed || isPending) && (
                          <button
                            type="button"
                            onClick={() => handleRetryOne(v)}
                            disabled={retryingId === v.id || !isOnline}
                            className="px-2.5 py-1 text-xs font-semibold bg-brand-50 text-brand-700 hover:bg-brand-100 dark:bg-brand-950/60 dark:text-brand-300 dark:hover:bg-brand-900/60 border border-brand-200 dark:border-brand-800 rounded-lg transition disabled:opacity-50"
                          >
                            {retryingId === v.id ? t('localVouchers.retrying') : t('localVouchers.retryBtn')}
                          </button>
                        )}
                        <button
                          type="button"
                          onClick={() => setSelectedVoucher(v)}
                          className="px-2.5 py-1 text-xs font-semibold bg-gray-100 dark:bg-slate-800 text-gray-700 dark:text-slate-300 hover:bg-gray-200 dark:hover:bg-slate-700 rounded-lg transition"
                        >
                          Details
                        </button>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>

      {/* Voucher Detail Modal */}
      {selectedVoucher && (
        <div className="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white dark:bg-slate-900 rounded-2xl shadow-2xl max-w-xl w-full p-6 border border-gray-200 dark:border-slate-800 space-y-5 max-h-[90vh] overflow-y-auto">
            <div className="flex items-center justify-between border-b border-gray-100 dark:border-slate-800 pb-3">
              <div>
                <h3 className="text-lg font-bold text-gray-900 dark:text-slate-100">
                  {t('localVouchers.detailsTitle')}
                </h3>
                <p className="text-xs font-mono text-gray-400 mt-0.5">
                  ID: {selectedVoucher.id}
                </p>
              </div>
              <button
                type="button"
                onClick={() => setSelectedVoucher(null)}
                className="p-1.5 text-gray-400 hover:text-gray-600 dark:hover:text-slate-200 rounded-lg"
              >
                ✕
              </button>
            </div>

            {/* Metadata Grid */}
            <div className="grid grid-cols-2 gap-3 bg-gray-50 dark:bg-slate-800/60 p-3.5 rounded-xl text-xs">
              <div>
                <span className="text-gray-400 block">{t('localVouchers.actionTypeCol')}</span>
                <span className="font-semibold text-gray-800 dark:text-slate-200 capitalize flex items-center gap-1.5">
                  {selectedVoucher.action === 'update' ? `✏️ ${t('localVouchers.actionUpdate')}` : selectedVoucher.action === 'delete' ? `🗑️ ${t('localVouchers.actionDelete')}` : `➕ ${t('localVouchers.actionCreate')}`}
                  <span className="text-[10px] px-1.5 py-0.5 rounded bg-gray-200 dark:bg-slate-700 text-gray-700 dark:text-slate-300">
                    {selectedVoucher.voucherType === 'buy' || selectedVoucher.isBuyVoucher ? t('localVouchers.typeBuy') : t('localVouchers.typeSale')}
                  </span>
                </span>
              </div>
              <div>
                <span className="text-gray-400 block">Agent</span>
                <span className="font-semibold text-gray-800 dark:text-slate-200">
                  {(selectedVoucher.agentId === 'buy_offload' || selectedVoucher.isBuyVoucher)
                    ? 'Buy Offload'
                    : (agentMap.get(String(selectedVoucher.agentId)) || agentMap.get(String(selectedVoucher.id)) || (selectedVoucher.agentName && selectedVoucher.agentName !== selectedVoucher.agentId ? selectedVoucher.agentName : null) || '—')}
                </span>
              </div>
              <div>
                <span className="text-gray-400 block">Session</span>
                <span className="font-semibold text-gray-800 dark:text-slate-200">
                  {selectedVoucher.onDate} ({selectedVoucher.ampm} #{selectedVoucher.onCount})
                </span>
              </div>
              <div>
                <span className="text-gray-400 block">Created At</span>
                <span className="font-semibold text-gray-800 dark:text-slate-200">
                  {selectedVoucher.createdAt ? new Date(selectedVoucher.createdAt).toLocaleString() : '—'}
                </span>
              </div>
              <div>
                <span className="text-gray-400 block">Server Sr No.</span>
                <span className="font-semibold text-emerald-600 dark:text-emerald-400">
                  {selectedVoucher.srNo ? `#${selectedVoucher.srNo}` : 'Not yet assigned'}
                </span>
              </div>
              <div>
                <span className="text-gray-400 block">Status</span>
                <span className="font-semibold text-gray-800 dark:text-slate-200 capitalize">
                  {selectedVoucher.status}
                </span>
              </div>
              {selectedVoucher.error && (
                <div className="col-span-2 text-red-600 dark:text-red-400 pt-1 border-t border-gray-200/50 dark:border-slate-700/50">
                  <span className="text-gray-400 block">Error Message</span>
                  <span className="font-medium">{selectedVoucher.error}</span>
                </div>
              )}
            </div>

            {/* Raw Expression Tokens */}
            <div>
              <h4 className="text-xs font-bold text-gray-500 dark:text-slate-400 uppercase mb-2">
                {t('localVouchers.tokensList')}
              </h4>
              <div className="bg-gray-100 dark:bg-slate-800 p-3 rounded-xl font-mono text-sm space-y-1 text-gray-800 dark:text-slate-200">
                {(selectedVoucher.tokens || []).map((tok, i) => (
                  <div key={i}>{tok}</div>
                ))}
              </div>
            </div>

            {/* Parsed Breakdown */}
            <div>
              <h4 className="text-xs font-bold text-gray-500 dark:text-slate-400 uppercase mb-2">
                {t('localVouchers.parsedEntries')}
              </h4>
              <div className="max-h-48 overflow-y-auto border border-gray-100 dark:border-slate-800 rounded-xl">
                <table className="w-full text-xs text-left">
                  <thead className="bg-gray-50 dark:bg-slate-800 text-gray-500 sticky top-0">
                    <tr>
                      <th className="py-2 px-3">#</th>
                      <th className="py-2 px-3">Number</th>
                      <th className="py-2 px-3 text-right">Amount</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-gray-100 dark:divide-slate-800">
                    {getParsedEntries(selectedVoucher.tokens).map((entry, idx) => (
                      <tr key={idx} className="hover:bg-gray-50/50 dark:hover:bg-slate-800/40">
                        <td className="py-1.5 px-3 text-gray-400">{idx + 1}</td>
                        <td className="py-1.5 px-3 font-mono font-bold text-gray-800 dark:text-slate-200">
                          {entry.number}
                        </td>
                        <td className="py-1.5 px-3 text-right font-semibold text-brand-600 dark:text-brand-400">
                          {(entry.amount || 0).toLocaleString()}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>

            {/* Footer Buttons */}
            <div className="flex items-center justify-end gap-3 pt-3 border-t border-gray-100 dark:border-slate-800">
              {(selectedVoucher.status === 'failed' || selectedVoucher.status === 'pending') && (
                <button
                  type="button"
                  onClick={() => {
                    handleRetryOne(selectedVoucher);
                    setSelectedVoucher(null);
                  }}
                  disabled={!isOnline}
                  className="px-4 py-2 text-sm font-semibold bg-brand-600 hover:bg-brand-700 text-white rounded-xl transition shadow-sm disabled:opacity-50"
                >
                  {t('localVouchers.retryBtn')}
                </button>
              )}
              <button
                type="button"
                onClick={() => setSelectedVoucher(null)}
                className="px-4 py-2 text-sm font-medium bg-gray-100 dark:bg-slate-800 hover:bg-gray-200 dark:hover:bg-slate-700 text-gray-700 dark:text-slate-300 rounded-xl transition"
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
