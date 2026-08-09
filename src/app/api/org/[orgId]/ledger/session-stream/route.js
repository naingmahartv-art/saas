import { orgSessionDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';

export const dynamic = 'force-dynamic';
export const runtime = 'nodejs'; // firebase-admin needs Node, not Edge

const HEARTBEAT_MS = 20000;
const encoder = new TextEncoder();

function sseFrame(payload) {
  return encoder.encode(`data: ${JSON.stringify(payload)}\n\n`);
}

// GET /api/org/[orgId]/ledger/session-stream?sessionId=... — a Server-Sent
// Events stream that relays the session document's live-changing fields
// (totals, luckyNumber, hotNumbers, notBuyNumbers, voucherCount) to the
// browser. The connection itself is a normal same-origin request, so the
// existing session cookie carries the same auth check every other ledger
// route uses — no separate auth mechanism for this endpoint.
//
// The actual Firestore listener lives here, server-side, via firebase-admin;
// the browser never talks to Firestore directly (see EventSource client in
// src/lib/ledger/useLiveSession.js). Vercel serverless functions have
// execution-time limits, so this connection will eventually get cut and
// EventSource will reconnect on its own — that's expected, not a bug.
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return new Response('Unauthorized', { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const sessionId = searchParams.get('sessionId');
  if (!sessionId) {
    return new Response('sessionId is required', { status: 400 });
  }

  let unsubscribe = null;
  let heartbeat = null;

  const stream = new ReadableStream({
    start(controller) {
      unsubscribe = orgSessionDoc(orgId, sessionId).onSnapshot(
        (snap) => {
          if (!snap.exists) return;
          const data = snap.data();
          controller.enqueue(sseFrame({
            totals: data.totals || {},
            luckyNumber: data.luckyNumber || null,
            hotNumbers: data.hotNumbers || [],
            notBuyNumbers: data.notBuyNumbers || [],
            voucherCount: data.voucherCount || 0,
          }));
        },
        (err) => {
          controller.enqueue(encoder.encode(`event: error\ndata: ${JSON.stringify({ error: err.message })}\n\n`));
        }
      );

      // Keeps intermediate proxies/load balancers from timing the connection
      // out early — a comment line, ignored by EventSource's message parsing.
      heartbeat = setInterval(() => {
        try {
          controller.enqueue(encoder.encode(': heartbeat\n\n'));
        } catch {
          // controller already closed — cleanup below will catch up shortly
        }
      }, HEARTBEAT_MS);
    },
    cancel() {
      if (unsubscribe) unsubscribe();
      if (heartbeat) clearInterval(heartbeat);
    },
  });

  request.signal.addEventListener('abort', () => {
    if (unsubscribe) unsubscribe();
    if (heartbeat) clearInterval(heartbeat);
  });

  return new Response(stream, {
    headers: {
      'Content-Type': 'text/event-stream',
      'Cache-Control': 'no-cache, no-transform',
      Connection: 'keep-alive',
    },
  });
}
