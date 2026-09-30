'use client';
import { useMemo, useRef, useState, useEffect, Fragment } from 'react';
import Link from 'next/link';
import { parseNumberExpression, MAX_ENTRIES } from '@/lib/lottery/numberParser.js';
import { createRuleEngine } from '@/lib/lottery/ruleEngine.js';
import { useI18n } from '@/lib/i18n/index.js';
import AgentCombobox from './AgentCombobox.js';
import { matchesCombo, formatCombo as rawFormatCombo } from '@/lib/ledger/shortcuts.js';
import { useIsMac } from '@/lib/ledger/useLedgerShortcuts.js';
import { enqueue, onQueueEvent, startAutoDrain } from '@/lib/ledger/voucherQueue.js';
import { getLocalVoucherCounts, saveLocalVoucher, deleteLocalVoucher } from '@/lib/ledger/localVoucherDb.js';
import useLedgerFontSize from '@/lib/ledger/useLedgerFontSize.js';
import { todayStr, getCurrentSlotKey } from '@/lib/lottery/sessionSlots.js';
import LotteryGuideModal from '@/components/LotteryGuideModal.js';
import MixedLedgerGrid from './MixedLedgerGrid.js';

const ALLOWED_CHARS = /[^0-9RAGPBWNFXT+\-*/.[\]]/gi;

// Strips disallowed characters, then converts the convenience shorthand `/`
// to `P` (numpad-friendly alias for the Part modifier) and converts `*` to `R`.
function normalizeInput(raw, slashRep = 'P', asteriskRep = 'R') {
  return raw.replace(ALLOWED_CHARS, '').replaceAll('/', slashRep).replaceAll('*', asteriskRep).toUpperCase();
}

// Only the sparse special-category tables (10-20 numbers each) are worth
// surfacing as a restriction warning. Brade/Part/SM classify ALL 100
// numbers, so flagging them per-entry would just be noise on every number —
// they remain purely input to the B/P/F expansion modifiers in numberParser.js.
const WARN_RULES = new Set(['Power', 'APoo', 'NetKhat', 'Brother']);
const SLOT_LABEL_KEY = { '09:00': 'slot0900', '12:00': 'slot1200', '04:00': 'slot0400' };
const ruleEngine = createRuleEngine();

function ruleMatchesFor(num) {
  return ruleEngine.evaluate(num).matches
    .filter(m => WARN_RULES.has(m.rule))
    .map(m => m.rule);
}

function normalizeCheckInput(value) {
  const digits = String(value ?? '').replace(/[^0-9]/g, '');
  if (!digits) return null;
  return digits.slice(0, 2).padStart(2, '0');
}

let tokenSeq = 0;
function nextTokenId() {
  tokenSeq += 1;
  return `t${Date.now()}_${tokenSeq}`;
}

// Parses one committed group into a voucher-token row: the raw text is kept
// as typed (source of truth); entries are only derived for display (subtotal,
// warnings) and for building the save payload.
function tokenFromText(rawText, t) {
  const text = rawText.trim();
  if (!text) return { token: null, error: null };
  const { entries, error } = parseNumberExpression(text, { maxEntries: MAX_ENTRIES });
  if (error) return { token: null, error };
  if (!entries.length) return { token: null, error: t('ledger.couldNotParse', { text }) };
  return { token: { id: nextTokenId(), tokenText: text, entries }, error: null };
}

const GRID_NUMBERS = Array.from({ length: 10 }, (_, tens) =>
  Array.from({ length: 10 }, (_, units) => `${tens}${units}`)
);

// Legacy table layout: 00-99 split into 4 column-groups, read top-to-bottom
// within each group, laid out as rows of [num, amount] pairs side by side —
// matching the old system's table view rather than a 10x10 button grid.
// Parametrized over the numbers list (instead of a fixed constant) so the
// same visual shape works whether sorted by number or by amount.
const NUMBER_TABLE_COLUMNS = 4;
const ALL_NUMBERS_FLAT = GRID_NUMBERS.flat();

function buildNumberTable(numbersFlat) {
  const groupSize = Math.ceil(numbersFlat.length / NUMBER_TABLE_COLUMNS);
  const groups = Array.from({ length: NUMBER_TABLE_COLUMNS }, (_, g) =>
    numbersFlat.slice(g * groupSize, (g + 1) * groupSize)
  );
  const rows = Math.max(...groups.map(g => g.length));
  return Array.from({ length: rows }, (_, r) => groups.map(g => g[r] ?? null));
}

