'use client';
import { useMemo, useRef, useState, useEffect, Fragment } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';
import { useI18n } from '@/lib/i18n/index.js';
import { useIsMac } from '@/lib/ledger/useLedgerShortcuts.js';
import { formatCombo as rawFormatCombo, matchesCombo } from '@/lib/ledger/shortcuts.js';
import SessionPicker from '../ledger/SessionPicker.js';

function buildNumberTable(numbersList) {
  const perCol = 34;
  const col1 = numbersList.slice(0, perCol);
  const col2 = numbersList.slice(perCol, perCol * 2);
  const col3 = numbersList.slice(perCol * 2);

  const rows = [];
  for (let i = 0; i < perCol; i += 1) {
    rows.push([col1[i] || null, col2[i] || null, col3[i] || null]);
  }
  return rows;
}

const SLOT_LABEL_KEY = {
  slot0900: 'slot0900',
  slot1200: 'slot1200',
  slot1400: 'slot1400',
  slot1630: 'slot1630',
  ampm_0900: 'slot0900',
  ampm_1200: 'slot1200',
  ampm_1400: 'slot1400',
  ampm_1630: 'slot1630',
};

export default function BuyEntry({
  orgId,
  activeSession,
  agents,
  rate,
  limit,
  notBuyNumbers,
  hotNumbers,
  luckyNumber,
  totals,
  buyTotals,
  canWrite = true,
  shortcuts,
  replaceSlash = 'P',
  replaceAsterisk = 'R',
  onOptimisticBuySave,
  onOpenSessionPicker,
}) {
  const { t } = useI18n();
  const router = useRouter();
  const isMac = useIsMac();
  const formatCombo = (combo) => rawFormatCombo(combo, isMac);

  const [agentId, setAgentId] = useState('buy_offload');
  const [inputValue, setInputValue] = useState('');
  const [pendingTokens, setPendingTokens] = useState([]);
  const [error, setError] = useState('');
  const [warnings, setWarnings] = useState([]);
  const [saving, setSaving] = useState(false);
  const [successMsg, setSuccessMsg] = useState('');
  const [search, setSearch] = useState('');

  const [exceedSortKey, setExceedSortKey] = useState('excess');
  const [exceedSortDir, setExceedSortDir] = useState('desc');
  const [gridSortKey, setGridSortKey] = useState('number');
  const [gridSortDir, setGridSortDir] = useState('asc');

  const [draggedTokenId, setDraggedTokenId] = useState(null);
  const [dragOverTokenId, setDragOverTokenId] = useState(null);

  const inputRef = useRef(null);
  const agentSelectRef = useRef(null);
  const middlePanelRef = useRef(null);
  const [middlePanelHeight, setMiddlePanelHeight] = useState(0);

  const [quickEntryOpen, setQuickEntryOpen] = useState(false);
  const [quickEntryNums, setQuickEntryNums] = useState('');
  const [quickEntryAmount, setQuickEntryAmount] = useState('');
  const quickNumsRef = useRef(null);
  const quickAmountRef = useRef(null);

  const notBuySet = useMemo(() => new Set(notBuyNumbers || []), [notBuyNumbers]);
  const hotSet = useMemo(() => new Set(hotNumbers || []), [hotNumbers]);

  const limitValue = limit?.num1Limit || 0;
  const isLimitActive = limitValue > 0;

  useEffect(() => {
    if (!middlePanelRef.current) return;
    const el = middlePanelRef.current;
    const observer = new ResizeObserver(entries => {
      for (const entry of entries) {
        setMiddlePanelHeight(entry.contentRect.height);
      }
    });
    observer.observe(el);
    return () => observer.disconnect();
  }, []);

  const totalsEntries = useMemo(
    () => Object.entries(totals || {}).map(([num, amount]) => ({ num, amount })),
    [totals]
  );
  const grandTotal = totalsEntries.reduce((s, e) => s + e.amount, 0);

  const exceedList = useMemo(() => {
    const list = [];
    const allNums = new Set([
      ...Object.keys(totals || {}),
      ...Object.keys(buyTotals || {}),
    ]);

    for (const num of allNums) {
      const amount = totals?.[num] || 0;
      const buy = buyTotals?.[num] || 0;
      const excess = isLimitActive && limitValue > 0 ? Math.max(0, amount - limitValue) : amount;
      const total = excess - buy;

      if (amount > (isLimitActive ? limitValue : 0) || buy > 0 || excess > 0) {
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

  const totalBuy = useMemo(() => {
    return exceedList.reduce((sum, e) => sum + e.buy, 0);
  }, [exceedList]);

  const totalRemaining = useMemo(() => {
    return exceedList.reduce((sum, e) => sum + e.total, 0);
  }, [exceedList]);

  const allNumbersList = useMemo(() => {
    const list = [];
    for (let i = 0; i <= 99; i += 1) {
      const num = String(i).padStart(2, '0');
      const amount = totals?.[num] || 0;
      list.push({ number: num, amount });
    }
    return list;
  }, [totals]);

  const sortedGridNumbers = useMemo(() => {
    const list = [...allNumbersList];
    list.sort((a, b) => {
      let av = a[gridSortKey];
      let bv = b[gridSortKey];

      if (gridSortKey === 'number') {
        const cmp = av.localeCompare(bv);
        return gridSortDir === 'asc' ? cmp : -cmp;
      } else {
        const cmp = av - bv;
        return gridSortDir === 'asc' ? cmp : -cmp;
      }
    });
    return list;
  }, [allNumbersList, gridSortKey, gridSortDir]);

  const numberTable = useMemo(() => buildNumberTable(sortedGridNumbers), [sortedGridNumbers]);

  function handleCellDragStart(e, tokenId) {
    setDraggedTokenId(tokenId);
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/plain', tokenId);
  }

  function handleCellDragOver(e, tokenId) {
    e.preventDefault();
    e.dataTransfer.dropEffect = 'move';
    if (dragOverTokenId !== tokenId) setDragOverTokenId(tokenId);
  }

  function handleCellDragLeave(e, tokenId) {
    if (dragOverTokenId === tokenId) setDragOverTokenId(null);
  }

  function handleCellDrop(e, targetTokenId) {
    e.preventDefault();
    const sourceTokenId = draggedTokenId || e.dataTransfer.getData('text/plain');
    if (!sourceTokenId || !targetTokenId || sourceTokenId === targetTokenId) {
      setDraggedTokenId(null);
      setDragOverTokenId(null);
      return;
    }
    setPendingTokens(prev => {
      const srcIdx = prev.findIndex(p => p.id === sourceTokenId);
      const targetIdx = prev.findIndex(p => p.id === targetTokenId);
      if (srcIdx === -1 || targetIdx === -1) return prev;
      const next = [...prev];
      const [moved] = next.splice(srcIdx, 1);
      next.splice(targetIdx, 0, moved);
      return next;
    });
    setDraggedTokenId(null);
    setDragOverTokenId(null);
  }

  function handleCellDragEnd() {
    setDraggedTokenId(null);
    setDragOverTokenId(null);
  }

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
      setGridSortDir('asc');
    }
  }

  function handleInputKeyDown(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      addInputToken();
    } else if (e.key === ' ' || e.code === 'Space') {
      e.preventDefault();
      setQuickEntryOpen(true);
      setTimeout(() => quickNumsRef.current?.focus(), 50);
    }
  }

  function addInputToken() {
    setError('');
    setWarnings([]);
    const raw = inputValue.trim();
    if (!raw) return;

    const { entries: parsed, error: parseError } = parseNumberExpression(raw, { maxEntries: MAX_ENTRIES });
    if (parseError) {
      setError(parseError);
      return;
    }

    const warnList = [];
    for (const entry of parsed) {
      if (notBuySet.has(entry.num)) warnList.push(`${entry.num} (Not Buy)`);
    }

    setPendingTokens(prev => [
      ...prev,
      { id: Date.now() + Math.random().toString(), tokenText: raw, entries: parsed },
    ]);
    setInputValue('');
    if (warnList.length > 0) setWarnings(warnList);
  }

  function handleAddQuickEntry() {
    setError('');
    setWarnings([]);
    const numsRaw = quickEntryNums.trim();
    const amtRaw = quickEntryAmount.trim();

    if (!numsRaw || !amtRaw) {
      setError('Please enter both numbers and amount');
      return;
    }

    const expr = `${numsRaw}R${amtRaw}`;
    const { entries: parsed, error: parseError } = parseNumberExpression(expr, { maxEntries: MAX_ENTRIES });

    if (parseError) {
      setError(parseError);
      return;
    }

    setPendingTokens(prev => [
      ...prev,
      { id: Date.now() + Math.random().toString(), tokenText: expr, entries: parsed },
    ]);

    setQuickEntryNums('');
    setQuickEntryAmount('');
    setQuickEntryOpen(false);
    setTimeout(() => inputRef.current?.focus(), 50);
  }

  async function handleSaveBuyVoucher() {
    setError('');
    setWarnings([]);
    if (!activeSession) {
      setError(t('ledger.noActiveSession'));
      return;
    }
    if (pendingTokens.length === 0) {
      setError('No items to save in Buy Voucher');
      return;
    }

    const items = pendingTokens.flatMap(p => p.entries);
    setSaving(true);

    try {
      const res = await fetch(`/api/org/${orgId}/ledger/buy-voucher`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          onCount: activeSession.onCount,
          ampm: activeSession.ampm,
          onDate: activeSession.onDate,
          machineId: activeSession.machineId,
          items,
        }),
      });
      const data = await res.json();
      if (!res.ok) {
        setError(data.error || 'Failed to save Buy Voucher');
        return;
      }

      if (onOptimisticBuySave) onOptimisticBuySave(items);
      setPendingTokens([]);
      setInputValue('');
      setSuccessMsg(`Buy Voucher saved successfully! (Sr.No: ${data.srNo})`);
      setTimeout(() => {
        setSuccessMsg('');
        inputRef.current?.focus();
      }, 3000);
    } catch (err) {
      setError(err.message || 'Network error');
    } finally {
      setSaving(false);
    }
  }

  const visibleTokens = useMemo(() => {
    let list = pendingTokens.map(p => ({
      ...p,
      amount: p.entries.reduce((s, e) => s + e.amount, 0),
    }));
    const q = search.trim();
    if (q) list = list.filter(p => p.tokenText.includes(q));
    return list;
  }, [pendingTokens, search]);

  const entryTableRows = useMemo(() => {
    const cols = 5;
    const rows = [];
    for (let i = 0; i < visibleTokens.length; i += cols) {
      rows.push(visibleTokens.slice(i, i + cols));
    }
    return rows;
  }, [visibleTokens]);

  return (
    <div className="w-full h-[calc(100vh-1.5rem)] flex flex-col overflow-hidden">
      {/* Top Header Navigation Bar */}
      <div className="bg-white rounded-xl border border-gray-200 shadow-sm px-4 py-2 mb-3 flex flex-wrap items-center justify-between gap-2 shrink-0">
        <div className="flex items-center gap-3">
          <div className="flex items-center gap-1 bg-slate-100 p-1 rounded-lg border border-slate-200 text-xs font-semibold">
            <Link
              href={`/org/${orgId}/2d/ledger`}
              className="px-3 py-1.5 rounded-md transition flex items-center gap-1.5 text-slate-600 hover:text-slate-900"
            >
              <span>📝</span> Ledger (2D)
            </Link>
            <Link
              href={`/org/${orgId}/2d/buy`}
              className="px-3 py-1.5 rounded-md transition flex items-center gap-1.5 bg-emerald-600 text-white shadow-xs font-bold"
            >
              <span>🛒</span> Buy Page (အဝယ်စာရင်း)
            </Link>
          </div>

          {activeSession ? (
            <div className="flex flex-wrap items-center gap-3 text-sm font-medium text-gray-900">
              <span className="badge-active">{t(`session.${SLOT_LABEL_KEY[activeSession.ampm] || 'slot0900'}`)}</span>
              <span className="text-gray-400">•</span>
              <span>{activeSession.onDate}</span>
              <span className="text-gray-400">•</span>
              <span className="text-gray-500">{t('session.machineLabel', { id: activeSession.machineId })}</span>
              {onOpenSessionPicker && (
                <button
                  type="button"
                  onClick={onOpenSessionPicker}
                  className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-0.5 rounded hover:bg-indigo-50 transition"
                >
                  {t('session.changeSession')}
                </button>
              )}
            </div>
          ) : (
            <div className="flex items-center gap-3">
              <p className="text-sm text-red-600 font-medium">{t('session.noSessionSelected')}</p>
            </div>
          )}
        </div>
      </div>

      {/* Main 3-Column Layout */}
      <div className="grid grid-cols-1 lg:grid-cols-12 gap-3 flex-1 min-h-0">
        
        {/* LEFT COLUMN: Input & Voucher Entries */}
        <div className="lg:col-span-5 flex flex-col h-full min-h-0">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden flex flex-col h-full min-h-0">
            {/* Green Title Header matching legacy design */}
            <div className="bg-gradient-to-r from-emerald-800 via-emerald-700 to-teal-800 text-white px-3 py-2 flex items-center justify-between shrink-0 shadow-sm">
              <h1 className="text-sm font-bold tracking-wide flex items-center gap-2">
                <span>🛒</span>
                <span>အဝယ်စာရင်း ထည့်သွင်းခြင်း (Buy Voucher Entry)</span>
              </h1>
              <span className="text-[11px] bg-emerald-900/80 px-2 py-0.5 rounded font-mono text-emerald-200 border border-emerald-600/50">
                {pendingTokens.length} Vouchers
              </span>
            </div>

            <div className="p-3 flex flex-col flex-1 min-h-0 space-y-2.5">
              {/* Agent & Controls */}
              <div className="grid grid-cols-2 gap-2">
                <div>
                  <label className="block text-[11px] font-semibold text-gray-600 mb-1">
                    ကိုယ်စားလှယ် (Agent)
                  </label>
                  <select
                    ref={agentSelectRef}
                    value={agentId}
                    onChange={e => setAgentId(e.target.value)}
                    className="w-full px-2.5 py-1.5 text-xs font-semibold border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500 bg-white"
                  >
                    <option value="buy_offload">Buy Offload (အဝယ်စာရင်း)</option>
                    {agents.map(a => (
                      <option key={a.id} value={a.id}>
                        {a.agentName}
                      </option>
                    ))}
                  </select>
                </div>
                <div>
                  <label className="block text-[11px] font-semibold text-gray-600 mb-1">
                    ရှာဖွေရန် (Search Tokens)
                  </label>
                  <input
                    type="text"
                    value={search}
                    onChange={e => setSearch(e.target.value)}
                    placeholder="Search..."
                    className="w-full px-2.5 py-1.5 text-xs border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
                  />
                </div>
              </div>

              {/* Number Input Box & Action Buttons */}
              <div>
                <div className="flex gap-2">
                  <input
                    ref={inputRef}
                    type="text"
                    value={inputValue}
                    onChange={e => setInputValue(e.target.value)}
                    onKeyDown={handleInputKeyDown}
                    placeholder="Enter expression (e.g. 12R100)"
                    className="flex-1 px-3 py-2 text-sm font-mono font-bold border-2 border-emerald-500 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-300 shadow-inner"
                  />
                  <button
                    type="button"
                    onClick={handleSaveBuyVoucher}
                    disabled={saving || pendingTokens.length === 0}
                    className="px-4 py-2 bg-emerald-600 hover:bg-emerald-700 disabled:opacity-50 text-white font-bold text-xs rounded-lg transition shadow flex items-center gap-1"
                  >
                    <span>💾</span> Save (F1)
                  </button>
                  <button
                    type="button"
                    onClick={() => setPendingTokens([])}
                    className="px-3 py-2 bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium text-xs rounded-lg transition border border-gray-300"
                  >
                    Clear
                  </button>
                </div>
                <p className="text-[10px] text-gray-400 mt-1">Press Spacebar for Quick Entry modal</p>
              </div>

              {error && (
                <div className="bg-red-50 border border-red-200 text-red-700 text-xs px-2.5 py-1.5 rounded-lg font-medium">
                  {error}
                </div>
              )}
              {successMsg && (
                <div className="bg-emerald-50 border border-emerald-200 text-emerald-800 text-xs px-2.5 py-1.5 rounded-lg font-medium">
                  {successMsg}
                </div>
              )}

              {/* Pending Items Grid Table */}
              <div className="flex-1 min-h-0 border border-gray-200 rounded-lg overflow-hidden flex flex-col bg-slate-50">
                <div className="flex-1 overflow-y-auto">
                  <table className="w-full text-xs border-collapse">
                    <tbody>
                      {entryTableRows.map((row, rIdx) => (
                        <tr key={rIdx} className="even:bg-slate-100/50 hover:bg-emerald-50/50 transition-colors">
                          {Array.from({ length: 5 }, (_, cIdx) => {
                            const p = row[cIdx];
                            if (!p) return <td key={cIdx} className="border border-slate-200/60 p-1.5" />;

                            const isDragging = draggedTokenId === p.id;
                            const isDragOver = dragOverTokenId === p.id;

                            return (
                              <td
                                key={p.id}
                                draggable={true}
                                onDragStart={e => handleCellDragStart(e, p.id)}
                                onDragOver={e => handleCellDragOver(e, p.id)}
                                onDragLeave={e => handleCellDragLeave(e, p.id)}
                                onDrop={e => handleCellDrop(e, p.id)}
                                onDragEnd={handleCellDragEnd}
                                className={`border border-slate-200 p-1.5 text-center font-mono font-bold transition-all ${
                                  isDragging ? 'opacity-40 bg-emerald-100 scale-95 border-dashed border-emerald-500' : ''
                                } ${
                                  isDragOver ? 'bg-emerald-200 ring-2 ring-emerald-500 scale-105 z-10 shadow' : 'hover:bg-emerald-100/60'
                                }`}
                              >
                                <span className="truncate font-bold text-slate-900 text-xs select-none">
                                  {p.tokenText}
                                </span>
                              </td>
                            );
                          })}
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>

              {/* Bottom Buttons */}
              <div className="flex justify-between items-center pt-1 border-t border-gray-100">
                <button
                  type="button"
                  onClick={() => router.push(`/org/${orgId}/2d/ledger`)}
                  className="px-3 py-1.5 bg-slate-100 hover:bg-slate-200 text-slate-700 font-semibold text-xs rounded-lg transition border border-slate-300 flex items-center gap-1"
                >
                  <span>⬅️</span> Exit (F4)
                </button>
                <div className="text-xs font-mono font-bold text-emerald-800">
                  Total Pending: {pendingTokens.reduce((s, p) => s + p.entries.reduce((a, e) => a + e.amount, 0), 0).toLocaleString()}
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* MIDDLE COLUMN: Bought & Exceed List Table (Exact match to legacy screenshot layout & colors) */}
        <div className="lg:col-span-4 flex flex-col h-full min-h-0">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden flex flex-col h-full min-h-0">
            {/* Green Header Banner matching legacy image */}
            <div className="bg-gradient-to-r from-emerald-900 via-emerald-800 to-teal-900 text-white px-3 py-2 flex items-center justify-between shrink-0 shadow-sm">
              <h2 className="text-sm font-bold tracking-wide flex items-center gap-2">
                <span>ဝယ်ပြီးသော ကွက်များ (Bought & Exceed List)</span>
              </h2>
              <select
                value={exceedSortKey}
                onChange={e => setExceedSortKey(e.target.value)}
                className="text-[11px] font-semibold bg-emerald-950 text-emerald-100 border border-emerald-700/80 rounded px-2 py-0.5 focus:outline-none"
              >
                <option value="excess">Sort By Exceed Format</option>
                <option value="num">Sort By Number</option>
                <option value="buy">Sort By Buy Amount</option>
                <option value="total">Sort By Net Total</option>
              </select>
            </div>

            <div className="p-2.5 flex-1 flex flex-col min-h-0 justify-between">
              {exceedList.length === 0 ? (
                <p className="text-xs text-gray-400 text-center py-10">No over-limit or buy entries yet</p>
              ) : (
                <div className="flex-1 min-h-0 overflow-y-auto mb-2 border border-gray-200 rounded-lg">
                  <table className="w-full text-xs border-collapse">
                    <thead>
                      <tr className="bg-slate-100 text-[10px] font-bold text-slate-700 uppercase tracking-wide border-b border-gray-200">
                        <th className="px-1.5 py-1.5 border-r border-gray-200 text-center w-12 bg-emerald-700 text-white">
                          Num
                        </th>
                        <th className="px-1.5 py-1.5 border-r border-gray-200 text-right text-red-600 bg-red-50">
                          Exceed
                        </th>
                        <th className="px-1.5 py-1.5 border-r border-gray-200 text-right bg-white text-slate-800">
                          Buy
                        </th>
                        <th className="px-1.5 py-1.5 text-right bg-purple-700 text-white font-bold">
                          Net Total
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      {exceedList.map(e => (
                        <tr key={e.num} className="border-b border-gray-200 hover:bg-emerald-50/50">
                          {/* Col 1: Bright Green Number Badge */}
                          <td className="px-1.5 py-1 font-mono font-bold text-center bg-emerald-600 text-white border-r border-gray-200">
                            {e.num}
                          </td>
                          {/* Col 2: Red font Exceed Amount */}
                          <td className="px-1.5 py-1 text-right font-mono font-bold text-red-600 bg-white border-r border-gray-200">
                            {e.excess.toLocaleString()}
                          </td>
                          {/* Col 3: White cell Buy Amount */}
                          <td className="px-1.5 py-1 text-right font-mono font-semibold text-slate-900 bg-white border-r border-gray-200">
                            {e.buy > 0 ? e.buy.toLocaleString() : '0'}
                          </td>
                          {/* Col 4: Deep Purple background Net Total */}
                          <td className="px-1.5 py-1 text-right font-mono font-bold text-white bg-purple-700">
                            {e.total.toLocaleString()}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}

              {/* Summary totals at bottom of Middle Panel */}
              <div className="border-t border-gray-200 pt-2 space-y-1 text-xs font-mono">
                <div className="flex justify-between px-1 font-semibold text-red-600">
                  <span>Exceed Total:</span>
                  <span>{totalExcess.toLocaleString()}</span>
                </div>
                <div className="flex justify-between px-1 font-semibold text-amber-700">
                  <span>Buy Total:</span>
                  <span>{totalBuy.toLocaleString()}</span>
                </div>
                <div className="flex justify-between font-bold border-t border-gray-200 pt-1.5 px-1 text-sm bg-purple-50 rounded p-1 text-purple-900">
                  <span>Net Total (Exceed - Buy):</span>
                  <span className="text-purple-950 font-extrabold">{totalRemaining.toLocaleString()}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* RIGHT COLUMN: 00–99 Ledger Grid (Full 3-column height) */}
        <div className="lg:col-span-3 flex flex-col h-full min-h-0">
          <div ref={middlePanelRef} className="bg-white rounded-xl border border-gray-200 shadow-sm p-2.5 h-full overflow-hidden flex flex-col min-h-0">
            <div className="flex items-center justify-between mb-2 shrink-0">
              <h2 className="text-sm font-bold text-gray-800">00 – 99 Overall Ledger Grid</h2>
              <div className="flex items-center gap-1">
                <button
                  type="button"
                  onClick={() => toggleGridSort('number')}
                  className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 transition"
                >
                  Num {gridSortKey === 'number' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
                <button
                  type="button"
                  onClick={() => toggleGridSort('amount')}
                  className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 transition"
                >
                  Amt {gridSortKey === 'amount' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
              </div>
            </div>

            <div className="flex-1 min-h-0 overflow-y-auto border border-gray-200 rounded-lg">
              <table className="w-full text-xs font-mono">
                <tbody>
                  {numberTable.map((row, rowIdx) => (
                    <tr key={rowIdx} className="border-b border-gray-150">
                      {row.map((item, colIdx) => {
                        if (!item) {
                          return (
                            <Fragment key={colIdx}>
                              <td className="w-6 border-r border-gray-200" />
                              <td className={`border-r border-gray-200 ${colIdx < 2 ? 'pr-1' : ''}`} />
                            </Fragment>
                          );
                        }

                        const num = item.number;
                        const amount = item.amount;
                        const isHot = hotSet.has(num);
                        const isNotBuy = notBuySet.has(num);
                        const isLucky = luckyNumber && num === String(luckyNumber).padStart(2, '0');
                        const isOverLimit = isLimitActive && amount > limitValue;
                        const hasBuyOffload = buyTotals?.[num] > 0;

                        let cls = 'bg-emerald-600 text-white font-bold';
                        let amountCls = 'text-gray-800 font-semibold';

                        if (isLucky) {
                          cls = 'bg-red-600 text-white font-bold';
                          amountCls = 'bg-red-600 text-white font-bold';
                        } else if (isOverLimit) {
                          cls = 'bg-purple-700 text-white font-bold';
                          amountCls = 'bg-purple-50 text-purple-900 font-bold';
                        } else if (hasBuyOffload) {
                          cls = 'bg-amber-500 text-white font-bold';
                          amountCls = 'bg-amber-50 text-amber-900 font-bold';
                        } else if (isNotBuy) {
                          cls = 'bg-gray-300 text-gray-600';
                        } else if (isHot) {
                          cls = 'bg-yellow-300 text-yellow-950 font-bold';
                        }

                        return (
                          <Fragment key={colIdx}>
                            <td className={`w-6 text-center font-bold px-1 py-0.5 border-r border-gray-200 ${cls}`}>
                              {num}
                            </td>
                            <td className={`px-1.5 py-0.5 text-right border-r border-gray-200 ${amountCls}`}>
                              {amount > 0 ? amount.toLocaleString() : ''}
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

      </div>

      {/* Quick Entry Modal */}
      {quickEntryOpen && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-xl shadow-2xl max-w-sm w-full p-4 border border-gray-200">
            <h3 className="text-sm font-bold text-gray-800 mb-3">Quick Buy Entry (Spacebar)</h3>
            <div className="space-y-3">
              <div>
                <label className="block text-xs font-semibold text-gray-600 mb-1">Numbers</label>
                <input
                  ref={quickNumsRef}
                  type="text"
                  value={quickEntryNums}
                  onChange={e => setQuickEntryNums(e.target.value)}
                  onKeyDown={e => {
                    if (e.key === 'Enter') quickAmountRef.current?.focus();
                  }}
                  placeholder="e.g. 12.14.16"
                  className="w-full px-3 py-1.5 text-sm font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>
              <div>
                <label className="block text-xs font-semibold text-gray-600 mb-1">Amount</label>
                <input
                  ref={quickAmountRef}
                  type="text"
                  value={quickEntryAmount}
                  onChange={e => setQuickEntryAmount(e.target.value)}
                  onKeyDown={e => {
                    if (e.key === 'Enter') handleAddQuickEntry();
                  }}
                  placeholder="e.g. 100"
                  className="w-full px-3 py-1.5 text-sm font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500"
                />
              </div>
            </div>
            <div className="flex justify-end gap-2 mt-4">
              <button
                type="button"
                onClick={() => setQuickEntryOpen(false)}
                className="px-3 py-1.5 bg-gray-100 hover:bg-gray-200 text-gray-700 text-xs font-semibold rounded-lg"
              >
                Cancel
              </button>
              <button
                type="button"
                onClick={handleAddQuickEntry}
                className="px-4 py-1.5 bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-bold rounded-lg"
              >
                Add Items
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
