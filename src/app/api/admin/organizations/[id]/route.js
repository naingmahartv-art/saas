import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { getDb, orgDoc, usersCol } from '@/lib/db/firestore.js';

// DELETE — remove organization. Firestore has no FK cascade, so this
// recursively deletes the org doc's own subcollections (agents, sessions +
// nested vouchers, restrictions, activityLogs, etc.) via the admin SDK's
// recursiveDelete, then separately deletes the org's users — `users` is a
// top-level collection (needed for cross-org email lookup at login), not a
// subcollection of the org, so it isn't covered by the recursive delete.
export async function DELETE(request, { params }) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized' }, { status: 401 });
  }

  const { id } = await params;
  const db = getDb();

  const usersSnap = await usersCol().where('orgId', '==', id).get();
  if (!usersSnap.empty) {
    const batch = db.batch();
    usersSnap.docs.forEach(d => batch.delete(d.ref));
    await batch.commit();
  }

  await db.recursiveDelete(orgDoc(id));

  return NextResponse.json({ ok: true });
}
