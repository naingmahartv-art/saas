import { NextResponse } from 'next/server';
import { FieldValue } from 'firebase-admin/firestore';
import { orgSessionDoc, sessionId as buildSessionId } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { onCountToSessionParts } from '@/lib/lottery/sessionSlots.js';

function sessionRefForOnCount(orgId, onCount) {
  const { onDate, ampm } = onCountToSessionParts(onCount);
  return orgSessionDoc(orgId, buildSessionId(onDate, ampm, onCount));
}

// GET /api/org/[orgId]/settings/not-buy?onCount=... — list not-buy numbers for a session
export async function GET(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { searchParams } = new URL(request.url);
  const onCount = searchParams.get('onCount');
  if (!onCount) {
    return NextResponse.json({ error: 'onCount is required' }, { status: 400 });
  }

  const onCountInt = parseInt(onCount);
  const snap = await sessionRefForOnCount(orgId, onCountInt).get();
  const nums = snap.exists ? (snap.data().notBuyNumbers || []) : [];
  const list = nums.map(num => ({ id: num, num, onCount: onCountInt, orgId }));

  return NextResponse.json({ notBuyNumbers: list });
}

// POST /api/org/[orgId]/settings/not-buy — add a not-buy number
export async function POST(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { num, onCount } = await request.json();

  if (!num || !/^\d{2}$/.test(num)) {
    return NextResponse.json({ error: 'num must be a 2-digit string ("00"-"99")' }, { status: 400 });
  }
  if (!onCount) {
    return NextResponse.json({ error: 'onCount is required' }, { status: 400 });
  }

  const onCountInt = parseInt(onCount);
  const ref = sessionRefForOnCount(orgId, onCountInt);
  const snap = await ref.get();
  if (snap.exists && (snap.data().notBuyNumbers || []).includes(num)) {
    return NextResponse.json({ error: 'Number already in not-buy list' }, { status: 409 });
  }

  await ref.set({ notBuyNumbers: FieldValue.arrayUnion(num) }, { merge: true });

  return NextResponse.json({ success: true });
}

// DELETE /api/org/[orgId]/settings/not-buy — remove a not-buy number
export async function DELETE(request, { params }) {
  const { orgId } = await params;
  const session = await getSession();
  if (!session || (session.orgId !== orgId && session.role !== 'super_admin')) {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { id, onCount } = await request.json();
  if (!id) {
    return NextResponse.json({ error: 'id is required' }, { status: 400 });
  }
  if (!onCount) {
    return NextResponse.json({ error: 'onCount is required' }, { status: 400 });
  }

  await sessionRefForOnCount(orgId, parseInt(onCount)).set(
    { notBuyNumbers: FieldValue.arrayRemove(id) },
    { merge: true }
  );

  return NextResponse.json({ success: true });
}
