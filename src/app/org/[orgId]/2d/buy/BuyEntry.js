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
import { enqueue } from '@/lib/ledger/voucherQueue.js';
import { deleteLocalVoucher, saveLocalVoucher } from '@/lib/ledger/localVoucherDb.js';
import { todayStr, getCurrentSlotKey } from '@/lib/lottery/sessionSlots.js';

const NUMBER_TABLE_COLUMNS = 4;
const ALLOWED_CHARS = /[^0-9RAGPBWNFXT+\-*/.[\]]/gi;

function normalizeInput(raw, slashRep = 'P', asteriskRep = 'R') {
  return raw.replace(ALLOWED_CHARS, '').replaceAll('/', slashRep).replaceAll('*', asteriskRep).toUpperCase();
}

function buildNumberTable(numbersList) {
  const groupSize = Math.ceil(numbersList.length / NUMBER_TABLE_COLUMNS);
  const groups = Array.from({ length: NUMBER_TABLE_COLUMNS }, (_, g) =>
    numbersList.slice(g * groupSize, (g + 1) * groupSize)
  );
  const rows = Math.max(...groups.map(g => g.length), 0);
  return Array.from({ length: rows }, (_, r) => groups.map(g => g[r] ?? null));
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

let tokenSeq = 0;
function nextTokenId() {
  tokenSeq += 1;
  return `t${Date.now()}_${tokenSeq}`;
}

function tokenFromText(rawText, t) {
  const text = rawText.trim();
  if (!text) return { token: null, error: null };
  const { entries, error } = parseNumberExpression(text, { maxEntries: MAX_ENTRIES });
  if (error) return { token: null, error };
  if (!entries.length) return { token: null, error: t ? t('ledger.couldNotParse', { text }) : `Could not parse "${text}"` };
  return { token: { id: nextTokenId(), tokenText: text, entries }, error: null };
}

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
  editingVoucher = null,
  canWrite = true,
  shortcuts,
  replaceSlash = 'P',
  replaceAsterisk = 'R',
  onOptimisticBuySave,
  onSaved,
  onCancelEdit,
  onOpenHistory,
  onOpenReports,
  onOpenBuy1,
  onOpenBuy2,
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
  const [editingId, setEditingId] = useState(null);
  const [editingSrNo, setEditingSrNo] = useState(null);
  const [error, setError] = useState('');
  const [warnings, setWarnings] = useState([]);

  useEffect(() => {
    if (!editingVoucher) return;
    const tokens = (editingVoucher.tokens || []).map(tokText => {
      const { entries } = parseNumberExpression(tokText, { maxEntries: MAX_ENTRIES });
      return { id: Math.random().toString(), tokenText: tokText, entries: entries || [] };
    });
    setPendingTokens(tokens);
    setEditingId(editingVoucher.id);
    setEditingSrNo(editingVoucher.srNo);
    const matchedAgent = agents?.find(a => a.agentName === editingVoucher.agentName);
    if (matchedAgent) {
      setAgentId(matchedAgent.id);
    } else if (editingVoucher.agentId) {
      setAgentId(editingVoucher.agentId);
    }
    setInputValue('');
    setError('');
    setWarnings([]);
    setSuccessMsg('');
  }, [editingVoucher, agents]);
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
  const saveRef = useRef(null);
  const [middlePanelHeight, setMiddlePanelHeight] = useState(0);

  const [quickEntryOpen, setQuickEntryOpen] = useState(false);
  const [quickEntryNums, setQuickEntryNums] = useState('');
  const [quickEntryAmount, setQuickEntryAmount] = useState('');
  const quickNumsRef = useRef(null);
  const quickAmountRef = useRef(null);

  const [importModalOpen, setImportModalOpen] = useState(false);
  const [importStep, setImportStep] = useState(1);
  const [importJsonText, setImportJsonText] = useState('');
  const [importPreviewItems, setImportPreviewItems] = useState([]);
  const [importSearch, setImportSearch] = useState('');

  const [cellPopup, setCellPopup] = useState(null);
  const [checkAgentOpen, setCheckAgentOpen] = useState(false);
  const [checkAgentInput, setCheckAgentInput] = useState('');
  const [checkAgentResults, setCheckAgentResults] = useState(null);
  const [checkAgentLoading, setCheckAgentLoading] = useState(false);

  const notBuySet = useMemo(() => new Set(notBuyNumbers || []), [notBuyNumbers]);
  const hotSet = useMemo(() => new Set(hotNumbers || []), [hotNumbers]);

  const limitValue = typeof limit?.limitValue === 'number' ? limit.limitValue : (limit?.num1Limit || limit?.limit || 0);
  const isLimitActive = limitValue > 0;

  const visibleTokens = useMemo(() => {
    if (!search.trim()) return pendingTokens;
    const q = search.trim().toLowerCase();
    return pendingTokens.filter(p => p.tokenText.toLowerCase().includes(q));
  }, [pendingTokens, search]);

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

  const entryTableRows = useMemo(() => {
    const cols = 5;
    const rows = [];
    for (let i = 0; i < visibleTokens.length; i += cols) {
      rows.push(visibleTokens.slice(i, i + cols));
    }
    return rows;
  }, [visibleTokens]);

  function handleCellClick(num) {
    const amt = buyTotals?.[num] || 0;
    setCellPopup({ num, amount: amt });
  }

  function openCheckAgent() {
    setCheckAgentOpen(true);
    setCheckAgentInput('');
    setCheckAgentResults(null);
  }

  async function runCheckAgent(val) {
    const clean = val.replace(/[^0-9]/g, '').slice(0, 2);
    setCheckAgentInput(clean);
    if (!clean) {
      setCheckAgentResults(null);
      return;
    }
    setCheckAgentLoading(true);
    try {
      const res = await fetch(`/api/org/${orgId}/ledger/totals?num=${clean}`);
      const data = await res.json();
      setCheckAgentResults(data.byAgent || []);
    } catch {
      setCheckAgentResults([]);
    } finally {
      setCheckAgentLoading(false);
    }
  }

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

  function formatDashInput(val) {
    const clean = val.replace(/[^0-9]/g, '');
    const chunks = [];
    for (let i = 0; i < clean.length; i += 2) {
      chunks.push(clean.slice(i, i + 2));
    }
    return chunks.join('-');
  }

  function handleQuickNumsChange(e) {
    const formatted = formatDashInput(e.target.value);
    setQuickEntryNums(formatted);
  }

  function handleQuickNumsKeyDown(e) {
    if (e.key === 'Enter') {
      e.preventDefault();
      quickAmountRef.current?.focus();
    } else if (e.key === 'Escape') {
      e.preventDefault();
      setQuickEntryOpen(false);
      inputRef.current?.focus();
    }
  }

  function handleQuickAmountKeyDown(e) {
    if (e.key === 'Tab' && e.shiftKey) {
      e.preventDefault();
      if (quickNumsRef.current) {
        quickNumsRef.current.focus();
        const len = quickNumsRef.current.value.length;
        quickNumsRef.current.setSelectionRange(len, len);
      }
      return;
    }
    if (e.key === 'Enter') {
      e.preventDefault();
      handleQuickSubmit();
    } else if (e.key === 'Escape') {
      e.preventDefault();
      if (quickNumsRef.current) {
        quickNumsRef.current.focus();
        const len = quickNumsRef.current.value.length;
        quickNumsRef.current.setSelectionRange(len, len);
      }
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

  const [editingTokenId, setEditingTokenId] = useState(null);
  const [editingTokenValue, setEditingTokenValue] = useState('');

  function removeSelectedTokens() {
    if (selectedTokenIds.size === 0) return;
    setPendingTokens(prev => prev.filter(p => !selectedTokenIds.has(p.id)));
    if (editingTokenId && selectedTokenIds.has(editingTokenId)) {
      setEditingTokenId(null);
      setEditingTokenValue('');
    }
    setSelectedTokenIds(new Set());
    setLastSelectedIndex(null);
  }

  function startTokenEdit(token) {
    setEditingTokenId(token.id);
    setEditingTokenValue(token.tokenText);
    setError('');
    setSuccessMsg('');
  }

  function cancelTokenEdit() {
    setEditingTokenId(null);
    setEditingTokenValue('');
    setError('');
    setTimeout(() => {
      inputRef.current?.focus();
    }, 50);
  }

  function commitTokenEdit(id) {
    const text = editingTokenValue.trim();
    if (!text) {
      removeToken(id);
      setEditingTokenId(null);
      setEditingTokenValue('');
      setTimeout(() => {
        inputRef.current?.focus();
      }, 50);
      return;
    }

    const { entries: parsed, error: parseError } = parseNumberExpression(text, { maxEntries: MAX_ENTRIES });
    if (parseError || !parsed || parsed.length === 0) {
      setError(parseError || `'${text}' is not allowed.`);
      return;
    }

    setPendingTokens(prev => prev.map(p => (p.id === id ? { id, tokenText: text, entries: parsed } : p)));
    setEditingTokenId(null);
    setEditingTokenValue('');
    setError('');
    setSuccessMsg('');
    setTimeout(() => {
      inputRef.current?.focus();
    }, 50);
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

  async function handleSaveBuyVoucher() {
    if (saving) return;
    setError('');
    setWarnings([]);

    const fallbackDate = todayStr();
    const fallbackSlot = getCurrentSlotKey();
    const vOnDate = editingVoucher?.onDate || activeSession?.onDate || fallbackDate;
    const vAmpm = editingVoucher?.ampm || activeSession?.ampm || fallbackSlot;
    const vOnCount = editingVoucher?.onCount || activeSession?.onCount || 1;
    const vMachineId = editingVoucher?.machineId || activeSession?.machineId || 1;

    if (editingId) {
      if (pendingTokens.length === 0) {
        setSaving(true);
        const delNo = editingSrNo;
        const sid = editingVoucher?.sessionId || `${vOnDate}_${vAmpm}_${vOnCount}`;
        try {
          await deleteLocalVoucher(editingId, orgId, sid);
          enqueue(orgId, {
            id: editingId,
            voucherId: editingId,
            action: 'delete',
            voucherType: 'buy',
            isBuyVoucher: true,
            onCount: vOnCount,
            ampm: vAmpm,
            onDate: vOnDate,
            srNo: delNo,
          });

          setPendingTokens([]);
          setInputValue('');
          setEditingId(null);
          setEditingSrNo(null);
          setSuccessMsg(`Buy Voucher #${delNo || ''} deleted successfully!`);
          if (onSaved) onSaved();
          setTimeout(() => setSuccessMsg(''), 4000);
        } catch {
          setError(t('common.failedToSave'));
        } finally {
          setSaving(false);
        }
        return;
      }

      setSaving(true);
      const updateNo = editingSrNo;
      try {
        const tokens = pendingTokens.map(p => p.tokenText);
        const items = pendingTokens.flatMap(p => p.entries);
        const amount = items.reduce((sum, it) => sum + (parseFloat(it.amount || it.value) || 0), 0);

        await saveLocalVoucher({
          id: editingId,
          clientId: editingId,
          voucherId: editingId,
          orgId,
          agentId: agentId || 'buy_offload',
          agentName: 'Buy Offload (အဝယ်စာရင်း)',
          tokens,
          items,
          entries: items,
          amount,
          onCount: vOnCount,
          ampm: vAmpm,
          onDate: vOnDate,
          machineId: vMachineId,
          voucherType: 'buy',
          isBuyVoucher: true,
          action: 'update',
          status: 'pending',
          srNo: updateNo,
        });

        enqueue(orgId, {
          id: editingId,
          voucherId: editingId,
          agentId: agentId || 'buy_offload',
          agentName: 'Buy Offload (အဝယ်စာရင်း)',
          tokens,
          items,
          entries: items,
          amount,
          onCount: vOnCount,
          ampm: vAmpm,
          onDate: vOnDate,
          machineId: vMachineId,
          voucherType: 'buy',
          isBuyVoucher: true,
          action: 'update',
          srNo: updateNo,
        });

        setPendingTokens([]);
        setInputValue('');
        setEditingId(null);
        setEditingSrNo(null);
        setSuccessMsg(`Buy Voucher #${updateNo || ''} updated successfully!`);
        if (onSaved) onSaved();
        setTimeout(() => setSuccessMsg(''), 4000);
      } catch (err) {
        setError(err.message || t('common.failedToSave'));
      } finally {
        setSaving(false);
      }
      return;
    }

    const tokens = pendingTokens.map(p => p.tokenText);
    const items = pendingTokens.flatMap(p => p.entries);
    if (items.length === 0 && !editingId) {
      setError(t('ledger.noEntriesError'));
      return;
    }
    const amount = items.reduce((sum, it) => sum + (parseFloat(it.amount || it.value) || 0), 0);

    const clientId = enqueue(orgId, {
      agentId: agentId || 'buy_offload',
      tokens,
      items,
      entries: items,
      amount,
      onCount: vOnCount,
      ampm: vAmpm,
      onDate: vOnDate,
      machineId: vMachineId,
      voucherType: 'buy',
      isBuyVoucher: true,
      action: 'create',
    });

    if (onOptimisticBuySave) onOptimisticBuySave(items);
    setPendingTokens([]);
    setInputValue('');
    setSuccessMsg(t('ledger.queuedMsg') || 'Buy Voucher saved successfully!');
    if (onSaved) onSaved();
    setTimeout(() => {
      setSuccessMsg('');
      inputRef.current?.focus();
    }, 3000);
  }

  useEffect(() => {
    saveRef.current = handleSaveBuyVoucher;
  });

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
      } else if ((shortcuts && matchesCombo(e, shortcuts.sale1)) || e.key === 'F7') {
        e.preventDefault();
        onOpenBuy1?.();
      } else if ((shortcuts && matchesCombo(e, shortcuts.sale2)) || e.key === 'F10') {
        e.preventDefault();
        onOpenBuy2?.();
      } else if (shortcuts && matchesCombo(e, shortcuts.clear)) {
        e.preventDefault();
        handleClear();
        inputRef.current?.focus();
      } else if (shortcuts && matchesCombo(e, shortcuts.save)) {
        e.preventDefault();
        saveRef.current?.();
      } else if (shortcuts && matchesCombo(e, shortcuts.checkAgent)) {
        e.preventDefault();
        if (checkAgentOpen) {
          setCheckAgentOpen(false);
          inputRef.current?.focus();
        } else {
          openCheckAgent();
        }
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
        toggleGridSort('amount');
      } else if (e.key === 'F4') {
        e.preventDefault();
        handleExit();
      } else if (e.key === 'F12') {
        e.preventDefault();
        setExceededModalOpen(prev => !prev);
      } else if (e.key === 'Escape') {
        if (checkAgentOpen) {
          e.preventDefault();
          setCheckAgentOpen(false);
          inputRef.current?.focus();
        } else if (exceededModalOpen) {
          setExceededModalOpen(false);
        } else if (quickEntryOpen) {
          setQuickEntryOpen(false);
          inputRef.current?.focus();
        }
      } else if ((e.key === 'Delete' || e.key === 'Backspace') && selectedTokenIds.size > 0 && !editingTokenId) {
        const activeTag = document.activeElement ? document.activeElement.tagName : '';
        if (activeTag !== 'INPUT' && activeTag !== 'TEXTAREA' && activeTag !== 'SELECT') {
          e.preventDefault();
          removeSelectedTokens();
        }
      }
    }

    window.addEventListener('keydown', handleGlobalKeyDown);
    return () => window.removeEventListener('keydown', handleGlobalKeyDown);
  }, [
    shortcuts,
    orgId,
    selectedTokenIds,
    editingTokenId,
    router,
    exceededModalOpen,
    checkAgentOpen,
    quickEntryOpen,
    inputValue,
    onOpenHistory,
    onOpenReports,
  ]);

  useEffect(() => {
    if (quickEntryOpen) {
      setTimeout(() => {
        quickNumsRef.current?.focus();
      }, 50);
    }
  }, [quickEntryOpen]);

  function handleChange(e) {
    setInputValue(normalizeInput(e.target.value, replaceSlash, replaceAsterisk));
    setSuccessMsg('');
    setError('');
  }

  function handleKeyDown(e) {
    if (e.key === ' ' || e.code === 'Space') {
      e.preventDefault();
      if (!agentId) {
        setError('Select an agent first');
        return;
      }
      setQuickEntryNums(formatDashInput(inputValue));
      setQuickEntryAmount('');
      setQuickEntryOpen(true);
      setInputValue('');
    } else if (e.key === 'Enter') {
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

  function handleQuickSubmit() {
    setError('');
    setWarnings([]);
    const cleanNums = quickEntryNums.replace(/[^0-9]/g, '');
    if (!cleanNums) {
      setError('Please enter some numbers.');
      setQuickEntryOpen(false);
      return;
    }
    const rawAmtStr = quickEntryAmount.trim().toUpperCase();
    if (!rawAmtStr) {
      setError('Please enter a valid amount.');
      setQuickEntryOpen(false);
      return;
    }

    const newTokens = [];
    const parseErrors = [];
    for (let i = 0; i < cleanNums.length; i += 2) {
      const num = cleanNums.slice(i, i + 2);
      if (num.length === 2) {
        const tokenExpr = buildTokenExprForNum(num, rawAmtStr);
        const { entries, error: parseErr } = parseNumberExpression(tokenExpr, { maxEntries: MAX_ENTRIES });
        if (parseErr) {
          parseErrors.push(parseErr);
        } else if (entries && entries.length > 0) {
          newTokens.push({
            id: Date.now() + Math.random().toString(),
            tokenText: tokenExpr,
            entries,
          });
        }
      }
    }

    if (newTokens.length === 0) {
      setError(parseErrors[0] || 'Please enter valid 2-digit numbers and amount.');
      setQuickEntryOpen(false);
      return;
    }

    setPendingTokens(prev => [...prev, ...newTokens]);
    setQuickEntryOpen(false);
    setQuickEntryNums('');
    setQuickEntryAmount('');
    setTimeout(() => {
      inputRef.current?.focus();
    }, 50);
  }

  async function handleCopyExceedLimit() {
    const validItems = exceedList.filter(e => {
      const amt = e.total !== undefined ? e.total : e.excess;
      return (typeof amt === 'number' ? amt : parseFloat(String(amt).replace(/,/g, ''))) > 0;
    });

    if (validItems.length === 0) {
      setError('Nothing to export');
      return;
    }

    const text = validItems.map(e => `${e.num} - ${e.total !== undefined ? e.total : e.excess}`).join('\n');

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

  function handleOpenImportModal() {
    setImportStep(1);
    setImportJsonText('');
    setImportPreviewItems([]);
    setImportSearch('');
    setError('');
    setImportModalOpen(true);
  }

  function handleCloseImportModal() {
    setImportModalOpen(false);
    setImportStep(1);
    setImportJsonText('');
    setImportPreviewItems([]);
    setImportSearch('');
  }

  function handleParseToPreview(rawText) {
    try {
      if (!rawText || !rawText.trim()) {
        setError('Please paste entries or select a file');
        return;
      }
      const text = rawText.trim();
      let rawItems = [];

      // 1. Try parsing as JSON first (if formatted as JSON)
      if (text.startsWith('{') || text.startsWith('[')) {
        try {
          const parsed = JSON.parse(text);
          if (Array.isArray(parsed)) {
            rawItems = parsed;
          } else if (parsed && Array.isArray(parsed.items)) {
            rawItems = parsed.items;
          } else if (parsed && typeof parsed === 'object') {
            rawItems = Object.entries(parsed).map(([num, amount]) => ({ num, amount }));
          }
        } catch {
          // If JSON parse fails, fall back to line parsing below
        }
      }

      // 2. Line-by-line parsing: supports custom "20 - 200", "20-200", "20 200", CSV "20, 200", etc.
      if (rawItems.length === 0) {
        const lines = text.split(/\r?\n/).filter(line => line.trim());
        for (const line of lines) {
          const trimmed = line.trim();
          if (/^#|^\[|^total|^num|^number|^sr|^item|^code/i.test(trimmed)) continue;

          // Check dash-separated format e.g. "20 - 200" or "20-200"
          if (trimmed.includes('-')) {
            const dashParts = trimmed.split('-').map(p => p.trim()).filter(Boolean);
            if (dashParts.length >= 2) {
              rawItems.push({ num: dashParts[0], amount: dashParts[1] });
              continue;
            }
          }

          // Check comma/semicolon/tab delimiter
          const parts = trimmed.split(/[,;\t]+/).map(p => p.trim()).filter(Boolean);

          if (parts.length >= 2) {
            let numCandidate = parts[0];
            let amtCandidate = parts[1];

            if (parts.length >= 3 && !isNaN(parseFloat(parts[2].replace(/,/g, '')))) {
              numCandidate = parts[1];
              amtCandidate = parts[2];
            }

            rawItems.push({ num: numCandidate, amount: amtCandidate });
          } else if (parts.length === 1) {
            // Space separated e.g. "20 200"
            const spaceParts = trimmed.split(/\s+/).map(p => p.trim()).filter(Boolean);
            if (spaceParts.length >= 2 && !isNaN(parseFloat(spaceParts[1].replace(/,/g, '')))) {
              rawItems.push({ num: spaceParts[0], amount: spaceParts[1] });
            } else {
              // Lottery expression e.g. "20300R200"
              const cleanedExpr = parts[0].replace(/[\s\-]+/g, '');
              if (cleanedExpr) {
                const { token } = tokenFromText(cleanedExpr, t);
                if (token && token.entries) {
                  for (const ent of token.entries) {
                    rawItems.push({ num: ent.num, amount: ent.amount });
                  }
                } else {
                  rawItems.push({ num: cleanedExpr, amount: '' });
                }
              }
            }
          }
        }
      }

      if (!rawItems.length) {
        setError('No valid entries found in data (e.g. 20 - 200)');
        return;
      }

      const previewList = [];
      for (const item of rawItems) {
        if (typeof item === 'string') {
          const { token } = tokenFromText(item, t);
          if (token && token.entries) {
            for (const ent of token.entries) {
              previewList.push({
                id: nextTokenId(),
                num: ent.num,
                amount: ent.amount,
                selected: true,
              });
            }
          }
          continue;
        }

        const rawNum = item.num ?? item.number ?? item.n ?? item.key;
        const rawAmt = item.amount ?? item.excess ?? item.amt ?? item.a ?? item.value ?? item.total;

        if (rawNum !== undefined && rawAmt !== undefined) {
          let numStr = String(rawNum).trim().replace(/[^0-9]/g, '');
          if (numStr.length === 1) numStr = '0' + numStr;
          if (numStr.length > 2) numStr = numStr.slice(-2);

          const amtVal = parseFloat(String(rawAmt).replace(/,/g, '')) || 0;

          if (numStr.length === 2 && amtVal > 0) {
            previewList.push({
              id: nextTokenId(),
              num: numStr,
              amount: amtVal,
              selected: true,
            });
          }
        }
      }

      if (previewList.length === 0) {
        setError('No valid 2-digit number & amount entries found (e.g. 20 - 200)');
        return;
      }

      setImportPreviewItems(previewList);
      setImportStep(2);
      setError('');
    } catch (err) {
      setError('Invalid entry format: ' + err.message);
    }
  }

  function handleTogglePreviewItem(id) {
    setImportPreviewItems(prev =>
      prev.map(it => (it.id === id ? { ...it, selected: !it.selected } : it))
    );
  }

  function handleUpdatePreviewAmount(id, newAmount) {
    setImportPreviewItems(prev =>
      prev.map(it => (it.id === id ? { ...it, amount: newAmount } : it))
    );
  }

  function handleRemovePreviewItem(id) {
    setImportPreviewItems(prev => prev.filter(it => it.id !== id));
  }

  function handleSelectAllPreview(select = true) {
    setImportPreviewItems(prev => prev.map(it => ({ ...it, selected: select })));
  }

  function handleFinalImport() {
    const activeItems = importPreviewItems.filter(
      it => it.selected && parseFloat(String(it.amount).replace(/,/g, '')) > 0
    );
    if (activeItems.length === 0) {
      setError('Please select at least one valid entry to import');
      return;
    }

    const newTokens = activeItems.map(item => {
      const amtVal = parseFloat(String(item.amount).replace(/,/g, '')) || 0;
      return {
        id: nextTokenId(),
        tokenText: `${item.num}${amtVal}`,
        entries: [{ num: item.num, amount: amtVal }],
      };
    });

    setPendingTokens(prev => [...prev, ...newTokens]);
    handleCloseImportModal();
    setError('');
    setSuccessMsg(`Successfully imported ${newTokens.length} entries into ${t('ledger.entries') || 'Entries'}!`);
    setTimeout(() => setSuccessMsg(''), 4000);
  }

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
              {editingSrNo && (
                <span className="px-2.5 py-0.5 bg-amber-500 text-white font-bold text-xs rounded-md shadow-xs animate-pulse">
                  Editing Buy Voucher #{editingSrNo}
                </span>
              )}
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

          {/* Buy 1 (F7) */}
          {onOpenBuy1 && (
            <button
              type="button"
              onClick={onOpenBuy1}
              className="px-3 py-1 font-bold text-xs rounded-lg border flex items-center gap-1.5 transition cursor-pointer shadow-xs bg-gray-100 hover:bg-gray-200 dark:bg-slate-800 dark:hover:bg-slate-700 text-gray-800 dark:text-slate-200 border-gray-300 dark:border-slate-700"
              title="Buy Report by Agent (F7)"
            >
              <span>📋</span>
              <span>Buy 1 (F7)</span>
            </button>
          )}

          {/* Buy 2 (F10) */}
          {onOpenBuy2 && (
            <button
              type="button"
              onClick={onOpenBuy2}
              className="px-3 py-1 font-bold text-xs rounded-lg border flex items-center gap-1.5 transition cursor-pointer shadow-xs bg-gray-100 hover:bg-gray-200 dark:bg-slate-800 dark:hover:bg-slate-700 text-gray-800 dark:text-slate-200 border-gray-300 dark:border-slate-700"
              title="Buy Summary Report (F10)"
            >
              <span>📈</span>
              <span>Buy 2 (F10)</span>
            </button>
          )}

          {/* Total / Ledger Summary (F6) */}
          <button
            type="button"
            onClick={onOpenReports}
            className="px-3 py-1 bg-indigo-50 hover:bg-indigo-100 text-indigo-800 dark:bg-indigo-950/60 dark:hover:bg-indigo-900/60 dark:text-indigo-200 font-bold text-xs rounded-lg border border-indigo-300 dark:border-indigo-800 shadow-xs flex items-center gap-1.5 transition cursor-pointer"
            title="Reports (F6)"
          >
            <span>📊</span>
            <span>Reports (F6)</span>
          </button>

          {/* Check Numbers Breakdown (Alt+G) */}
          <button
            type="button"
            onClick={() => (checkAgentOpen ? setCheckAgentOpen(false) : openCheckAgent())}
            className="px-3 py-1 bg-sky-50 hover:bg-sky-100 text-sky-800 dark:bg-sky-950/60 dark:hover:bg-sky-900/60 dark:text-sky-200 font-bold text-xs rounded-lg border border-sky-300 dark:border-sky-800 shadow-xs flex items-center gap-1.5 transition cursor-pointer"
            title={`Search number breakdown (${formatCombo(shortcuts?.checkAgent)})`}
          >
            <span>🔍</span>
            <span>Check Numbers ({formatCombo(shortcuts?.checkAgent)})</span>
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

            {/* Action Buttons matching Sale Ledger UI */}
            <div className="flex gap-2 mt-3">
              <button
                type="button"
                onClick={handleSaveBuyVoucher}
                disabled={saving || (!editingId && pendingTokens.length === 0)}
                className={`flex-1 text-white text-sm font-bold py-2.5 rounded-lg transition shadow-sm flex items-center justify-center gap-1 cursor-pointer ${
                  editingId && pendingTokens.length === 0
                    ? 'bg-rose-600 hover:bg-rose-700 font-bold shadow-md'
                    : editingId
                    ? 'bg-emerald-600 hover:bg-emerald-700'
                    : 'bg-purple-600 hover:bg-purple-700 disabled:opacity-50'
                }`}
              >
                {saving
                  ? 'Saving...'
                  : editingId
                  ? pendingTokens.length === 0
                    ? `Delete Voucher (#${editingSrNo || ''})`
                    : `Update Voucher (#${editingSrNo || ''})`
                  : `Save (${formatCombo(shortcuts?.save)})`}
              </button>
              <button
                type="button"
                onClick={() => {
                  if (editingId) {
                    setEditingId(null);
                    setEditingSrNo(null);
                    setPendingTokens([]);
                    setInputValue('');
                    setError('');
                    setWarnings([]);
                    if (onCancelEdit) onCancelEdit();
                  } else {
                    if (onOpenHistory) onOpenHistory();
                  }
                }}
                className="flex-1 bg-slate-700 hover:bg-slate-800 text-white text-sm font-bold py-2.5 rounded-lg transition shadow-sm flex items-center justify-center gap-1 cursor-pointer"
              >
                {editingId ? 'Cancel Edit' : `Search (${formatCombo(shortcuts?.history || 'f8')})`}
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
                  onClick={handleOpenImportModal}
                  className="text-[11px] px-2.5 py-1 bg-emerald-500/20 border border-emerald-400/30 text-emerald-300 font-semibold rounded hover:bg-emerald-500/30 transition flex items-center gap-1.5 backdrop-blur-sm cursor-pointer"
                  title="Import entries (e.g. 20 - 200, CSV, or JSON)"
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

            <div
              onClick={(e) => {
                if (!e.target.closest('[data-token-cell]')) {
                  setSelectedTokenIds(new Set());
                  setLastSelectedIndex(null);
                }
              }}
              className="flex-1 min-h-0 overflow-y-auto p-2 bg-slate-50/30 dark:bg-slate-900/40 flex flex-col justify-start"
            >
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
                            if (!p) return (
                              <td
                                key={cIdx}
                                onClick={(e) => {
                                  e.stopPropagation();
                                  setSelectedTokenIds(new Set());
                                  setLastSelectedIndex(null);
                                }}
                                className="border border-slate-150/80 dark:border-slate-800 bg-slate-50/20 dark:bg-slate-900/20 px-1 py-1.5 cursor-default"
                              />
                            );

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
                                {editingTokenId === p.id ? (
                                  <input
                                    type="text"
                                    data-token-cell="true"
                                    value={editingTokenValue}
                                    onChange={e => setEditingTokenValue(e.target.value.toUpperCase())}
                                    onKeyDown={e => {
                                      if (e.key === 'Enter') {
                                        e.preventDefault();
                                        commitTokenEdit(p.id);
                                      } else if (e.key === 'Escape') {
                                        e.preventDefault();
                                        cancelTokenEdit();
                                      }
                                    }}
                                    onBlur={() => commitTokenEdit(p.id)}
                                    autoFocus
                                    className="w-full px-1 py-0.5 font-mono text-sm border-2 border-purple-500 rounded text-purple-950 dark:text-slate-100 dark:bg-slate-800 text-left font-bold shadow-inner ring-2 ring-purple-200"
                                  />
                                ) : (
                                  <button
                                    type="button"
                                    data-token-cell="true"
                                    onClick={(e) => {
                                      e.stopPropagation();
                                      handleCellSelect(p, globalIdx, e);
                                    }}
                                    onDoubleClick={(e) => {
                                      e.stopPropagation();
                                      startTokenEdit(p);
                                    }}
                                    onKeyDown={(e) => {
                                      if (e.key === 'Enter') {
                                        e.stopPropagation();
                                        e.preventDefault();
                                        startTokenEdit(p);
                                      } else if (e.key === 'Delete' || e.key === 'Backspace') {
                                        e.stopPropagation();
                                        e.preventDefault();
                                        removeSelectedTokens();
                                      }
                                    }}
                                    className={`w-full truncate font-mono font-bold text-sm text-left select-none cursor-pointer ${
                                      isSelected ? 'text-white font-extrabold' : 'text-slate-900 dark:text-slate-100 hover:text-purple-700 dark:hover:text-purple-300'
                                    }`}
                                    title="Click to select, double-click to edit cell inline, press Delete to remove"
                                  >
                                    {p.tokenText}
                                  </button>
                                )}
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

        {/* CENTER COLUMN: 00–99 Buy Grid (Moved to middle between Left Entry & Right Exceeded list) */}
        <div ref={middlePanelRef} className="bg-white dark:bg-slate-900 rounded-xl border border-gray-200 dark:border-slate-800 shadow-sm p-2.5 h-full overflow-hidden flex flex-col min-h-0">
          <div className="flex items-center justify-between mb-2 shrink-0">
            <h2 className="text-sm font-bold text-gray-800 dark:text-gray-200">00 – 99 Buy Grid (ဝယ်ယူထားသော စာရင်း)</h2>
            <div className="flex items-center gap-1">
              <button
                type="button"
                onClick={() => toggleGridSort('number')}
                className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 dark:hover:bg-slate-800 transition"
              >
                Num {gridSortKey === 'number' && (gridSortDir === 'asc' ? '▲' : '▼')}
              </button>
              <button
                type="button"
                onClick={() => toggleGridSort('amount')}
                className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 dark:hover:bg-slate-800 transition"
              >
                Amt {gridSortKey === 'amount' && (gridSortDir === 'asc' ? '▲' : '▼')}
              </button>
            </div>
          </div>

          <div className="flex-1 min-h-0 overflow-hidden flex flex-col">
            <table className="w-full h-full text-base border border-collapse border-gray-200 dark:border-slate-800 table-fixed">
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
                            <td className="border border-gray-200 dark:border-slate-800" />
                            <td className="border border-gray-200 dark:border-slate-800" />
                          </Fragment>
                        );
                      }

                      const num = item.number;
                      const amount = item.amount;
                      const isHot = hotSet.has(num);
                      const isNotBuy = notBuySet.has(num);
                      const isLucky = luckyNumber && num === String(luckyNumber).padStart(2, '0');

                      let cls = 'bg-gray-50 dark:bg-slate-800 text-gray-600 dark:text-slate-300';
                      let amountCls = 'text-gray-700 dark:text-slate-200';

                      if (isLucky) {
                        cls = 'bg-red-600 text-white font-bold';
                        amountCls = 'bg-red-600 text-white font-bold';
                      } else if (amount > 0) {
                        cls = 'bg-emerald-600 text-white font-bold';
                        amountCls = 'bg-emerald-50 dark:bg-emerald-950/40 text-emerald-900 dark:text-emerald-200 font-bold';
                      } else if (isNotBuy) {
                        cls = 'bg-gray-300 dark:bg-slate-700 text-gray-500';
                      } else if (isHot) {
                        cls = 'bg-yellow-300 text-yellow-900 font-bold';
                      }

                      return (
                        <Fragment key={colIdx}>
                          <td
                            onClick={() => handleCellClick(num)}
                            title={amount > 0 ? `${num}: ${amount.toLocaleString()}` : num}
                            className={`px-0.5 py-0.5 text-xs font-mono font-semibold text-center cursor-pointer hover:opacity-90 transition border border-gray-200 dark:border-slate-800 ${cls}`}
                          >
                            {num}
                          </td>
                          <td
                            onClick={() => handleCellClick(num)}
                            className={`px-1 py-0.5 text-xs text-right font-mono whitespace-nowrap cursor-pointer hover:opacity-90 transition border border-gray-200 dark:border-slate-800 ${amountCls}`}
                          >
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

        {/* RIGHT COLUMN: Exceeded / Buy Offload Table (Moved to right column) */}
        <div className="flex flex-col h-full min-h-0">
          <div className="bg-white dark:bg-slate-900 rounded-xl border border-gray-200 dark:border-slate-800 shadow-sm overflow-hidden flex flex-col h-full min-h-0">
            {/* Header */}
            <div className="bg-gradient-to-r from-emerald-900 via-emerald-800 to-teal-900 text-white px-3 py-1.5 flex items-center justify-between shrink-0 shadow-sm">
              <h2 className="text-xs font-bold tracking-wide flex items-center gap-1.5">
                <span>⚠️</span>
                <span>Exceeded List</span>
              </h2>
              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={handleCopyExceedLimit}
                  className="text-xs px-2.5 py-0.5 bg-emerald-700 hover:bg-emerald-600 text-white font-medium rounded transition flex items-center gap-1 border border-emerald-500 cursor-pointer"
                >
                  <span>📋</span> Copy
                </button>
              </div>
            </div>

            <div className="p-2.5 flex-1 flex flex-col min-h-0 justify-between">
              <div className="flex-1 min-h-0 overflow-y-auto mb-2 border border-gray-200 dark:border-slate-800 rounded-lg">
                <table className="w-full text-xs border-collapse">
                  <thead>
                    <tr className="bg-slate-100 dark:bg-slate-800 text-xs font-bold text-slate-700 dark:text-slate-200 border-b border-gray-200 dark:border-slate-700">
                      <th className="px-1 py-1.5 border-r border-gray-200 dark:border-slate-700 text-center w-16 bg-purple-700 text-white font-bold">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('num')}
                          className="hover:text-purple-200 transition font-bold flex items-center justify-center gap-0.5 mx-auto text-white cursor-pointer w-full"
                          title="Sort by Number (Alt+1)"
                        >
                          Number
                          {exceedSortKey === 'num' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1 py-1.5 border-r border-gray-200 dark:border-slate-700 text-right bg-purple-50 dark:bg-purple-950/40 text-purple-900 dark:text-purple-300 font-extrabold">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('excess')}
                          className="hover:text-purple-700 dark:hover:text-purple-200 transition font-extrabold flex items-center justify-end gap-0.5 ml-auto text-purple-900 dark:text-purple-300 cursor-pointer w-full"
                          title="Sort by Exceed Amount (Alt+3)"
                        >
                          Exceed
                          {exceedSortKey === 'excess' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1 py-1.5 border-r border-gray-200 dark:border-slate-700 text-right bg-emerald-50 dark:bg-emerald-950/40 font-bold text-emerald-700 dark:text-emerald-400">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('buy')}
                          className="hover:text-emerald-800 dark:hover:text-emerald-200 transition font-bold flex items-center justify-end gap-0.5 ml-auto text-emerald-700 dark:text-emerald-400 cursor-pointer w-full"
                          title="Sort by Buy Offload"
                        >
                          Buy
                          {exceedSortKey === 'buy' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1 py-1.5 text-right bg-indigo-50 dark:bg-indigo-950/40 font-extrabold text-indigo-900 dark:text-indigo-300">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('total')}
                          className="hover:text-indigo-700 dark:hover:text-indigo-200 transition font-extrabold flex items-center justify-end gap-0.5 ml-auto text-indigo-900 dark:text-indigo-300 cursor-pointer w-full"
                          title="Sort by Net Total (Alt+2)"
                        >
                          Total
                          {exceedSortKey === 'total' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {exceedList.length === 0 ? (
                      <tr>
                        <td colSpan={4} className="px-4 py-12 text-center text-slate-400 dark:text-slate-500 text-xs font-medium">
                          {!isLimitActive
                            ? 'No active limit (Buy vouchers will appear here when entered)'
                            : 'No over-limit or buy entries for this session'}
                        </td>
                      </tr>
                    ) : (
                      exceedList.map(e => (
                        <tr key={e.num} className="border-b border-gray-200 dark:border-slate-800 hover:bg-purple-50/40 dark:hover:bg-slate-800/60">
                          {/* Col 1: Purple Number Badge */}
                          <td className="px-2 py-1 font-mono font-bold text-center bg-purple-600 text-white border-r border-gray-200 text-xs">
                            {e.num}
                          </td>
                          <td className="px-2 py-1 text-right font-mono font-extrabold text-purple-900 dark:text-purple-300 border-r border-gray-200 text-xs">
                            {e.excess.toLocaleString()}
                          </td>
                          <td className="px-2 py-1 text-right font-mono font-bold text-emerald-800 dark:text-emerald-400 border-r border-gray-200 text-xs">
                            {e.buy > 0 ? `-${e.buy.toLocaleString()}` : '0'}
                          </td>
                          <td className="px-2 py-1 text-right font-mono font-extrabold text-slate-900 dark:text-slate-100 text-xs">
                            {e.total.toLocaleString()}
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>

              {/* Summary Card */}
              <div className="bg-purple-50/60 dark:bg-purple-950/20 border border-purple-200 dark:border-purple-800/40 rounded-lg p-2 space-y-1 text-xs font-mono shrink-0">
                <div className="flex justify-between items-center px-1 font-bold text-purple-900 dark:text-purple-300">
                  <span>Exceed Total:</span>
                  <span className="text-xs text-purple-900 dark:text-purple-200 font-bold">{totalExcess.toLocaleString()}</span>
                </div>
                <div className="flex justify-between items-center px-1 font-bold text-emerald-800 dark:text-emerald-300">
                  <span>Buy Total:</span>
                  <span className="text-xs font-bold">{totalBuy > 0 ? `-${totalBuy.toLocaleString()}` : '0'}</span>
                </div>
                <div className="flex justify-between items-center border-t border-purple-200 dark:border-purple-800/40 pt-1 px-1 font-bold text-slate-950 dark:text-slate-100 text-xs">
                  <span>Total (Exceed - Buy):</span>
                  <span className="text-sm font-bold text-purple-950 dark:text-purple-100">{totalRemaining.toLocaleString()}</span>
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
                <span className="text-xs font-mono font-bold text-amber-700 dark:text-amber-400">{exceedList.length} numbers</span>
              </div>
              <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-amber-200 dark:border-amber-900/50 shadow-xs">
                <span className="block text-[11px] font-semibold text-gray-500 dark:text-slate-400">Total Exceed Amount</span>
                <span className="text-xs font-mono font-bold text-red-600">{totalExcess.toLocaleString()}</span>
              </div>
              <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-amber-200 dark:border-amber-900/50 shadow-xs">
                <span className="block text-[11px] font-semibold text-gray-500 dark:text-slate-400">Net Total (Exceed - Buy)</span>
                <span className="text-xs font-mono font-bold text-purple-700 dark:text-purple-400">{totalRemaining.toLocaleString()}</span>
              </div>
            </div>

            {/* Modal Table Content */}
            <div className="p-4 flex-1 overflow-y-auto min-h-0">
              {exceedList.length === 0 ? (
                <p className="text-xs text-gray-400 text-center py-12">No over-limit or exceeded numbers yet.</p>
              ) : (
                <table className="w-full text-xs border-collapse border border-gray-200 dark:border-slate-800">
                  <thead>
                    <tr className="bg-slate-100 dark:bg-slate-800 text-xs font-bold uppercase tracking-wider text-slate-700 dark:text-slate-200 border-b border-gray-200 dark:border-slate-700">
                      <th className="px-1 py-1.5 border-r border-gray-200 dark:border-slate-700 text-center bg-emerald-700 text-white w-16">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('num')}
                          className="hover:text-emerald-200 transition font-bold flex items-center justify-center gap-0.5 mx-auto text-white cursor-pointer w-full"
                        >
                          Number
                          {exceedSortKey === 'num' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1 py-1.5 border-r border-gray-200 dark:border-slate-700 text-right text-red-600 bg-red-50 dark:bg-red-950/40">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('excess')}
                          className="hover:text-red-700 dark:hover:text-red-300 transition font-bold flex items-center justify-end gap-0.5 ml-auto text-red-600 dark:text-red-400 cursor-pointer w-full"
                        >
                          Exceed Amount
                          {exceedSortKey === 'excess' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1 py-1.5 border-r border-gray-200 dark:border-slate-700 text-right bg-white dark:bg-slate-900">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('buy')}
                          className="hover:text-slate-700 dark:hover:text-slate-200 transition font-bold flex items-center justify-end gap-0.5 ml-auto text-slate-700 dark:text-slate-200 cursor-pointer w-full"
                        >
                          Buy Offload
                          {exceedSortKey === 'buy' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                      <th className="px-1 py-1.5 text-right bg-purple-700 text-white font-bold">
                        <button
                          type="button"
                          onClick={() => toggleExceedSort('total')}
                          className="hover:text-purple-200 transition font-bold flex items-center justify-end gap-0.5 ml-auto text-white cursor-pointer w-full"
                        >
                          Net Total
                          {exceedSortKey === 'total' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                        </button>
                      </th>
                    </tr>
                  </thead>
                  <tbody>
                    {exceedList.map(e => (
                      <tr key={e.num} className="border-b border-gray-200 dark:border-slate-800 hover:bg-amber-50/50 dark:hover:bg-amber-950/20">
                        <td className="px-2 py-1 font-mono font-bold text-center bg-emerald-600 text-white border-r border-gray-200 dark:border-slate-800 text-xs">
                          {e.num}
                        </td>
                        <td className="px-2 py-1 text-right font-mono font-bold text-red-600 dark:text-red-400 border-r border-gray-200 dark:border-slate-800 text-xs">
                          {e.excess.toLocaleString()}
                        </td>
                        <td className="px-2 py-1 text-right font-mono font-semibold text-slate-800 dark:text-slate-200 border-r border-gray-200 dark:border-slate-800 text-xs">
                          {e.buy > 0 ? `-${e.buy.toLocaleString()}` : '0'}
                        </td>
                        <td className="px-2 py-1 text-right font-mono font-bold text-white bg-purple-700 text-xs">
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
        <div className="fixed inset-0 bg-black/40 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-xl shadow-2xl border border-gray-200 max-w-md w-full overflow-hidden animate-in fade-in zoom-in duration-150">
            {/* Header */}
            <div className="px-5 py-4 border-b border-gray-100 flex items-center justify-between">
              <h3 className="text-sm font-semibold text-gray-800">Quick Entry</h3>
              <button
                type="button"
                onClick={() => {
                  setQuickEntryOpen(false);
                  inputRef.current?.focus();
                }}
                className="text-gray-400 hover:text-gray-600 text-base cursor-pointer"
                aria-label={t('common.close')}
              >
                ✕
              </button>
            </div>
            {/* Body */}
            <div className="p-5 space-y-4">
              <div>
                <label className="block text-xs font-semibold text-gray-600 mb-1.5">
                  Enter Numbers Here
                </label>
                <input
                  ref={quickNumsRef}
                  type="text"
                  value={quickEntryNums}
                  onChange={handleQuickNumsChange}
                  onKeyDown={handleQuickNumsKeyDown}
                  onFocus={e => {
                    const len = e.target.value.length;
                    e.target.setSelectionRange(len, len);
                  }}
                  placeholder="Enter Numbers Here"
                  className="w-full px-3 py-2 text-sm font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                />
              </div>

              <div>
                <label className="block text-xs font-semibold text-gray-600 mb-1.5">
                  Amount
                </label>
                <input
                  ref={quickAmountRef}
                  type="text"
                  value={quickEntryAmount}
                  onChange={e => {
                    let val = normalizeInput(e.target.value, replaceSlash, replaceAsterisk);
                    val = val.replace(/[*\/]/g, 'R').replace(/[^0-9rR]/gi, '').toUpperCase();
                    setQuickEntryAmount(val);
                  }}
                  onKeyDown={handleQuickAmountKeyDown}
                  placeholder="100, R100, or 100R50"
                  className="w-full px-3 py-2 text-sm font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500"
                />
              </div>
            </div>

            {/* Footer */}
            <div className="px-5 py-3.5 bg-gray-50 border-t border-gray-100 flex justify-end gap-2">
              <button
                type="button"
                onClick={() => {
                  setQuickEntryOpen(false);
                  inputRef.current?.focus();
                }}
                className="px-4 py-2 text-xs font-semibold border border-gray-300 rounded-lg hover:bg-gray-100 transition cursor-pointer"
              >
                Cancel
              </button>
              <button
                type="button"
                onClick={handleQuickSubmit}
                className="px-4 py-2 text-xs font-semibold text-white bg-purple-600 hover:bg-purple-700 rounded-lg transition cursor-pointer"
              >
                Submit
              </button>
            </div>
          </div>
        </div>
      )}

      {checkAgentOpen && (
        <div
          className="fixed inset-0 bg-black/50 backdrop-blur-xs z-50 flex items-center justify-center p-4"
          onClick={() => setCheckAgentOpen(false)}
        >
          <div
            className="bg-white dark:bg-slate-900 rounded-xl shadow-2xl border border-gray-200 dark:border-slate-800 max-w-sm w-full p-4 space-y-3"
            onClick={e => e.stopPropagation()}
          >
            <div className="flex items-center justify-between border-b border-gray-100 dark:border-slate-800 pb-2">
              <h3 className="text-sm font-bold text-gray-800 dark:text-slate-100 flex items-center gap-1.5">
                <span>🔍</span>
                <span>Search Number Breakdown</span>
              </h3>
              <button
                type="button"
                onClick={() => setCheckAgentOpen(false)}
                className="text-gray-400 hover:text-gray-600 text-sm font-bold cursor-pointer"
              >
                ✕
              </button>
            </div>
            <input
              type="text"
              value={checkAgentInput}
              onChange={e => runCheckAgent(e.target.value)}
              placeholder="Search 2-digit number (e.g. 00-99)"
              autoFocus
              className="w-full px-3 py-2 text-sm font-mono text-center border border-gray-300 dark:border-slate-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-500 text-slate-900 dark:text-slate-100 dark:bg-slate-800"
            />
            <div className="space-y-1.5 max-h-56 overflow-y-auto pt-1">
              {checkAgentLoading ? (
                <p className="text-xs text-gray-400 text-center py-4">Loading...</p>
              ) : checkAgentResults === null ? (
                <p className="text-xs text-gray-400 text-center py-4">Enter a 2-digit number to check total buy entries</p>
              ) : checkAgentResults.length === 0 ? (
                <p className="text-xs text-gray-400 text-center py-4">No buy entries found for this number</p>
              ) : (
                checkAgentResults.map(r => (
                  <div key={r.agentName} className="flex items-center justify-between text-xs bg-purple-50 dark:bg-purple-950/40 rounded-lg p-2 border border-purple-200 dark:border-purple-800/40">
                    <span className="font-medium text-purple-900 dark:text-purple-200">{r.agentName}</span>
                    <span className="font-mono font-bold text-purple-800 dark:text-purple-300">{r.total.toLocaleString()}</span>
                  </div>
                ))
              )}
            </div>
          </div>
        </div>
      )}

      {cellPopup && (
        <div className="fixed bottom-6 right-6 bg-white dark:bg-slate-900 rounded-xl shadow-xl border border-gray-200 dark:border-slate-800 px-6 py-4 text-center min-w-[180px] z-50 relative">
          <button
            type="button"
            onClick={() => setCellPopup(null)}
            className="absolute top-1.5 right-2 text-gray-400 hover:text-gray-600 text-sm cursor-pointer"
            aria-label="Close"
          >
            ✕
          </button>
          <p className="font-mono text-3xl font-bold text-gray-900 dark:text-slate-100">
            {cellPopup.num}
            {cellPopup.num === luckyNumber && <span className="ml-2 align-middle text-lg">🎯</span>}
          </p>
          <p className="text-xs text-gray-500 dark:text-slate-400 mt-1">Buy Total Amount</p>
          <p className="text-xl font-semibold text-purple-700 dark:text-purple-400">{cellPopup.amount.toLocaleString()}</p>
        </div>
      )}
      {/* Import Entries Modal */}
      {importModalOpen && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-xs z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl p-6 shadow-2xl border border-gray-100 max-w-2xl w-full max-h-[90vh] flex flex-col space-y-4">
            {/* Modal Header */}
            <div className="flex items-center justify-between border-b border-gray-100 pb-3 shrink-0">
              <div className="flex items-center gap-3">
                <h3 className="text-base font-bold text-gray-900 flex items-center gap-2">
                  <span>📥</span> Import Entries
                </h3>
                {/* Step indicator pills */}
                <div className="flex items-center gap-1.5 text-xs font-semibold">
                  <button
                    type="button"
                    onClick={() => setImportStep(1)}
                    className={`px-2.5 py-0.5 rounded-full transition cursor-pointer ${
                      importStep === 1
                        ? 'bg-emerald-600 text-white shadow-xs'
                        : 'bg-emerald-50 text-emerald-700 hover:bg-emerald-100'
                    }`}
                  >
                    1. Import Tokens
                  </button>
                  <span className="text-gray-400">→</span>
                  <button
                    type="button"
                    disabled={importPreviewItems.length === 0}
                    onClick={() => importPreviewItems.length > 0 && setImportStep(2)}
                    className={`px-2.5 py-0.5 rounded-full transition ${
                      importStep === 2
                        ? 'bg-emerald-600 text-white shadow-xs'
                        : importPreviewItems.length > 0
                        ? 'bg-gray-100 text-gray-700 hover:bg-gray-200 cursor-pointer'
                        : 'bg-gray-100 text-gray-400 cursor-not-allowed'
                    }`}
                  >
                    2. Preview & Edit
                  </button>
                </div>
              </div>
              <button
                type="button"
                onClick={handleCloseImportModal}
                className="text-gray-400 hover:text-gray-600 text-lg font-bold px-2 cursor-pointer"
              >
                ✕
              </button>
            </div>

            {error && (
              <div className="p-2.5 bg-red-50 border border-red-200 text-red-700 text-xs rounded-lg flex items-center justify-between shrink-0">
                <span>{error}</span>
                <button type="button" onClick={() => setError('')} className="font-bold ml-2">✕</button>
              </div>
            )}

            {/* Step 1: Input Data */}
            {importStep === 1 && (
              <div className="space-y-4 overflow-y-auto flex-1 min-h-0 py-1">
                <div>
                  <label className="block text-xs font-semibold text-gray-700 mb-1.5">
                    1. Choose File (.txt, .csv, .json)
                  </label>
                  <input
                    type="file"
                    accept=".txt,.csv,.json,text/plain,text/csv,application/json"
                    onChange={(e) => {
                      const file = e.target.files?.[0];
                      if (file) {
                        const reader = new FileReader();
                        reader.onload = (evt) => {
                          setImportJsonText(evt.target?.result || '');
                        };
                        reader.readAsText(file);
                      }
                    }}
                    className="block w-full text-xs text-gray-500 file:mr-3 file:py-1.5 file:px-3 file:rounded-lg file:border-0 file:text-xs file:font-medium file:bg-emerald-50 file:text-emerald-700 hover:file:bg-emerald-100 cursor-pointer"
                  />
                </div>

                <div>
                  <label className="block text-xs font-semibold text-gray-700 mb-1.5">
                    2. Or Paste Entries Directly (e.g. 20 - 200)
                  </label>
                  <textarea
                    rows={8}
                    value={importJsonText}
                    onChange={(e) => setImportJsonText(e.target.value)}
                    placeholder={`Paste entries here (number - amount)...\n\nExample:\n20 - 200\n12 - 1000\n16 - 700\n26 - 700`}
                    className="w-full p-2.5 text-xs font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-emerald-500 text-slate-900"
                  />
                </div>
              </div>
            )}

            {/* Step 2: Preview & Edit Tokens */}
            {importStep === 2 && (
              <div className="flex flex-col flex-1 min-h-0 space-y-3">
                {/* Stats and toolbar */}
                <div className="p-3 bg-emerald-50/70 border border-emerald-200/80 rounded-xl flex flex-wrap items-center justify-between gap-2 shrink-0">
                  <div className="flex items-center gap-4 text-xs font-mono">
                    <div>
                      <span className="text-gray-500">Total: </span>
                      <strong className="text-gray-900 font-bold">{importPreviewItems.length}</strong>
                    </div>
                    <div>
                      <span className="text-gray-500">Selected: </span>
                      <strong className="text-emerald-700 font-bold">
                        {importPreviewItems.filter(it => it.selected).length}
                      </strong>
                    </div>
                    <div>
                      <span className="text-gray-500">Total Amount: </span>
                      <strong className="text-indigo-700 font-bold">
                        {importPreviewItems
                          .filter(it => it.selected)
                          .reduce((sum, it) => sum + (parseFloat(String(it.amount).replace(/,/g, '')) || 0), 0)
                          .toLocaleString()}
                      </strong>
                    </div>
                  </div>

                  <div className="flex items-center gap-2">
                    <button
                      type="button"
                      onClick={() => handleSelectAllPreview(true)}
                      className="text-[11px] px-2.5 py-1 bg-white border border-emerald-300 text-emerald-700 font-semibold rounded hover:bg-emerald-100 transition cursor-pointer"
                    >
                      Select All
                    </button>
                    <button
                      type="button"
                      onClick={() => handleSelectAllPreview(false)}
                      className="text-[11px] px-2.5 py-1 bg-white border border-gray-300 text-gray-700 font-semibold rounded hover:bg-gray-100 transition cursor-pointer"
                    >
                      Deselect All
                    </button>
                  </div>
                </div>

                {/* Filter and search */}
                <div className="flex items-center justify-between gap-2 shrink-0">
                  <span className="text-xs text-gray-500">Edit amounts or uncheck numbers to skip:</span>
                  <input
                    type="text"
                    value={importSearch}
                    onChange={(e) => setImportSearch(e.target.value)}
                    placeholder="Filter number..."
                    className="px-2.5 py-1 text-xs font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-1 focus:ring-emerald-500 w-36 text-slate-900"
                  />
                </div>

                {/* Table list of numbers */}
                <div className="flex-1 min-h-[220px] max-h-[360px] overflow-y-auto border border-gray-200 rounded-xl">
                  <table className="w-full text-xs text-left border-collapse">
                    <thead className="bg-slate-100 text-slate-700 sticky top-0 border-b border-gray-200 z-10">
                      <tr>
                        <th className="p-2 w-12 text-center">
                          <input
                            type="checkbox"
                            checked={importPreviewItems.length > 0 && importPreviewItems.every(it => it.selected)}
                            onChange={(e) => handleSelectAllPreview(e.target.checked)}
                            className="rounded border-gray-300 text-emerald-600 focus:ring-emerald-500 cursor-pointer"
                          />
                        </th>
                        <th className="p-2 w-24 text-center font-bold">Number</th>
                        <th className="p-2 font-bold">Amount (Editable)</th>
                        <th className="p-2 w-28 text-center font-bold">Status</th>
                        <th className="p-2 w-16 text-center font-bold">Action</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100 font-mono">
                      {importPreviewItems
                        .filter(it => !importSearch.trim() || it.num.includes(importSearch.trim()))
                        .map((item, idx) => {
                          const isNotBuy = notBuyNumbers && notBuyNumbers.includes(item.num);
                          const isHot = hotNumbers && hotNumbers.includes(item.num);

                          return (
                            <tr
                              key={item.id || idx}
                              className={`hover:bg-slate-50 transition ${
                                item.selected ? 'bg-white' : 'bg-gray-50/70 opacity-60'
                              }`}
                            >
                              <td className="p-2 text-center">
                                <input
                                  type="checkbox"
                                  checked={!!item.selected}
                                  onChange={() => handleTogglePreviewItem(item.id)}
                                  className="rounded border-gray-300 text-emerald-600 focus:ring-emerald-500 cursor-pointer"
                                />
                              </td>
                              <td className="p-2 text-center">
                                <div className="inline-flex items-center gap-1">
                                  <span className="px-2.5 py-0.5 rounded bg-purple-100 border border-purple-200 text-purple-900 font-bold text-sm">
                                    {item.num}
                                  </span>
                                  {isNotBuy && <span className="text-[10px] bg-red-100 text-red-700 px-1 rounded font-bold">Blocked</span>}
                                  {isHot && <span className="text-[10px] bg-orange-100 text-orange-700 px-1 rounded font-bold">Hot</span>}
                                </div>
                              </td>
                              <td className="p-2">
                                <div className="flex items-center gap-1.5 max-w-[200px]">
                                  <input
                                    type="number"
                                    min="1"
                                    step="1"
                                    value={item.amount}
                                    onChange={(e) => handleUpdatePreviewAmount(item.id, e.target.value)}
                                    className="w-full px-2.5 py-1 text-xs font-mono font-bold bg-white border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-emerald-500 text-slate-900"
                                  />
                                </div>
                              </td>
                              <td className="p-2 text-center">
                                {item.selected ? (
                                  <span className="text-[11px] px-2 py-0.5 bg-emerald-100 text-emerald-800 rounded font-semibold">
                                    ✓ Include
                                  </span>
                                ) : (
                                  <span className="text-[11px] px-2 py-0.5 bg-gray-200 text-gray-600 rounded font-medium">
                                    ✕ Skip
                                  </span>
                                )}
                              </td>
                              <td className="p-2 text-center">
                                <button
                                  type="button"
                                  onClick={() => handleRemovePreviewItem(item.id)}
                                  className="text-red-500 hover:text-red-700 p-1 hover:bg-red-50 rounded transition text-xs cursor-pointer"
                                  title="Remove from import"
                                >
                                  🗑️
                                </button>
                              </td>
                            </tr>
                          );
                        })}
                    </tbody>
                  </table>
                </div>
              </div>
            )}

            {/* Modal Footer */}
            <div className="flex items-center justify-between border-t border-gray-100 pt-3 shrink-0">
              <div>
                {importStep === 2 ? (
                  <button
                    type="button"
                    onClick={() => setImportStep(1)}
                    className="px-3.5 py-2 text-xs font-semibold text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg transition cursor-pointer flex items-center gap-1"
                  >
                    <span>←</span> Back to Edit Data
                  </button>
                ) : (
                  <button
                    type="button"
                    onClick={handleCloseImportModal}
                    className="px-3.5 py-2 text-xs font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg transition cursor-pointer"
                  >
                    Cancel
                  </button>
                )}
              </div>

              <div className="flex items-center gap-2">
                {importStep === 1 ? (
                  <>
                    <button
                      type="button"
                      onClick={() => handleParseToPreview(importJsonText)}
                      disabled={!importJsonText.trim()}
                      className="bg-emerald-600 hover:bg-emerald-700 text-white text-xs px-4 py-2 font-semibold rounded-lg disabled:opacity-50 transition cursor-pointer flex items-center gap-1.5 shadow-sm"
                    >
                      <span>Next: Preview Entries</span>
                      <span>→</span>
                    </button>
                  </>
                ) : (
                  <>
                    <button
                      type="button"
                      onClick={handleCloseImportModal}
                      className="px-3.5 py-2 text-xs font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-lg transition cursor-pointer"
                    >
                      Cancel
                    </button>
                    <button
                      type="button"
                      onClick={handleFinalImport}
                      disabled={importPreviewItems.filter(it => it.selected && parseFloat(String(it.amount).replace(/,/g, '')) > 0).length === 0}
                      className="bg-emerald-600 hover:bg-emerald-700 text-white text-xs px-4 py-2 font-semibold rounded-lg disabled:opacity-50 transition cursor-pointer shadow-sm"
                    >
                      Import {importPreviewItems.filter(it => it.selected && parseFloat(String(it.amount).replace(/,/g, '')) > 0).length} Entries
                    </button>
                  </>
                )}
              </div>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
