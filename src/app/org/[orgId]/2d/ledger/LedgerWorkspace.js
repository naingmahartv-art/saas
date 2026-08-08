'use client';
import { useState, useEffect, useCallback } from 'react';
import LedgerEntry from './LedgerEntry.js';
import LedgerHistory from './LedgerHistory.js';
import SessionPicker from './SessionPicker.js';
import ReportsModal from './ReportsModal.js';

// Coordinates shared state between the entry panel and the saved-voucher
// history panel: session-wide per-number totals (drives the grid/stats in
// both), and which voucher (if any) is currently loaded for editing.
export default function LedgerWorkspace({
  orgId,
  activeSession,
  agents,
  rate,
  limit,
  notBuyNumbers,
  hotNumbers,
  luckyNumber,
  machines,
  canWrite,
}) {
  const [totals, setTotals] = useState({});
  const [editingVoucher, setEditingVoucher] = useState(null);
  const [refreshSignal, setRefreshSignal] = useState(0);
  const [isHistoryOpen, setIsHistoryOpen] = useState(false);
  const [isReportsOpen, setIsReportsOpen] = useState(false);
  // Every time the Ledger page is opened, the cashier must confirm which
  // date+slot session they're working in — so this starts open, not just
  // when no session exists yet.
  const [isSessionPickerOpen, setIsSessionPickerOpen] = useState(true);

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

  useEffect(() => {
    function handleKeyDown(e) {
      if (e.key === 'F8') {
        e.preventDefault();
        setIsHistoryOpen(open => !open);
      } else if (e.key === 'Escape' && isHistoryOpen) {
        setIsHistoryOpen(false);
      }
    }
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isHistoryOpen]);

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