export default function LedgerEntry({
  isBuyPage = false,
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
  userRole = 'cashier',
  shortcuts,
  replaceSlash = 'P',
  replaceAsterisk = 'R',
}) {
  const { t } = useI18n();
  const ledgerFontSize = useLedgerFontSize();
  const isMac = useIsMac();
  const formatCombo = (combo) => rawFormatCombo(combo, isMac);
  const [agentId, setAgentId] = useState('');
  const [inputValue, setInputValue] = useState('');
  const [pendingTokens, setPendingTokens] = useState([]);
  const [voucherCounts, setVoucherCounts] = useState({ pending: 0, failed: 0, synced: 0 });
  const [editingId, setEditingId] = useState(null);
  const [editingSrNo, setEditingSrNo] = useState(null);
  const [error, setError] = useState('');
  const [warnings, setWarnings] = useState([]);
  const [saving, setSaving] = useState(false);
  const [successMsg, setSuccessMsg] = useState('');
  const [search, setSearch] = useState('');
  const [sortKey, setSortKey] = useState(null); // null | 'tokenText' | 'amount'
  const [sortDir, setSortDir] = useState('asc');
  const [editingTokenId, setEditingTokenId] = useState(null);
  const [editingTokenValue, setEditingTokenValue] = useState('');
  const [selectedTokenIds, setSelectedTokenIds] = useState(new Set());
  const [lastSelectedIndex, setLastSelectedIndex] = useState(null);
  const [luckyNo, setLuckyNo] = useState(luckyNumber || null);
  const [luckyOpen, setLuckyOpen] = useState(false);
  const [luckyInput, setLuckyInput] = useState('');
  const [luckySaving, setLuckySaving] = useState(false);
  const [luckyError, setLuckyError] = useState('');
  const [cellPopup, setCellPopup] = useState(null); // { num, amount } | null
  const [limitValue, setLimitValue] = useState(limit?.limitValue ?? null);
  const isLimitActive = limitValue !== null && limitValue !== undefined && limitValue >= 0;
  const [limitOpen, setLimitOpen] = useState(false);
  const [limitInput, setLimitInput] = useState('');
  const [limitSaving, setLimitSaving] = useState(false);
  const [limitError, setLimitError] = useState('');
  const [rateValue, setRateValue] = useState(rate?.num1Rate || 0);
  const [rateOpen, setRateOpen] = useState(false);
  const [rateInput, setRateInput] = useState('');
  const [rateSaving, setRateSaving] = useState(false);
  const [rateError, setRateError] = useState('');
  const [checkAgentOpen, setCheckAgentOpen] = useState(false);
  const [checkAgentInput, setCheckAgentInput] = useState('');
  const [checkAgentResults, setCheckAgentResults] = useState(null);
  const [checkAgentLoading, setCheckAgentLoading] = useState(false);
  const [importModalOpen, setImportModalOpen] = useState(false);
  const [guideModalOpen, setGuideModalOpen] = useState(false);
  const [importStep, setImportStep] = useState(1);
  const [importJsonText, setImportJsonText] = useState('');
  const [importPreviewItems, setImportPreviewItems] = useState([]);
  const [importSearch, setImportSearch] = useState('');
  const [exceedSortKey, setExceedSortKey] = useState('excess');
  const [exceedSortDir, setExceedSortDir] = useState('desc');
  const [syncLoading, setSyncLoading] = useState(false);

  async function handleSyncOldLedger() {
    if (!activeSession) return;
    setSyncLoading(true);
    try {
      const date = activeSession.onDate || activeSession.date || new Date().toISOString().slice(0, 10);
      const count = activeSession.onCount || 1;
      const am = activeSession.ampm || 'AM';
      const res = await fetch(
        `/api/org/${orgId}/ledger/sync-rtdb?onCount=${count}&ampm=${encodeURIComponent(am)}&onDate=${date}`,
        { method: 'POST' }
      );
      const data = await res.json();
      if (data.success) {
        setSuccessMsg('Successfully synced & recalculated ledger totals!');
        window.location.reload();
      } else {
        setError(data.error || 'Failed to sync ledger');
      }
    } catch (err) {
      setError('Error syncing old ledger: ' + (err?.message || err));
    } finally {
      setSyncLoading(false);
    }
  }
  const [isBuyModalOpen, setIsBuyModalOpen] = useState(false);
  const [gridSortKey, setGridSortKey] = useState('number');
  const [gridSortDir, setGridSortDir] = useState('asc');
  const [ledgerGridMode, setLedgerGridMode] = useState(() => {
    if (typeof window !== 'undefined') {
      try {
        const saved = localStorage.getItem(`ledger_grid_mode_${orgId}`);
        if (saved === 'mixed' || saved === 'classic') return saved;
      } catch {}
    }
    return 'classic';
  });

  const handleSetLedgerGridMode = (mode) => {
    setLedgerGridMode(mode);
    if (typeof window !== 'undefined') {
      try {
        localStorage.setItem(`ledger_grid_mode_${orgId}`, mode);
      } catch {}
    }
  };
  const inputRef = useRef(null);
  const rateInputRef = useRef(null);
  const agentSelectRef = useRef(null);
  const middlePanelRef = useRef(null);
  const [middlePanelHeight, setMiddlePanelHeight] = useState(0);
  const [quickEntryOpen, setQuickEntryOpen] = useState(false);
  const [quickEntryNums, setQuickEntryNums] = useState('');
  const [quickEntryAmount, setQuickEntryAmount] = useState('');
  const [draggedTokenId, setDraggedTokenId] = useState(null);
  const [dragOverTokenId, setDragOverTokenId] = useState(null);
  const quickNumsRef = useRef(null);
  const quickAmountRef = useRef(null);
  const lastQueuedClientIdRef = useRef(null);

  function handleCellDragStart(e, tokenId) {
    setDraggedTokenId(tokenId);
    e.dataTransfer.effectAllowed = 'move';
    e.dataTransfer.setData('text/plain', tokenId);
  }

  function handleCellDragOver(e, tokenId) {
    e.preventDefault();
    e.dataTransfer.dropEffect = 'move';
    if (dragOverTokenId !== tokenId) {
      setDragOverTokenId(tokenId);
    }
  }

  function handleCellDragLeave(e, tokenId) {
    if (dragOverTokenId === tokenId) {
      setDragOverTokenId(null);
    }
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

  const notBuySet = useMemo(() => new Set(notBuyNumbers || []), [notBuyNumbers]);
  const hotSet = useMemo(() => new Set(hotNumbers || []), [hotNumbers]);

  // Queued voucher saves (see handleSave) drain in the background — this
  // keeps that loop alive for as long as the ledger is open and surfaces any
  // save the server ultimately rejects (network failures just retry silently;
  // a rejection is dropped from the queue and needs the cashier's attention).
  useEffect(() => {
    const stopDrain = startAutoDrain(orgId);

    async function fetchCounts() {
      if (orgId) {
        try {
          const c = await getLocalVoucherCounts(orgId);
          setVoucherCounts(c);
        } catch {}
      }
    }
    fetchCounts();

    const unsubscribe = onQueueEvent(event => {
      if (event.orgId !== orgId) return;
      fetchCounts();
      if (event.type === 'failed') {
        setError(t('ledger.queuedSaveFailed', { tokens: (event.tokens || []).join(' '), reason: event.error }));
        return;
      }
      // Once the background save actually lands, swap the generic "queued"
      // message for the real voucher number — but only if the cashier hasn't
      // already moved on to a different message in the meantime.
      if (event.type === 'saved' && event.clientId === lastQueuedClientIdRef.current) {
        setSuccessMsg(current => (current === t('ledger.queuedMsg') ? t('ledger.savedSrNo', { n: event.srNo }) : current));
      }
    });
    return () => { stopDrain(); unsubscribe(); };
  }, [orgId, t]);

  useEffect(() => {
    if (!middlePanelRef.current) return;
    const resizeObserver = new ResizeObserver(() => {
      if (middlePanelRef.current && window.innerWidth >= 1280) {
        setMiddlePanelHeight(middlePanelRef.current.getBoundingClientRect().height);
      } else {
        setMiddlePanelHeight(0);
      }
    });
    resizeObserver.observe(middlePanelRef.current);

    const handleResize = () => {
      if (middlePanelRef.current && window.innerWidth >= 1280) {
        setMiddlePanelHeight(middlePanelRef.current.getBoundingClientRect().height);
      } else {
        setMiddlePanelHeight(0);
      }
    };
    window.addEventListener('resize', handleResize);

    return () => {
      resizeObserver.disconnect();
      window.removeEventListener('resize', handleResize);
    };
  }, []);

  // Load a voucher selected from history into this panel for editing.
  useEffect(() => {
    if (!editingVoucher) return;
    const tokens = (editingVoucher.tokens || []).map(text => {
      const { entries } = parseNumberExpression(text, { maxEntries: MAX_ENTRIES });
      return { id: nextTokenId(), tokenText: text, entries: entries || [] };
    });
    setPendingTokens(tokens);
    setEditingId(editingVoucher.id);
    setEditingSrNo(editingVoucher.srNo);
    const matchedAgent = agents.find(a => a.agentName === editingVoucher.agentName);
    if (matchedAgent) setAgentId(matchedAgent.id);
    setInputValue('');
    setError('');
    setWarnings([]);
    setSuccessMsg('');
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [editingVoucher]);

  // Synchronize state when props change or activeSession changes (switching time slots/dates)
  useEffect(() => {
    setLuckyNo(luckyNumber || null);
  }, [luckyNumber]);

  useEffect(() => {
    setLimitValue(limit?.limitValue || 0);
  }, [limit, activeSession?.id, activeSession?.onCount]);

  useEffect(() => {
    if (isBuyPage && !agentId) {
      setAgentId('buy_offload');
    }
  }, [isBuyPage, agentId]);

  useEffect(() => {
    setPendingTokens([]);
    setEditingId(null);
    setEditingSrNo(null);
    setInputValue('');
    setError('');
    setWarnings([]);
    setSuccessMsg('');
    setSearch('');
  }, [activeSession]);

  // F1 creates the voucher from whatever is currently in the Entries list —
  // same action as clicking Save. A ref keeps the listener itself stable
  // (mounted once) while always calling into the latest handleSave/pendingTokens.
  const saveRef = useRef();
  useEffect(() => {
    saveRef.current = () => handleSave(pendingTokens);
  });


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

  function handleExportExceedLimit() {
    if (exceedList.length === 0) {
      setError(t('ledger.nothingToExport') || 'Nothing to export');
      return;
    }

    const headers = [t('ledger.numberCol'), t('ledger.exceedLabel')].join(',');
    const rows = exceedList.map(e => `${e.num},${e.excess}`);
    const csvContent = [headers, ...rows].join('\n');

    const blob = new Blob(['\uFEFF' + csvContent], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.setAttribute('href', url);
    const dateStr = new Date().toISOString().slice(0, 10);
    link.setAttribute('download', `exceed_limit_${dateStr}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
  }

  async function handleCopyExceedLimit() {
    const validItems = exceedList.filter(e => {
      const amt = e.total !== undefined ? e.total : e.excess;
      return (typeof amt === 'number' ? amt : parseFloat(String(amt).replace(/,/g, ''))) > 0;
    });

    if (validItems.length === 0) {
      setError(t('ledger.nothingToExport') || 'Nothing to export');
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
      setSuccessMsg(t('ledger.copiedToClipboard') || 'Copied to clipboard!');
      setTimeout(() => setSuccessMsg(''), 3000);
    } catch {
      setError(t('ledger.shareFailed') || 'Could not copy');
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

  function handleExportExceedJson() {
    if (exceedList.length === 0) {
      setError(t('ledger.nothingToExport') || 'Nothing to export');
      return;
    }

    const totalVal = exceedList.reduce((sum, e) => sum + e.excess, 0);
    const exportData = {
      app: 'SaaS Platform 2D',
      type: 'exceed_limit',
      exportedAt: new Date().toISOString(),
      totalExcess: totalVal,
      itemCount: exceedList.length,
      items: exceedList.map(e => ({
        num: e.num,
        amount: e.excess,
      })),
    };

    const jsonString = JSON.stringify(exportData, null, 2);
    const blob = new Blob([jsonString], { type: 'application/json;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.setAttribute('href', url);
    const dateStr = new Date().toISOString().slice(0, 10);
    link.setAttribute('download', `exceed_limit_${dateStr}.json`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
    setSuccessMsg('Exported exceed_limit.json! Ready for re-import into the app.');
    setTimeout(() => setSuccessMsg(''), 4000);
  }

  function handleExportGrid() {
    const headers = [t('ledger.numberCol'), t('ledger.amountCol')].join(',');
    const rows = sortedGridNumbers.map(num => {
      const amount = totals?.[num] ?? 0;
      return `${num},${amount}`;
    });
    const csvContent = [headers, ...rows].join('\n');

    const blob = new Blob(['\uFEFF' + csvContent], { type: 'text/csv;charset=utf-8;' });
    const url = URL.createObjectURL(blob);
    const link = document.createElement('a');
    link.setAttribute('href', url);
    const dateStr = new Date().toISOString().slice(0, 10);
    link.setAttribute('download', `grid_00_99_${dateStr}.csv`);
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
    URL.revokeObjectURL(url);
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

  async function handleQuickSubmit() {
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
        const { token, error: parseErr } = tokenFromText(tokenExpr, t);
        if (parseErr) {
          parseErrors.push(parseErr);
        } else if (token) {
          newTokens.push(token);
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

  useEffect(() => {
    if (quickEntryOpen) {
      setTimeout(() => {
        quickNumsRef.current?.focus();
      }, 50);
    }
  }, [quickEntryOpen]);

  function commitGroup(rawText, currentTokens) {
    const { token, error: parseError } = tokenFromText(rawText, t);
    if (parseError) {
      setError(parseError);
      return null;
    }
    if (!token) return currentTokens;

    const msgs = [];
    for (const e of token.entries) {
      if (notBuySet.has(e.num)) msgs.push(t('ledger.notBuyRejected', { num: e.num }));
      if (hotSet.has(e.num)) msgs.push(t('ledger.hotNumberMsg', { num: e.num }));
      if (isLimitActive && e.amount > limitValue) msgs.push(t('ledger.overLimitMsg', { num: e.num, limit: limitValue }));
    }

    setError('');
    setWarnings(msgs);
    return [...currentTokens, token];
  }

  function handleChange(e) {
    setInputValue(normalizeInput(e.target.value, replaceSlash, replaceAsterisk));
    setSuccessMsg('');
  }

  // Spacebar or Enter on an empty/long text box opens the quick-entry modal
  // (bulk numbers + one shared amount / R expression).
  function handleKeyDown(e) {
    if (e.key === ' ' || e.code === 'Space') {
      e.preventDefault();
      if (!agentId) {
        setError(t('ledger.selectAgentFirst'));
        return;
      }
      setQuickEntryNums(formatDashInput(inputValue));
      setQuickEntryAmount('');
      setQuickEntryOpen(true);
      setInputValue('');
    } else if (e.key === 'Enter') {
      e.preventDefault();
      if (inputValue.trim()) {
        const next = commitGroup(inputValue, pendingTokens);
        if (next) {
          setPendingTokens(next);
          setInputValue('');
        }
        return;
      }
    }
  }

  function handleCellClick(num) {
    setCellPopup({ num, amount: totals?.[num] ?? 0 });
    if (!inputRef.current) return;
    setInputValue(num);
    inputRef.current.focus();
  }

  function removeToken(id) {
    setPendingTokens(prev => prev.filter(p => p.id !== id));
    if (editingTokenId === id) {
      setEditingTokenId(null);
      setEditingTokenValue('');
    }
    setSelectedTokenIds(prev => {
      const next = new Set(prev);
      next.delete(id);
      return next;
    });
  }

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

    const { token, error: parseError } = tokenFromText(text, t);
    if (parseError) {
      setError(parseError);
      return;
    }
    if (!token) {
      removeToken(id);
      setEditingTokenId(null);
      setEditingTokenValue('');
      setTimeout(() => {
        inputRef.current?.focus();
      }, 50);
      return;
    }

    setPendingTokens(prev => prev.map(p => (p.id === id ? { ...token, id } : p)));
    setEditingTokenId(null);
    setEditingTokenValue('');
    setError('');
    setSuccessMsg('');
    setTimeout(() => {
      inputRef.current?.focus();
    }, 50);
  }

  function handleClear() {
    setPendingTokens([]);
    setInputValue('');
    setError('');
    setWarnings([]);
    setSuccessMsg('');
    setEditingId(null);
    setEditingSrNo(null);
    if (onCancelEdit) onCancelEdit();
  }

  async function handleDeleteVoucher(vId) {
    const targetId = vId || editingId;
    if (!targetId) return;
    const fallbackDate = todayStr();
    const fallbackSlot = getCurrentSlotKey();
    const sessionOnDate = activeSession?.onDate || fallbackDate;
    const sessionAmpm = activeSession?.ampm || fallbackSlot;
    const sessionOnCount = activeSession?.onCount || 1;
    const delNo = editingSrNo;

    setSaving(true);
    setError('');
    const sid = editingVoucher?.sessionId || `${sessionOnDate}_${sessionAmpm}_${sessionOnCount}`;
    try {
      await deleteLocalVoucher(targetId, orgId, sid);
      enqueue(orgId, {
        id: targetId,
        voucherId: targetId,
        action: 'delete',
        voucherType: isBuyPage ? 'buy' : 'sale',
        isBuyVoucher: isBuyPage,
        onCount: sessionOnCount,
        ampm: sessionAmpm,
        onDate: sessionOnDate,
        srNo: delNo,
      });

      setPendingTokens([]);
      setInputValue('');
      setAgentId('');
      setWarnings([]);
      setSuccessMsg(`Voucher #${delNo || ''} deleted successfully!`);
      setEditingId(null);
      setEditingSrNo(null);
      if (onSaved) onSaved();
      setTimeout(() => setSuccessMsg(''), 4000);
    } catch {
      setError(t('common.failedToSave'));
    } finally {
      setSaving(false);
    }
  }

  async function handleSave(tokensToSave) {
    setError('');
    if (!agentId) {
      setError(t('ledger.selectAgentError'));
      return;
    }
    if (!tokensToSave || tokensToSave.length === 0) {
      if (editingId) {
        await handleDeleteVoucher(editingId);
        return;
      }
      setError(t('ledger.noEntriesError'));
      return;
    }

    const fallbackDate = todayStr();
    const fallbackSlot = getCurrentSlotKey();
    const sessionOnDate = activeSession?.onDate || fallbackDate;
    const sessionAmpm = activeSession?.ampm || fallbackSlot;
    const sessionOnCount = activeSession?.onCount || 1;
    const sessionMachineId = activeSession?.machineId || 1;

    const tokens = tokensToSave.map(p => p.tokenText);

    // Update existing voucher: save to offline DB and enqueue to sync in background
    if (editingId) {
      if (tokensToSave.length === 0) {
        await handleDeleteVoucher(editingId);
        return;
      }

      let entries;
      try {
        entries = tokens.flatMap(text => {
          const { entries: parsed, error: parseError } = parseNumberExpression(text, { maxEntries: MAX_ENTRIES });
          if (parseError) throw new Error(parseError);
          return parsed;
        });
      } catch (err) {
        setError(err.message);
        return;
      }

      const amount = entries.reduce((sum, it) => sum + (parseFloat(it.amount || it.value) || 0), 0);
      const updateNo = editingSrNo;
      const targetAgent = agents.find(a => a.id === agentId);
      const agentName = targetAgent?.agentName || (isBuyPage ? 'Buy Offload' : agentId);

      setSaving(true);
      try {
        await saveLocalVoucher({
          id: editingId,
          clientId: editingId,
          voucherId: editingId,
          orgId,
          agentId,
          agentName,
          tokens,
          entries,
          items: entries,
          amount,
          onCount: sessionOnCount,
          ampm: sessionAmpm,
          onDate: sessionOnDate,
          machineId: sessionMachineId,
          voucherType: isBuyPage ? 'buy' : 'sale',
          isBuyVoucher: isBuyPage,
          action: 'update',
          status: 'pending',
          srNo: updateNo,
        });

        enqueue(orgId, {
          id: editingId,
          voucherId: editingId,
          agentId,
          agentName,
          tokens,
          entries,
          items: entries,
          amount,
          onCount: sessionOnCount,
          ampm: sessionAmpm,
          onDate: sessionOnDate,
          machineId: sessionMachineId,
          voucherType: isBuyPage ? 'buy' : 'sale',
          isBuyVoucher: isBuyPage,
          action: 'update',
          srNo: updateNo,
        });

        setPendingTokens([]);
        setInputValue('');
        setAgentId('');
        setWarnings([]);
        setSuccessMsg(t('ledger.updatedSrNo', { n: updateNo }));
        setEditingId(null);
        setEditingSrNo(null);
        if (onSaved) onSaved();
        setTimeout(() => setSuccessMsg(''), 4000);
      } catch (err) {
        setError(err.message || t('common.failedToSave'));
      } finally {
        setSaving(false);
      }
      return;
    }

    // New voucher: no await, no spinner — it's queued to localStorage/IndexedDB and
    // pushed to the server in the background (voucherQueue.js). Totals bump
    // optimistically right here, using the same parser the server uses, so
    // the exceed-limit/hot-number grid stays accurate without waiting on the
    // network for the cashier's own entries.
    let entries;
    try {
      entries = tokens.flatMap(text => {
        const { entries: parsed, error: parseError } = parseNumberExpression(text, { maxEntries: MAX_ENTRIES });
        if (parseError) throw new Error(parseError);
        return parsed;
      });
    } catch (err) {
      setError(err.message);
      return;
    }

    if (isBuyPage) {
      setSaving(true);
      try {
        const res = await fetch(`/api/org/${orgId}/ledger/buy-voucher`, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({
            onCount: sessionOnCount,
            ampm: sessionAmpm,
            onDate: sessionOnDate,
            machineId: sessionMachineId,
            items: entries,
          }),
        });
        const data = await res.json();
        if (!res.ok) {
          setError(data.error || t('common.failedToSave'));
          return;
        }
        if (onOptimisticBuySave) onOptimisticBuySave(entries);
        setPendingTokens([]);
        setInputValue('');
        setAgentId('buy_offload');
        setWarnings([]);
        setSuccessMsg('Buy Voucher saved successfully!');
        setTimeout(() => {
          agentSelectRef.current?.focus();
        }, 50);
      } catch (err) {
        setError(err.message || t('common.networkError'));
      } finally {
        setSaving(false);
      }
      return;
    }

    const clientId = enqueue(orgId, {
      agentId,
      onCount: sessionOnCount,
      ampm: sessionAmpm,
      onDate: sessionOnDate,
      machineId: sessionMachineId,
      tokens,
    });
    lastQueuedClientIdRef.current = clientId;

    if (onOptimisticSave) onOptimisticSave(entries);

    setPendingTokens([]);
    setInputValue('');
    setAgentId('');
    setWarnings([]);
    setSuccessMsg(t('ledger.queuedMsg'));
    setTimeout(() => {
      agentSelectRef.current?.focus();
    }, 50);
  }

  function openLucky() {
    setLuckyInput(luckyNo || '');
    setLuckyError('');
    setLuckyOpen(true);
  }

  async function saveLucky() {
    setLuckyError('');
    if (!activeSession) {
      setLuckyError(t('ledger.noActiveSessionShort'));
      return;
    }
    if (!/^\d{2}$/.test(luckyInput)) {
      setLuckyError(t('ledger.enter2DigitLucky'));
      return;
    }

    setLuckySaving(true);
    try {
      const res = await fetch(`/api/org/${orgId}/lucky`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          lNo: luckyInput,
          onDate: activeSession.onDate,
          ampm: activeSession.ampm,
        }),
      });
      const data = await res.json();
      if (!res.ok) {
        setLuckyError(data.error || t('session.saveFailed'));
        return;
      }
      setLuckyNo(data.luckyNo.lNo);
      setLuckyOpen(false);
    } catch {
      setLuckyError(t('common.networkError'));
    } finally {
      setLuckySaving(false);
    }
  }

  function openLimit() {
    setLimitInput(String(limitValue || ''));
    setLimitError('');
    setLimitOpen(true);
  }

  async function saveLimit() {
    setLimitError('');
    const parsed = parseFloat(limitInput);
    if (!limitInput.trim() || Number.isNaN(parsed) || parsed < 0) {
      setLimitError(t('ledger.enterValidLimit'));
      return;
    }

    setLimitSaving(true);
    try {
      const res = await fetch(`/api/org/${orgId}/settings/limits`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ limitValue: parsed }),
      });
      const data = await res.json();
      if (!res.ok) {
        setLimitError(data.error || t('session.saveFailed'));
        return;
      }
      setLimitValue(parsed);
      setLimitOpen(false);
    } catch {
      setLimitError(t('common.networkError'));
    } finally {
      setLimitSaving(false);
    }
  }

  function openRate() {
    setRateInput(String(rateValue || ''));
    setRateError('');
    setRateOpen(true);
    setTimeout(() => {
      rateInputRef.current?.focus();
      rateInputRef.current?.select();
    }, 50);
  }

  async function saveRate() {
    setRateError('');
    const parsed = parseFloat(rateInput);
    if (!rateInput.trim() || Number.isNaN(parsed) || parsed < 0) {
      setRateError(t('ledger.enterValidRate'));
      return;
    }

    setRateSaving(true);
    try {
      const res = await fetch(`/api/org/${orgId}/settings`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ num1Rate: parsed, num2Rate: rate?.num2Rate ?? 0 }),
      });
      const data = await res.json();
      if (!res.ok) {
        setRateError(data.error || t('session.saveFailed'));
        return;
      }
      setRateValue(parsed);
      setRateOpen(false);
    } catch {
      setRateError(t('common.networkError'));
    } finally {
      setRateSaving(false);
    }
  }

  async function openCheckAgent() {
    setCheckAgentOpen(true);
    setCheckAgentInput('');
    setCheckAgentResults(null);
  }

  async function runCheckAgent(numRaw) {
    const num = normalizeCheckInput(numRaw);
    setCheckAgentInput(numRaw);
    if (!num || !activeSession) {
      setCheckAgentResults(null);
      return;
    }
    setCheckAgentLoading(true);
    try {
      const res = await fetch(
        `/api/org/${orgId}/ledger/totals?onCount=${activeSession.onCount}&ampm=${activeSession.ampm}&num=${num}`
      );
      const data = await res.json();
      setCheckAgentResults(data.byAgent || []);
    } catch {
      setCheckAgentResults([]);
    } finally {
      setCheckAgentLoading(false);
    }
  }

  const pendingByNum = useMemo(() => {
    const map = new Map();
    for (const p of pendingTokens) {
      for (const e of p.entries) {
        map.set(e.num, (map.get(e.num) || 0) + e.amount);
      }
    }
    return map;
  }, [pendingTokens]);

  const pendingTotal = pendingTokens.reduce(
    (sum, p) => sum + p.entries.reduce((s, e) => s + e.amount, 0),
    0
  );

  const visibleTokens = useMemo(() => {
    let list = pendingTokens.map(p => ({
      ...p,
      amount: p.entries.reduce((s, e) => s + e.amount, 0),
    }));
    const q = search.trim();
    if (q) list = list.filter(p => p.tokenText.includes(q));
    if (sortKey) {
      list = [...list].sort((a, b) => {
        const av = a[sortKey], bv = b[sortKey];
        const cmp = av < bv ? -1 : av > bv ? 1 : 0;
        return sortDir === 'asc' ? cmp : -cmp;
      });
    }
    return list;
  }, [pendingTokens, search, sortKey, sortDir]);

  function toggleSort(key) {
    if (sortKey === key) {
      setSortDir(d => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setSortKey(key);
      setSortDir('asc');
    }
  }

  function toggleExceedSort(key) {
    if (exceedSortKey === key) {
      setExceedSortDir(d => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setExceedSortKey(key);
      setExceedSortDir('desc');
    }
  }

  // Session-wide aggregates driving the grid, the exceed-limit panel, and
  // the bottom stat row — all derived from `totals` (refetched after
  // save/edit/delete), not from the still-unsaved pendingTokens.
  const totalsEntries = useMemo(
    () => Object.entries(totals || {}).map(([num, amount]) => ({ num, amount })),
    [totals]
  );
  const grandTotal = totalsEntries.reduce((s, e) => s + e.amount, 0);
  const bestSeller = totalsEntries.reduce(
    (best, e) => (e.amount > (best?.amount ?? -Infinity) ? e : best),
    null
  );
  const orangeLiability = bestSeller ? bestSeller.amount * (rateValue || 0) : 0;
  const pinkStat = bestSeller && bestSeller.amount > 0 ? grandTotal / bestSeller.amount : 0;
  // Legacy behavior: the exceed panel shows how much OVER the limit each
  // number is (amount - limit), not the raw total — e.g. a 3829 total
  // against a 1000 limit shows 2829, not 3829.
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

  function toggleGridSort(key) {
    if (gridSortKey === key) {
      setGridSortDir(d => (d === 'asc' ? 'desc' : 'asc'));
    } else {
      setGridSortKey(key);
      setGridSortDir(key === 'amount' ? 'desc' : 'asc');
    }
  }

  const sortedGridNumbers = useMemo(() => {
    const list = [...ALL_NUMBERS_FLAT];
    list.sort((a, b) => {
      const cmp = gridSortKey === 'amount'
        ? (totals?.[a] ?? 0) - (totals?.[b] ?? 0)
        : a.localeCompare(b);
      return gridSortDir === 'asc' ? cmp : -cmp;
    });
    return list;
  }, [gridSortKey, gridSortDir, totals]);

  const numberTable = useMemo(() => buildNumberTable(sortedGridNumbers), [sortedGridNumbers]);

  const entryTableRows = useMemo(() => {
    const cols = 5;
    const rows = [];
    for (let i = 0; i < visibleTokens.length; i += cols) {
      rows.push(visibleTokens.slice(i, i + cols));
    }
    return rows;
  }, [visibleTokens]);

  useEffect(() => {
    // Combos come from the user's saved shortcuts (Settings → User Settings),
    // falling back to DEFAULT_SHORTCUTS — see src/lib/ledger/shortcuts.js.
    // Escape is fixed (closes whichever panel is open) and not remappable.
    function handleGlobalKeyDown(e) {
      if (matchesCombo(e, shortcuts.focusAgent)) {
        e.preventDefault();
        agentSelectRef.current?.focus();
      } else if (matchesCombo(e, shortcuts.focusNumber)) {
        e.preventDefault();
        inputRef.current?.focus();
      } else if (matchesCombo(e, shortcuts.sortVoucher)) {
        e.preventDefault();
        toggleSort('tokenText');
      } else if (matchesCombo(e, shortcuts.checkAgent)) {
        e.preventDefault();
        setRateOpen(false);
        setLimitOpen(false);
        setLuckyOpen(false);
        if (checkAgentOpen) {
          setCheckAgentOpen(false);
          inputRef.current?.focus();
        } else {
          openCheckAgent();
        }
      } else if (matchesCombo(e, shortcuts.luckyNumber)) {
        e.preventDefault();
        setRateOpen(false);
        setLimitOpen(false);
        setCheckAgentOpen(false);
        if (luckyOpen) {
          setLuckyOpen(false);
          inputRef.current?.focus();
        } else if (activeSession) {
          openLucky();
        }
      } else if (matchesCombo(e, shortcuts.limit)) {
        e.preventDefault();
        setRateOpen(false);
        setLuckyOpen(false);
        setCheckAgentOpen(false);
        if (limitOpen) {
          setLimitOpen(false);
          inputRef.current?.focus();
        } else {
          openLimit();
        }
      } else if (matchesCombo(e, shortcuts.reports) || e.key === 'F6') {
        e.preventDefault();
        onOpenReports?.();
      } else if (matchesCombo(e, shortcuts.refresh)) {
        e.preventDefault();
        window.location.reload();
      } else if (matchesCombo(e, shortcuts.sortExceedNum)) {
        e.preventDefault();
        toggleExceedSort('num');
      } else if (matchesCombo(e, shortcuts.sortExceedAmount)) {
        e.preventDefault();
        toggleExceedSort('amount');
      } else if (matchesCombo(e, shortcuts.sortExceedExcess)) {
        e.preventDefault();
        toggleExceedSort('excess');
      } else if (matchesCombo(e, shortcuts.save)) {
        e.preventDefault();
        saveRef.current();
      } else if (matchesCombo(e, shortcuts.rate)) {
        e.preventDefault();
        setLimitOpen(false);
        setLuckyOpen(false);
        setCheckAgentOpen(false);
        if (rateOpen) {
          setRateOpen(false);
          inputRef.current?.focus();
        } else {
          openRate();
        }
      } else if (matchesCombo(e, shortcuts.clear)) {
        e.preventDefault();
        handleClear();
        inputRef.current?.focus();
      } else if (matchesCombo(e, shortcuts.exportExceed)) {
        e.preventDefault();
        handleExportExceedLimit();
      } else if (matchesCombo(e, shortcuts.sortGridNum)) {
        e.preventDefault();
        toggleGridSort('number');
      } else if (matchesCombo(e, shortcuts.sortGridAmount)) {
        e.preventDefault();
        toggleGridSort('amount');
      } else if (matchesCombo(e, shortcuts.exportGrid)) {
        e.preventDefault();
        handleExportGrid();
      } else if (matchesCombo(e, shortcuts.sale1)) {
        e.preventDefault();
        if (onOpenSale1) onOpenSale1();
      } else if (matchesCombo(e, shortcuts.sale2)) {
        e.preventDefault();
        if (onOpenSale2) onOpenSale2();
      } else if (e.altKey && e.shiftKey) {
        if (e.code && e.code.startsWith('Digit')) {
          const digitStr = e.code.slice(5);
          let digit = parseInt(digitStr, 10);
          if (digit === 0) digit = 10;
          if (digit >= 1 && digit <= 10) {
            e.preventDefault();
            const targetToken = visibleTokens[digit - 1];
            if (targetToken) {
              startTokenEdit(targetToken);
            }
          }
        }
      } else if ((e.key === 'Delete' || e.key === 'Backspace') && selectedTokenIds.size > 0 && !editingTokenId) {
        const activeTag = document.activeElement ? document.activeElement.tagName : '';
        if (activeTag !== 'INPUT' && activeTag !== 'TEXTAREA' && activeTag !== 'SELECT') {
          e.preventDefault();
          removeSelectedTokens();
        }
      } else if (e.key === 'Escape') {
        if (checkAgentOpen || luckyOpen || rateOpen || limitOpen) {
          e.preventDefault();
          setCheckAgentOpen(false);
          setLuckyOpen(false);
          setRateOpen(false);
          setLimitOpen(false);
          inputRef.current?.focus();
        }
      }
    }

    window.addEventListener('keydown', handleGlobalKeyDown);
    return () => window.removeEventListener('keydown', handleGlobalKeyDown);
  }, [
    shortcuts,
    activeSession,
    checkAgentOpen,
    luckyOpen,
    rateOpen,
    limitOpen,
    exceedSortKey,
    exceedSortDir,
    sortKey,
    sortDir,
    onOpenReports,
    onOpenSale1,
    onOpenSale2,
    exceedList,
    gridSortKey,
    gridSortDir,
    sortedGridNumbers,
    totals,
    visibleTokens,
  ]);





  return (
    <div className="w-full h-[calc(100vh-1.5rem)] flex flex-col overflow-hidden">
      {/* Top bar */}
      <div className="bg-white dark:bg-slate-900 rounded-xl border border-gray-200 dark:border-slate-800 shadow-sm px-4 py-2 mb-3 flex flex-wrap items-center justify-between gap-2 shrink-0">
        <div className="flex items-center gap-3">
          {activeSession ? (
            <div className="flex flex-wrap items-center gap-3 text-sm font-medium text-gray-900 dark:text-slate-100">
              <span className="badge-active">{t(`session.${SLOT_LABEL_KEY[activeSession.ampm] || 'slot0900'}`)}</span>
              {activeSession.isActive === false && (
                canWrite ? (
                  <span className="text-xs px-2.5 py-0.5 rounded-full font-bold bg-purple-100 text-purple-800 dark:bg-purple-950 dark:text-purple-300 border border-purple-300">
                    Finished Session (Admin Edit)
                  </span>
                ) : (
                  <span className="text-xs px-2.5 py-0.5 rounded-full font-bold bg-rose-100 text-rose-800 dark:bg-rose-950 dark:text-rose-300 border border-rose-300">
                    Session Closed (Read Only)
                  </span>
                )
              )}
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
              {editingId && (
                <span className="badge-basic">{t('ledger.editingSrNo', { n: editingSrNo })}</span>
              )}
            </div>
          ) : (
            <div className="flex items-center gap-2">
              <span className="text-xs px-2.5 py-1 rounded-md font-medium bg-amber-100 text-amber-800 dark:bg-amber-900/60 dark:text-amber-200 inline-flex items-center gap-1.5 border border-amber-300 dark:border-amber-800">
                <span className="w-2 h-2 rounded-full bg-amber-500 animate-pulse" />
                Offline Standby ({t(`session.${SLOT_LABEL_KEY[getCurrentSlotKey()] || 'slot0900'}`)} · {todayStr()})
              </span>
              {onOpenSessionPicker && (
                <button
                  type="button"
                  onClick={onOpenSessionPicker}
                  className="text-xs bg-indigo-600 hover:bg-indigo-700 text-white font-medium px-2.5 py-1 rounded-lg transition"
                >
                  {t('session.pickTitle')}
                </button>
              )}
            </div>
          )}
        </div>
        <div className="flex items-center gap-2">
          {onOpenSale1 && (
            <button
              type="button"
              onClick={onOpenSale1}
              className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium rounded-lg border border-gray-300 text-gray-700 hover:bg-gray-50 transition"
              title="By Agent Report (F7)"
            >
              <span>📋</span>
              <span>Sale 1 (F7)</span>
            </button>
          )}

          {onOpenSale2 && (
            <button
              type="button"
              onClick={onOpenSale2}
              className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium rounded-lg border border-gray-300 text-gray-700 hover:bg-gray-50 transition"
              title="Summary Report (F10)"
            >
              <span>📈</span>
              <span>Sale 2 (F10)</span>
            </button>
          )}

          <div className="relative">
            <button
              type="button"
              onClick={() => (luckyOpen ? setLuckyOpen(false) : openLucky())}
              disabled={!activeSession}
              className={`flex items-center gap-1.5 px-3 py-2 text-sm font-medium rounded-lg border transition disabled:opacity-50 ${
                luckyNo ? 'bg-[#D4AF37]/10 border-[#D4AF37] text-[#8a6d1a]' : 'border-gray-300 text-gray-600 hover:bg-gray-50'
              }`}
            >
              <span>🎯</span>
              {luckyNo ? (
                <span>Luc<u className="underline font-semibold">k</u>y: {luckyNo}</span>
              ) : (
                <span>Luc<u className="underline font-semibold">k</u>y</span>
              )}
            </button>

            {luckyOpen && (
              <div className="absolute right-0 mt-2 w-56 bg-white border border-gray-200 rounded-lg shadow-lg p-3 z-10">
                <p className="text-xs font-medium text-gray-600 mb-2">{t('ledger.winningNumberHint')}</p>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={luckyInput}
                    onChange={e => setLuckyInput(e.target.value.replace(/[^0-9]/g, '').slice(0, 2))}
                    onKeyDown={e => { if (e.key === 'Enter') { e.preventDefault(); saveLucky(); } }}
                    placeholder="00"
                    autoFocus
                    className="w-16 px-2 py-1.5 text-sm font-mono text-center border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-amber-500"
                  />
                  <button
                    type="button"
                    onClick={saveLucky}
                    disabled={luckySaving}
                    className="flex-1 bg-amber-500 hover:bg-amber-600 disabled:opacity-50 text-white text-sm font-medium rounded-lg transition"
                  >
                    {luckySaving ? t('common.saving') : t('common.save')}
                  </button>
                </div>
                {luckyError && <p className="text-xs text-red-600 mt-2">{luckyError}</p>}
              </div>
            )}
          </div>



          <div className="relative">
            <button
              type="button"
              onClick={() => (limitOpen ? setLimitOpen(false) : openLimit())}
              className={`flex items-center gap-1.5 px-3 py-2 text-sm font-medium rounded-lg border transition ${
                isLimitActive ? 'bg-indigo-50 border-indigo-300 text-indigo-800' : 'border-gray-300 text-gray-600 hover:bg-gray-50'
              }`}
            >
              <span>🚧</span>
              {isLimitActive ? (
                <span><u className="underline font-semibold">L</u>imit: {Number(limitValue).toLocaleString()}</span>
              ) : (
                <span><u className="underline font-semibold">L</u>imit</span>
              )}
            </button>

            {limitOpen && (
              <div className="absolute right-0 mt-2 w-56 bg-white border border-gray-200 rounded-lg shadow-lg p-3 z-10">
                <p className="text-xs font-medium text-gray-600 mb-2">{t('ledger.maxAmountHint')}</p>
                <div className="flex gap-2">
                  <input
                    type="text"
                    value={limitInput}
                    onChange={e => setLimitInput(e.target.value.replace(/[^0-9.]/g, ''))}
                    onKeyDown={e => { if (e.key === 'Enter') { e.preventDefault(); saveLimit(); } }}
                    placeholder="0"
                    autoFocus
                    className="w-20 px-2 py-1.5 text-sm font-mono text-center border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
                  />
                  <button
                    type="button"
                    onClick={saveLimit}
                    disabled={limitSaving}
                    className="flex-1 bg-indigo-600 hover:bg-indigo-700 disabled:opacity-50 text-white text-sm font-medium rounded-lg transition"
                  >
                    {limitSaving ? t('common.saving') : t('common.save')}
                  </button>
                </div>
                <p className="text-xs text-gray-400 mt-2">{t('ledger.noLimitHint')}</p>
                {limitError && <p className="text-xs text-red-600 mt-2">{limitError}</p>}
              </div>
            )}
          </div>



          <div className="relative">
            <button
              type="button"
              onClick={() => (checkAgentOpen ? setCheckAgentOpen(false) : openCheckAgent())}
              className="flex items-center gap-1.5 px-3 py-2 text-sm font-medium rounded-lg border border-gray-300 text-gray-600 hover:bg-gray-50 transition"
            >
              <span>👤</span>
              <span>Checkin<u className="underline font-semibold">g</u> Agent</span>
            </button>

            {checkAgentOpen && (
              <div className="absolute right-0 mt-2 w-64 bg-white border border-gray-200 rounded-lg shadow-lg p-3 z-10">
                <input
                  type="text"
                  value={checkAgentInput}
                  onChange={e => runCheckAgent(e.target.value)}
                  placeholder="00"
                  autoFocus
                  className="w-full px-2 py-1.5 text-sm font-mono text-center border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-400"
                />
                <div className="mt-3 space-y-1.5">
                  {checkAgentLoading ? (
                    <p className="text-xs text-gray-400 text-center">{t('common.loading')}</p>
                  ) : checkAgentResults === null ? (
                    <p className="text-xs text-gray-400 text-center">{t('ledger.checkEnterNumber')}</p>
                  ) : checkAgentResults.length === 0 ? (
                    <p className="text-xs text-gray-400 text-center">{t('ledger.checkAgentNoData')}</p>
                  ) : (
                    checkAgentResults.map(r => (
                      <div key={r.agentName} className="flex items-center justify-between text-xs bg-blue-50 rounded px-2 py-1">
                        <span className="font-medium text-blue-900">{r.agentName}</span>
                        <span className="font-mono text-blue-700">{r.total.toLocaleString()}</span>
                      </div>
                    ))
                  )}
                </div>
              </div>
            )}
          </div>



          {onOpenReports && (
            <button
              type="button"
              onClick={onOpenReports}
              className="flex items-center gap-1.5 px-3 py-1.5 font-bold text-xs rounded-lg border border-gray-300 dark:border-slate-700 bg-white dark:bg-slate-800 text-gray-700 dark:text-slate-200 hover:bg-gray-50 dark:hover:bg-slate-700 transition cursor-pointer shadow-xs"
              title="Reports (F6)"
            >
              <span>📊</span>
              <span>Reports (F6)</span>
            </button>
          )}
        </div>
      </div>

      <div
        className="flex-1 min-h-0 flex flex-col overflow-hidden"
        style={{ zoom: parseFloat(ledgerFontSize || '100') / 100 }}
      >
        <div className="grid grid-cols-1 xl:grid-cols-[1.4fr_1.3fr_0.8fr] gap-3 flex-1 min-h-0 items-stretch">
        {/* Left panel: input + voucher token list (5-cell column grid) */}
        <div className="flex flex-col h-full min-h-0 space-y-3">
          <div className="bg-white rounded-xl border border-gray-200 shadow-sm p-3 shrink-0">
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-2">
              <div className="w-full">
                <AgentCombobox
                  ref={agentSelectRef}
                  agents={agents}
                  value={agentId}
                  onChange={setAgentId}
                  placeholder={`${t('ledger.agentLabel')} (${formatCombo(shortcuts.focusAgent)})`}
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
                disabled={!agentId || !canWrite}
                placeholder={
                  !canWrite
                    ? 'Session is closed (Read Only)'
                    : agentId
                    ? `${t('ledger.enterNumbers')} (${formatCombo(shortcuts.focusNumber)})`
                    : t('ledger.selectAgentFirst')
                }
                className="w-full px-3 py-2 text-sm font-mono tracking-wide border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 disabled:bg-gray-100"
              />
            </div>

            {!activeSession && (
              <div className="flex items-center gap-2 text-xs font-medium text-amber-800 dark:text-amber-300 bg-amber-50 dark:bg-amber-950/40 border border-amber-200 dark:border-amber-900/40 rounded-lg px-3 py-2 mt-3">
                <span className="w-2 h-2 rounded-full bg-amber-500 animate-pulse shrink-0" />
                <span>Offline Mode: Vouchers will be saved locally in IndexedDB and automatically synced to Firestore when online.</span>
              </div>
            )}

            {!canWrite && (
              <div className="flex items-center gap-2 text-xs font-semibold text-rose-800 dark:text-rose-300 bg-rose-50 dark:bg-rose-950/40 border border-rose-200 dark:border-rose-900/40 rounded-lg px-3 py-2 mt-3">
                <span>🔒 Session has finished. Cashiers are in Read-Only mode. Only Admins can modify closed sessions.</span>
              </div>
            )}

            {error && (
              <div className="text-sm text-red-600 bg-red-50 dark:bg-red-950/40 border border-red-200 dark:border-red-900/50 rounded-lg px-3 py-2 mt-3 space-y-1">
                <p>{error}</p>
              </div>
            )}

            <div className="flex gap-2 mt-3">
              <button
                type="button"
                onClick={() => handleSave(pendingTokens)}
                disabled={!canWrite || saving || (pendingTokens.length === 0 && !editingId)}
                className={`flex-1 text-white text-sm font-medium py-2.5 rounded-lg transition ${
                  !canWrite
                    ? 'bg-gray-400 dark:bg-slate-700 cursor-not-allowed opacity-75'
                    : editingId && pendingTokens.length === 0
                    ? 'bg-red-600 hover:bg-red-700 font-bold shadow-md'
                    : 'bg-indigo-600 hover:bg-indigo-700 disabled:opacity-50'
                }`}
              >
                {!canWrite
                  ? 'Session Closed (Read Only)'
                  : saving
                  ? t('common.saving')
                  : editingId
                  ? pendingTokens.length === 0
                    ? `Delete Voucher (#${editingSrNo || ''})`
                    : t('common.update')
                  : `${t('common.save')} (${formatCombo(shortcuts.save)})`}
              </button>
              <button
                type="button"
                onClick={editingId ? handleClear : onOpenHistory}
                disabled={saving}
                className="flex-1 bg-purple-600 hover:bg-purple-700 text-white text-sm font-medium py-2.5 rounded-lg transition flex items-center justify-center gap-1.5"
              >
                {editingId ? t('common.cancel') : `${t('ledger.historyTitle')} (${formatCombo(shortcuts.history)})`}
              </button>
            </div>

            {successMsg && <p className="text-sm text-green-700 bg-green-50 rounded-lg px-3 py-2 mt-3">{successMsg}</p>}
          </div>

          {/* Voucher token list — Modern Table Grid View */}
          <div className="bg-white rounded-xl border border-slate-200/90 shadow-sm overflow-hidden flex flex-col flex-1 min-h-0">
            <div className="px-3.5 py-2.5 border-b border-indigo-900/40 flex flex-wrap items-center justify-between gap-2 shrink-0 bg-gradient-to-r from-slate-900 via-slate-800 to-indigo-950 text-white shadow-sm">
              <div className="flex items-center gap-2.5">
                <span className="text-xs font-bold tracking-wide text-slate-100 flex items-center gap-1.5">
                  <span className="w-2 h-2 rounded-full bg-indigo-400 animate-pulse" />
                  {t('ledger.entriesHeader')}
                  <span className="bg-purple-500/25 border border-purple-400/30 text-purple-200 px-2.5 py-0.5 rounded text-[11px] font-mono font-bold">
                    Sr. {editingVoucher?.srNo ?? vouchersCount ?? 0}
                  </span>
                  <span className="bg-indigo-500/25 border border-indigo-400/30 text-indigo-200 px-2 py-0.5 rounded text-[11px] font-mono">
                    {pendingTokens.length} numbers
                  </span>
                  {search.trim() && <span className="text-slate-400 font-normal"> — {t('ledger.matchSuffix', { n: visibleTokens.length })}</span>}
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
                  placeholder={t('ledger.findPlaceholder')}
                  className="px-2.5 py-1 text-xs font-mono bg-slate-800/90 border border-slate-700 text-slate-100 placeholder-slate-400 rounded focus:outline-none focus:ring-2 focus:ring-indigo-400 w-28"
                />
                <span className="text-xs font-bold text-emerald-300 bg-emerald-500/20 border border-emerald-400/30 px-2.5 py-1 rounded font-mono shadow-inner">
                  {t('ledger.totalLabel', { n: pendingTotal.toLocaleString() })}
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
              className="flex-1 min-h-0 overflow-y-auto p-2 bg-slate-50/30"
            >
              {pendingTokens.length === 0 ? (
                <div className="px-4 py-8 text-center text-slate-400 text-sm font-medium">{t('ledger.noEntriesYet')}</div>
              ) : visibleTokens.length === 0 ? (
                <div className="px-4 py-8 text-center text-slate-400 text-sm font-medium">{t('ledger.noMatchEntries', { q: search })}</div>
              ) : (
                <div className="border border-slate-200/90 rounded-lg overflow-hidden bg-white shadow-xs">
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
                        <tr key={rIdx} className="even:bg-slate-50/50 hover:bg-indigo-50/40 transition-colors duration-150">
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
                                className="border border-slate-150/80 dark:border-slate-800 bg-slate-50/20 px-1 py-1.5 cursor-default"
                              />
                            );

                            const isDragging = draggedTokenId === p.id;
                            const isDragOver = dragOverTokenId === p.id;
                            const isSelected = selectedTokenIds.has(p.id);

                            return (
                              <td
                                key={p.id}
                                draggable={editingTokenId !== p.id}
                                onDragStart={e => handleCellDragStart(e, p.id)}
                                onDragOver={e => handleCellDragOver(e, p.id)}
                                onDragLeave={e => handleCellDragLeave(e, p.id)}
                                onDrop={e => handleCellDrop(e, p.id)}
                                onDragEnd={handleCellDragEnd}
                                className={`relative border px-1.5 py-1 text-left font-mono font-bold transition-all duration-150 ${
                                  isSelected
                                    ? 'bg-indigo-600 text-white dark:bg-indigo-600 dark:text-white ring-2 ring-indigo-400 rounded z-10'
                                    : 'border-slate-200/80 dark:border-slate-800 hover:bg-indigo-50/60 dark:hover:bg-slate-800/60 text-slate-900 dark:text-slate-100'
                                } ${
                                  isDragging ? 'opacity-40 bg-indigo-100 scale-95 border-dashed border-indigo-500' : ''
                                } ${
                                  isDragOver ? 'bg-indigo-200/90 ring-2 ring-indigo-500 scale-105 z-10 shadow-md' : ''
                                }`}
                              >
                                {editingTokenId === p.id ? (
                                  <input
                                    type="text"
                                    data-token-cell="true"
                                    value={editingTokenValue}
                                    onChange={e => setEditingTokenValue(normalizeInput(e.target.value, replaceSlash, replaceAsterisk))}
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
                                    className="w-full px-1 py-0.5 font-mono text-base border-2 border-indigo-500 rounded text-indigo-950 dark:text-slate-100 dark:bg-slate-800 text-left font-bold shadow-inner ring-2 ring-indigo-200"
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
                                    className={`w-full truncate font-mono font-bold text-base text-left transition-colors select-none focus:outline-none cursor-pointer ${
                                      isSelected
                                        ? 'text-white font-extrabold'
                                        : 'text-slate-900 dark:text-slate-100 hover:text-indigo-700 dark:hover:text-indigo-300'
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

        {/* Center panel: 00-99 aggregate table, session-wide — switchable between Classic (Sale only) and Mixed (Sale + Buy + Net) */}
        <div ref={middlePanelRef} className="bg-white rounded-xl border border-gray-200 shadow-sm p-2.5 h-full overflow-hidden flex flex-col min-h-0">
          <div className="flex items-center justify-between mb-2 shrink-0">
            <div className="flex items-center gap-2">
              <h2 className="text-sm font-semibold text-gray-800">00 – 99</h2>
              <div className="inline-flex rounded-lg border border-gray-200 p-0.5 bg-gray-100/90 text-xs">
                <button
                  type="button"
                  onClick={() => handleSetLedgerGridMode('classic')}
                  className={`px-2 py-0.5 font-bold rounded-md transition cursor-pointer text-[11px] flex items-center gap-1 ${
                    ledgerGridMode === 'classic'
                      ? 'bg-blue-600 text-white shadow-xs'
                      : 'text-gray-600 hover:text-gray-900'
                  }`}
                  title="Classic Sale Ledger Grid"
                >
                  <span>🛒</span>
                  <span>Classic</span>
                </button>
                <button
                  type="button"
                  onClick={() => handleSetLedgerGridMode('mixed')}
                  className={`px-2 py-0.5 font-bold rounded-md transition cursor-pointer text-[11px] flex items-center gap-1 ${
                    ledgerGridMode === 'mixed'
                      ? 'bg-indigo-600 text-white shadow-xs'
                      : 'text-gray-600 hover:text-gray-900'
                  }`}
                  title="Mixed 3-in-1 (Sale + Buy + Net) Ledger Grid"
                >
                  <span>⚖️</span>
                  <span>Mixed</span>
                </button>
              </div>
            </div>

            {ledgerGridMode === 'classic' && (
              <div className="flex items-center gap-2">
                <div className="flex items-center gap-1">
                  <button
                    type="button"
                    onClick={() => toggleGridSort('number')}
                    className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 transition flex items-center gap-0.5"
                    title={`${t('ledger.numberCol')} (${formatCombo(shortcuts.sortGridNum)})`}
                  >
                    {t('ledger.numberCol')} ({formatCombo(shortcuts.sortGridNum)})
                    {gridSortKey === 'number' && <span>{gridSortDir === 'asc' ? '▲' : '▼'}</span>}
                  </button>
                  <button
                    type="button"
                    onClick={() => toggleGridSort('amount')}
                    className="text-[10px] font-medium text-gray-500 hover:text-gray-800 px-1.5 py-0.5 rounded hover:bg-gray-100 transition flex items-center gap-0.5"
                    title={`${t('ledger.amountCol')} (${formatCombo(shortcuts.sortGridAmount)})`}
                  >
                    {t('ledger.amountCol')} ({formatCombo(shortcuts.sortGridAmount)})
                    {gridSortKey === 'amount' && <span>{gridSortDir === 'asc' ? '▲' : '▼'}</span>}
                  </button>
                </div>
                <button
                  type="button"
                  onClick={handleExportGrid}
                  className="text-[10px] px-1.5 py-0.5 bg-indigo-50 border border-indigo-200 text-indigo-700 font-medium rounded hover:bg-indigo-100 transition flex items-center gap-0.5 cursor-pointer"
                  title={`${t('ledger.exportCsv')} (${formatCombo(shortcuts.exportGrid)})`}
                >
                  <span>📥</span> {t('ledger.exportCsv')} ({formatCombo(shortcuts.exportGrid)})
                </button>
              </div>
            )}
          </div>

          {ledgerGridMode === 'mixed' ? (
            <MixedLedgerGrid
              totals={totals}
              buyTotals={buyTotals}
              limitValue={limitValue}
              isLimitActive={isLimitActive}
              rateValue={rateValue}
              hotSet={hotSet}
              notBuySet={notBuySet}
              luckyNo={luckyNo}
              handleCellClick={handleCellClick}
              shortcuts={shortcuts}
              formatCombo={formatCombo}
              t={t}
            />
          ) : (
            <>
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
                        {row.map((num, colIdx) => {
                          if (num === null) {
                            return <td key={colIdx} colSpan={2} className="border border-gray-200" />;
                          }

                          const amount = totals?.[num] ?? 0;
                          const isNotBuy = notBuySet.has(num);
                          const isHot = hotSet.has(num);
                          const isLucky = num === luckyNo;
                          const isOverLimit = isLimitActive && amount > limitValue;

                          // Purple (over limit) and red (winning number) carry
                          // through to the amount cell too — green ("has
                          // amount") stays on the number cell only.
                          let cls = 'bg-gray-50 text-gray-600';
                          let amountCls = 'text-gray-700';
                          if (isLucky) {
                            cls = 'bg-red-600 text-white';
                            amountCls = 'bg-red-600 text-white';
                          } else if (isOverLimit) {
                            cls = 'bg-purple-500 text-white';
                            amountCls = 'bg-purple-500 text-white';
                          } else if (amount > 0) {
                            cls = 'bg-green-500 text-white';
                          } else if (isNotBuy) {
                            cls = 'bg-gray-300 text-gray-500';
                          } else if (isHot) {
                            cls = 'bg-yellow-300 text-yellow-900';
                          }

                          return (
                            <Fragment key={colIdx}>
                              <td
                                onClick={() => handleCellClick(num)}
                                title={amount ? `${num}: ${amount}${isLucky ? ' — 🎯' : ''}` : isLucky ? `${num} — 🎯` : num}
                                className={`px-0.5 py-0.5 text-xs font-mono font-semibold text-center cursor-pointer hover:opacity-90 transition border border-gray-200 ${cls}`}
                              >
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

              {/* Bottom stat row (2/4, 1/4, 1/4 width ratio) */}
              <div className="grid grid-cols-4 gap-1.5 mt-2">
                <div className="col-span-2 bg-orange-500 text-white rounded-lg px-2 py-1.5 text-center font-mono font-semibold text-xs truncate" title={bestSeller && bestSeller.amount > 0 ? `[${bestSeller.num}] ${bestSeller.amount.toLocaleString()} × ${rateValue || 0} = ${orangeLiability.toLocaleString()}` : ''}>
                  {bestSeller && bestSeller.amount > 0 ? (
                    `[${bestSeller.num}] ${bestSeller.amount.toLocaleString()} × ${rateValue || 0} = ${orangeLiability.toLocaleString()}`
                  ) : (
                    '—'
                  )}
                </div>
                <div className="col-span-1 bg-pink-100 text-pink-900 rounded-lg px-2 py-1.5 text-center font-mono font-semibold text-xs truncate">
                  {pinkStat ? pinkStat.toFixed(2) : '—'}
                </div>
                <div className="col-span-1 bg-purple-100 text-purple-900 rounded-lg px-2 py-1.5 text-center font-mono font-semibold text-xs truncate">
                  {grandTotal.toLocaleString()}
                </div>
              </div>
            </>
          )}
        </div>

        <div
          className="bg-white rounded-xl border border-gray-200 shadow-sm p-3 overflow-hidden flex flex-col h-full min-h-0"
        >
          <div className="flex items-center justify-between mb-2 shrink-0">
            <h2 className="text-sm font-semibold text-gray-800 flex items-center gap-1.5">
              <Link
                href={`/org/${orgId}/2d/buy`}
                className="hover:text-purple-700 hover:underline transition flex items-center gap-1.5"
                title="Go to Buy Page"
              >
                <span>🛒</span> {t('ledger.exceedPanelTitle')}
              </Link>
            </h2>
            <div className="flex flex-wrap items-center gap-1.5">
              <Link
                href={`/org/${orgId}/2d/buy`}
                className="text-xs px-2.5 py-1 bg-purple-600 hover:bg-purple-700 text-white font-medium rounded-lg transition flex items-center gap-1 shadow-xs"
                title="Go to Buy Page to enter buy vouchers"
              >
                <span>🛒</span> Buy
              </Link>
              {exceedList.length > 0 && (
                <button
                  type="button"
                  onClick={handleCopyExceedLimit}
                  className="text-xs px-2.5 py-1 bg-blue-50 border border-blue-200 text-blue-700 font-medium rounded-lg hover:bg-blue-100 transition flex items-center gap-1 cursor-pointer"
                  title="Copy Exceed list (Number - Amount)"
                >
                  <span>📋</span> Copy
                </button>
              )}
            </div>
          </div>

          <div className="flex flex-col flex-1 min-h-0 justify-between">
            <div className="flex-1 min-h-0 overflow-y-auto mb-2 border border-gray-200 rounded-lg">
              <table className="w-full text-xs border-collapse">
                <thead>
                  <tr className="bg-gray-50 text-[11px] text-gray-600 uppercase tracking-wide border-b border-gray-200 font-medium">
                    <th className="px-1 py-1.5 border-r border-gray-200 text-center font-semibold bg-purple-600 text-white w-16">
                      <button
                        type="button"
                        onClick={() => toggleExceedSort('num')}
                        className="hover:text-gray-100 transition font-bold flex items-center justify-center gap-0.5 mx-auto text-white"
                      >
                        Number
                        {exceedSortKey === 'num' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                      </button>
                    </th>
                    <th className="px-1 py-1.5 border-r border-gray-200 text-right font-semibold bg-purple-50 text-purple-900">
                      <button
                        type="button"
                        onClick={() => toggleExceedSort('excess')}
                        className="hover:text-purple-700 transition font-bold flex items-center justify-center gap-0.5 ml-auto text-purple-900"
                      >
                        Exceed
                        {exceedSortKey === 'excess' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                      </button>
                    </th>
                    <th className="px-1 py-1.5 border-r border-gray-200 text-right font-semibold bg-amber-50 text-amber-900">
                      <button
                        type="button"
                        onClick={() => toggleExceedSort('buy')}
                        className="hover:text-amber-700 transition font-bold flex items-center justify-center gap-0.5 ml-auto text-amber-900"
                      >
                        Buy
                        {exceedSortKey === 'buy' && <span>{exceedSortDir === 'asc' ? '▲' : '▼'}</span>}
                      </button>
                    </th>
                    <th className="px-1 py-1.5 text-right font-semibold bg-indigo-50 text-indigo-900">
                      <button
                        type="button"
                        onClick={() => toggleExceedSort('total')}
                        className="hover:text-indigo-700 transition font-bold flex items-center justify-center gap-0.5 ml-auto text-indigo-900"
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
                      <td colSpan={4} className="px-3 py-10 text-center text-gray-400 text-xs font-medium">
                        {!isLimitActive
                          ? 'No active limit (Buy vouchers will appear here when entered)'
                          : t('ledger.noExceedEntries')}
                      </td>
                    </tr>
                  ) : (
                    exceedList.map(e => (
                      <tr
                        key={e.num}
                        onClick={() => router.push(`/org/${orgId}/2d/buy`)}
                        className="cursor-pointer hover:bg-purple-100/60 transition border-b border-gray-100"
                        title="Click to go to Buy Page"
                      >
                        <td className="px-1.5 py-1 font-mono font-semibold text-center bg-purple-500 text-white border-r border-gray-200">
                          {e.num}
                        </td>
                        <td className="px-1.5 py-1 text-right font-mono whitespace-nowrap border-r border-gray-200 bg-purple-50 text-purple-900 font-semibold">
                          {e.excess.toLocaleString()}
                        </td>
                        <td className="px-1.5 py-1 text-right font-mono whitespace-nowrap border-r border-gray-200 bg-amber-50 text-amber-900 font-semibold">
                          {e.buy > 0 ? `-${e.buy.toLocaleString()}` : '0'}
                        </td>
                        <td className="px-1.5 py-1 text-right font-mono whitespace-nowrap bg-indigo-50 text-indigo-900 font-bold">
                          {e.total.toLocaleString()}
                        </td>
                      </tr>
                    ))
                  )}
                </tbody>
              </table>
            </div>

            <div className="border-t border-gray-200 pt-2 space-y-1 text-xs font-mono shrink-0">
              <div className="flex justify-between text-gray-600 px-1 font-semibold">
                <span>Exceed Total:</span>
                <span className="text-purple-900 font-bold">{totalExcess.toLocaleString()}</span>
              </div>
              <div className="flex justify-between text-gray-600 px-1 font-semibold">
                <span>Buy Total:</span>
                <span className="text-amber-700 font-bold">{totalBuy > 0 ? `-${totalBuy.toLocaleString()}` : '0'}</span>
              </div>
              <div className="flex justify-between text-gray-900 font-bold border-t border-gray-200 pt-1 px-1 text-xs">
                <span>Total (Exceed - Buy):</span>
                <span className="text-indigo-700 font-extrabold">{totalRemaining.toLocaleString()}</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      {cellPopup && (
        <div className="fixed bottom-6 right-6 bg-white rounded-xl shadow-xl border border-gray-200 px-6 py-4 text-center min-w-[180px] z-20 relative">
          <button
            type="button"
            onClick={() => setCellPopup(null)}
            className="absolute top-1.5 right-2 text-gray-400 hover:text-gray-600 text-sm"
            aria-label={t('common.close')}
          >
            ✕
          </button>
          <p className="font-mono text-3xl font-bold text-gray-900">
            {cellPopup.num}
            {cellPopup.num === luckyNo && <span className="ml-2 align-middle text-lg">🎯</span>}
          </p>
          <p className="text-xs text-gray-500 mt-1">{t('ledger.totalAmount')}</p>
          <p className="text-xl font-semibold text-gray-900">{cellPopup.amount.toLocaleString()}</p>
        </div>
      )}

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
                className="text-gray-400 hover:text-gray-600 text-base"
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
                  className="w-full px-3 py-2 text-sm font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
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
                  className="w-full px-3 py-2 text-sm font-mono border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
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
                className="px-4 py-2 text-xs font-semibold border border-gray-300 rounded-lg hover:bg-gray-100 transition"
              >
                Cancel
              </button>
              <button
                type="button"
                onClick={handleQuickSubmit}
                className="px-4 py-2 text-xs font-semibold text-white bg-indigo-600 hover:bg-indigo-700 rounded-lg transition"
              >
                Submit
              </button>
            </div>
          </div>
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

      {guideModalOpen && (
        <LotteryGuideModal
          isOpen={guideModalOpen}
          onClose={() => setGuideModalOpen(false)}
        />
      )}

      </div>
    </div>
  );
}
