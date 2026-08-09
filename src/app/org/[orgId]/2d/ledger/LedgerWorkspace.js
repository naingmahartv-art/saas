'use client';
import { useState, useEffect, useCallback } from 'react';
import LedgerEntry from './LedgerEntry.js';
import LedgerHistory from './LedgerHistory.js';
import SessionPicker from './SessionPicker.js';
import ReportsModal from './ReportsModal.js';
import useLedgerShortcuts from '@/lib/ledger/useLedgerShortcuts.js';
import useLiveSession from '@/lib/ledger/useLiveSession.js';
import { matchesCombo } from '@/lib/ledger/shortcuts.js';

// Coordinates shared state between the entry panel and the saved-voucher
// history panel: session-wide per-number totals (drives the grid/stats in
// both), and which voucher (if any) is currently loaded for editing.
export default function LedgerWorkspace({
  orgId,
  activeSession,
  agents,
  rate,
  limit,
  notBuyNumbers: initialNotBuyNumbers,
  hotNumbers: initialHotNumbers,
  luckyNumber: initialLuckyNumber,
  machines,
  canWrite,
}) {
  const [totals, setTotals] = useState({});
  const [luckyNumber, setLuckyNumber] = useState(initialLuckyNumber);
  const [hotNumbers, setHotNumbers] = useState(initialHotNumbers);
  const [notBuyNumbers, setNotBuyNumbers] = useState(initialNotBuyNumbers);
  const [editingVoucher, setEditingVoucher] = useState(null);
  const [refreshSignal, setRefreshSignal] = useState(0);
  const [isHistoryOpen, setIsHistoryOpen] = useState(false);
  const [isReportsOpen, setIsReportsOpen] = useState(false);
  // Every time the Ledger page is opened, the cashier must confirm which
  // date+slot session they're working in — so this starts open, not just
  // when no session exists yet.
  const [isSessionPickerOpen, setIsSessionPickerOpen] = useState(true);
  const { shortcuts, replaceSlash, replaceAsterisk } = useLedgerShortcuts();

  const refreshTotals = useCallback(async () => {
    if (!activeSession) return;
    try {
      const res = await fetch(
        `/api/org/${orgId}/ledger/totals?onCount=${activeSession.onCount}&ampm=${activeSession.ampm}`
      );
      const data = await res.json();
      setTotals(data.totals || {});
    } catch {
      // keep last known totals on failure
    }
  }, [orgId, activeSession]);

  useEffect(() => {
    refreshTotals();
  }, [refreshTotals]);

  // Server-held Firestore listener, relayed over SSE — picks up saves from
  // *any* cashier in this session, not just this browser's own (that part is
  // covered by the optimistic bump below). See session-stream/route.js and
  // useLiveSession.js. Falls back gracefully to the fetch-based paths above
  // if the stream hasn't connected yet or drops.
  const live = useLiveSession(orgId, activeSession?.id);
  useEffect(() => {
    if (!live) return;
    setTotals(live.totals || {});
    setLuckyNumber(live.luckyNumber ?? null);
    setHotNumbers(live.hotNumbers || []);
    setNotBuyNumbers(live.notBuyNumbers || []);
  }, [live]);

  // Bumps the totals grid the instant a voucher is queued (see
  // LedgerEntry.js's handleSave) — pure client-side math using the same
  // parser the server uses, so the exceed-limit/hot-number grid reflects the
  // cashier's own entries with zero latency instead of waiting on the
  // network round trip that queuing was built to avoid.
  const applyOptimisticTotals = useCallback((entries) => {
    setTotals(prev => {
      const next = { ...prev };
      for (const e of entries) {
        const amt = parseFloat(e.amount) || 0;
        next[e.num] = (next[e.num] || 0) + amt;
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
    <div className="px-3 py-3">
      <LedgerEntry
        orgId={orgId}
        activeSession={activeSession}
        agents={agents}
        rate={rate}
        limit={limit}
        notBuyNumbers={notBuyNumbers}
        hotNumbers={hotNumbers}
        luckyNumber={luckyNumber}
        totals={totals}
        editingVoucher={editingVoucher}
        canWrite={canWrite}
        shortcuts={shortcuts}
        replaceSlash={replaceSlash}
        replaceAsterisk={replaceAsterisk}
        onOptimisticSave={applyOptimisticTotals}
        onSaved={() => {
          setEditingVoucher(null);
          refreshTotals();
          setRefreshSignal(s => s + 1);
        }}
        onCancelEdit={() => setEditingVoucher(null)}
        onOpenHistory={() => setIsHistoryOpen(true)}
        onOpenSessionPicker={() => setIsSessionPickerOpen(true)}
        onOpenReports={() => setIsReportsOpen(true)}
      />

      {isSessionPickerOpen && (
        <SessionPicker
          orgId={orgId}
          activeSession={activeSession}
          machines={machines}
          onClose={() => setIsSessionPickerOpen(false)}
        />
      )}

      {isReportsOpen && (
        <ReportsModal
          orgId={orgId}
          activeSession={activeSession}
          agents={agents}
          onClose={() => setIsReportsOpen(false)}
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
                activeSession={activeSession}
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
