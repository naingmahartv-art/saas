'use client';
import { useMemo, useRef, useState, useEffect, Fragment } from 'react';
import Link from 'next/link';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';
import { createRuleEngine } from '@/lib/lottery/ruleEngine.js';
import { useI18n } from '@/lib/i18n/index.js';
import AgentCombobox from './AgentCombobox.js';
import { matchesCombo, formatCombo as rawFormatCombo } from '@/lib/ledger/shortcuts.js';
import { useIsMac } from '@/lib/ledger/useLedgerShortcuts.js';
import { enqueue } from '@/lib/ledger/voucherQueue.js';
import { deleteLocalVoucher, saveLocalVoucher } from '@/lib/ledger/localVoucherDb.js';
import useLedgerFontSize from '@/lib/ledger/useLedgerFontSize.js';
import { todayStr, getCurrentSlotKey } from '@/lib/lottery/sessionSlots.js';

const ALLOWED_CHARS = /[^0-9RAGPBWNFXT+\-*/.[\]]/gi;

function normalizeInput(raw, slashRep = 'P', asteriskRep = 'R') {
  return raw.replace(ALLOWED_CHARS, '').replaceAll('/', slashRep).replaceAll('*', asteriskRep).toUpperCase();
}

const WARN_RULES = new Set(['Power', 'APoo', 'NetKhat', 'Brother']);
const ruleEngine = createRuleEngine();

function ruleMatchesFor(num) {
  return ruleEngine.evaluate(num).matches
    .filter(m => WARN_RULES.has(m.rule))
    .map(m => m.rule);
}

let tokenSeq = 0;
function nextTokenId() {
  tokenSeq += 1;
  return `mt_${Date.now()}_${tokenSeq}`;
}

function tokenFromText(rawText, t) {
  const text = rawText.trim();
  if (!text) return { token: null, error: null };
  const { entries, error } = parseNumberExpression(text, { maxEntries: MAX_ENTRIES });
  if (error) return { token: null, error };
  if (!entries.length) return { token: null, error: t('ledger.couldNotParse', { text }) };
  return { token: { id: nextTokenId(), tokenText: text, entries }, error: null };
}

const NUMBER_TABLE_COLUMNS = 4;

function buildNumberTable(numbersList) {
  const groupSize = Math.ceil(numbersList.length / NUMBER_TABLE_COLUMNS);
  const groups = Array.from({ length: NUMBER_TABLE_COLUMNS }, (_, g) =>
    numbersList.slice(g * groupSize, (g + 1) * groupSize)
  );
  const rows = Math.max(...groups.map(g => g.length), 0);
  return Array.from({ length: rows }, (_, r) => groups.map(g => g[r] ?? null));
}

