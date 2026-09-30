'use client';
import { useState, useMemo, useEffect } from 'react';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';

const GUIDE_ITEMS = [
  {
    id: 'direct',
    token: 'Direct',
    name: 'ရိုးရိုးဂဏန်း',
    syntax: 'ဂဏန်း + ငွေပမာဏ',
    examples: ['20500', '051000', '99300'],
    desc: 'ဂဏန်း (၂) လုံးနှင့် ထိုးလိုသော ငွေပမာဏကို တွဲ၍ ရိုက်ထည့်ခြင်း ဖြစ်ပါသည်။ (ဥပမာ 20500 = 20 ကို ၅၀၀ ကျပ်)',
    count: '၁ လုံး',
    countBadge: '1 number',
    sampleOutput: ['20 (500)'],
  },
  {
    id: 'r_same',
    token: 'R',
    name: 'အာ / အပြန် (ငွေတူ)',
    syntax: 'ဂဏန်း + R + ငွေပမာဏ',
    examples: ['20R500', '14R1000', '78R300'],
    desc: 'မူရင်းဂဏန်းနှင့် ပြောင်းပြန်ဂဏန်း (၂) လုံးစလုံးကို တူညီသော ငွေပမာဏဖြင့် ထိုးခြင်း ဖြစ်ပါသည်။ (အပူးဖြစ်ပါက ၁ လုံးသာ ထွက်ပါမည်)',
    count: '၂ လုံး',
    countBadge: '2 numbers',
    sampleOutput: ['20 (500)', '02 (500)'],
  },
  {
    id: 'r_diff',
    token: 'R',
    name: 'အာ / အပြန် (ငွေမတူ)',
    syntax: 'ဂဏန်း + ပထမငွေ + R + ဒုတိယငွေ',
    examples: ['20500R200', '141000R500', '78300R100'],
    desc: 'မူရင်းဂဏန်းကို ပထမငွေ၊ ပြောင်းပြန်ဂဏန်းကို ဒုတိယငွေဖြင့် သီးခြားစီ ခွဲ၍ ထိုးခြင်း ဖြစ်ပါသည်။ (ဥပမာ 20500R200 = 20 ကို ၅၀၀၊ 02 ကို ၂၀၀)',
    count: '၂ လုံး',
    countBadge: '2 numbers (diff)',
    sampleOutput: ['20 (500)', '02 (200)'],
  },
  {
    id: 'part',
    token: 'P /',
    name: 'ပတ်ဂဏန်း (Part)',
    syntax: 'ဂဏန်း ၁ လုံး + P + ငွေပမာဏ (သို့ /)',
    examples: ['1P500', '0P1000', '9P300'],
    desc: 'ထိုဂဏန်း ၁ လုံး ပါဝင်သော ဂဏန်းအားလုံး (၁၉) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (ရှေ့ဂဏန်း ၁ ပါဝင်မှု နှင့် နောက်ဂဏန်း ၁ ပါဝင်မှု အားလုံး)',
    count: '၁၉ လုံး',
    countBadge: '19 numbers',
    sampleOutput: ['01', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '21', '31', '41', '51', '61', '71', '81', '91'],
  },
  {
    id: 'head_series',
    token: 'F (ရှေ့)',
    name: 'ထိပ်စီး (Front Series)',
    syntax: 'ဂဏန်း ၁ လုံး + F + ငွေပမာဏ',
    examples: ['1F500', '0F1000', '5F300'],
    desc: 'ရှေ့ဂဏန်း (ထိပ်စီး) အဖြစ် သတ်မှတ်ထားသော ဂဏန်း (၁၀) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (ဥပမာ 1F500 = 10 မှ 19 အထိ)',
    count: '၁၀ လုံး',
    countBadge: '10 numbers (10-19)',
    sampleOutput: ['10', '11', '12', '13', '14', '15', '16', '17', '18', '19'],
  },
  {
    id: 'tail_series',
    token: 'F (နောက်)',
    name: 'နောက်ပိတ် (Back Series)',
    syntax: 'F + ဂဏန်း ၁ လုံး + ငွေပမာဏ',
    examples: ['F1500', 'F01000', 'F5300'],
    desc: 'နောက်ဂဏန်း (နောက်ပိတ်) အဖြစ် သတ်မှတ်ထားသော ဂဏန်း (၁၀) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (ဥပမာ F1500 = 01, 11, 21 ... 91 အထိ)',
    count: '၁၀ လုံး',
    countBadge: '10 numbers (01-91)',
    sampleOutput: ['01', '11', '21', '31', '41', '51', '61', '71', '81', '91'],
  },
  {
    id: 'matrix_brackets',
    token: '[ ]',
    name: 'ဂဏန်းခွေ (Matrix / Digit Pool)',
    syntax: '[ဂဏန်းများ] + ငွေပမာဏ',
    examples: ['[123]500', '[012]1000', '[1234]300'],
    desc: 'ကွင်းအတွင်းရှိ ဂဏန်းများ အချင်းချင်း တွဲစပ်ပြီး ထွက်လာသော ဂဏန်းအားလုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (အပူးများ ပါဝင်ပါသည်)',
    count: 'ဂဏန်း² (၃ လုံး = ၉ လုံး)',
    countBadge: 'Matrix n²',
    sampleOutput: ['11', '12', '13', '21', '22', '23', '31', '32', '33'],
  },
  {
    id: 'matrix_no_doubles',
    token: '[A...]',
    name: 'ဂဏန်းခွေ (အပူးမပါ)',
    syntax: '[A + ဂဏန်းများ] + ငွေပမာဏ',
    examples: ['[A123]500', '[A012]1000', '[A1234]300'],
    desc: 'ကွင်းအတွင်း A ထည့်ပါက အပူးဂဏန်းများ (11, 22, 33 စသည်) ကို ဖယ်ထုတ်ပြီး ကျန်အတွဲများကိုသာ ခွေပေးပါသည်။',
    count: 'အပူးမပါအတွဲများ (၆ လုံး)',
    countBadge: 'No Doubles',
    sampleOutput: ['12', '13', '21', '23', '31', '32'],
  },
  {
    id: 'brade',
    token: 'B',
    name: 'ဘရိတ် (Brade)',
    syntax: 'ဘရိတ်ဂဏန်း (၀ မှ ၉ သို့ ၁၀) + B + ငွေပမာဏ',
    examples: ['1B500', '5B1000', '0B500', '10B500'],
    desc: 'ဂဏန်း (၂) လုံးပေါင်းခြင်း ရလဒ် တူညီသော (၁၀) လုံးတွဲ ဖြစ်ပါသည်။ (0B နှင့် 10B သည် တူညီပါသည်)',
    count: '၁၀ လုံး',
    countBadge: '10 numbers',
    sampleOutput: ['01', '10', '29', '38', '47', '56', '65', '74', '83', '92'],
  },
  {
    id: 'apoo_all',
    token: 'A',
    name: 'အပူး (Apoo - အားလုံး)',
    syntax: 'A + ငွေပမာဏ',
    examples: ['A500', 'A1000', 'A200'],
    desc: 'ရှေ့နောက် ဂဏန်းတူညီသော အပူး (၁၀) လုံးလုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (00, 11, 22 ... 99)',
    count: '၁၀ လုံး',
    countBadge: '10 doubles',
    sampleOutput: ['00', '11', '22', '33', '44', '55', '66', '77', '88', '99'],
  },
  {
    id: 'apoo_even',
    token: '+A',
    name: 'စုံပူး (Even Apoo)',
    syntax: '+A + ငွေပမာဏ',
    examples: ['+A500', '+A1000', '+A200'],
    desc: 'စုံဂဏန်း အပူး (၅) လုံးကိုသာ သီးသန့် ထိုးခြင်း ဖြစ်ပါသည်။ (00, 22, 44, 66, 88)',
    count: '၅ လုံး',
    countBadge: '5 even doubles',
    sampleOutput: ['00', '22', '44', '66', '88'],
  },
  {
    id: 'apoo_odd',
    token: '-A',
    name: 'မပူး (Odd Apoo)',
    syntax: '-A + ငွေပမာဏ',
    examples: ['-A500', '-A1000', '-A200'],
    desc: 'မဂဏန်း အပူး (၅) လုံးကိုသာ သီးသန့် ထိုးခြင်း ဖြစ်ပါသည်။ (11, 33, 55, 77, 99)',
    count: '၅ လုံး',
    countBadge: '5 odd doubles',
    sampleOutput: ['11', '33', '55', '77', '99'],
  },
  {
    id: 'power',
    token: 'W',
    name: 'ပါဝါ (Power)',
    syntax: 'W + ငွေပမာဏ',
    examples: ['W500', 'W1000', 'W300'],
    desc: 'ပါဝါဂဏန်း (၁၀) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (05, 50, 16, 61, 27, 72, 38, 83, 94, 49)',
    count: '၁၀ လုံး',
    countBadge: '10 numbers',
    sampleOutput: ['05', '50', '16', '61', '27', '72', '38', '83', '94', '49'],
  },
  {
    id: 'netkhat',
    token: 'N',
    name: 'နက္ခတ် (Netkhat)',
    syntax: 'N + ငွေပမာဏ',
    examples: ['N500', 'N1000', 'N300'],
    desc: 'နက္ခတ်ဂဏန်း (၁၀) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (07, 70, 18, 81, 24, 42, 35, 53, 69, 96)',
    count: '၁၀ လုံး',
    countBadge: '10 numbers',
    sampleOutput: ['07', '70', '18', '81', '24', '42', '35', '53', '69', '96'],
  },
  {
    id: 'brother',
    token: 'X',
    name: 'ညီကို (Brother)',
    syntax: 'X + ငွေပမာဏ',
    examples: ['X500', 'X1000', 'X300'],
    desc: 'ညီကိုဂဏန်း (၂၀) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (01, 10, 12, 21, ..., 89, 98, 09, 90)',
    count: '၂၀ လုံး',
    countBadge: '20 numbers',
    sampleOutput: ['01', '10', '12', '21', '23', '32', '34', '43', '45', '54', '56', '65', '67', '76', '78', '87', '89', '98', '09', '90'],
  },
  {
    id: 'thai_netkhat',
    token: 'T',
    name: 'ထိုင်းနက္ခတ် (Thai Netkhat)',
    syntax: 'T + ငွေပမာဏ',
    examples: ['T500', 'T1000', 'T300'],
    desc: 'ထိုင်းနက္ခတ် (၁၀) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။ (09, 13, 26, 31, 47, 58, 62, 74, 85, 90)',
    count: '၁၀ လုံး',
    countBadge: '10 numbers',
    sampleOutput: ['09', '13', '26', '31', '47', '58', '62', '74', '85', '90'],
  },
  {
    id: 'parity_ss',
    token: '++ / SS',
    name: 'စုံစုံ (Even-Even)',
    syntax: '++ + ငွေပမာဏ (သို့မဟုတ် SS)',
    examples: ['++500', 'SS1000', '++300'],
    desc: 'ရှေ့ဂဏန်း စုံ ၊ နောက်ဂဏန်း စုံ ဖြစ်သော (၂၅) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။',
    count: '၂၅ လုံး',
    countBadge: '25 numbers',
    sampleOutput: ['00', '02', '04', '06', '08', '20', '22', '24', '26', '28', '40', '42', '44', '46', '48', '60', '62', '64', '66', '68', '80', '82', '84', '86', '88'],
  },
  {
    id: 'parity_mm',
    token: '-- / MM',
    name: 'မမ (Odd-Odd)',
    syntax: '-- + ငွေပမာဏ (သို့မဟုတ် MM)',
    examples: ['--500', 'MM1000', '--300'],
    desc: 'ရှေ့ဂဏန်း မ ၊ နောက်ဂဏန်း မ ဖြစ်သော (၂၅) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။',
    count: '၂၅ လုံး',
    countBadge: '25 numbers',
    sampleOutput: ['11', '13', '15', '17', '19', '31', '33', '35', '37', '39', '51', '53', '55', '57', '59', '71', '73', '75', '77', '79', '91', '93', '95', '97', '99'],
  },
  {
    id: 'parity_sm',
    token: '+- / SM',
    name: 'စုံမ (Even-Odd)',
    syntax: '+- + ငွေပမာဏ (သို့မဟုတ် SM)',
    examples: ['+-500', 'SM1000', '+-300'],
    desc: 'ရှေ့ဂဏန်း စုံ ၊ နောက်ဂဏန်း မ ဖြစ်သော (၂၅) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။',
    count: '၂၅ လုံး',
    countBadge: '25 numbers',
    sampleOutput: ['01', '03', '05', '07', '09', '21', '23', '25', '27', '29', '41', '43', '45', '47', '49', '61', '63', '65', '67', '69', '81', '83', '85', '87', '89'],
  },
  {
    id: 'parity_ms',
    token: '-+ / MS',
    name: 'မစုံ (Odd-Even)',
    syntax: '-+ + ငွေပမာဏ (သို့မဟုတ် MS)',
    examples: ['-+500', 'MS1000', '-+300'],
    desc: 'ရှေ့ဂဏန်း မ ၊ နောက်ဂဏန်း စုံ ဖြစ်သော (၂၅) လုံးကို ထိုးခြင်း ဖြစ်ပါသည်။',
    count: '၂၅ လုံး',
    countBadge: '25 numbers',
    sampleOutput: ['10', '12', '14', '16', '18', '30', '32', '34', '36', '38', '50', '52', '54', '56', '58', '70', '72', '74', '76', '78', '90', '92', '94', '96', '98'],
  },
  {
    id: 'dot_shortcut',
    token: '.',
    name: '. (အစက် = 00 အတိုကောက်)',
    syntax: '. + ငွေပမာဏ',
    examples: ['.500', '.1000', '.200'],
    desc: 'ကီးဘုတ်မှ . (အစက်) ရိုက်ထည့်ပါက "00" အဖြစ် အလိုအလျောက် ပြောင်းပေးပါသည်။ (ဥပမာ .500 = 00 ကို 500)',
    count: '၁ လုံး (00)',
    countBadge: '1 number',
    sampleOutput: ['00 (500)'],
  },
  {
    id: 'chain_plus',
    token: '+ *',
    name: '+ သို့ * (ဆက်တိုက်ထိုးခြင်း)',
    syntax: 'Token1 + Token2 + Token3',
    examples: ['20500+30200', '1P500*A300', '20R500+W200'],
    desc: '+ သို့မဟုတ် * ခံပြီး ရိုက်ထည့်ပါက အကွက်များစွာကို တစ်ကြိမ်တည်း ဆက်တိုက် ထည့်သွင်းနိုင်ပါသည်။',
    count: 'စိတ်ကြိုက်',
    countBadge: 'Chain entries',
    sampleOutput: ['20 (500)', '30 (200)'],
  },
];

