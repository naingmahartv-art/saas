import React from 'react';
import { systemResourcesCol } from '@/lib/db/firestore.js';
import TutorialView from './TutorialView.js';

export const dynamic = 'force-dynamic';

const DEFAULT_EXE = [
  {
    id: 'exe_main',
    type: 'exe',
    title: 'SaaS Platform Desktop Setup 1.0.4.exe',
    version: '1.0.4',
    url: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FSaaS%20Platform%20Setup%201.0.4.exe?alt=media&token=4ba05faa-bf39-4667-99fc-0d9df8a72958',
    description: 'Windows Standalone Desktop App Installer v1.0.4 with full offline support & high speed performance.',
    updatedAt: Date.now(),
  },
];

const DEFAULT_VIDEOS = [
  {
    id: 1,
    title: '1. Basic Usage & Entry Guide (စတင်အသုံးပြုခြင်းနှင့် အခြေခံ ထည့်သွင်းနည်း)',
    subtitle: 'Learn how to set up session, select agents, and enter 2D numbers & amounts.',
    mySubtitle: 'စက်ချိန်သတ်မှတ်ခြင်း၊ ကိုယ်စားလှယ်ရွေးချယ်ခြင်းနှင့် နံပါတ်/ငွေပမာဏများ ထည့်သွင်းနည်းများ။',
    videoUrl: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20105513.mp4?alt=media&token=3bf2722f-8a77-4a57-aa77-2a6a8e3d55c1',
    tags: ['Basic Usage', 'Session Setup', 'Entries', 'အခြေခံ'],
    highlights: [
      'Selecting AM/PM session and date',
      'Choosing agent and typing numbers with amounts',
      'Using space/enter to add to entry list',
      'Saving voucher slips with F1 or Save button',
    ],
  },
  {
    id: 2,
    title: '2. Keyboard Shortcuts & Voucher Management (ကီးဘုတ် ဖြတ်လမ်းများနှင့် ဘောင်ချာ စီမံခြင်း)',
    subtitle: 'Master fast keyboard entry, custom shortcuts, history search, and voucher editing.',
    mySubtitle: 'မြန်ဆန်သော ကီးဘုတ်ဖြတ်လမ်းများ အသုံးပြုခြင်း၊ စိတ်ကြိုက် ပြောင်းလဲခြင်းနှင့် မှတ်တမ်း ပြန်လည်ကြည့်ရှုပြင်ဆင်ခြင်း။',
    videoUrl: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20110048.mp4?alt=media&token=1a997238-a0ee-47a8-b3b6-6e1e9118f07b',
    tags: ['Shortcuts', 'History', 'Edit Voucher', 'ဖြတ်လမ်းများ'],
    highlights: [
      'Using function keys (F1-F12) for rapid focus & actions',
      'Configuring custom keyboard shortcuts in Account Settings',
      'Searching saved vouchers by Sr No. or Agent',
      'Editing or deleting existing voucher slips',
    ],
  },
  {
    id: 3,
    title: '3. Exceed Limit (Buy List), Export & Import (အဝယ်စာရင်း၊ Export နှင့် Import အသုံးပြုနည်း)',
    subtitle: 'Manage Buy list (အဝယ်), export JSON/CSV, and import CSV clipboard text directly.',
    mySubtitle: 'ကန့်သတ်ချက်ကျော်လွန်သော အဝယ်စာရင်းများ ကြည့်ရှုခြင်း၊ CSV/JSON ထုတ်ယူခြင်းနှင့် Clipboard မှ တိုက်ရိုက် Import လုပ်ခြင်း။',
    videoUrl: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20112311.mp4?alt=media&token=1fd5ab0c-fb1c-433c-ac00-bf4f057e8b1c',
    tags: ['Exceed Limit', 'Buy List', 'CSV Export', 'Import JSON/CSV', 'အဝယ်'],
    highlights: [
      'Setting per-number bet limits and viewing "အဝယ်" (Buy list)',
      'Exporting Exceed list to JSON or CSV files',
      'Copying clean CSV data to clipboard',
      'Pasting CSV/JSON clipboard data directly into Import modal',
    ],
  },
  {
    id: 4,
    title: '4. Advanced Features & Daily Workflow (အဆင့်မြင့် လုပ်ဆောင်ချက်များနှင့် နေ့စဉ် အသုံးပြုပုံ)',
    subtitle: 'Complete daily workflow overview from entry, reports, win results calculation to balance settlements.',
    mySubtitle: 'ထိုးစာရင်း ထည့်သွင်းခြင်းမှ ပေါက်ဂဏန်း တွက်ချက်ခြင်း၊ အစီရင်ခံစာများ ကြည့်ရှုခြင်းနှင့် ရှင်းတမ်း ပြုလုပ်ခြင်းအထိ နေ့စဉ် လုပ်ငန်းစဉ် အပြည့်အစုံ။',
    videoUrl: 'https://firebasestorage.googleapis.com/v0/b/shweywethla-49cb4.firebasestorage.app/o/share%2FScreen%20Recording%202026-08-10%20114921.mp4?alt=media&token=cdc923d1-86f5-4940-8031-f7e5a48e6edc',
    tags: ['Advanced Workflow', 'Reports & Payouts', 'Balance', 'အဆင့်မြင့်'],
    highlights: [
      'Full daily workflow from session opening to session closing',
      'Setting winning numbers and calculating payout results',
      'Viewing agent sales, commissions, and balance settlements',
      'Exporting summary PDF reports and checking activity logs',
    ],
  },
];

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

  const exeItems = resources
    .filter((r) => r.type === 'exe')
    .sort((a, b) => (b.updatedAt || 0) - (a.updatedAt || 0));

  const tutorialRes = resources.filter((r) => r.type === 'tutorial');

  const finalExeList = exeItems.length > 0 ? exeItems : DEFAULT_EXE;

  const finalVideos =
    tutorialRes.length > 0
      ? tutorialRes.map((r, i) => ({
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
        }))
      : DEFAULT_VIDEOS;

  return <TutorialView initialExeList={finalExeList} initialVideos={finalVideos} />;
}