export default function MixedLedgerEntry({
  orgId,
  activeSession,
  agents = [],
  rate,
  limit,
  notBuyNumbers = [],
  hotNumbers = [],
  luckyNumber = null,
  totals = {},
  buyTotals = {},
  vouchersCount = 0,
  editingVoucher,
  onSaved,
  onOptimisticSave,
  onOptimisticBuySave,
  onCancelEdit,
  onOpenHistory,
  onOpenSessionPicker,
  onOpenReports,
  onOpenSale1,
  onOpenSale2,
  canWrite = true,
  userRole,
  shortcuts,
  replaceSlash = 'P',
  replaceAsterisk = 'R',
}) {
  const { t } = useI18n();
  const isMac = useIsMac();
  const formatCombo = (combo) => rawFormatCombo(combo, isMac);
  const { fontSize } = useLedgerFontSize();

  // Dual Mode: 'sale' vs 'buy'
  const [entryMode, setEntryMode] = useState('sale'); // 'sale' | 'buy'
  const [agentId, setAgentId] = useState('');
  const [pendingTokens, setPendingTokens] = useState([]);
  const [inputValue, setInputValue] = useState('');
  const [error, setError] = useState('');
  const [successMsg, setSuccessMsg] = useState('');
  const [saving, setSaving] = useState(false);
  const [editingId, setEditingId] = useState(null);
  const [editingSrNo, setEditingSrNo] = useState(null);

  // Sorting
  const [exceedSortKey, setExceedSortKey] = useState('excess');
  const [exceedSortDir, setExceedSortDir] = useState('desc');
  const [gridSortKey, setGridSortKey] = useState('number'); // 'number' | 'sale' | 'buy' | 'net'
  const [gridSortDir, setGridSortDir] = useState('asc');
  const [search, setSearch] = useState('');
  const [selectedTokenIds, setSelectedTokenIds] = useState(new Set());
  const [lastSelectedIndex, setLastSelectedIndex] = useState(null);
  const [editingTokenId, setEditingTokenId] = useState(null);
  const [editingTokenValue, setEditingTokenValue] = useState('');
  const [exceededModalOpen, setExceededModalOpen] = useState(false);

  const inputRef = useRef(null);
  const agentSelectRef = useRef(null);
  const saveRef = useRef(null);

  const isLimitActive = activeSession?.isLimitActive ?? true;
  const limitValue = Number(activeSession?.limit ?? limit ?? 0);

  // Load editing voucher
  useEffect(() => {
    if (!editingVoucher) return;
    setEditingId(editingVoucher.id);
    setEditingSrNo(editingVoucher.srNo);
    setEntryMode(editingVoucher.voucherType === 'buy' || editingVoucher.isBuyVoucher ? 'buy' : 'sale');
    setAgentId(editingVoucher.agentId || '');

    const tokens = editingVoucher.tokens || [];
    const restored = [];
    for (const text of tokens) {
      const { token } = tokenFromText(text, t);
      if (token) restored.push(token);
    }
    setPendingTokens(restored);
    setInputValue('');
    setError('');
  }, [editingVoucher, t]);

  // Combined 00-99 Numbers List with 3-in-1 math: Sale, Buy, Net
  const combinedNumbersList = useMemo(() => {
    const list = [];
    for (let i = 0; i <= 99; i++) {
      const num = String(i).padStart(2, '0');
      const sale = totals?.[num] || 0;
      const buy = buyTotals?.[num] || 0;
      const net = sale - buy;
      const isHot = hotNumbers.includes(num);
      const isNotBuy = notBuyNumbers.includes(num);
      const isWinning = luckyNumber === num;
      const isOverLimit = isLimitActive && limitValue > 0 && net > limitValue;

      list.push({
        number: num,
        sale,
        buy,
        net,
        isHot,
        isNotBuy,
        isWinning,
        isOverLimit,
      });
    }
    return list;
  }, [totals, buyTotals, hotNumbers, notBuyNumbers, luckyNumber, isLimitActive, limitValue]);

  // Sorted Grid Numbers
  const sortedGridNumbers = useMemo(() => {
    const list = [...combinedNumbersList];
    list.sort((a, b) => {
      let av = a[gridSortKey];
      let bv = b[gridSortKey];

      if (gridSortKey === 'number') {
        const cmp = String(av).localeCompare(String(bv));
        return gridSortDir === 'asc' ? cmp : -cmp;
      } else {
        const cmp = (Number(av) || 0) - (Number(bv) || 0);
        return gridSortDir === 'asc' ? cmp : -cmp;
      }
    });
    return list;
  }, [combinedNumbersList, gridSortKey, gridSortDir]);

  // Grand Totals Summary
  const grandSalesTotal = useMemo(() => {
    return Object.values(totals || {}).reduce((s, a) => s + (Number(a) || 0), 0);
  }, [totals]);

  const grandBuyTotal = useMemo(() => {
    return Object.values(buyTotals || {}).reduce((s, a) => s + (Number(a) || 0), 0);
  }, [buyTotals]);

  const grandNetTotal = grandSalesTotal - grandBuyTotal;

  // Exceed Limit List
  const exceedList = useMemo(() => {
    const list = [];
    const allNums = new Set([
      ...Object.keys(totals || {}),
      ...Object.keys(buyTotals || {}),
    ]);

    for (const num of allNums) {
      const amount = totals?.[num] || 0;
      const buy = buyTotals?.[num] || 0;
      const excess = isLimitActive && limitValue > 0 ? Math.max(0, amount - limitValue) : 0;
      const total = excess - buy;

      if ((isLimitActive && limitValue > 0 && amount > limitValue) || buy > 0) {
        list.push({ num, amount, excess, buy, total });
      }
    }

    return list.sort((a, b) => {
      let av = a[exceedSortKey];
      let bv = b[exceedSortKey];

      if (exceedSortKey === 'num') {
        const cmp = String(av || '').localeCompare(String(bv || ''));
        return exceedSortDir === 'asc' ? cmp : -cmp;
      } else {
        const cmp = (Number(av) || 0) - (Number(bv) || 0);
        return exceedSortDir === 'asc' ? cmp : -cmp;
      }
    });
  }, [totals, buyTotals, isLimitActive, limitValue, exceedSortKey, exceedSortDir]);

  const totalExcess = useMemo(() => {
    return exceedList.reduce((sum, e) => sum + e.excess, 0);
  }, [exceedList]);

  const totalRemainingExcess = useMemo(() => {
    return exceedList.reduce((sum, e) => sum + e.total, 0);
  }, [exceedList]);

  function toggleExceedSort(key) {
    if (exceedSortKey === key) {
      setExceedSortDir(d => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setExceedSortKey(key);
      setExceedSortDir('desc');
    }
  }

  function toggleGridSort(key) {
    if (gridSortKey === key) {
      setGridSortDir(d => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setGridSortKey(key);
      setGridSortDir(key === 'number' ? 'asc' : 'desc');
    }
  }

  // Handle Token Add
  function handleAddToken() {
    const raw = normalizeInput(inputValue, replaceSlash, replaceAsterisk).trim();
    if (!raw) return;

    const parts = raw.split(/\s+/).filter(Boolean);
    const newTokens = [];

    for (const p of parts) {
      const { token, error: parseError } = tokenFromText(p, t);
      if (parseError) {
        setError(parseError);
        return;
      }
      if (token) newTokens.push(token);
    }

    setPendingTokens(prev => [...prev, ...newTokens]);
    setInputValue('');
    setError('');
  }

  // Handle Save
  async function handleSave() {
    if (!canWrite) return;
    if (pendingTokens.length === 0) {
      setError('Please enter at least one number');
      return;
    }

    const isBuy = entryMode === 'buy';
    if (!isBuy && !agentId) {
      setError('Please select an agent for Sale voucher');
      agentSelectRef.current?.focus();
      return;
    }

    setSaving(true);
    setError('');

    const tokenTexts = pendingTokens.map(p => p.tokenText);
    const allEntries = pendingTokens.flatMap(p => p.entries);
    const voucherAmount = allEntries.reduce((s, e) => s + (parseFloat(e.amount) || 0), 0);

    const fallbackDate = todayStr();
    const fallbackSlot = getCurrentSlotKey();
    const vOnDate = editingVoucher?.onDate || activeSession?.onDate || fallbackDate;
    const vAmpm = editingVoucher?.ampm || activeSession?.ampm || fallbackSlot;
    const vOnCount = editingVoucher?.onCount || activeSession?.onCount || 1;
    const vMachineId = editingVoucher?.machineId || activeSession?.machineId || 1;

    const targetAgentId = isBuy ? (agentId || 'buy_offload') : agentId;
    const foundAgent = agents.find(a => a.id === targetAgentId || a.agentId === targetAgentId);
    const targetAgentName = isBuy
      ? (targetAgentId === 'buy_offload' ? 'Buy Offload (အဝယ်စာရင်း)' : (foundAgent?.agentName || targetAgentId))
      : (foundAgent?.agentName || targetAgentId);

    const voucherPayload = {
      clientId: editingId || undefined,
      id: editingId || undefined,
      voucherId: editingId || undefined,
      orgId,
      tokens: tokenTexts,
      entries: allEntries,
      amount: voucherAmount,
      agentId: targetAgentId,
      agentName: targetAgentName,
      voucherType: isBuy ? 'buy' : 'sale',
      isBuyVoucher: isBuy,
      onDate: vOnDate,
      ampm: vAmpm,
      onCount: vOnCount,
      machineId: vMachineId,
      action: editingId ? 'update' : 'create',
      srNo: editingSrNo || null,
    };

    try {
      if (isBuy) {
        if (onOptimisticBuySave) onOptimisticBuySave(allEntries);
      } else {
        if (onOptimisticSave) onOptimisticSave(allEntries);
      }

      enqueue(orgId, voucherPayload);

      setPendingTokens([]);
      setInputValue('');
      setEditingId(null);
      setEditingSrNo(null);
      setSuccessMsg(
        editingId
          ? `Voucher #${editingSrNo || ''} updated successfully!`
          : `${isBuy ? 'Buy' : 'Sale'} Voucher saved successfully!`
      );

      if (onSaved) onSaved();
      setTimeout(() => setSuccessMsg(''), 4000);
      inputRef.current?.focus();
    } catch (err) {
      setError(err?.message || t('common.failedToSave'));
    } finally {
      setSaving(false);
    }
  }

  saveRef.current = handleSave;

  // Global Shortcuts
  useEffect(() => {
    function handleGlobalKeyDown(e) {
      if (shortcuts && matchesCombo(e, shortcuts.focusAgent)) {
        e.preventDefault();
        agentSelectRef.current?.focus();
      } else if (shortcuts && matchesCombo(e, shortcuts.focusInput)) {
        e.preventDefault();
        inputRef.current?.focus();
      } else if (shortcuts && matchesCombo(e, shortcuts.history)) {
        e.preventDefault();
        onOpenHistory?.();
      } else if (shortcuts && (matchesCombo(e, shortcuts.reports) || e.key === 'F6')) {
        e.preventDefault();
        onOpenReports?.();
      } else if (shortcuts && matchesCombo(e, shortcuts.save)) {
        e.preventDefault();
        saveRef.current?.();
      } else if ((shortcuts && matchesCombo(e, shortcuts.sortExceedNum)) || (e.altKey && e.key === '1')) {
        e.preventDefault();
        toggleExceedSort('num');
      } else if ((shortcuts && matchesCombo(e, shortcuts.sortExceedAmount)) || (e.altKey && e.key === '2')) {
        e.preventDefault();
        toggleExceedSort('total');
      } else if ((shortcuts && matchesCombo(e, shortcuts.sortExceedExcess)) || (e.altKey && e.key === '3')) {
        e.preventDefault();
        toggleExceedSort('excess');
      } else if ((shortcuts && matchesCombo(e, shortcuts.sortGridNum)) || (e.altKey && e.key === '4')) {
        e.preventDefault();
        toggleGridSort('number');
      } else if ((shortcuts && matchesCombo(e, shortcuts.sortGridAmount)) || (e.altKey && e.key === '5')) {
        e.preventDefault();
        toggleGridSort('net');
      } else if (e.altKey && (e.key === 'b' || e.key === 'B')) {
        e.preventDefault();
        setEntryMode(prev => (prev === 'sale' ? 'buy' : 'sale'));
      } else if (e.key === 'F12') {
        e.preventDefault();
        setExceededModalOpen(prev => !prev);
      } else if (e.key === 'Escape') {
        if (exceededModalOpen) setExceededModalOpen(false);
        else if (editingId) onCancelEdit?.();
      }
    }

    window.addEventListener('keydown', handleGlobalKeyDown);
    return () => window.removeEventListener('keydown', handleGlobalKeyDown);
  }, [shortcuts, exceededModalOpen, editingId, onOpenHistory, onOpenReports, onCancelEdit]);

  // Input keydown
  function handleInputKeyDown(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      if (inputValue.trim()) {
        handleAddToken();
      } else if (pendingTokens.length > 0) {
        handleSave();
      }
    } else if (e.key === ' ' && inputValue.trim()) {
      e.preventDefault();
      handleAddToken();
    }
  }

  const tableRows = useMemo(() => buildNumberTable(sortedGridNumbers), [sortedGridNumbers]);

  return (
    <div className={`flex flex-col space-y-2.5 ${fontSize}`}>
      {/* 1. Real-Time Financial Balance Header Banner */}
      <div className="bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 text-white p-3 rounded-xl border border-indigo-900/60 shadow-md flex flex-wrap items-center justify-between gap-3">
        <div className="flex items-center gap-3">
          <div className="flex items-center gap-2">
            <span className="text-xl">⚖️</span>
            <div>
              <div className="flex items-center gap-2">
                <span className="font-extrabold text-sm tracking-wide text-indigo-200">Mixed Ledger (အရောင်း / အဝယ် ပေါင်းစပ်စာရင်း)</span>
                <span className="px-2 py-0.5 rounded-full text-[10px] font-bold uppercase tracking-wider bg-indigo-500/30 border border-indigo-400/40 text-indigo-300">
                  Live Sync
                </span>
              </div>
              <div className="text-[11px] text-slate-400 font-mono">
                Session: {activeSession?.onDate} | {activeSession?.ampm} | Count #{activeSession?.onCount || 1}
              </div>
            </div>
          </div>
        </div>

        {/* 4 Key Metrics */}
        <div className="flex flex-wrap items-center gap-2">
          {/* Gross Sales */}
          <div className="bg-slate-800/80 border border-blue-500/30 px-3 py-1 rounded-lg text-right">
            <span className="block text-[10px] text-blue-300 font-semibold uppercase tracking-wider">Gross Sales (အရောင်း)</span>
            <span className="text-xs font-mono font-black text-blue-200">+{grandSalesTotal.toLocaleString()}</span>
          </div>

          {/* Buy Offload */}
          <div className="bg-slate-800/80 border border-emerald-500/30 px-3 py-1 rounded-lg text-right">
            <span className="block text-[10px] text-emerald-300 font-semibold uppercase tracking-wider">Buy Offload (အဝယ်)</span>
            <span className="text-xs font-mono font-black text-emerald-300">-{grandBuyTotal.toLocaleString()}</span>
          </div>

          {/* Net Retained */}
          <div className="bg-indigo-900/60 border border-indigo-400/40 px-3 py-1 rounded-lg text-right shadow-inner">
            <span className="block text-[10px] text-indigo-300 font-semibold uppercase tracking-wider">Net Retained (ကျန်ငွေ)</span>
            <span className={`text-xs font-mono font-black ${grandNetTotal >= 0 ? 'text-amber-300' : 'text-rose-400'}`}>
              {grandNetTotal.toLocaleString()}
            </span>
          </div>

          {/* Over Limit Excess */}
          <div className="bg-slate-800/80 border border-amber-500/30 px-3 py-1 rounded-lg text-right">
            <span className="block text-[10px] text-amber-300 font-semibold uppercase tracking-wider">Exceed Excess (ကျော်ငွေ)</span>
            <span className="text-xs font-mono font-black text-amber-400">{totalRemainingExcess.toLocaleString()}</span>
          </div>
        </div>
      </div>

      {/* 2. Main 3-Column Layout */}
      <div className="grid grid-cols-1 xl:grid-cols-[1.2fr_1.5fr_0.9fr] gap-3 flex-1 min-h-0 items-stretch">
        
        {/* LEFT COLUMN: Dual Entry Form (Sale & Buy) */}
        <div className="flex flex-col h-full min-h-0 space-y-2.5">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-3 shrink-0">
            {/* Entry Mode Switcher (Sale vs Buy) */}
            <div className="flex items-center justify-between mb-2 pb-2 border-b border-gray-100">
              <span className="text-xs font-bold text-gray-700 flex items-center gap-1.5">
                <span>📝</span>
                <span>Voucher Type</span>
              </span>
              <div className="inline-flex rounded-lg border border-gray-200 p-0.5 bg-gray-100/80">
                <button
                  type="button"
                  onClick={() => setEntryMode('sale')}
                  className={`px-3 py-1 text-xs font-bold rounded-md transition cursor-pointer flex items-center gap-1 ${
                    entryMode === 'sale'
                      ? 'bg-blue-600 text-white shadow-xs'
                      : 'text-gray-600 hover:text-gray-900'
                  }`}
                  title="Sale Voucher (Alt+B to toggle)"
                >
                  <span>🛒</span>
                  <span>Sale (အရောင်း)</span>
                </button>
                <button
                  type="button"
                  onClick={() => setEntryMode('buy')}
                  className={`px-3 py-1 text-xs font-bold rounded-md transition cursor-pointer flex items-center gap-1 ${
                    entryMode === 'buy'
                      ? 'bg-emerald-600 text-white shadow-xs'
                      : 'text-gray-600 hover:text-gray-900'
                  }`}
                  title="Buy Voucher (Alt+B to toggle)"
                >
                  <span>📥</span>
                  <span>Buy (အဝယ်)</span>
                </button>
              </div>
            </div>

            {/* Agent Selector & Express Input */}
            <div className="space-y-2">
              <div>
                <label className="block text-[11px] font-bold text-gray-600 mb-1">
                  {entryMode === 'sale' ? 'Sale Agent (ကိုယ်စားလှယ်)' : 'Buy Channel (အဝယ်ချန်နယ်)'} (F2)
                </label>
                {entryMode === 'sale' ? (
                  <AgentCombobox
                    ref={agentSelectRef}
                    agents={agents}
                    value={agentId}
                    onChange={setAgentId}
                    disabled={!canWrite || Boolean(editingId)}
                  />
                ) : (
                  <div className="flex gap-2">
                    <input
                      type="text"
                      readOnly
                      value="Buy Offload (အဝယ်စာရင်း)"
                      className="w-full px-2.5 py-1.5 bg-emerald-50 border border-emerald-300 text-emerald-900 text-xs font-bold rounded-lg cursor-not-allowed"
                    />
                  </div>
                )}
              </div>

              <div>
                <label className="block text-[11px] font-bold text-gray-600 mb-1">
                  Number & Amount Expressions (F3)
                </label>
                <div className="flex gap-1.5">
                  <input
                    ref={inputRef}
                    type="text"
                    value={inputValue}
                    onChange={e => setInputValue(e.target.value)}
                    onKeyDown={handleInputKeyDown}
                    placeholder="e.g. 20R500 123A1000 2F500"
                    disabled={!canWrite}
                    className="flex-1 px-3 py-1.5 text-xs font-mono font-bold bg-white border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 uppercase"
                  />
                  <button
                    type="button"
                    onClick={handleAddToken}
                    disabled={!canWrite || !inputValue.trim()}
                    className="px-3 py-1.5 bg-indigo-600 hover:bg-indigo-700 text-white font-bold text-xs rounded-lg transition cursor-pointer disabled:opacity-50"
                  >
                    Add
                  </button>
                </div>
              </div>
            </div>

            {/* Error / Success feedback */}
            {error && (
              <div className="mt-2 p-2 bg-red-50 border border-red-200 text-red-700 text-xs font-semibold rounded-lg">
                ⚠️ {error}
              </div>
            )}
            {successMsg && (
              <div className="mt-2 p-2 bg-emerald-50 border border-emerald-200 text-emerald-700 text-xs font-semibold rounded-lg">
                ✅ {successMsg}
              </div>
            )}
          </div>

          {/* Pending Tokens Feed */}
          <div className="bg-slate-900 text-white rounded-xl border border-slate-800 shadow-md p-3 flex-1 flex flex-col min-h-[220px]">
            <div className="flex items-center justify-between pb-2 mb-2 border-b border-slate-800">
              <span className="text-xs font-bold text-slate-300 flex items-center gap-1.5">
                <span>📋</span>
                <span>Entered Numbers ({pendingTokens.length})</span>
              </span>
              <span className="text-xs font-mono font-bold text-emerald-400 bg-emerald-950/60 border border-emerald-800/60 px-2 py-0.5 rounded">
                Total: {pendingTokens.reduce((s, p) => s + p.entries.reduce((a, e) => a + e.amount, 0), 0).toLocaleString()} Ks
              </span>
            </div>

            <div className="flex-1 overflow-y-auto space-y-1.5 pr-1 min-h-0">
              {pendingTokens.length === 0 ? (
                <div className="text-slate-500 text-xs text-center py-8">
                  Enter expressions above (e.g. <span className="font-mono text-slate-400">20R500</span>) and press Enter
                </div>
              ) : (
                pendingTokens.map(tItem => {
                  const subTotal = tItem.entries.reduce((a, e) => a + e.amount, 0);
                  return (
                    <div
                      key={tItem.id}
                      className="bg-slate-800/90 hover:bg-slate-800 border border-slate-700/80 px-2.5 py-1.5 rounded-lg flex items-center justify-between text-xs font-mono transition"
                    >
                      <span className="font-bold text-indigo-300">{tItem.tokenText}</span>
                      <div className="flex items-center gap-2">
                        <span className="text-slate-300 font-bold">{subTotal.toLocaleString()} Ks</span>
                        <button
                          type="button"
                          onClick={() => setPendingTokens(prev => prev.filter(p => p.id !== tItem.id))}
                          className="text-red-400 hover:text-red-300 px-1 cursor-pointer font-bold"
                          title="Remove item"
                        >
                          ✕
                        </button>
                      </div>
                    </div>
                  );
                })
              )}
            </div>

            {/* Action Buttons */}
            <div className="pt-2.5 mt-2 border-t border-slate-800 flex items-center gap-2">
              <button
                type="button"
                onClick={handleSave}
                disabled={!canWrite || saving || pendingTokens.length === 0}
                className={`flex-1 py-2 font-bold text-xs rounded-lg transition cursor-pointer shadow-sm flex items-center justify-center gap-1.5 ${
                  entryMode === 'sale'
                    ? 'bg-blue-600 hover:bg-blue-700 text-white disabled:opacity-50'
                    : 'bg-emerald-600 hover:bg-emerald-700 text-white disabled:opacity-50'
                }`}
              >
                <span>💾</span>
                <span>{editingId ? `Update ${editingSrNo ? `#${editingSrNo}` : ''}` : `Save ${entryMode === 'sale' ? 'Sale' : 'Buy'} Voucher (F1)`}</span>
              </button>

              <button
                type="button"
                onClick={() => {
                  setPendingTokens([]);
                  setInputValue('');
                  setError('');
                }}
                disabled={pendingTokens.length === 0}
                className="px-3 py-2 bg-slate-800 hover:bg-slate-700 text-slate-300 font-bold text-xs rounded-lg border border-slate-700 transition cursor-pointer disabled:opacity-40"
              >
                Clear
              </button>
            </div>
          </div>
        </div>

        {/* MIDDLE COLUMN: 00-99 3-in-1 Numbers Grid (Sale, Buy, Net) */}
        <div className="flex flex-col h-full min-h-0">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden flex flex-col h-full min-h-0">
            {/* Grid Header & Sort Controls */}
            <div className="bg-gradient-to-r from-slate-900 via-indigo-950 to-slate-900 text-white px-3 py-2 flex items-center justify-between shrink-0">
              <div className="flex items-center gap-2">
                <span className="font-bold text-xs">00-99 Combined Grid</span>
                <span className="text-[10px] text-slate-400 font-mono">
                  [Sale | Buy | Net]
                </span>
              </div>

              {/* Sort Buttons */}
              <div className="flex items-center gap-1">
                <button
                  type="button"
                  onClick={() => toggleGridSort('number')}
                  className={`px-2 py-0.5 text-[11px] font-bold rounded cursor-pointer transition ${
                    gridSortKey === 'number'
                      ? 'bg-indigo-600 text-white'
                      : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
                  }`}
                  title="Sort by Number (Alt+4)"
                >
                  Num {gridSortKey === 'number' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
                <button
                  type="button"
                  onClick={() => toggleGridSort('sale')}
                  className={`px-2 py-0.5 text-[11px] font-bold rounded cursor-pointer transition ${
                    gridSortKey === 'sale'
                      ? 'bg-blue-600 text-white'
                      : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
                  }`}
                >
                  Sale {gridSortKey === 'sale' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
                <button
                  type="button"
                  onClick={() => toggleGridSort('buy')}
                  className={`px-2 py-0.5 text-[11px] font-bold rounded cursor-pointer transition ${
                    gridSortKey === 'buy'
                      ? 'bg-emerald-600 text-white'
                      : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
                  }`}
                >
                  Buy {gridSortKey === 'buy' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
                <button
                  type="button"
                  onClick={() => toggleGridSort('net')}
                  className={`px-2 py-0.5 text-[11px] font-bold rounded cursor-pointer transition ${
                    gridSortKey === 'net'
                      ? 'bg-amber-600 text-white'
                      : 'bg-slate-800 text-slate-300 hover:bg-slate-700'
                  }`}
                  title="Sort by Net Retained Amount (Alt+5)"
                >
                  Net {gridSortKey === 'net' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
              </div>
            </div>

            {/* 4-Column Table Grid */}
            <div className="flex-1 overflow-y-auto p-1 min-h-0 bg-slate-50">
              <table className="w-full text-xs border-collapse">
                <tbody>
                  {tableRows.map((row, rIdx) => (
                    <tr key={rIdx} className="border-b border-gray-200">
                      {row.map((item, cIdx) => {
                        if (!item) {
                          return <td key={cIdx} colSpan={2} className="p-1 bg-gray-100/50" />;
                        }

                        const hasData = item.sale > 0 || item.buy > 0;
                        const cellBg = item.isOverLimit
                          ? 'bg-amber-100 text-amber-900 border-amber-300'
                          : item.isWinning
                          ? 'bg-emerald-100 text-emerald-900 font-black'
                          : hasData
                          ? 'bg-white hover:bg-indigo-50/60'
                          : 'bg-white/70 hover:bg-gray-100 text-gray-400';

                        return (
                          <Fragment key={item.number}>
                            {/* Number Cell */}
                            <td
                              className={`px-1.5 py-1 text-center font-mono font-bold border-r border-gray-200 w-10 ${
                                item.isOverLimit
                                  ? 'bg-amber-500 text-white'
                                  : 'bg-slate-800 text-white'
                              }`}
                            >
                              {item.number}
                            </td>

                            {/* 3-in-1 Values Cell */}
                            <td className={`px-2 py-1 font-mono text-right border-r border-gray-300 ${cellBg}`}>
                              {hasData ? (
                                <div className="flex items-center justify-between gap-1 text-[11px] leading-tight">
                                  {/* Sale */}
                                  <span className="text-blue-700 font-bold" title="Gross Sale">
                                    {item.sale > 0 ? item.sale.toLocaleString() : '0'}
                                  </span>
                                  {/* Buy */}
                                  <span className="text-emerald-700 font-bold" title="Buy Offload">
                                    {item.buy > 0 ? `-${item.buy.toLocaleString()}` : ''}
                                  </span>
                                  {/* Net */}
                                  <span
                                    className={`font-black ${
                                      item.isOverLimit
                                        ? 'text-amber-800 underline'
                                        : item.net > 0
                                        ? 'text-slate-900'
                                        : 'text-gray-400'
                                    }`}
                                    title="Net Retained"
                                  >
                                    ={item.net.toLocaleString()}
                                  </span>
                                </div>
                              ) : (
                                <span className="text-gray-300">-</span>
                              )}
                            </td>
                          </Fragment>
                        );
                      })}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
        </div>

        {/* RIGHT COLUMN: Exceeded Limit & Buy Balancing Table */}
        <div className="flex flex-col h-full min-h-0">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden flex flex-col h-full min-h-0">
            <div className="bg-gradient-to-r from-amber-700 via-amber-800 to-amber-900 text-white px-3 py-2 flex items-center justify-between shrink-0">
              <h2 className="text-xs font-bold flex items-center gap-1.5">
                <span>⚠️</span>
                <span>Exceeded / Risk Offload ({exceedList.length})</span>
              </h2>
              <button
                type="button"
                onClick={() => setExceededModalOpen(true)}
                className="text-[11px] px-2 py-0.5 bg-amber-600 hover:bg-amber-500 text-white font-bold rounded transition cursor-pointer"
              >
                Expand (F12)
              </button>
            </div>

            <div className="p-2 flex-1 flex flex-col min-h-0">
              <div className="flex-1 min-h-0 overflow-y-auto border border-gray-200 rounded-lg">
                <table className="w-full text-xs border-collapse">
                  <thead>
                    <tr className="bg-slate-100 text-[11px] font-bold text-slate-700 border-b border-gray-200">
                      <th className="px-1.5 py-1 text-center bg-purple-700 text-white w-12">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('num')}
                          className="hover:text-purple-200 transition font-bold flex items-center justify-center gap-0.5 mx-auto text-white cursor-pointer w-full"
                          title="Sort by Number (Alt+1)"
                        >
                          Num {exceedSortKey === 'num' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1.5 py-1 text-right bg-purple-50 text-purple-900">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('excess')}
                          className="hover:text-purple-700 transition font-extrabold flex items-center justify-end gap-0.5 ml-auto text-purple-900 cursor-pointer w-full"
                          title="Sort by Exceed Amount (Alt+3)"
                        >
                          Exceed {exceedSortKey === 'excess' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1.5 py-1 text-right bg-emerald-50 text-emerald-800">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('buy')}
                          className="hover:text-emerald-800 transition font-bold flex items-center justify-end gap-0.5 ml-auto text-emerald-800 cursor-pointer w-full"
                        >
                          Buy {exceedSortKey === 'buy' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1.5 py-1 text-right bg-indigo-50 text-indigo-900">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('total')}
                          className="hover:text-indigo-700 transition font-extrabold flex items-center justify-end gap-0.5 ml-auto text-indigo-900 cursor-pointer w-full"
                          title="Sort by Net Excess (Alt+2)"
                        >
                          Net {exceedSortKey === 'total' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {exceedList.length === 0 ? (
                      <tr>
                        <td colSpan={4} className="px-3 py-12 text-center text-gray-400 text-xs">
                          No over-limit or buy offload entries
                        </td>
                      </tr>
                    ) : (
                      exceedList.map(e => (
                        <tr key={e.num} className="border-b border-gray-100 hover:bg-amber-50/50">
                          <td className="px-1.5 py-1 font-mono font-bold text-center bg-purple-600 text-white text-xs">
                            {e.num}
                          </td>
                          <td className="px-1.5 py-1 text-right font-mono font-bold text-purple-900 text-xs">
                            {e.excess.toLocaleString()}
                          </td>
                          <td className="px-1.5 py-1 text-right font-mono font-bold text-emerald-700 text-xs">
                            {e.buy > 0 ? `-${e.buy.toLocaleString()}` : '0'}
                          </td>
                          <td className="px-1.5 py-1 text-right font-mono font-black text-slate-900 text-xs">
                            {e.total.toLocaleString()}
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Exceeded Modal (F12) */}
      {exceededModalOpen && (
        <div
          className="fixed inset-0 bg-black/60 backdrop-blur-xs z-50 flex items-center justify-center p-4 animate-in fade-in duration-200"
          onClick={() => setExceededModalOpen(false)}
        >
          <div
            className="bg-white rounded-2xl shadow-2xl max-w-4xl w-full max-h-[85vh] flex flex-col overflow-hidden border border-gray-200"
            onClick={e => e.stopPropagation()}
          >
            <div className="bg-gradient-to-r from-amber-700 via-amber-800 to-amber-900 text-white px-5 py-3 flex justify-between items-center shrink-0">
              <h3 className="font-bold text-base flex items-center gap-2">
                <span>⚠️</span>
                <span>Exceeded Numbers & Risk Balancing (F12)</span>
              </h3>
              <button
                type="button"
                onClick={() => setExceededModalOpen(false)}
                className="text-white hover:bg-white/20 p-1.5 rounded-lg transition"
              >
                ✕
              </button>
            </div>

            <div className="p-4 flex-1 overflow-y-auto">
              <table className="w-full text-xs border-collapse">
                <thead>
                  <tr className="bg-slate-100 text-xs font-bold text-slate-700 border-b border-gray-200">
                    <th className="px-2 py-2 text-center bg-purple-700 text-white w-16">Number</th>
                    <th className="px-2 py-2 text-right bg-purple-50 text-purple-900">Exceed Amount</th>
                    <th className="px-2 py-2 text-right bg-emerald-50 text-emerald-800">Buy Offload</th>
                    <th className="px-2 py-2 text-right bg-indigo-50 text-indigo-900">Net Remaining</th>
                  </tr>
                </thead>
                <tbody>
                  {exceedList.map(e => (
                    <tr key={e.num} className="border-b border-gray-200 hover:bg-amber-50">
                      <td className="px-2 py-1.5 font-mono font-bold text-center bg-purple-600 text-white">{e.num}</td>
                      <td className="px-2 py-1.5 text-right font-mono font-bold text-purple-900">{e.excess.toLocaleString()}</td>
                      <td className="px-2 py-1.5 text-right font-mono font-bold text-emerald-700">{e.buy > 0 ? `-${e.buy.toLocaleString()}` : '0'}</td>
                      <td className="px-2 py-1.5 text-right font-mono font-black text-indigo-900">{e.total.toLocaleString()}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>

            <div className="p-3 bg-gray-50 border-t border-gray-200 flex justify-end">
              <button
                type="button"
                onClick={() => setExceededModalOpen(false)}
                className="px-4 py-1.5 bg-slate-700 hover:bg-slate-800 text-white font-bold text-xs rounded-lg transition cursor-pointer"
              >
                Close (Esc)
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
