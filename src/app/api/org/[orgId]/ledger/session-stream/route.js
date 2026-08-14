import { orgSessionDoc } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth';

export const dynamic = 'force-dynamic';
export const runtime = 'nodejs';

const HEARTBEAT_MS = 20000;
const encoder = new TextEncoder();

function sseFrame(payload) {
  return encoder.encode(`data: ${JSON.stringify(payload)}\n\n`);
}

// GET /api/org/[orgId]/ledger/session-stream?sessionId=... — SSE stream relaying live
// Firestore session updates (totals, lucky numbers, voucher counts)
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
      try {
        unsubscribe = orgSessionDoc(orgId, sessionId).onSnapshot((snap) => {
          if (!snap.exists) return;
          const data = snap.data();
          controller.enqueue(
            sseFrame({
              totals: data.totals || {},
              buyTotals: data.buyTotals || {},
              luckyNumber: data.luckyNumber || null,
              hotNumbers: data.hotNumbers || [],
              notBuyNumbers: data.notBuyNumbers || [],
              voucherCount: data.voucherCount || 0,
            })
          );
        });
      } catch (err) {
        console.error('Firestore stream subscription error:', err);
      }

      heartbeat = setInterval(() => {
        try {
          controller.enqueue(encoder.encode(': heartbeat\n\n'));
        } catch {}
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
