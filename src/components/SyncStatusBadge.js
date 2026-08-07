'use client';
import { useEffect, useState, useCallback } from 'react';

const STYLES = {
  online: 'bg-green-50 text-green-700',
  pending: 'bg-amber-50 text-amber-700',
  syncing: 'bg-blue-50 text-blue-700',
  offline: 'bg-gray-100 text-gray-500',
  error: 'bg-red-50 text-red-700',
};

function label(status) {
  if (status.status === 'error') return 'Sync error';
  if (status.status === 'syncing') return 'Syncing…';
  if (status.status === 'offline') return 'Offline';
  if (status.pendingCount > 0) return `${status.pendingCount} pending`;
  return 'Synced';
}

function styleKey(status) {
  if (status.status === 'error') return 'error';
  if (status.status === 'syncing') return 'syncing';
  if (status.status === 'offline') return 'offline';
  if (status.pendingCount > 0) return 'pending';
  return 'online';
}

export default function SyncStatusBadge() {
  const [status, setStatus] = useState(null);
  const [triggering, setTriggering] = useState(false);

  const poll = useCallback(async () => {
    try {
      const res = await fetch('/api/sync/status');
      const data = await res.json();
      setStatus(data);
    } catch {
      // ignore — next poll will retry
    }
  }, []);

  useEffect(() => {
    poll();
    const id = setInterval(poll, 5000);
    return () => clearInterval(id);
  }, [poll]);

  async function syncNow() {
    setTriggering(true);
    try {
      const res = await fetch('/api/sync/trigger', { method: 'POST' });
      const data = await res.json();
      setStatus(data);
    } finally {
      setTriggering(false);
    }
  }

  if (!status || !status.configured) return null;

  return (
    <div className="flex items-center gap-2">
      <span className={`inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium ${STYLES[styleKey(status)]}`}>
        {label(status)}
      </span>
      <button
        onClick={syncNow}
        disabled={triggering || status.status === 'syncing'}
        className="text-xs text-gray-400 hover:text-gray-600 disabled:opacity-50"
      >
        Sync now
      </button>
    </div>
  );
}
