import React from 'react';
import { systemResourcesCol } from '@/lib/db/firestore.js';
import TutorialView from './TutorialView.js';

export const dynamic = 'force-dynamic';

export default async function TutorialPage() {
  let resources = [];
  try {
    const snap = await systemResourcesCol().get();
    if (!snap.empty) {
      resources = snap.docs.map((doc) => ({ id: doc.id, ...doc.data() }));
    }
  } catch (err) {
    console.error('Server Firestore read error in /tutorial:', err);
  }

  const exeList = resources
    .filter((r) => r.type === 'exe')
    .sort((a, b) => (b.updatedAt || 0) - (a.updatedAt || 0));

  const tutorialRes = resources
    .filter((r) => r.type === 'tutorial')
    .sort((a, b) => (a.updatedAt || 0) - (b.updatedAt || 0));

  const videos = tutorialRes.map((r, i) => ({
    id: i + 1,
    title: r.title,
    subtitle: r.description || 'Step-by-step video guide.',
    mySubtitle: r.description || 'ဗီဒီယို သင်ခန်းစာ လမ်းညွှန်။',
    videoUrl: r.url,
    tags: ['Tutorial', `v${r.version || '1.0'}`],
    highlights: [
      r.description || 'Watch step-by-step video guide',
      `Version ${r.version || '1.0.0'} feature demonstration`,
    ],
  }));

  return <TutorialView initialExeList={exeList} initialVideos={videos} />;
}
