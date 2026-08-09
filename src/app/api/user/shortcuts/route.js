import { NextResponse } from 'next/server';
import { orgUserPreferencesCol } from '@/lib/db/firestore.js';
import { getSession } from '@/lib/auth/session.js';
import { DEFAULT_SHORTCUTS, SHORTCUT_ACTIONS, isValidCombo, mergeShortcuts } from '@/lib/ledger/shortcuts.js';

// GET /api/user/shortcuts — the current user's Ledger keyboard shortcuts, merged over the defaults
export async function GET() {
  const session = await getSession();
  if (!session) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const snap = await orgUserPreferencesCol(session.orgId || 'platform').doc(session.id).get();
  const overrides = snap.exists ? JSON.parse(snap.data().shortcuts || 'null') : null;

  return NextResponse.json({
    shortcuts: mergeShortcuts(overrides),
    defaults: DEFAULT_SHORTCUTS,
    replaceSlash: snap.exists ? snap.data().replaceSlash ?? 'P' : 'P',
    replaceAsterisk: snap.exists ? snap.data().replaceAsterisk ?? 'R' : 'R',
  });
}

// PUT /api/user/shortcuts — replace the current user's shortcut overrides
export async function PUT(request) {
  const session = await getSession();
  if (!session) return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });

  const { shortcuts, replaceSlash, replaceAsterisk } = await request.json();

  let cleaned = null;
  if (shortcuts && typeof shortcuts === 'object') {
    cleaned = {};
    for (const action of SHORTCUT_ACTIONS) {
      const combo = shortcuts[action];
      if (combo === undefined) continue;
      if (typeof combo !== 'string' || !isValidCombo(combo)) {
        return NextResponse.json({ error: `Invalid shortcut for "${action}"` }, { status: 400 });
      }
      cleaned[action] = combo;
    }

    // Reject binding two different actions to the same combo.
    const seen = new Map();
    for (const [action, combo] of Object.entries(cleaned)) {
      if (seen.has(combo)) {
        return NextResponse.json(
          { error: `"${action}" and "${seen.get(combo)}" can't share the same shortcut (${combo})` },
          { status: 400 }
        );
      }
      seen.set(combo, action);
    }
  }

  const now = Date.now();
  const ref = orgUserPreferencesCol(session.orgId || 'platform').doc(session.id);
  const snap = await ref.get();

  const dataToSave = {
    id: session.id,
    userId: session.id,
    createdAt: snap.exists ? snap.data().createdAt : now,
    updatedAt: now,
  };

  if (cleaned) {
    dataToSave.shortcuts = JSON.stringify(cleaned);
  }
  if (typeof replaceSlash === 'string') {
    dataToSave.replaceSlash = replaceSlash.toUpperCase().slice(0, 1);
  }
  if (typeof replaceAsterisk === 'string') {
    dataToSave.replaceAsterisk = replaceAsterisk.toUpperCase().slice(0, 1);
  }

  await ref.set(dataToSave, { merge: true });

  const updatedSnap = await ref.get();
  const updatedOverrides = JSON.parse(updatedSnap.data().shortcuts || 'null');

  return NextResponse.json({
    shortcuts: mergeShortcuts(updatedOverrides),
    replaceSlash: updatedSnap.data().replaceSlash ?? 'P',
    replaceAsterisk: updatedSnap.data().replaceAsterisk ?? 'R',
  });
}
