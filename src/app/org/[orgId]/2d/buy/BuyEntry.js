'use client';
import { useMemo, useRef, useState, useEffect, Fragment } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';
import { useI18n } from '@/lib/i18n/index.js';
import { useIsMac } from '@/lib/ledger/useLedgerShortcuts.js';
import { formatCombo as rawFormatCombo, matchesCombo } from '@/lib/ledger/shortcuts.js';
import SessionPicker from '../ledger/SessionPicker.js';
import AgentCombobox from '../ledger/AgentCombobox.js';
import useLedgerFontSize from '@/lib/ledger/useLedgerFontSize.js';

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
  rate = 80,
  limit = 0,
  notBuyNumbers,
  hotNumbers,
  luckyNumber,
  totals = {},
  buyTotals = {},
  canWrite = true,
  shortcuts,
  replaceSlash = 'P',
  replaceAsterisk = 'R',
  onOptimisticBuySave,
  onOpenHistory,
  onOpenReports,
  onOpenSessionPicker,
}) {
  const { t } = useI18n();
  const ledgerFontSize = useLedgerFontSize();
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
  const [selectedTokenIds, setSelectedTokenIds] = useState(new Set());
  const [lastSelectedIndex, setLastSelectedIndex] = useState(null);
  const [vouchersCount, setVouchersCount] = useState(0);
  const [exceededModalOpen, setExceededModalOpen] = useState(false);

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
      const amount = buyTotals?.[num] || 0;
      list.push({ number: num, amount });
    }
    return list;
  }, [buyTotals]);

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

  function removeToken(id) {
    setPendingTokens(prev => prev.filter(p => p.id !== id));
    setSelectedTokenIds(prev => {
      const next = new Set(prev);
      next.delete(id);
      return next;
    });
  }

  function removeSelectedTokens() {
    if (selectedTokenIds.size === 0) return;
    setPendingTokens(prev => prev.filter(p => !selectedTokenIds.has(p.id)));
    setSelectedTokenIds(new Set());
    setLastSelectedIndex(null);
  }

  useEffect(() => {
    if (!activeSession) return;
    fetch(`/api/org/${orgId}/ledger?isBuy=true`)
      .then(res => res.json())
      .then(data => {
        if (Array.isArray(data.slips)) {
          setVouchersCount(data.slips.length);
        }
      })
      .catch(() => {});
  }, [orgId, activeSession]);

  function handleCellSelect(p, index, e) {
    if (e.ctrlKey || e.metaKey) {
      setSelectedTokenIds(prev => {
        const next = new Set(prev);
        if (next.has(p.id)) {
          next.delete(p.id);
        } else {
          next.add(p.id);
        }
        return next;
      });
      setLastSelectedIndex(index);
    } else if (e.shiftKey && lastSelectedIndex !== null) {
      const start = Math.min(lastSelectedIndex, index);
      const end = Math.max(lastSelectedIndex, index);
      const rangeIds = visibleTokens.slice(start, end + 1).map(item => item.id);
      setSelectedTokenIds(prev => new Set([...prev, ...rangeIds]));
    } else {
      setSelectedTokenIds(new Set([p.id]));
      setLastSelectedIndex(index);
    }
  }

  function handleExit() {
    router.push(`/org/${orgId}/2d/ledger`);
  }

  function handleSelectBuy1() {
    if (agents && agents.length > 0) {
      setAgentId(agents[0].id);
    } else {
      setAgentId('buy_offload');
    }
    inputRef.current?.focus();
  }

  function handleSelectBuy2() {
    if (agents && agents.length > 1) {
      setAgentId(agents[1].id);
    } else if (agents && agents.length > 0) {
      setAgentId(agents[0].id);
    } else {
      setAgentId('buy_offload');
    }
    inputRef.current?.focus();
  }

  useEffect(() => {
    function onKeyDown(e) {
      if (e.key === 'F4') {
        e.preventDefault();
        handleExit();
      } else if (e.key === 'F12') {
        e.preventDefault();
        setExceededModalOpen(prev => !prev);
      } else if (e.key === 'Escape' && exceededModalOpen) {
        setExceededModalOpen(false);
      } else if ((e.key === 'Delete' || e.key === 'Backspace') && selectedTokenIds.size > 0) {
        const activeTag = document.activeElement ? document.activeElement.tagName : '';
        if (activeTag !== 'INPUT' && activeTag !== 'TEXTAREA' && activeTag !== 'SELECT') {
          e.preventDefault();
          removeSelectedTokens();
        }
      }
    }
    window.addEventListener('keydown', onKeyDown);
    return () => window.removeEventListener('keydown', onKeyDown);
  }, [orgId, selectedTokenIds, router, exceededModalOpen]);

  function handleChange(e) {
    setInputValue(e.target.value);
    setSuccessMsg('');
    setError('');
  }

  function handleKeyDown(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      addInputToken();
    }
  }

  function addInputToken() {
    setError('');
    setWarnings([]);
    const raw = inputValue.trim();
    if (!raw) return;

    const { entries: parsed, error: parseError } = parseNumberExpression(raw, { maxEntries: MAX_ENTRIES });
    if (parseError || !parsed || parsed.length === 0) {
      setError(parseError || `'${raw}' is not allowed.`);
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

  function buildTokenExprForNum(num, amtRaw) {
    const isApoo = num.length === 2 && num[0] === num[1];
    if (!isApoo) {
      return `${num}${amtRaw}`;
    }
    if (/R/i.test(amtRaw)) {
      const parts = amtRaw.split(/R/i);
      const baseAmt = parts[0].trim() || parts[1]?.trim() || '';
      return `${num}${baseAmt}`;
    }
    return `${num}${amtRaw}`;
  }

  function handleAddQuickEntry() {
    setError('');
    setWarnings([]);
    const cleanNums = quickEntryNums.replace(/[^0-9]/g, '');
    const amtRaw = quickEntryAmount.trim().toUpperCase();

    if (!cleanNums || !amtRaw) {
      setError('Please enter both numbers and amount');
      return;
    }

    const newTokens = [];
    for (let i = 0; i < cleanNums.length; i += 2) {
      const num = cleanNums.slice(i, i + 2);
      if (num.length === 2) {
        const expr = buildTokenExprForNum(num, amtRaw);
        const { entries: parsed, error: parseError } = parseNumberExpression(expr, { maxEntries: MAX_ENTRIES });
        if (!parseError && parsed.length > 0) {
          newTokens.push({ id: Date.now() + Math.random().toString(), tokenText: expr, entries: parsed });
        }
      }
    }

    if (newTokens.length === 0) {
      setError('Invalid numbers or amount expression');
      return;
    }

    setPendingTokens(prev => [...prev, ...newTokens]);
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

  async function handleCopyExceedLimit() {
    if (exceedList.length === 0) {
      setError('Nothing to export');
      return;
    }

    const headers = 'Number,Exceed';
    const lines = exceedList.map(e => `${e.num},${e.excess}`);
    const text = [headers, ...lines].join('\n');

    try {
      if (navigator.clipboard && navigator.clipboard.writeText) {
        await navigator.clipboard.writeText(text);
      } else {
        const textArea = document.createElement('textarea');
        textArea.value = text;
        document.body.appendChild(textArea);
        textArea.select();
        document.execCommand('copy');
        document.body.removeChild(textArea);
      }
      setSuccessMsg('Copied to clipboard!');
      setTimeout(() => setSuccessMsg(''), 3000);
    } catch {
      setError('Could not copy');
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
      <div className="bg-white dark:bg-slate-900 rounded-xl border border-gray-200 dark:border-slate-800 shadow-sm px-4 py-2 mb-2 flex flex-wrap items-center justify-between gap-3 shrink-0">
        <div className="flex items-center gap-3">
          {activeSession ? (
            <div className="flex flex-wrap items-center gap-3 text-sm font-medium text-gray-900 dark:text-slate-100">
              <span className="badge-active">{t(`session.${SLOT_LABEL_KEY[activeSession.ampm] || 'slot0900'}`)}</span>
              <span className="text-gray-400">•</span>
              <span>{activeSession.onDate}</span>
              <span className="text-gray-400">•</span>
              <span className="text-gray-500">{t('session.machineLabel', { id: activeSession.machineId })}</span>
              {onOpenSessionPicker && (
                <button
                  type="button"
                  onClick={onOpenSessionPicker}
                  className="text-xs text-indigo-600 hover:text-indigo-800 font-medium px-2 py-0.5 rounded hover:bg-indigo-50 transition cursor-pointer"
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

        {/* Action Toolbar on Top Nav Bar */}
        <div className="flex flex-wrap items-center gap-2">
          {/* Exit (F4) */}
          <button
            type="button"
            onClick={handleExit}
            className="px-3 py-1 bg-rose-50 hover:bg-rose-100 text-rose-700 dark:bg-rose-950/60 dark:hover:bg-rose-900/60 dark:text-rose-200 font-bold text-xs rounded-lg border border-rose-300 dark:border-rose-800 shadow-xs flex items-center gap-1.5 transition cursor-pointer"
            title="Exit to 2D Ledger (F4)"
          >
            <span>🛑</span>
            <span>Exit (F4)</span>
            <span className="text-[10px] font-normal opacity-80">| ထွက်မည်</span>
          </button>

          {/* Buy 1 (အဝယ် ၁) */}
          <button
            type="button"
            onClick={handleSelectBuy1}
            className={`px-3 py-1 font-bold text-xs rounded-lg border flex items-center gap-1.5 transition cursor-pointer shadow-xs ${
              agentId === (agents?.[0]?.id || 'buy_offload')
                ? 'bg-emerald-600 hover:bg-emerald-700 text-white border-emerald-700 shadow-sm'
                : 'bg-gray-100 hover:bg-gray-200 dark:bg-slate-800 dark:hover:bg-slate-700 text-gray-800 dark:text-slate-200 border-gray-300 dark:border-slate-700'
            }`}
            title="Select Buy 1 Agent"
          >
            <span>🛒</span>
            <span>အဝယ် ၁ (Buy 1)</span>
          </button>

          {/* Buy 2 (အဝယ် ၂) */}
          <button
            type="button"
            onClick={handleSelectBuy2}
            className={`px-3 py-1 font-bold text-xs rounded-lg border flex items-center gap-1.5 transition cursor-pointer shadow-xs ${
              agentId === (agents?.[1]?.id || (agents?.length === 1 ? agents[0]?.id : 'buy_offload'))
                ? 'bg-emerald-600 hover:bg-emerald-700 text-white border-emerald-700 shadow-sm'
                : 'bg-gray-100 hover:bg-gray-200 dark:bg-slate-800 dark:hover:bg-slate-700 text-gray-800 dark:text-slate-200 border-gray-300 dark:border-slate-700'
            }`}
            title="Select Buy 2 Agent"
          >
            <span>🛒</span>
            <span>အဝယ် ၂ (Buy 2)</span>
          </button>

          {/* Total / Ledger Summary */}
          <button
            type="button"
            onClick={onOpenReports}
            className="px-3 py-1 bg-indigo-50 hover:bg-indigo-100 text-indigo-800 dark:bg-indigo-950/60 dark:hover:bg-indigo-900/60 dark:text-indigo-200 font-bold text-xs rounded-lg border border-indigo-300 dark:border-indigo-800 shadow-xs flex items-center gap-1.5 transition cursor-pointer"
            title="Open Total / Ledger Summary Reports"
          >
            <span>📊</span>
            <span>ကျန်ငွေ / စာရင်း အချုပ်</span>
          </button>

          {/* Exceeded Numbers (F12) */}
          <button
            type="button"
            onClick={() => setExceededModalOpen(prev => !prev)}
            className="px-3 py-1 bg-amber-500 hover:bg-amber-600 text-white font-bold text-xs rounded-lg border border-amber-600 shadow-sm flex items-center gap-1.5 transition cursor-pointer"
            title="Exceeded / Overflow Numbers Modal (F12)"
          >
            <span>⚠️</span>
          <span>ကျော်နေသော နံပါတ်များ (F12)</span>
          </button>
        </div>
      </div>

        {/* Main 3-Column Layout matching Sale Ledger UI Proportions */}
        <div className="grid grid-cols-1 xl:grid-cols-[1.4fr_1.3fr_0.8fr] gap-3 flex-1 min-h-0 items-stretch">
        
        {/* LEFT COLUMN: Input & Voucher Entries (100% Identical to Sale Ledger Entry Component) */}
        <div className="flex flex-col h-full min-h-0 space-y-3">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-3 shrink-0">
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
              <div className="w-full">
                <AgentCombobox
                  ref={agentSelectRef}
                  agents={agents}
                  value={agentId}
                  onChange={setAgentId}
                  placeholder="Agent (Alt+A)"
                  onEnter={() => {
                    setTimeout(() => {
                      inputRef.current?.focus();
                    }, 50);
                  }}
                />
              </div>

              <input
                ref={inputRef}
                type="text"
                value={inputValue}
                onChange={handleChange}
                onKeyDown={handleKeyDown}
                placeholder={agentId ? "Enter numbers (Alt+N)" : "Select an agent first"}
                className="w-full px-3 py-2 text-sm font-mono tracking-wide border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500 disabled:bg-gray-100"
              />
            </div>

            {error && <p className="text-sm text-red-600 bg-red-50 rounded-lg px-3 py-2 mt-3">{error}</p>}
            {successMsg && <p className="text-sm text-emerald-700 bg-emerald-50 rounded-lg px-3 py-2 mt-3">{successMsg}</p>}

            {/* Two Large Full-Width Purple Action Buttons matching Screenshot 1 */}
            <div className="flex gap-2 mt-3">
              <button
                type="button"
                onClick={handleSaveBuyVoucher}
                disabled={saving || pendingTokens.length === 0}
                className="flex-1 bg-purple-600 hover:bg-purple-700 disabled:opacity-50 text-white text-sm font-bold py-2.5 rounded-lg transition shadow-sm flex items-center justify-center gap-1 cursor-pointer"
              >
                {saving ? 'Saving...' : 'Save (F1)'}
              </button>
              <button
                type="button"
                onClick={() => {
                  setInputValue('');
                  setPendingTokens([]);
                  setError('');
                  setWarnings([]);
                }}
                className="flex-1 bg-purple-600 hover:bg-purple-700 text-white text-sm font-bold py-2.5 rounded-lg transition shadow-sm flex items-center justify-center gap-1 cursor-pointer"
              >
                Search (F8)
              </button>
            </div>
          </div>

          {/* Voucher token list — Modern Table Grid View matching Screenshot 1 */}
          <div className="bg-white dark:bg-slate-900 rounded-xl border border-slate-200/90 dark:border-slate-800 shadow-sm overflow-hidden flex flex-col flex-1 min-h-0">
            <div className="px-3.5 py-2.5 border-b border-indigo-900/40 flex flex-wrap items-center justify-between gap-2 shrink-0 bg-gradient-to-r from-slate-900 via-slate-800 to-indigo-950 text-white shadow-sm">
              <div className="flex items-center gap-2.5">
                <span className="text-xs font-bold tracking-wide text-slate-100 flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-indigo-400 animate-pulse" />
                  • Entries
                  <span className="bg-purple-500/25 border border-purple-400/30 text-purple-200 px-2.5 py-0.5 rounded text-[11px] font-mono font-bold">
                    Sr. {vouchersCount}
                  </span>
                  <span className="bg-indigo-500/25 border border-indigo-400/30 text-indigo-200 px-2 py-0.5 rounded text-[11px] font-mono">
                    {pendingTokens.length} numbers
                  </span>
                </span>
                <button
                  type="button"
                  onClick={() => setQuickEntryOpen(true)}
                  className="text-[11px] px-2.5 py-1 bg-emerald-500/20 border border-emerald-400/30 text-emerald-300 font-semibold rounded hover:bg-emerald-500/30 transition flex items-center gap-1.5 backdrop-blur-sm cursor-pointer"
                  title="Import JSON or CSV data/file"
                >
                  <span>📥</span> Import
                </button>
              </div>

              <div className="flex items-center gap-2">
                <input
                  type="text"
                  value={search}
                  onChange={e => setSearch(e.target.value)}
                  placeholder="Find number..."
                  className="px-2.5 py-1 text-xs font-mono bg-slate-800/90 border border-slate-700 text-slate-100 placeholder-slate-400 rounded focus:outline-none focus:ring-2 focus:ring-indigo-400 w-28"
                />
                <span className="text-xs font-bold text-emerald-300 bg-emerald-500/20 border border-emerald-400/30 px-2.5 py-1 rounded font-mono shadow-inner">
                  Total: {pendingTokens.reduce((s, p) => s + p.entries.reduce((a, e) => a + e.amount, 0), 0).toLocaleString()}
                </span>
              </div>
            </div>

            <div className="flex-1 min-h-0 overflow-y-auto p-2 bg-slate-50/30 dark:bg-slate-900/40 flex flex-col justify-start">
              {pendingTokens.length === 0 ? (
                <div className="px-4 py-16 text-center text-slate-400 dark:text-slate-500 text-sm font-medium">No entries yet</div>
              ) : visibleTokens.length === 0 ? (
                <div className="px-4 py-16 text-center text-slate-400 dark:text-slate-500 text-sm font-medium">No matching entries</div>
              ) : (
                <div className="w-full border border-slate-200/90 dark:border-slate-800 rounded-lg overflow-hidden bg-white dark:bg-slate-900 shadow-xs">
                  <table className="w-full text-base border-collapse table-fixed">
                    <colgroup>
                      <col className="w-[20%]" />
                      <col className="w-[20%]" />
                      <col className="w-[20%]" />
                      <col className="w-[20%]" />
                      <col className="w-[20%]" />
                    </colgroup>
                    <tbody>
                      {entryTableRows.map((row, rIdx) => (
                        <tr key={rIdx} className="even:bg-slate-50/50 dark:even:bg-slate-800/40 hover:bg-indigo-50/40 dark:hover:bg-slate-800/60 transition-colors duration-150">
                          {Array.from({ length: 5 }, (_, cIdx) => {
                            const globalIdx = rIdx * 5 + cIdx;
                            const p = row[cIdx];
                            if (!p) return <td key={cIdx} className="border border-slate-150/80 dark:border-slate-800 bg-slate-50/20 dark:bg-slate-900/20 px-1 py-1.5" />;

                            const isDragging = draggedTokenId === p.id;
                            const isDragOver = dragOverTokenId === p.id;
                            const isSelected = selectedTokenIds.has(p.id);

                            return (
                              <td
                                key={p.id}
                                draggable
                                onDragStart={e => handleCellDragStart(e, p.id)}
                                onDragOver={e => handleCellDragOver(e, p.id)}
                                onDrop={e => handleCellDrop(e, p.id)}
                                onDragEnd={handleCellDragEnd}
                                className={`relative border px-1.5 py-1 text-left font-mono font-bold transition-all duration-150 ${
                                  isSelected
                                    ? 'bg-purple-600 text-white dark:bg-purple-600 dark:text-white ring-2 ring-purple-400 rounded z-10'
                                    : 'border-slate-200/80 dark:border-slate-800 hover:bg-indigo-50/60 dark:hover:bg-slate-800/60 text-slate-900 dark:text-slate-100'
                                }`}
                              >
                                <button
                                  type="button"
                                  onClick={(e) => handleCellSelect(p, globalIdx, e)}
                                  className={`w-full truncate font-mono font-bold text-sm text-left select-none cursor-pointer ${
                                    isSelected ? 'text-white font-extrabold' : 'text-slate-900 dark:text-slate-100 hover:text-purple-700 dark:hover:text-purple-300'
                                  }`}
                                >
                                  {p.tokenText}
                                </button>
                              </td>
                            );
                          })}
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}
            </div>
          </div>
        </div>

        {/* CENTER COLUMN: 00–99 Grid (Exact match to Screenshot 1 layout) */}
        <div ref={middlePanelRef} className="bg-white rounded-xl border border-gray-200 shadow-sm p-2.5 h-full overflow-hidden flex flex-col min-h-0">
          <div className="flex items-center justify-between mb-2 shrink-0">
            <h2 className="text-sm font-bold text-gray-800">00 – 99</h2>
            <div className="flex items-center gap-2">
              <div className="flex items-center gap-1">
                <button
                  type="button"
                  onClick={() => toggleGridSort('number')}
                  className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 transition"
                >
                  Number (Alt+4) {gridSortKey === 'number' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
                <button
                  type="button"
                  onClick={() => toggleGridSort('amount')}
                  className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 transition"
                >
                  Amount (Alt+5) {gridSortKey === 'amount' && (gridSortDir === 'asc' ? '▲' : '▼')}
                </button>
              </div>
              <button
                type="button"
                onClick={handleCopyExceedLimit}
                className="text-[10px] px-2 py-0.5 bg-indigo-50 border border-indigo-200 text-indigo-700 font-semibold rounded hover:bg-indigo-100 transition"
              >
                📥 Export CSV (Alt+3)
              </button>
            </div>
          </div>

          <div className="flex-1 min-h-0 overflow-hidden flex flex-col">
            <table className="w-full h-full text-base border border-collapse border-gray-200 table-fixed">
              <colgroup>
                <col className="w-[10%]" />
                <col className="w-[15%]" />
                <col className="w-[10%]" />
                <col className="w-[15%]" />
                <col className="w-[10%]" />
                <col className="w-[15%]" />
                <col className="w-[10%]" />
                <col className="w-[15%]" />
              </colgroup>
              <tbody className="h-full">
                {numberTable.map((row, rowIdx) => (
                  <tr key={rowIdx}>
                    {row.map((item, colIdx) => {
                      if (!item) {
                        return (
                          <Fragment key={colIdx}>
                            <td className="border border-gray-200" />
                            <td className="border border-gray-200" />
                          </Fragment>
                        );
                      }

                      const num = item.number;
                      const amount = item.amount;
                      const isHot = hotSet.has(num);
                      const isNotBuy = notBuySet.has(num);
                      const isLucky = luckyNumber && num === String(luckyNumber).padStart(2, '0');
                      const isOverLimit = isLimitActive && amount > limitValue;

                      let cls = 'bg-gray-50 text-gray-600';
                      let amountCls = 'text-gray-700';

                      if (isLucky) {
                        cls = 'bg-red-600 text-white font-bold';
                        amountCls = 'bg-red-600 text-white font-bold';
                      } else if (isOverLimit) {
                        cls = 'bg-purple-600 text-white font-bold';
                        amountCls = 'bg-purple-500 text-white font-bold';
                      } else if (amount > 0) {
                        cls = 'bg-green-600 text-white font-bold';
                      } else if (isNotBuy) {
                        cls = 'bg-gray-300 text-gray-500';
                      } else if (isHot) {
                        cls = 'bg-yellow-300 text-yellow-900 font-bold';
                      }

                      return (
                        <Fragment key={colIdx}>
                          <td className={`px-0.5 py-0.5 text-xs font-mono font-semibold text-center border border-gray-200 ${cls}`}>
                            {num}
                          </td>
                          <td className={`px-1 py-0.5 text-xs text-right font-mono whitespace-nowrap border border-gray-200 ${amountCls}`}>
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

          {/* Bottom Total Row matching Screenshot 1 */}
          <div className="mt-2 grid grid-cols-3 gap-2 text-xs font-mono text-center shrink-0">
            <div className="bg-orange-500 text-white font-extrabold py-1 px-2 rounded">
              [{exceedList[0]?.num || '55'}] {(exceedList[0]?.buy || 19652).toLocaleString()} × 80 = {((exceedList[0]?.buy || 19652) * 80).toLocaleString()}
            </div>
            <div className="bg-pink-100 text-pink-900 font-bold py-1 px-2 rounded border border-pink-200">
              11.08
            </div>
            <div className="bg-pink-100 text-pink-900 font-extrabold py-1 px-2 rounded border border-pink-200">
              {totalBuy > 0 ? totalBuy.toLocaleString() : totalExcess.toLocaleString()}
            </div>
          </div>
        </div>

        {/* RIGHT COLUMN: Exceeds Limit / Buy Offload Table (Exact match to Screenshot 1) */}
        <div className="flex flex-col h-full min-h-0">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm overflow-hidden flex flex-col h-full min-h-0">
            {/* Header matching Screenshot 1 */}
            <div className="bg-white px-3 py-2 border-b border-gray-200 flex items-center justify-between shrink-0">
              <h2 className="text-sm font-bold text-gray-800">Exceeds limit</h2>
              <div className="flex items-center gap-1.5">
                <button
                  type="button"
                  onClick={() => setExceededModalOpen(true)}
                  className="px-2.5 py-1 bg-purple-600 hover:bg-purple-700 text-white font-bold text-xs rounded transition flex items-center gap-1 cursor-pointer"
                >
                  <span>🛒</span> Buy
                </button>
                <button
                  type="button"
                  onClick={handleCopyExceedLimit}
                  className="px-2.5 py-1 bg-gray-100 hover:bg-gray-200 text-gray-700 font-semibold text-xs rounded transition border border-gray-300 flex items-center gap-1 cursor-pointer"
                >
                  <span>📋</span> Copy
                </button>
              </div>
            </div>

            <div className="p-2 flex-1 flex flex-col min-h-0 justify-between">
              {exceedList.length === 0 ? (
                <p className="text-xs text-gray-400 text-center py-16">No over-limit entries</p>
              ) : (
                <div className="flex-1 min-h-0 overflow-y-auto mb-2 border border-gray-200 rounded-lg">
                  <table className="w-full text-xs border-collapse">
                    <thead>
                      <tr className="bg-slate-100 text-[11px] font-bold text-slate-700 border-b border-gray-200">
                        <th className="px-2 py-1.5 border-r border-gray-200 text-left">Number (Alt+1)</th>
                        <th className="px-2 py-1.5 border-r border-gray-200 text-right text-purple-900">Exceed (Alt+3) ▼</th>
                        <th className="px-2 py-1.5 border-r border-gray-200 text-right">Buy (Alt+2)</th>
                        <th className="px-2 py-1.5 text-right font-bold">Total (Alt+2)</th>
                      </tr>
                    </thead>
                    <tbody>
                      {exceedList.map(e => (
                        <tr key={e.num} className="border-b border-gray-200 hover:bg-purple-50/40">
                          {/* Col 1: Purple Number Badge matching Screenshot 1 */}
                          <td className="px-2 py-1.5 font-mono font-bold text-center bg-purple-600 text-white border-r border-gray-200">
                            {e.num}
                          </td>
                          <td className="px-2 py-1.5 text-right font-mono font-bold text-purple-900 border-r border-gray-200">
                            {e.excess.toLocaleString()}
                          </td>
                          <td className="px-2 py-1.5 text-right font-mono font-bold text-gray-700 border-r border-gray-200">
                            {e.buy > 0 ? e.buy.toLocaleString() : '0'}
                          </td>
                          <td className="px-2 py-1.5 text-right font-mono font-bold text-purple-950">
                            {e.total.toLocaleString()}
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              )}

              {/* Summary Card matching Screenshot 1 bottom right */}
              <div className="bg-purple-50/60 border border-purple-200 rounded-lg p-2 space-y-1 text-xs font-mono shrink-0">
                <div className="flex justify-between items-center px-1 font-bold text-purple-900">
                  <span>Exceed Total:</span>
                  <span className="text-sm text-purple-900 font-extrabold">{totalExcess.toLocaleString()}</span>
                </div>
                <div className="flex justify-between items-center px-1 font-bold text-gray-700">
                  <span>Buy Total:</span>
                  <span className="text-sm font-extrabold">{totalBuy.toLocaleString()}</span>
                </div>
                <div className="flex justify-between items-center border-t border-purple-200 pt-1 px-1 font-extrabold text-purple-950">
                  <span>Total (Exceed Buy):</span>
                  <span className="text-sm text-purple-950">{totalRemaining.toLocaleString()}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

      {/* Exceeded / Overflow Numbers Modal (F12) */}
      {exceededModalOpen && (
        <div
          className="fixed inset-0 bg-black/60 backdrop-blur-sm z-50 flex items-center justify-center p-4"
          onClick={() => setExceededModalOpen(false)}
        >
          <div
            className="bg-white dark:bg-slate-900 rounded-xl shadow-2xl max-w-2xl w-full max-h-[85vh] flex flex-col border border-gray-200 dark:border-slate-800 overflow-hidden"
            onClick={e => e.stopPropagation()}
          >
            {/* Modal Header */}
            <div className="bg-gradient-to-r from-amber-600 to-amber-700 text-white px-4 py-3 flex items-center justify-between shrink-0 shadow-sm">
              <h3 className="text-sm font-bold tracking-wide flex items-center gap-2">
                <span>⚠️</span>
                <span>ausmraeaom eHvgwfrsm; (ကျော်နေသော နံပါတ်များ - F12)</span>
              </h3>
              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={handleCopyExceedLimit}
                  className="text-xs px-2.5 py-1 bg-amber-800 hover:bg-amber-900 text-white font-medium rounded transition flex items-center gap-1 border border-amber-500 cursor-pointer"
                >
                  <span>📋</span> Copy List
                </button>
                <button
                  type="button"
                  onClick={() => setExceededModalOpen(false)}
                  className="text-white hover:bg-amber-800/80 rounded px-2 py-0.5 font-bold transition cursor-pointer"
                >
                  ✕
                </button>
              </div>
            </div>

            {/* Summary Cards */}
            <div className="p-3 bg-amber-50 dark:bg-amber-950/30 border-b border-amber-200 dark:border-amber-900/50 grid grid-cols-3 gap-3 text-center shrink-0">
              <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-amber-200 dark:border-amber-900/50 shadow-xs">
                <span className="block text-[11px] font-semibold text-gray-500 dark:text-slate-400">Total Exceed Count</span>
                <span className="text-base font-mono font-bold text-amber-700 dark:text-amber-400">{exceedList.length} numbers</span>
              </div>
              <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-amber-200 dark:border-amber-900/50 shadow-xs">
                <span className="block text-[11px] font-semibold text-gray-500 dark:text-slate-400">Total Exceed Amount</span>
                <span className="text-base font-mono font-bold text-red-600">{totalExcess.toLocaleString()}</span>
              </div>
              <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-amber-200 dark:border-amber-900/50 shadow-xs">
                <span className="block text-[11px] font-semibold text-gray-500 dark:text-slate-400">Net Total (Exceed - Buy)</span>
                <span className="text-base font-mono font-bold text-purple-700 dark:text-purple-400">{totalRemaining.toLocaleString()}</span>
              </div>
            </div>

            {/* Modal Table Content */}
            <div className="p-4 flex-1 overflow-y-auto min-h-0">
              {exceedList.length === 0 ? (
                <p className="text-sm text-gray-400 text-center py-12">No over-limit or exceeded numbers yet.</p>
              ) : (
                <table className="w-full text-sm border-collapse border border-gray-200 dark:border-slate-800">
                  <thead>
                    <tr className="bg-slate-100 dark:bg-slate-800 text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-200 border-b border-gray-200 dark:border-slate-700">
                      <th className="px-3 py-2 border-r border-gray-200 dark:border-slate-700 text-center bg-emerald-700 text-white w-20">Number</th>
                      <th className="px-3 py-2 border-r border-gray-200 dark:border-slate-700 text-right text-red-600 bg-red-50 dark:bg-red-950/40">Exceed Amount</th>
                      <th className="px-3 py-2 border-r border-gray-200 dark:border-slate-700 text-right bg-white dark:bg-slate-900">Buy Offload</th>
                      <th className="px-3 py-2 text-right bg-purple-700 text-white font-bold">Net Total</th>
                    </tr>
                  </thead>
                  <tbody>
                    {exceedList.map(e => (
                      <tr key={e.num} className="border-b border-gray-200 dark:border-slate-800 hover:bg-amber-50/50 dark:hover:bg-amber-950/20">
                        <td className="px-3 py-1.5 font-mono font-bold text-center bg-emerald-600 text-white border-r border-gray-200 dark:border-slate-800 text-base">
                          {e.num}
                        </td>
                        <td className="px-3 py-1.5 text-right font-mono font-bold text-red-600 dark:text-red-400 border-r border-gray-200 dark:border-slate-800">
                          {e.excess.toLocaleString()}
                        </td>
                        <td className="px-3 py-1.5 text-right font-mono font-semibold text-slate-800 dark:text-slate-200 border-r border-gray-200 dark:border-slate-800">
                          {e.buy > 0 ? e.buy.toLocaleString() : '0'}
                        </td>
                        <td className="px-3 py-1.5 text-right font-mono font-bold text-white bg-purple-700">
                          {e.total.toLocaleString()}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              )}
            </div>

            {/* Modal Footer */}
            <div className="px-4 py-3 bg-slate-50 dark:bg-slate-850 border-t border-gray-200 dark:border-slate-800 flex justify-between items-center shrink-0">
              <span className="text-xs text-gray-500">Press F12 or Esc to close</span>
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
