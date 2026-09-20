'use client';
import { useState, useEffect, useCallback } from 'react';
import LedgerEntry from './LedgerEntry.js';
import LedgerHistory from './LedgerHistory.js';
import SessionPicker from './SessionPicker.js';
import ReportsModal from './ReportsModal.js';
import useLedgerShortcuts from '@/lib/ledger/useLedgerShortcuts.js';
import useLiveSession from '@/lib/ledger/useLiveSession.js';
import { matchesCombo } from '@/lib/ledger/shortcuts.js';
import { saveLocalAgentsBulk, getLocalAgents } from '@/lib/ledger/localVoucherDb.js';

// Coordinates shared state between the entry panel and the saved-voucher
// history panel: session-wide per-number totals (drives the grid/stats in
// both), and which voucher (if any) is currently loaded for editing.
export default function LedgerWorkspace({
  orgId,
  activeSession,
  agents = [],
  rate,
  limit,
  notBuyNumbers: initialNotBuyNumbers = [],
  hotNumbers: initialHotNumbers = [],
  luckyNumber: initialLuckyNumber = null,
  machines = [],
  canWrite,
  userRole,
}) {
  const [effectiveAgents, setEffectiveAgents] = useState(() => {
    if (agents && agents.length > 0) {
      if (typeof window !== 'undefined') {
        try {
          localStorage.setItem(`agents_cache_${orgId}`, JSON.stringify(agents));
        } catch {}
      }
      return agents;
    }
    if (typeof window !== 'undefined') {
      try {
        const cached = localStorage.getItem(`agents_cache_${orgId}`);
        if (cached) return JSON.parse(cached);
      } catch {}
    }
    return agents || [];
  });

  const [effectiveSession, setEffectiveSession] = useState(() => {
    if (activeSession) {
      if (typeof window !== 'undefined') {
        try {
          localStorage.setItem(`session_cache_${orgId}`, JSON.stringify(activeSession));
        } catch {}
      }
      return activeSession;
    }
    if (typeof window !== 'undefined') {
      try {
        const cached = localStorage.getItem(`session_cache_${orgId}`);
        if (cached) return JSON.parse(cached);
      } catch {}
    }
    return activeSession || null;
  });

  const [effectiveRate, setEffectiveRate] = useState(() => {
    if (rate) {
      if (typeof window !== 'undefined') {
        try {
          localStorage.setItem(`rate_cache_${orgId}`, JSON.stringify(rate));
        } catch {}
      }
      return rate;
    }
    if (typeof window !== 'undefined') {
      try {
        const cached = localStorage.getItem(`rate_cache_${orgId}`);
        if (cached) return JSON.parse(cached);
      } catch {}
    }
    return rate || null;
  });

  const [effectiveLimit, setEffectiveLimit] = useState(() => {
    if (limit) {
      if (typeof window !== 'undefined') {
        try {
          localStorage.setItem(`limit_cache_${orgId}`, JSON.stringify(limit));
        } catch {}
      }
      return limit;
    }
    if (typeof window !== 'undefined') {
      try {
        const cached = localStorage.getItem(`limit_cache_${orgId}`);
        if (cached) return JSON.parse(cached);
      } catch {}
    }
    return limit || null;
  });

  const [effectiveMachines, setEffectiveMachines] = useState(() => {
    if (machines && machines.length > 0) {
      if (typeof window !== 'undefined') {
        try {
          localStorage.setItem(`machines_cache_${orgId}`, JSON.stringify(machines));
        } catch {}
      }
      return machines;
    }
    if (typeof window !== 'undefined') {
      try {
        const cached = localStorage.getItem(`machines_cache_${orgId}`);
        if (cached) return JSON.parse(cached);
      } catch {}
    }
    return machines && machines.length > 0
      ? machines
      : [{ machineId: 1, minSerial: 1, maxSerial: 999, label: 'Machine 1' }];
  });

  useEffect(() => {
    async function syncAgents() {
      if (agents && agents.length > 0) {
        setEffectiveAgents(agents);
        await saveLocalAgentsBulk(orgId, agents);
      } else {
        const localList = await getLocalAgents(orgId);
        if (localList && localList.length > 0) {
          setEffectiveAgents(localList);
        }
      }
    }
    syncAgents();
  }, [agents, orgId]);

  useEffect(() => {
    if (activeSession) {
      setEffectiveSession(activeSession);
      try {
        localStorage.setItem(`session_cache_${orgId}`, JSON.stringify(activeSession));
      } catch {}
    }
  }, [activeSession, orgId]);

  useEffect(() => {
    if (rate) {
      setEffectiveRate(rate);
      try {
        localStorage.setItem(`rate_cache_${orgId}`, JSON.stringify(rate));
      } catch {}
    }
  }, [rate, orgId]);

  useEffect(() => {
    if (limit) {
      setEffectiveLimit(limit);
      try {
        localStorage.setItem(`limit_cache_${orgId}`, JSON.stringify(limit));
      } catch {}
    }
  }, [limit, orgId]);

  useEffect(() => {
    if (machines && machines.length > 0) {
      setEffectiveMachines(machines);
      try {
        localStorage.setItem(`machines_cache_${orgId}`, JSON.stringify(machines));
      } catch {}
    }
  }, [machines, orgId]);

  const [totals, setTotals] = useState({});
  const [buyTotals, setBuyTotals] = useState({});
  const [vouchersCount, setVouchersCount] = useState(0);
  const [luckyNumber, setLuckyNumber] = useState(initialLuckyNumber);
  const [hotNumbers, setHotNumbers] = useState(initialHotNumbers);
  const [notBuyNumbers, setNotBuyNumbers] = useState(initialNotBuyNumbers);
  const [editingVoucher, setEditingVoucher] = useState(null);
  const [refreshSignal, setRefreshSignal] = useState(0);
  const [isHistoryOpen, setIsHistoryOpen] = useState(false);
  const [reportsTab, setReportsTab] = useState(null);

  // SessionPicker starts closed if an active session exists or has already been acknowledged
  const [isSessionPickerOpen, setIsSessionPickerOpen] = useState(() => {
    if (typeof window !== 'undefined') {
      const acknowledged = sessionStorage.getItem('session_picker_acknowledged');
      if (acknowledged) return false;
    }
    return !effectiveSession;
  });

  useEffect(() => {
    if (effectiveSession && typeof window !== 'undefined') {
      sessionStorage.setItem('session_picker_acknowledged', 'true');
    }
  }, [effectiveSession]);

  const handleCloseSessionPicker = useCallback(() => {
    if (typeof window !== 'undefined') {
      sessionStorage.setItem('session_picker_acknowledged', 'true');
    }
    setIsSessionPickerOpen(false);
  }, []);
  const { shortcuts, replaceSlash, replaceAsterisk } = useLedgerShortcuts();

  const refreshTotals = useCallback(async () => {
    if (!effectiveSession) return;
    try {
      const res = await fetch(
        `/api/org/${orgId}/ledger/totals?onCount=${effectiveSession.onCount}&ampm=${effectiveSession.ampm}`
      );
      const data = await res.json();
      setTotals(data.totals || {});
      setBuyTotals(data.buyTotals || {});
      if (data.luckyNumber !== undefined) setLuckyNumber(data.luckyNumber);
      if (typeof data.vouchersCount === 'number') {
        setVouchersCount(data.vouchersCount);
      }
    } catch {
      // keep last known totals on failure
    }
  }, [orgId, effectiveSession]);

  useEffect(() => {
    refreshTotals();
  }, [refreshTotals]);

  // Server-held Firestore listener, relayed over SSE — picks up saves from
  // *any* cashier in this session, not just this browser's own (that part is
  // covered by the optimistic bump below). See session-stream/route.js and
  // useLiveSession.js. Falls back gracefully to the fetch-based paths above
  // if the stream hasn't connected yet or drops.
  const live = useLiveSession(orgId, effectiveSession?.id, { scope: 'sale' });
  useEffect(() => {
    if (!live) return;
    setTotals(live.totals || {});
    if (live.buyTotals) setBuyTotals(live.buyTotals);
    setLuckyNumber(live.luckyNumber ?? null);
    setHotNumbers(live.hotNumbers || []);
    setNotBuyNumbers(live.notBuyNumbers || []);
    const count = typeof live.vouchersCount === 'number' ? live.vouchersCount : live.voucherCount;
    if (typeof count === 'number') setVouchersCount(count);
  }, [live]);

  // Bumps the totals grid the instant a voucher is queued (see
  // LedgerEntry.js's handleSave) — pure client-side math using the same
  // parser the server uses, so the exceed-limit/hot-number grid reflects the
  // cashier's own entries with zero latency instead of waiting on the
  // network round trip that queuing was built to avoid.
  const applyOptimisticTotals = useCallback((entries) => {
    setVouchersCount(c => c + 1);
    setTotals(prev => {
      const next = { ...prev };
      for (const e of entries) {
        const amt = parseFloat(e.amount) || 0;
        next[e.num] = (next[e.num] || 0) + amt;
      }
      return next;
    });
  }, []);

  const applyOptimisticBuyTotals = useCallback((buyItems) => {
    setBuyTotals(prev => {
      const next = { ...prev };
      for (const item of buyItems) {
        const amt = parseFloat(item.amount) || 0;
        next[item.num] = (next[item.num] || 0) + amt;
      }
      return next;
    });
  }, []);

  useEffect(() => {
    function handleKeyDown(e) {
      if (shortcuts && matchesCombo(e, shortcuts.history)) {
        e.preventDefault();
        setIsHistoryOpen(open => !open);
      } else if (e.key === 'Escape' && isHistoryOpen) {
        setIsHistoryOpen(false);
      }
    }
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isHistoryOpen, shortcuts]);

  return (
    <div className="w-full px-3 py-3">
      <LedgerEntry
        orgId={orgId}
        activeSession={effectiveSession}
        agents={effectiveAgents}
        rate={effectiveRate}
        limit={effectiveLimit}
        notBuyNumbers={effectiveSession?.notBuyNumbers || notBuyNumbers}
        hotNumbers={effectiveSession?.hotNumbers || hotNumbers}
        luckyNumber={effectiveSession?.luckyNumber || luckyNumber}
        totals={totals}
        buyTotals={buyTotals}
        vouchersCount={vouchersCount}
        editingVoucher={editingVoucher}
        canWrite={canWrite}
        userRole={userRole}
        shortcuts={shortcuts}
        replaceSlash={replaceSlash}
        replaceAsterisk={replaceAsterisk}
        onOptimisticSave={applyOptimisticTotals}
        onOptimisticBuySave={applyOptimisticBuyTotals}
        onSaved={() => {
          setEditingVoucher(null);
          refreshTotals();
          setRefreshSignal(s => s + 1);
        }}
        onCancelEdit={() => setEditingVoucher(null)}
        onOpenHistory={() => setIsHistoryOpen(true)}
        onOpenSessionPicker={() => setIsSessionPickerOpen(true)}
        onOpenReports={() => setReportsTab('allAgent')}
        onOpenSale1={() => setReportsTab('agent')}
        onOpenSale2={() => setReportsTab('summary')}
      />

      {isSessionPickerOpen && (
        <SessionPicker
          orgId={orgId}
          activeSession={effectiveSession}
          machines={effectiveMachines}
          onClose={handleCloseSessionPicker}
        />
      )}

      {reportsTab && (
        <ReportsModal
          orgId={orgId}
          activeSession={effectiveSession}
          agents={effectiveAgents}
          initialTab={reportsTab}
          onClose={() => setReportsTab(null)}
        />
      )}

      {isHistoryOpen && (
        <div
          className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4"
          onClick={() => setIsHistoryOpen(false)}
        >
          <div
            className="bg-white rounded-xl shadow-2xl max-w-5xl w-full max-h-[90vh] flex flex-col overflow-hidden border border-gray-200"
            onClick={e => e.stopPropagation()}
          >
            <div className="overflow-y-auto">
              <LedgerHistory
                orgId={orgId}
                activeSession={effectiveSession}
                isBuy={false}
                canWrite={canWrite}
                onEdit={slip => {
                  setEditingVoucher(slip);
                  setIsHistoryOpen(false);
                }}
                onDeleted={() => {
                  refreshTotals();
                  setRefreshSignal(s => s + 1);
                }}
                refreshSignal={refreshSignal}
                onClose={() => setIsHistoryOpen(false)}
              />
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
