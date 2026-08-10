import { orgSessionDoc } from '@/lib/db/firestore.js';
import { rtdbSessionRef } from '@/lib/db/rtdb.js';
import { getSession } from '@/lib/auth';

export const dynamic = 'force-dynamic';
export const runtime = 'nodejs';

const HEARTBEAT_MS = 20000;
const encoder = new TextEncoder();

function sseFrame(payload) {
  return encoder.encode(`data: ${JSON.stringify(payload)}\n\n`);
}

// GET /api/org/[orgId]/ledger/session-stream?sessionId=... — SSE stream relaying live
// Realtime DB totals, hot numbers, not-buy numbers, lucky numbers, and voucher counts with 0 Firestore read costs!
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

  let rtdbRef = null;
  let rtdbCallback = null;
  let heartbeat = null;

  const stream = new ReadableStream({
    start(controller) {
      try {
        rtdbRef = rtdbSessionRef(orgId, sessionId);
        rtdbCallback = (snap) => {
          const val = snap.val() || {};
          controller.enqueue(
            sseFrame({
              totals: val.totals || {},
              luckyNumber: val.luckyNumber || null,
              hotNumbers: val.hotNumbers || [],
              notBuyNumbers: val.notBuyNumbers || [],
              voucherCount: val.voucherCount || 0,
            })
          );
        };

        rtdbRef.on('value', rtdbCallback);
      } catch (err) {
        console.error('RTDB stream subscription error, fallback to Firestore:', err);
        // Fallback to Firestore listener
        const unsubscribe = orgSessionDoc(orgId, sessionId).onSnapshot((snap) => {
          if (!snap.exists) return;
          const data = snap.data();
          controller.enqueue(
            sseFrame({
              totals: data.totals || {},
              luckyNumber: data.luckyNumber || null,
              hotNumbers: data.hotNumbers || [],
              notBuyNumbers: data.notBuyNumbers || [],
              voucherCount: data.voucherCount || 0,
            })
          );
        });
        rtdbRef = { off: () => unsubscribe() };
      }

      heartbeat = setInterval(() => {
        try {
          controller.enqueue(encoder.encode(': heartbeat\n\n'));
        } catch {}
      }, HEARTBEAT_MS);
    },
    cancel() {
      if (rtdbRef && rtdbCallback) rtdbRef.off('value', rtdbCallback);
      else if (rtdbRef && rtdbRef.off) rtdbRef.off();
      if (heartbeat) clearInterval(heartbeat);
    },
  });

  request.signal.addEventListener('abort', () => {
    if (rtdbRef && rtdbCallback) rtdbRef.off('value', rtdbCallback);
    else if (rtdbRef && rtdbRef.off) rtdbRef.off();
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
