import { NextResponse } from 'next/server';
import { getSession } from '@/lib/auth';
import { systemResourcesCol } from '@/lib/db/firestore.js';

export const dynamic = 'force-dynamic';
export const revalidate = 0;

const DEFAULT_RESOURCES = [
  {
    id: 'exe_main',
    type: 'exe',
    title: 'SaaS Platform Desktop Setup.exe',
    version: '1.0.5',
    url: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FSaaS%20Platform%20Setup%201.0.4.exe?alt=media&token=4ba05faa-bf39-4667-99fc-0d9df8a72958',
    description: 'Windows Standalone Desktop App Installer with full offline support & high speed performance.',
    updatedAt: Date.now(),
  },
  {
    id: 'video_1',
    type: 'tutorial',
    title: '1. Basic Usage & Entry Guide (စတင်အသုံးပြုခြင်းနှင့် အခြေခံ ထည့်သွင်းနည်း)',
    version: '1.0.0',
    url: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20105513.mp4?alt=media&token=3bf2722f-8a77-4a57-aa77-2a6a8e3d55c1',
    description: 'Learn how to set up session, select agents, and enter 2D numbers & amounts.',
    updatedAt: Date.now(),
  },
  {
    id: 'video_2',
    type: 'tutorial',
    title: '2. Keyboard Shortcuts & Voucher Management (ကီးဘုတ် ဖြတ်လမ်းများနှင့် ဘောင်ချာ စီမံခြင်း)',
    version: '1.0.0',
    url: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20110048.mp4?alt=media&token=1a997238-a0ee-47a8-b3b6-6e1e9118f07b',
    description: 'Master fast keyboard entry, custom shortcuts, history search, and voucher editing.',
    updatedAt: Date.now(),
  },
  {
    id: 'video_3',
    type: 'tutorial',
    title: '3. Exceed Limit (Buy List), Export & Import (အဝယ်စာရင်း၊ Export နှင့် Import အသုံးပြုနည်း)',
    version: '1.0.0',
    url: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20112311.mp4?alt=media&token=1fd5ab0c-fb1c-433c-ac00-bf4f057e8b1c',
    description: 'Manage Buy list (အဝယ်), export JSON/CSV, and import CSV clipboard text directly.',
    updatedAt: Date.now(),
  },
  {
    id: 'video_4',
    type: 'tutorial',
    title: '4. Advanced Features & Daily Workflow (အဆင့်မြင့် လုပ်ဆောင်ချက်များနှင့် နေ့စဉ် အသုံးပြုပုံ)',
    version: '1.0.0',
    url: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20114921.mp4?alt=media&token=cdc923d1-86f5-4940-8031-f7e5a48e6edc',
    description: 'Complete daily workflow overview from entry, reports, win results calculation to balance settlements.',
    updatedAt: Date.now(),
  },
];

const JSON_HEADERS = {
  'Content-Type': 'application/json',
  'Cache-Control': 'no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0',
};

export async function GET() {
  try {
    const snap = await systemResourcesCol().get();
    if (snap.empty) {
      // Seed default resources so the admin has initial data to edit
      const batch = systemResourcesCol().firestore.batch();
      DEFAULT_RESOURCES.forEach((item) => {
        const ref = systemResourcesCol().doc(item.id);
        batch.set(ref, item);
      });
      await batch.commit();
      return NextResponse.json({ resources: DEFAULT_RESOURCES }, { headers: JSON_HEADERS });
    }

    const resources = snap.docs.map((doc) => ({ id: doc.id, ...doc.data() }));
    return NextResponse.json({ resources }, { headers: JSON_HEADERS });
  } catch (err) {
    console.error('GET /api/admin/resources error:', err);
    return NextResponse.json({ resources: DEFAULT_RESOURCES }, { headers: JSON_HEADERS });
  }
}

export async function POST(request) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized — Super Admin only' }, { status: 403, headers: JSON_HEADERS });
  }

  try {
    const body = await request.json();
    const { id, type, title, version, url, description } = body;

    if (!url || !title) {
      return NextResponse.json({ error: 'Title and URL are required.' }, { status: 400, headers: JSON_HEADERS });
    }

    const docType = type || 'tutorial';
    let docId = id;
    if (!docId && docType === 'exe') {
      docId = 'exe_main';
    } else if (!docId) {
      docId = `res_${Date.now()}`;
    }

    const payload = {
      id: docId,
      type: docType,
      title: title.trim(),
      version: (version || '1.0.0').trim(),
      url: url.trim(),
      description: (description || '').trim(),
      updatedAt: Date.now(),
      updatedBy: session.name || session.id,
    };

    await systemResourcesCol().doc(docId).set(payload, { merge: true });

    return NextResponse.json({ success: true, resource: payload }, { headers: JSON_HEADERS });
  } catch (err) {
    console.error('POST /api/admin/resources error:', err);
    return NextResponse.json({ error: err.message || 'Failed to save resource.' }, { status: 500, headers: JSON_HEADERS });
  }
}

export async function DELETE(request) {
  const session = await getSession();
  if (!session || session.role !== 'super_admin') {
    return NextResponse.json({ error: 'Unauthorized — Super Admin only' }, { status: 403, headers: JSON_HEADERS });
  }

  try {
    const { searchParams } = new URL(request.url);
    const id = searchParams.get('id');
    if (!id) {
      return NextResponse.json({ error: 'Resource ID is required.' }, { status: 400, headers: JSON_HEADERS });
    }

    await systemResourcesCol().doc(id).delete();
    return NextResponse.json({ success: true, deletedId: id }, { headers: JSON_HEADERS });
  } catch (err) {
    console.error('DELETE /api/admin/resources error:', err);
    return NextResponse.json({ error: err.message || 'Failed to delete resource.' }, { status: 500, headers: JSON_HEADERS });
  }
}