export default function LotteryGuideModal({ isOpen, onClose }) {
  const [testInput, setTestInput] = useState('');
  const [copiedKey, setCopiedKey] = useState(null);
  const [expandedIds, setExpandedIds] = useState(new Set());

  // Close on Escape key
  useEffect(() => {
    if (!isOpen) return;
    function handleKeyDown(e) {
      if (e.key === 'Escape') onClose();
    }
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [isOpen, onClose]);

  // Live expression parser
  const testResults = useMemo(() => {
    if (!testInput.trim()) return null;
    const { entries, error } = parseNumberExpression(testInput);
    return { entries: entries || [], error };
  }, [testInput]);

  const toggleExpand = (id) => {
    setExpandedIds(prev => {
      const next = new Set(prev);
      if (next.has(id)) {
        next.delete(id);
      } else {
        next.add(id);
      }
      return next;
    });
  };

  const handleToggleAll = () => {
    if (expandedIds.size > 0) {
      setExpandedIds(new Set());
    } else {
      setExpandedIds(new Set(GUIDE_ITEMS.map(it => it.id)));
    }
  };

  if (!isOpen) return null;

  const handleCopyExample = (ex) => {
    navigator.clipboard?.writeText(ex);
    setCopiedKey(ex);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  return (
    <div
      className="fixed inset-0 bg-slate-900/60 backdrop-blur-xs z-50 flex items-center justify-center p-3 sm:p-5"
      onClick={onClose}
    >
      <div
        className="bg-white text-slate-800 rounded-2xl shadow-2xl max-w-4xl w-full max-h-[90vh] flex flex-col overflow-hidden border border-slate-200 antialiased"
        onClick={(e) => e.stopPropagation()}
      >
        {/* Modern Clean Header */}
        <div className="px-6 py-4 border-b border-slate-100 flex items-center justify-between shrink-0 bg-slate-50/50">
          <div>
            <h2 className="text-base sm:text-lg font-bold text-slate-900 flex items-center gap-2">
              <span>📖 2D ထီထိုး အတိုကောက် သင်္ကေတများ</span>
              <span className="text-xs font-medium px-2 py-0.5 rounded-full bg-indigo-50 text-indigo-700 border border-indigo-200">
                User Guide
              </span>
            </h2>
            <p className="text-xs text-slate-500 mt-0.5">
              အရောင်းနှင့် အဝယ် စာရင်းသွင်းရာတွင် အသုံးပြုနိုင်သော စည်းမျဉ်းများ
            </p>
          </div>

          <div className="flex items-center gap-2">
            <button
              type="button"
              onClick={handleToggleAll}
              className="text-xs font-semibold text-indigo-600 hover:text-indigo-800 bg-indigo-50 hover:bg-indigo-100 border border-indigo-200 px-3 py-1.5 rounded-lg transition whitespace-nowrap cursor-pointer"
            >
              {expandedIds.size > 0 ? '▲ အားလုံး ပိတ်မည်' : '▼ အားလုံး ဖွင့်မည်'}
            </button>

            <button
              type="button"
              onClick={onClose}
              className="w-8 h-8 rounded-full bg-slate-100 hover:bg-slate-200 text-slate-500 hover:text-slate-700 flex items-center justify-center text-sm font-bold transition cursor-pointer"
              title="Close (Esc)"
            >
              ✕
            </button>
          </div>
        </div>

        {/* Minimalist Live Test Sandbox */}
        <div className="px-6 py-3.5 bg-slate-50/90 border-b border-slate-200/80 shrink-0">
          <div className="flex flex-col sm:flex-row items-stretch sm:items-center gap-2.5">
            <span className="text-xs font-bold text-slate-700 whitespace-nowrap flex items-center gap-1.5">
              <span>⚡ စမ်းသပ်ရန်:</span>
            </span>
            <div className="flex-1 relative">
              <input
                type="text"
                value={testInput}
                onChange={(e) => setTestInput(e.target.value.toUpperCase())}
                placeholder="Token ရိုက်ထည့်၍ စမ်းသပ်ကြည့်ပါ (ဥပမာ 20R500, [123]500, 1P500, +A300, 1B500)..."
                className="w-full px-3.5 py-1.5 font-mono text-xs sm:text-sm font-semibold bg-white border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 text-slate-900 placeholder-slate-400 shadow-2xs"
              />
              {testInput && (
                <button
                  type="button"
                  onClick={() => setTestInput('')}
                  className="absolute right-2.5 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 text-xs px-1"
                >
                  ✕
                </button>
              )}
            </div>
          </div>

          {/* Test Results Output */}
          {testInput.trim() && (
            <div className="mt-2.5 p-3 rounded-lg bg-white border border-slate-200 shadow-2xs text-xs">
              {testResults?.error ? (
                <div className="text-rose-600 font-medium flex items-center gap-1.5">
                  <span>⚠️</span>
                  <span>{testResults.error}</span>
                </div>
              ) : (
                <div className="space-y-2">
                  <div className="flex items-center justify-between text-slate-600 font-medium">
                    <span>
                      ထွက်ရှိသော ဂဏန်း: <strong className="text-slate-900 font-bold">{testResults?.entries.length} လုံး</strong>
                    </span>
                    <span>
                      စုစုပေါင်းငွေ: <strong className="text-emerald-700 font-bold">
                        {testResults?.entries.reduce((sum, e) => sum + e.amount, 0).toLocaleString()} ကျပ်
                      </strong>
                    </span>
                  </div>
                  <div className="flex flex-wrap gap-1.5 max-h-24 overflow-y-auto p-2 bg-slate-50 rounded-md border border-slate-100 font-mono text-xs">
                    {testResults?.entries.map((e, idx) => (
                      <span
                        key={idx}
                        className="inline-flex items-center gap-1 px-2 py-0.5 rounded bg-white text-slate-800 border border-slate-200 font-bold text-[11px] shadow-2xs"
                      >
                        <span className="text-indigo-700">{e.num}</span>
                        <span className="text-slate-400 font-normal">({e.amount.toLocaleString()})</span>
                      </span>
                    ))}
                  </div>
                </div>
              )}
            </div>
          )}
        </div>

        {/* Clean Structured 1-Column Accordion Content List */}
        <div className="flex-1 overflow-y-auto p-5 sm:p-6 space-y-2.5 bg-slate-50/40">
          <div className="grid grid-cols-1 gap-2.5">
            {GUIDE_ITEMS.map((item) => {
              const isExpanded = expandedIds.has(item.id);

              return (
                <div
                  key={item.id}
                  className={`bg-white rounded-xl border transition shadow-2xs ${
                    isExpanded ? 'border-indigo-300 ring-1 ring-indigo-200/50' : 'border-slate-200/90 hover:border-slate-300'
                  }`}
                >
                  {/* Compact Header Summary Row (Clickable) */}
                  <div
                    onClick={() => toggleExpand(item.id)}
                    className="p-3.5 flex flex-col sm:flex-row sm:items-center justify-between gap-2.5 cursor-pointer select-none"
                  >
                    {/* Left: Token Badge & Name & Syntax */}
                    <div className="flex items-center gap-2.5 flex-wrap">
                      <span className="px-2.5 py-1 rounded-lg font-mono font-bold text-xs bg-indigo-50 text-indigo-800 border border-indigo-200">
                        {item.token}
                      </span>
                      <span className="text-xs sm:text-sm font-bold text-slate-900">
                        {item.name}
                      </span>
                      <span className="text-[11px] font-mono text-slate-600 bg-slate-50 px-2 py-0.5 rounded border border-slate-150">
                        {item.syntax}
                      </span>
                    </div>

                    {/* Right: Count Badge & Examples & Details Toggle Button */}
                    <div className="flex items-center gap-2 self-end sm:self-center flex-wrap">
                      <div className="flex items-center gap-1" onClick={(e) => e.stopPropagation()}>
                        {item.examples.slice(0, 2).map((ex) => (
                          <button
                            key={ex}
                            type="button"
                            onClick={() => {
                              handleCopyExample(ex);
                              setTestInput(ex);
                            }}
                            className={`text-[11px] font-mono font-semibold px-2 py-0.5 rounded border transition cursor-pointer ${
                              copiedKey === ex
                                ? 'bg-emerald-600 text-white border-emerald-600'
                                : 'bg-slate-50 text-slate-700 border-slate-200 hover:bg-indigo-50 hover:text-indigo-700 hover:border-indigo-200'
                            }`}
                            title="Click to test & copy"
                          >
                            {ex} {copiedKey === ex && '✓'}
                          </button>
                        ))}
                      </div>

                      <span className="text-[11px] font-medium text-slate-500 bg-slate-100 px-2 py-0.5 rounded">
                        {item.count}
                      </span>

                      <button
                        type="button"
                        onClick={(e) => {
                          e.stopPropagation();
                          toggleExpand(item.id);
                        }}
                        className="text-xs text-indigo-600 hover:text-indigo-800 font-semibold px-1.5 py-0.5 rounded hover:bg-indigo-50 transition cursor-pointer flex items-center gap-1"
                      >
                        <span>{isExpanded ? 'ဖျောက်ရန်' : 'အသေးစိတ်'}</span>
                        <span className="text-[10px]">{isExpanded ? '▲' : '▼'}</span>
                      </button>
                    </div>
                  </div>

                  {/* Expandable Details Section */}
                  {isExpanded && (
                    <div className="px-3.5 pb-3.5 pt-2 border-t border-slate-100 bg-slate-50/40 text-xs text-slate-600 space-y-2.5 animate-fadeIn">
                      {/* Detailed Myanmar Description */}
                      <div className="leading-relaxed text-slate-700">
                        <strong className="text-slate-800 font-semibold">ရှင်းလင်းချက်: </strong>
                        {item.desc}
                      </div>

                      {/* Full Examples list with copy buttons */}
                      <div className="flex items-center gap-1.5 flex-wrap pt-1">
                        <span className="font-semibold text-slate-700 text-[11px]">နမူနာ ရိုက်ထည့်ပုံများ:</span>
                        {item.examples.map((ex) => (
                          <button
                            key={ex}
                            type="button"
                            onClick={() => {
                              handleCopyExample(ex);
                              setTestInput(ex);
                            }}
                            className={`text-xs font-mono font-semibold px-2.5 py-1 rounded-md border transition cursor-pointer flex items-center gap-1 ${
                              copiedKey === ex
                                ? 'bg-emerald-600 text-white border-emerald-600'
                                : 'bg-white text-slate-800 border-slate-200 hover:bg-indigo-50 hover:text-indigo-700 hover:border-indigo-200 shadow-2xs'
                            }`}
                            title="Click to test in sandbox & copy"
                          >
                            <span>{ex}</span>
                            <span className="text-[10px] opacity-70">{copiedKey === ex ? '✓' : '📋'}</span>
                          </button>
                        ))}
                      </div>

                      {/* Full Expanded Result Preview Chips */}
                      {item.sampleOutput && (
                        <div className="pt-1.5">
                          <span className="font-semibold text-slate-700 text-[11px] block mb-1">
                            ထွက်ရှိလာမည့် ဂဏန်းများ ({item.count}):
                          </span>
                          <div className="flex flex-wrap gap-1 max-h-24 overflow-y-auto p-2 bg-white rounded-lg border border-slate-200 font-mono text-[11px]">
                            {item.sampleOutput.map((n, idx) => (
                              <span
                                key={idx}
                                className="px-1.5 py-0.5 rounded bg-slate-100 text-slate-800 border border-slate-200 font-semibold"
                              >
                                {n}
                              </span>
                            ))}
                          </div>
                        </div>
                      )}
                    </div>
                  )}
                </div>
              );
            })}
          </div>
        </div>

        {/* Modal Footer */}
        <div className="px-6 py-3 bg-white border-t border-slate-100 flex items-center justify-between shrink-0">
          <span className="text-xs text-slate-500 font-normal">
            💡 ကတ်ပြားတစ်ခုစီကို နှိပ်ပြီး အသေးစိတ်ကို ဖွင့်/ပိတ် ကြည့်ရှုနိုင်ပါသည်။
          </span>
          <button
            type="button"
            onClick={onClose}
            className="px-4 py-1.5 bg-slate-900 hover:bg-slate-800 text-white text-xs font-semibold rounded-lg transition cursor-pointer shadow-2xs"
          >
            ပိတ်မည်
          </button>
        </div>
      </div>
    </div>
  );
}
