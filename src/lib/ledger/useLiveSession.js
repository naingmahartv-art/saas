'use client';
import { useEffect, useState } from 'react';

// Subscribes to the SSE stream in session-stream/route.js — the server holds
// the actual Firestore listener; this just consumes the relayed updates.
// EventSource reconnects on its own when the connection drops (including
// when a Vercel function's execution-time limit ends it), so no custom
// retry logic is needed here.
export default function useLiveSession(orgId, sessionId) {
  const [live, setLive] = useState(null);

  useEffect(() => {
    if (!orgId || !sessionId) {
      setLive(null);
      return;
    }

    const es = new EventSource(`/api/org/${orgId}/ledger/session-stream?sessionId=${encodeURIComponent(sessionId)}`);

    es.onmessage = (event) => {
      try {
        setLive(JSON.parse(event.data));
      } catch {
        // ignore a malformed frame — the next one will still arrive
      }
    };

    return () => es.close();
  }, [orgId, sessionId]);

  return live;
}
