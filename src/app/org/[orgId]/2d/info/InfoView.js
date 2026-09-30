'use client';
import { useState, useEffect, useMemo, useCallback } from 'react';
import { parseNumberExpression } from '@/lib/lottery/numberParser.js';
import { useI18n } from '@/lib/i18n/index.js';

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

const WEEKDAY_NAMES = [
  { key: 1, nameEn: 'Monday', nameMy: 'တနင်္လာ' },
  { key: 2, nameEn: 'Tuesday', nameMy: 'အင်္ဂါ' },
  { key: 3, nameEn: 'Wednesday', nameMy: 'ဗုဒ္ဓဟူး' },
  { key: 4, nameEn: 'Thursday', nameMy: 'ကြာသပတေး' },
  { key: 5, nameEn: 'Friday', nameMy: 'သောကြာ' },
];

const ALL_DIGITS = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];

const PERIOD_OPTIONS = [
  { key: '1w', labelMy: '၁ ပတ်', labelEn: '1 Week', desc: 'လက်ရှိ တစ်ပတ်တာ', weeks: 1 },
  { key: '2w', labelMy: '၂ ပတ်', labelEn: '2 Weeks', desc: 'လတ်တလော ၂ ပတ်တာ', weeks: 2 },
  { key: '3w', labelMy: '၃ ပတ်', labelEn: '3 Weeks', desc: 'လတ်တလော ၃ ပတ်တာ', weeks: 3 },
  { key: '1m', labelMy: '၁ လ', labelEn: '1 Month', desc: 'လတ်တလော ၁ လတာ', weeks: 4 },
];

const LOCAL_CACHE_PREFIX = 'lottery_period_lucky_';

function getLocalLuckyCache(orgId, period, startDate, endDate) {
  if (typeof window === 'undefined') return null;
  try {
    const key = `${LOCAL_CACHE_PREFIX}${orgId}_${period}_${startDate}_${endDate}`;
    const raw = localStorage.getItem(key);
    if (!raw) return null;
    const parsed = JSON.parse(raw);
    if (parsed && Array.isArray(parsed.sessions)) {
      return parsed.sessions;
    }
  } catch (err) {
    console.warn('Failed to read local lucky cache:', err);
  }
  return null;
}

function saveLocalLuckyCache(orgId, period, startDate, endDate, sessions) {
  if (typeof window === 'undefined') return;
  try {
    const key = `${LOCAL_CACHE_PREFIX}${orgId}_${period}_${startDate}_${endDate}`;
    localStorage.setItem(
      key,
      JSON.stringify({
        sessions,
        savedAt: Date.now(),
      })
    );
  } catch (err) {
    console.warn('Failed to save local lucky cache:', err);
  }
}

// Helper to format Date into YYYY-MM-DD
function formatDateStr(date) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const dt = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${dt}`;
}

// Helper to calculate date range for selected period and reference date
function getRangeForPeriod(period = '1w', refDate = new Date()) {
  const d = new Date(refDate);
  const day = d.getDay(); // 0: Sun, 1: Mon, ... 6: Sat
  const diffToMon = day === 0 ? -6 : 1 - day;
  const monday = new Date(d);
  monday.setDate(d.getDate() + diffToMon);

  const friday = new Date(monday);
  friday.setDate(monday.getDate() + 4);

  let startOffsetWeeks = 0;
  if (period === '2w') startOffsetWeeks = 1;
  else if (period === '3w') startOffsetWeeks = 2;
  else if (period === '1m') startOffsetWeeks = 3;

  const startDateObj = new Date(monday);
  startDateObj.setDate(monday.getDate() - (startOffsetWeeks * 7));

  const startDate = formatDateStr(startDateObj);
  const endDate = formatDateStr(friday);

  // Daily slots for the anchor Monday-Friday week
  const anchorDays = [];
  for (let i = 0; i < 5; i++) {
    const cur = new Date(monday);
    cur.setDate(monday.getDate() + i);
    anchorDays.push({
      dateStr: formatDateStr(cur),
      dayIndex: i + 1,
      weekday: WEEKDAY_NAMES[i],
      dateObj: cur,
    });
  }

  return {
    period,
    startDate,
    endDate,
    anchorMonday: formatDateStr(monday),
    anchorFriday: formatDateStr(friday),
    anchorDays,
  };
}

// Straight line SVG path generator (Point-to-Point connected straight line)
function generateStraightSvgPath(points) {
  if (!points || points.length === 0) return '';
  return points.map((pt, i) => `${i === 0 ? 'M' : 'L'} ${pt.x.toFixed(1)} ${pt.y.toFixed(1)}`).join(' ');
}


export default function InfoView({ orgId }) {
  const { t } = useI18n();
  const [selectedPeriod, setSelectedPeriod] = useState('1w'); // '1w' | '2w' | '3w' | '1m'
  const [activeMenu, setActiveMenu] = useState(null); // null (Menu Home) | 'manual' | 'analyze'
  const [currentDate, setCurrentDate] = useState(() => new Date());
  const [sessionsData, setSessionsData] = useState([]);
  const [dataSource, setDataSource] = useState('loading'); // 'local' | 'online'
  const [loading, setLoading] = useState(true);
  const [hoveredDigit, setHoveredDigit] = useState(null);
  const [selectedDetailDigit, setSelectedDetailDigit] = useState('1');
  const [activeChartTab, setActiveChartTab] = useState('wave'); // 'wave' | 'digit_timeline' | 'sparklines'
  const [showCharts, setShowCharts] = useState(false); // Default hide charts until user clicks show details
  const [showDigitBox, setShowDigitBox] = useState(true); // Default show 10-digit number box; collapsible

  // Manual tester and accordion states
  const [testInput, setTestInput] = useState('');
  const [copiedKey, setCopiedKey] = useState(null);
  const [expandedIds, setExpandedIds] = useState(new Set());

  // Sample Form states
  const [sampleFormViewMode, setSampleFormViewMode] = useState('digits'); // 'digits' | 'pairs'
  const [sampleFormFilter, setSampleFormFilter] = useState('all'); // 'all' | 'appeared' | 'remaining'
  const [sampleFormSort, setSampleFormSort] = useState('count_desc'); // 'count_desc' | 'count_asc' | 'digit_asc'
  const [copiedTableKey, setCopiedTableKey] = useState(null);

  const rangeInfo = useMemo(() => getRangeForPeriod(selectedPeriod, currentDate), [selectedPeriod, currentDate]);

  // Fetch session history for the selected period
  const fetchPeriodSessions = useCallback(async (forceOnline = false) => {
    const { startDate, endDate, period } = rangeInfo;

    // 1. If found in local and not forced, use local cache
    if (!forceOnline) {
      const localCached = getLocalLuckyCache(orgId, period, startDate, endDate);
      if (localCached !== null) {
        setSessionsData(localCached);
        setDataSource('local');
        setLoading(false);
        return;
      }
    }

    // 2. Otherwise fetch from online server API and save to local
    setLoading(true);
    try {
      const res = await fetch(
        `/api/org/${orgId}/weekly-lucky?startDate=${startDate}&endDate=${endDate}`
      );
      const data = await res.json();
      const sessions = data.sessions || [];
      setSessionsData(sessions);
      saveLocalLuckyCache(orgId, period, startDate, endDate, sessions);
      setDataSource('online');
    } catch (err) {
      // Fallback to local cache if offline
      const fallbackCached = getLocalLuckyCache(orgId, period, startDate, endDate);
      if (fallbackCached) {
        setSessionsData(fallbackCached);
        setDataSource('local');
      } else {
        setSessionsData([]);
      }
    } finally {
      setLoading(false);
    }
  }, [orgId, rangeInfo]);

  useEffect(() => {
    fetchPeriodSessions();
  }, [fetchPeriodSessions]);

  // Navigate weeks
  const handlePrevWeek = () => {
    const prev = new Date(currentDate);
    prev.setDate(prev.getDate() - 7);
    setCurrentDate(prev);
  };

  const handleNextWeek = () => {
    const next = new Date(currentDate);
    next.setDate(next.getDate() + 7);
    setCurrentDate(next);
  };

  const handleCurrentWeek = () => {
    setCurrentDate(new Date());
  };

  // Group sessions by Date and Slot
  const sessionsByDate = useMemo(() => {
    const map = new Map();
    for (const s of sessionsData) {
      const list = map.get(s.onDate) || [];
      list.push(s);
      map.set(s.onDate, list);
    }
    return map;
  }, [sessionsData]);

  // Distinct period dates sorted chronologically
  const periodDates = useMemo(() => {
    const datesSet = new Set();
    for (const s of sessionsData) {
      if (s.onDate) datesSet.add(s.onDate);
    }
    const sorted = Array.from(datesSet).sort();
    const dayNames = ['တနင်္ဂနွေ', 'တနင်္လာ', 'အင်္ဂါ', 'ဗုဒ္ဓဟူး', 'ကြာသပတေး', 'သောကြာ', 'စနေ'];
    const dayNamesEn = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return sorted.map((dStr) => {
      const parts = dStr.split('-');
      const dObj = new Date(Number(parts[0]), Number(parts[1]) - 1, Number(parts[2]));
      const dayOfWeek = dObj.getDay();
      const daySessions = sessionsByDate.get(dStr) || [];
      return {
        dateStr: dStr,
        shortDate: dStr.length >= 10 ? dStr.substring(5) : dStr,
        dayMy: dayNames[dayOfWeek] || '',
        dayEn: dayNamesEn[dayOfWeek] || '',
        sessions: daySessions,
      };
    });
  }, [sessionsData, sessionsByDate]);

  // Helper to compute daily appearance history for a specific digit
  const getDigitDailyHistory = useCallback((digit) => {
    return periodDates.map((pDate) => {
      let count = 0;
      let headCount = 0;
      let tailCount = 0;
      const matches = [];

      for (const s of pDate.sessions) {
        if (s.luckyNumber && typeof s.luckyNumber === 'string') {
          const num = s.luckyNumber.trim();
          let matched = false;
          if (num.length >= 1 && num[0] === digit) {
            count++;
            headCount++;
            matched = true;
          }
          if (num.length >= 2 && num[1] === digit) {
            count++;
            tailCount++;
            matched = true;
          }
          if (matched) {
            matches.push({
              ampm: s.ampm,
              luckyNumber: num,
              pos: num[0] === digit && num[1] === digit ? 'ထိပ်+နောက်' : num[0] === digit ? 'ထိပ်' : 'နောက်',
            });
          }
        }
      }

      return {
        ...pDate,
        count,
        headCount,
        tailCount,
        matches,
      };
    });
  }, [periodDates]);

  // Extract all lucky numbers that have appeared in the current period
  const periodLuckyNumbers = useMemo(() => {
    const list = [];
    for (const s of sessionsData) {
      if (s.luckyNumber && typeof s.luckyNumber === 'string') {
        list.push({
          number: s.luckyNumber.trim(),
          onDate: s.onDate,
          ampm: s.ampm,
        });
      }
    }
    return list;
  }, [sessionsData]);

  // Calculate detailed digit frequencies & hot/cold statistics across the chosen period
  const digitStats = useMemo(() => {
    const freq = new Map();
    const headFreq = new Map();
    const tailFreq = new Map();

    for (const d of ALL_DIGITS) {
      freq.set(d, 0);
      headFreq.set(d, 0);
      tailFreq.set(d, 0);
    }

    let totalDigitsCount = 0;
    for (const item of periodLuckyNumbers) {
      const str = item.number;
      if (str.length >= 2) {
        const head = str[0];
        const tail = str[1];
        if (headFreq.has(head)) headFreq.set(head, headFreq.get(head) + 1);
        if (tailFreq.has(tail)) tailFreq.set(tail, tailFreq.get(tail) + 1);
      }
      for (const char of str) {
        if (freq.has(char)) {
          freq.set(char, freq.get(char) + 1);
          totalDigitsCount++;
        }
      }
    }

    const items = ALL_DIGITS.map((d) => {
      const count = freq.get(d) || 0;
      const headCount = headFreq.get(d) || 0;
      const tailCount = tailFreq.get(d) || 0;
      const rate = totalDigitsCount > 0 ? ((count / totalDigitsCount) * 100).toFixed(1) : '0.0';
      return {
        digit: d,
        count,
        headCount,
        tailCount,
        rate,
      };
    });

    // Find max, min, and average counts
    const maxCount = Math.max(...items.map((i) => i.count), 0);
    const minCount = Math.min(...items.map((i) => i.count), 0);

    // Sort by count descending for ranking
    const ranked = [...items].sort((a, b) => b.count - a.count || Number(a.digit) - Number(b.digit));
    const topDigits = ranked.filter((i) => i.count > 0 && i.count === maxCount);
    const appearedDigits = items.filter((i) => i.count > 0);
    const remainingDigits = items.filter((i) => i.count === 0);

    return {
      freq,
      headFreq,
      tailFreq,
      items,
      ranked,
      maxCount,
      minCount,
      topDigits,
      appearedDigits,
      remainingDigits,
      totalLuckyNumbers: periodLuckyNumbers.length,
      totalDigitsCount,
    };
  }, [periodLuckyNumbers]);

  // 2D Full numbers frequency ranking (e.g. 12, 21, 55, etc.)
  const pairStats = useMemo(() => {
    const pairMap = new Map();
    for (const item of periodLuckyNumbers) {
      const num = item.number;
      if (num && num.length === 2) {
        if (!pairMap.has(num)) {
          pairMap.set(num, { number: num, count: 0, sessions: [] });
        }
        const obj = pairMap.get(num);
        obj.count++;
        obj.sessions.push({ onDate: item.onDate, ampm: item.ampm });
      }
    }
    const list = Array.from(pairMap.values()).sort((a, b) => b.count - a.count || a.number.localeCompare(b.number));
    return list;
  }, [periodLuckyNumbers]);

  const handleCopyTableData = (textToCopy, key = 'all') => {
    navigator.clipboard?.writeText(textToCopy);
    setCopiedTableKey(key);
    setTimeout(() => setCopiedTableKey(null), 2000);
  };

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

  const handleCopyExample = (ex) => {
    navigator.clipboard?.writeText(ex);
    setCopiedKey(ex);
    setTimeout(() => setCopiedKey(null), 2000);
  };

  return (
    <div className="w-full max-w-none px-1 sm:px-3 py-2 sm:py-4 space-y-6 antialiased">
      {/* ───────────────────────────────────────────────────────────── */}
      {/* 1. LANDING VIEW: SHOW ONLY TWO MENUS / TILES */}
      {/* ───────────────────────────────────────────────────────────── */}
      {activeMenu === null && (
        <div className="space-y-6 animate-fadeIn">
          {/* Top Title Banner */}
          <div className="bg-white text-slate-900 rounded-2xl p-6 sm:p-8 shadow-sm border border-slate-200">
            <div className="flex items-center gap-3.5">
              <div className="w-12 h-12 rounded-2xl bg-slate-100 text-slate-800 border border-slate-200 flex items-center justify-center text-2xl shadow-2xs">
                ℹ️
              </div>
              <div>
                <h1 className="text-xl sm:text-2xl font-bold tracking-wide text-slate-900 flex items-center gap-2.5">
                  <span>2D အချက်အလက် နှင့် လမ်းညွှန်</span>
                  <span className="text-xs font-normal px-2.5 py-0.5 rounded bg-slate-100 text-slate-600 border border-slate-200">
                    Information & Guide Hub
                  </span>
                </h1>
                <p className="text-xs sm:text-sm text-slate-500 mt-1">
                  အောက်ပါ ကဏ္ဍ (၂) ခုအနက် ကြည့်ရှုလိုသော အပိုင်းကို ရွေးချယ်နှိပ်ပါ
                </p>
              </div>
            </div>
          </div>

          {/* TWO MAIN MENU TILES */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {/* Tile 1: User Manual */}
            <div
              onClick={() => setActiveMenu('manual')}
              className="bg-white rounded-2xl border-2 border-slate-200 hover:border-indigo-500/80 p-6 sm:p-8 shadow-sm hover:shadow-md transition-all cursor-pointer flex flex-col justify-between group"
            >
              <div className="space-y-4">
                <div className="flex items-center justify-between">
                  <div className="w-14 h-14 rounded-2xl bg-indigo-50 text-indigo-700 border border-indigo-200/80 flex items-center justify-center text-3xl group-hover:scale-110 transition-transform">
                    📖
                  </div>
                  <span className="text-xs font-bold px-3 py-1 rounded-full bg-indigo-50 text-indigo-700 border border-indigo-200/80">
                    Menu #1
                  </span>
                </div>

                <div>
                  <h2 className="text-lg sm:text-xl font-bold text-slate-900 group-hover:text-indigo-600 transition-colors flex items-center gap-2">
                    <span>1. User Manual</span>
                  </h2>
                  <p className="text-xs sm:text-sm font-medium text-slate-700 mt-1">
                    2D စာရင်းသွင်း သင်္ကေတများ နှင့် အသုံးပြုနည်း လမ်းညွှန်
                  </p>
                  <p className="text-xs text-slate-500 mt-2 leading-relaxed">
                    အရောင်းနှင့် အဝယ် စာရင်းသွင်းရာတွင် အသုံးပြုနိုင်သော သင်္ကေတများ (R, P, F, [ ], A, W, N, X, +, - စသည်)၊ စည်းမျဉ်းများ၊ ရှင်းလင်းချက်များနှင့် Interactive Tester
                  </p>
                </div>

                <div className="flex flex-wrap gap-1.5 pt-2">
                  <span className="px-2.5 py-1 rounded-lg bg-slate-50 text-slate-600 border border-slate-200 text-xs font-medium">
                    ⚡ 20+ Token လမ်းညွှန်
                  </span>
                  <span className="px-2.5 py-1 rounded-lg bg-slate-50 text-slate-600 border border-slate-200 text-xs font-medium">
                    📋 နမူနာ ရိုက်ထည့်ပုံများ
                  </span>
                  <span className="px-2.5 py-1 rounded-lg bg-slate-50 text-slate-600 border border-slate-200 text-xs font-medium">
                    🧪 Interactive Tester
                  </span>
                </div>
              </div>

              <div className="pt-6 mt-6 border-t border-slate-100 flex items-center justify-between">
                <span className="text-xs font-semibold text-slate-500">
                  သင်္ကေတများ လေ့လာစမ်းသပ်ရန်
                </span>
                <span className="px-4 py-2 rounded-xl bg-indigo-600 text-white font-bold text-xs group-hover:bg-indigo-700 transition shadow-2xs flex items-center gap-1.5">
                  <span>ဖွင့်ရန် (Open Manual)</span>
                  <span>→</span>
                </span>
              </div>
            </div>

            {/* Tile 2: Data Analyze */}
            <div
              onClick={() => setActiveMenu('analyze')}
              className="bg-white rounded-2xl border-2 border-slate-200 hover:border-slate-800 p-6 sm:p-8 shadow-sm hover:shadow-md transition-all cursor-pointer flex flex-col justify-between group"
            >
              <div className="space-y-4">
                <div className="flex items-center justify-between">
                  <div className="w-14 h-14 rounded-2xl bg-slate-100 text-slate-800 border border-slate-300 flex items-center justify-center text-3xl group-hover:scale-110 transition-transform">
                    📊
                  </div>
                  <span className="text-xs font-bold px-3 py-1 rounded-full bg-slate-100 text-slate-800 border border-slate-300">
                    Menu #2
                  </span>
                </div>

                <div>
                  <h2 className="text-lg sm:text-xl font-bold text-slate-900 group-hover:text-slate-800 transition-colors flex items-center gap-2">
                    <span>2. Data Analyze</span>
                  </h2>
                  <p className="text-xs sm:text-sm font-medium text-slate-700 mt-1">
                    ထွက်ဂဏန်း ခွဲခြမ်းစိတ်ဖြာမှု နှင့် Chart များ
                  </p>
                  <p className="text-xs text-slate-500 mt-2 leading-relaxed">
                    ၁ ပတ်၊ ၂ ပတ်၊ ၃ ပတ်၊ ၁ လ ကာလအလိုက် ထွက်ရှိခဲ့သော ထီပေါက်ဂဏန်းများ၊ 0~9 လှိုင်းခုံး Chart၊ နေ့စဉ် အထွက်နှုန်းမှတ်တမ်း နှင့် အထွက်များဆုံး ထိပ်တန်းဂဏန်းများ
                  </p>
                </div>

                <div className="flex flex-wrap gap-1.5 pt-2">
                  <span className="px-2.5 py-1 rounded-lg bg-slate-50 text-slate-600 border border-slate-200 text-xs font-medium">
                    🎯 0 ~ 9 အခြေအနေ
                  </span>
                  <span className="px-2.5 py-1 rounded-lg bg-slate-50 text-slate-600 border border-slate-200 text-xs font-medium">
                    📅 တနင်္လာ~သောကြာ ထွက်ဂဏန်း
                  </span>
                  <span className="px-2.5 py-1 rounded-lg bg-slate-50 text-slate-600 border border-slate-200 text-xs font-medium">
                    🌊 လှိုင်းခုံး Wave Chart
                  </span>
                  <span className="px-2.5 py-1 rounded-lg bg-slate-50 text-slate-600 border border-slate-200 text-xs font-medium">
                    📋 အချက်အလက် ဇယား
                  </span>
                </div>
              </div>

              <div className="pt-6 mt-6 border-t border-slate-100 flex items-center justify-between">
                <span className="text-xs font-semibold text-slate-500">
                  ထွက်ဂဏန်း ခွဲခြမ်းစိတ်ဖြာမှု ကြည့်ရန်
                </span>
                <span className="px-4 py-2 rounded-xl bg-slate-900 text-white font-bold text-xs group-hover:bg-slate-800 transition shadow-2xs flex items-center gap-1.5">
                  <span>ဖွင့်ရန် (Open Analyze)</span>
                  <span>→</span>
                </span>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ───────────────────────────────────────────────────────────── */}
      {/* 2. DATA ANALYZE VIEW (ACTIVE WHEN activeMenu === 'analyze') */}
      {/* ───────────────────────────────────────────────────────────── */}
      {activeMenu === 'analyze' && (
        <div className="space-y-6 animate-fadeIn">
          {/* Sub-Header & Navigation */}
          <div className="bg-white text-slate-900 rounded-2xl p-4 sm:p-5 shadow-sm border border-slate-200 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
            <div className="flex items-center gap-3 flex-wrap">
              <button
                type="button"
                onClick={() => setActiveMenu(null)}
                className="px-3 py-2 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-800 text-xs font-bold transition flex items-center gap-1.5 cursor-pointer border border-slate-200"
              >
                <span>← မီနူးသို့ ပြန်သွားမည်</span>
              </button>
              <div className="h-5 w-[1px] bg-slate-200 hidden sm:block" />
              <div>
                <h1 className="text-base sm:text-lg font-bold text-slate-900 flex items-center gap-2">
                  <span>📊 2. Data Analyze</span>
                  <span className="text-xs font-normal text-slate-500 hidden md:inline">
                    (ထွက်ဂဏန်း ခွဲခြမ်းစိတ်ဖြာမှု နှင့် Chart များ)
                  </span>
                </h1>
              </div>
            </div>

            <div className="flex items-center gap-2 flex-wrap">
              {/* Quick week navigation */}
              <div className="flex items-center gap-1.5 bg-slate-50 p-1 rounded-xl border border-slate-200">
                <button
                  type="button"
                  onClick={handlePrevWeek}
                  className="px-2 py-1 text-xs text-slate-600 hover:text-slate-900 hover:bg-slate-200/60 rounded-lg transition cursor-pointer"
                  title="Previous Week"
                >
                  ← ပြီးခဲ့သောပတ်
                </button>
                <button
                  type="button"
                  onClick={handleCurrentWeek}
                  className="px-2.5 py-1 text-xs font-bold bg-white text-slate-900 border border-slate-300 hover:bg-slate-100 rounded-lg transition shadow-2xs cursor-pointer"
                >
                  ယခုပတ်
                </button>
                <button
                  type="button"
                  onClick={handleNextWeek}
                  className="px-2 py-1 text-xs text-slate-600 hover:text-slate-900 hover:bg-slate-200/60 rounded-lg transition cursor-pointer"
                  title="Next Week"
                >
                  နောက်တစ်ပတ် →
                </button>
              </div>

              <button
                type="button"
                onClick={() => setActiveMenu('manual')}
                className="px-3 py-1.5 rounded-xl bg-slate-50 hover:bg-slate-100 text-slate-700 text-xs font-semibold transition flex items-center gap-1.5 cursor-pointer border border-slate-200"
              >
                <span>📖 User Manual သို့ →</span>
              </button>
            </div>
          </div>

      {/* ───────────────────────────────────────────────────────────── */}
      {/* CARD 1: 0 ~ 9 DIGITS STATUS GRID (🎯 ဂဏန်းခွဲခြမ်းစိတ်ဖြာမှု အခြေအနေ) */}
      {/* ───────────────────────────────────────────────────────────── */}
      <section className="bg-white text-slate-900 rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
        {/* Card 1 Header */}
        <div className="px-6 py-4 bg-slate-50/70 border-b border-slate-200 flex flex-col lg:flex-row lg:items-center justify-between gap-4">
          <div>
            <div className="flex items-center gap-2 flex-wrap">
              <h2 className="text-base font-bold text-slate-900 flex items-center gap-2">
                <span>🎯 ဂဏန်းခွဲခြမ်းစိတ်ဖြာမှု အခြေအနေ (0 ~ 9 Digits Status)</span>
              </h2>
              <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-white text-slate-700 border border-slate-200 shadow-2xs">
                {rangeInfo.startDate} ~ {rangeInfo.endDate}
              </span>
            </div>
            <p className="text-xs text-slate-500 mt-1">
              ရွေးချယ်ထားသော ကာလအတွင်း ထွက်ရှိခဲ့သော ထီပေါက်ဂဏန်း စုစုပေါင်း ({digitStats.totalLuckyNumbers} ကြိမ်) အပေါ် အခြေခံထားပါသည်
            </p>
          </div>

          <div className="flex flex-wrap items-center gap-2.5">
            {/* Period Selector Tabs (1w, 2w, 3w, 1m) */}
            <div className="flex items-center bg-slate-100 p-1 rounded-xl gap-1 text-xs font-semibold border border-slate-200">
              {PERIOD_OPTIONS.map((p) => {
                const isActive = selectedPeriod === p.key;
                return (
                  <button
                    key={p.key}
                    type="button"
                    onClick={() => setSelectedPeriod(p.key)}
                    className={`px-3 py-1.5 rounded-lg transition-all cursor-pointer ${
                      isActive
                        ? 'bg-white text-slate-900 border border-slate-300 shadow-2xs font-bold'
                        : 'text-slate-600 hover:text-slate-900 hover:bg-slate-200/60'
                    }`}
                    title={p.desc}
                  >
                    <span>{p.labelMy}</span>
                    <span className="text-[10px] ml-1 opacity-70">({p.labelEn})</span>
                  </button>
                );
              })}
            </div>

            {/* Source indicator & force online sync button */}
            <div className="flex items-center gap-1.5 bg-white px-2.5 py-1 rounded-lg border border-slate-200 text-xs text-slate-700">
              <span className="text-slate-500 text-[11px]">ဒေတာ:</span>
              {dataSource === 'local' ? (
                <span className="inline-flex items-center gap-1 font-semibold text-slate-800 bg-slate-100 px-1.5 py-0.5 rounded text-[11px] border border-slate-200">
                  <span>⚡</span> Local
                </span>
              ) : dataSource === 'online' ? (
                <span className="inline-flex items-center gap-1 font-semibold text-slate-800 bg-slate-100 px-1.5 py-0.5 rounded text-[11px] border border-slate-200">
                  <span>🌐</span> Online
                </span>
              ) : (
                <span className="text-slate-400 text-[11px]">ရှာဖွေနေဆဲ…</span>
              )}
              <button
                type="button"
                onClick={() => fetchPeriodSessions(true)}
                disabled={loading}
                className="ml-1 p-1 hover:bg-slate-100 text-slate-500 hover:text-slate-900 rounded transition disabled:opacity-50 cursor-pointer"
                title="အွန်လိုင်းမှ အသစ်ပြန်လည်ရယူပြီး Local တွင် သိမ်းမည် (Sync from Online)"
              >
                <svg className={`w-3.5 h-3.5 ${loading ? 'animate-spin text-slate-900' : ''}`} fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
                </svg>
              </button>
            </div>

            {/* Show/Hide Digit Box Button */}
            <button
              type="button"
              onClick={() => setShowDigitBox(prev => !prev)}
              className="px-3 py-1.5 rounded-xl font-bold text-xs transition-all cursor-pointer flex items-center gap-1.5 bg-slate-100 hover:bg-slate-200 text-slate-800 border border-slate-300 shadow-2xs"
            >
              <span>{showDigitBox ? '▲ ဂဏန်းကွက် ဖျောက်ရန်' : '▼ ဂဏန်းကွက် ပြသရန်'}</span>
            </button>
          </div>
        </div>

        {/* Card 1 Content (Default Show) */}
        {showDigitBox && (
          <div className="p-6 space-y-4 animate-fadeIn">
            {/* Status counts bar */}
            <div className="flex items-center justify-between flex-wrap gap-2 text-xs">
              <div className="text-slate-600">
                ထွက်ပြီးသော ဂဏန်းများကို <span className="font-bold text-red-700">အနီဖျော့</span> ဖြင့်လည်းကောင်း၊ မထွက်သေးသော ဂဏန်းများကို <span className="font-bold text-emerald-700">အစိမ်းဖျော့</span> ဖြင့်လည်းကောင်း ခွဲခြားထားပါသည်။
              </div>
              <div className="flex items-center gap-2">
                <span className="px-2.5 py-1 rounded-lg bg-red-500/10 text-red-700 border border-red-200/80 font-bold text-xs">
                  ထွက်ပြီး: {digitStats.appearedDigits.length} လုံး
                </span>
                <span className="px-2.5 py-1 rounded-lg bg-emerald-500/10 text-emerald-700 border border-emerald-200/80 font-bold text-xs">
                  မထွက်သေး: {digitStats.remainingDigits.length} လုံး
                </span>
              </div>
            </div>

            {/* 10 Digits Grid with Soft Backgrounds */}
            <div className="grid grid-cols-5 sm:grid-cols-10 gap-2 sm:gap-2.5">
              {ALL_DIGITS.map((digit) => {
                const item = digitStats.items.find((it) => it.digit === digit);
                const count = item?.count || 0;
                const hasAppeared = count > 0;
                const isSelected = selectedDetailDigit === digit;

                return (
                  <div
                    key={digit}
                    onClick={() => {
                      setSelectedDetailDigit(digit);
                      setActiveChartTab('digit_timeline');
                      if (!showCharts) setShowCharts(true);
                    }}
                    className={`py-2.5 px-2 rounded-xl border flex flex-col items-center justify-between gap-1 transition-all cursor-pointer ${
                      isSelected
                        ? 'ring-2 ring-slate-900 shadow-xs scale-102 font-black'
                        : 'hover:scale-102 shadow-2xs'
                    } ${
                      hasAppeared
                        ? 'bg-red-500/10 text-red-700 border-red-200/80 hover:bg-red-500/20'
                        : 'bg-emerald-500/10 text-emerald-700 border-emerald-200/80 hover:bg-emerald-500/20'
                    }`}
                  >
                    <span className="text-xl sm:text-2xl font-black font-mono leading-none">
                      {digit}
                    </span>
                    <span className="text-[10px] font-semibold tracking-tight">
                      {hasAppeared ? `${count} ကြိမ်` : 'မထွက်သေး'}
                    </span>
                  </div>
                );
              })}
            </div>

            {/* Quick Summary Lists */}
            <div className="grid grid-cols-1 sm:grid-cols-2 gap-3 pt-1">
              <div className="p-3 bg-red-500/10 rounded-xl border border-red-200/80 flex items-center justify-between shadow-2xs">
                <div className="flex items-center gap-2">
                  <span className="w-2 h-2 rounded-full bg-red-600 shrink-0" />
                  <span className="text-xs font-semibold text-slate-800">ထွက်ပြီးသော ဂဏန်းများ:</span>
                </div>
                <div className="flex items-center gap-1 font-mono font-bold text-xs sm:text-sm text-red-700">
                  {digitStats.appearedDigits.length > 0
                    ? digitStats.appearedDigits.map((d) => d.digit).join(', ')
                    : 'မရှိသေးပါ'}
                </div>
              </div>

              <div className="p-3 bg-emerald-500/10 rounded-xl border border-emerald-200/80 flex items-center justify-between shadow-2xs">
                <div className="flex items-center gap-2">
                  <span className="w-2 h-2 rounded-full bg-emerald-600 shrink-0" />
                  <span className="text-xs font-semibold text-slate-800">မထွက်သေးသော ဂဏန်းများ:</span>
                </div>
                <div className="flex items-center gap-1 font-mono font-bold text-xs sm:text-sm text-emerald-700">
                  {digitStats.remainingDigits.length > 0
                    ? digitStats.remainingDigits.map((d) => d.digit).join(', ')
                    : 'အားလုံးထွက်ပြီး'}
                </div>
              </div>
            </div>
          </div>
        )}
      </section>

      {/* ───────────────────────────────────────────────────────────── */}
      {/* CARD 2: WEEKLY LUCKY NUMBERS (📅 တနင်္လာ မှ သောကြာ ထွက်ဂဏန်းများ) */}
      {/* ───────────────────────────────────────────────────────────── */}
      <section className="bg-white text-slate-900 rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
        <div className="px-6 py-4 bg-slate-50/70 border-b border-slate-200 flex items-center justify-between flex-wrap gap-2">
          <div className="flex items-center gap-2 flex-wrap">
            <h2 className="text-base font-bold text-slate-900 flex items-center gap-2">
              <span>📅 တနင်္လာ မှ သောကြာ ထွက်ဂဏန်းများ (Weekly Lucky Numbers)</span>
            </h2>
            <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-white text-slate-700 border border-slate-200 shadow-2xs">
              {rangeInfo.anchorMonday} ~ {rangeInfo.anchorFriday}
            </span>
          </div>
          <span className="text-xs text-slate-500">
            ရက်သတ္တပတ်အလိုက် 12:00 PM နှင့် 04:30 PM ထွက်ဂဏန်းများ
          </span>
        </div>

        <div className="p-6">
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-3.5">
            {rangeInfo.anchorDays.map((day) => {
              const daySessions = sessionsByDate.get(day.dateStr) || [];
              const slot12 = daySessions.find((s) => s.ampm === '12:00');
              const slot04 = daySessions.find((s) => s.ampm === '04:00' || s.ampm === '04:30');
              const slot09 = daySessions.find((s) => s.ampm === '09:00');

              return (
                <div
                  key={day.dateStr}
                  className="bg-slate-50/80 rounded-xl border border-slate-200 p-3.5 flex flex-col justify-between hover:border-slate-300 transition shadow-2xs"
                >
                  <div className="border-b border-slate-200 pb-2 mb-2.5">
                    <div className="flex items-center justify-between">
                      <span className="text-sm font-bold text-slate-900">
                        {day.weekday.nameMy}
                      </span>
                      <span className="text-[11px] font-medium text-slate-500">
                        {day.weekday.nameEn}
                      </span>
                    </div>
                    <span className="text-[11px] font-mono text-slate-400">
                      {day.dateStr}
                    </span>
                  </div>

                  <div className="space-y-2">
                    {/* 12:00 PM Slot */}
                    <div className="flex items-center justify-between bg-white px-2.5 py-1.5 rounded-lg border border-slate-200/80 shadow-2xs">
                      <span className="text-xs font-semibold text-slate-600">12:00 PM</span>
                      {slot12?.luckyNumber ? (
                        <span className="px-2.5 py-0.5 rounded-md font-mono font-black text-sm bg-slate-100 text-slate-900 border border-slate-300 shadow-2xs">
                          {slot12.luckyNumber}
                        </span>
                      ) : (
                        <span className="text-xs font-mono text-slate-400">—</span>
                      )}
                    </div>

                    {/* 04:30 PM Slot */}
                    <div className="flex items-center justify-between bg-white px-2.5 py-1.5 rounded-lg border border-slate-200/80 shadow-2xs">
                      <span className="text-xs font-semibold text-slate-600">04:30 PM</span>
                      {slot04?.luckyNumber ? (
                        <span className="px-2.5 py-0.5 rounded-md font-mono font-black text-sm bg-slate-100 text-slate-900 border border-slate-300 shadow-2xs">
                          {slot04.luckyNumber}
                        </span>
                      ) : (
                        <span className="text-xs font-mono text-slate-400">—</span>
                      )}
                    </div>

                    {/* 09:00 AM Slot (if exists) */}
                    {slot09 && (
                      <div className="flex items-center justify-between bg-white px-2.5 py-1.5 rounded-lg border border-slate-200/80 shadow-2xs">
                        <span className="text-xs font-semibold text-slate-600">09:00 AM</span>
                        {slot09?.luckyNumber ? (
                          <span className="px-2.5 py-0.5 rounded-md font-mono font-black text-sm bg-slate-100 text-slate-900 border border-slate-300 shadow-2xs">
                            {slot09.luckyNumber}
                          </span>
                        ) : (
                          <span className="text-xs font-mono text-slate-400">—</span>
                        )}
                      </div>
                    )}
                  </div>
                </div>
              );
            })}
          </div>
        </div>
      </section>

      {/* ───────────────────────────────────────────────────────────── */}
      {/* CARD 3: STRAIGHT LINE CHART (📈 0 ~ 9 ဂဏန်းအလိုက် အထွက်နှုန်း မျဉ်းဖြောင့် Chart) */}
      {/* ───────────────────────────────────────────────────────────── */}
      <section className="bg-white text-slate-900 rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
        {/* Card 3 Header */}
        <div className="px-6 py-4 bg-slate-50/70 border-b border-slate-200 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
          <div>
            <div className="flex items-center gap-2 flex-wrap">
              <h2 className="text-base font-bold text-slate-900 flex items-center gap-2">
                <span>📈 0 ~ 9 ဂဏန်းအလိုက် အထွက်နှုန်း မျဉ်းဖြောင့် Chart (Line Chart)</span>
              </h2>
              <span className="text-xs font-semibold px-2.5 py-0.5 rounded-full bg-white text-slate-700 border border-slate-200 shadow-2xs">
                {rangeInfo.startDate} ~ {rangeInfo.endDate}
              </span>
            </div>
            <p className="text-xs text-slate-500 mt-1">
              ဂဏန်း (၁၀) လုံး (1, 2, 3, 4, 5, 6, 7, 8, 9, 0) ၏ စုစုပေါင်း ထွက်ရှိမှု အကြိမ်ရေကို မျဉ်းဖြောင့်များဖြင့် ဆက်စပ်ဖော်ပြချက်
            </p>
          </div>

          <div className="flex items-center gap-2 flex-wrap">
            {hoveredDigit && (
              <div className="bg-white text-slate-800 border border-slate-300 px-3 py-1 rounded-lg text-xs font-medium flex items-center gap-2 shadow-2xs">
                <span className="font-bold text-slate-900 font-mono">ဂဏန်း [{hoveredDigit.digit}]</span>
                <span className="text-slate-400">|</span>
                <span>စုစုပေါင်း: <strong className="text-slate-900 font-mono">{hoveredDigit.count}</strong> ကြိမ်</span>
                <span className="text-slate-400">|</span>
                <span className="text-slate-800 font-mono font-bold">{hoveredDigit.rate}%</span>
              </div>
            )}
            <button
              type="button"
              onClick={() => setShowCharts((prev) => !prev)}
              className="px-3 py-1.5 rounded-xl font-bold text-xs transition-all cursor-pointer flex items-center gap-1.5 bg-slate-100 hover:bg-slate-200 text-slate-800 border border-slate-300 shadow-2xs"
            >
              <span>{showCharts ? '▲ Chart ဖျောက်ရန်' : '📈 Chart ပြသရန်'}</span>
            </button>
          </div>
        </div>

        {/* Straight Line Chart Content (Default: show) */}
        {showCharts && (
          <div className="p-6 space-y-4 animate-fadeIn">
            {/* SVG Straight Line Chart */}
            <div className="bg-slate-50/50 rounded-2xl p-4 sm:p-5 border border-slate-200">
              <div className="w-full overflow-x-auto">
                <div className="min-w-[650px] sm:min-w-full">
                  {(() => {
                    const chartW = 760;
                    const chartH = 220;
                    const padX = 42;
                    const padTop = 38;
                    const padBottom = 42;
                    const usableW = chartW - padX * 2;
                    const usableH = chartH - padTop - padBottom;
                    const maxC = Math.max(digitStats.maxCount, 1);

                    const linePoints = ALL_DIGITS.map((digit, idx) => {
                      const item = digitStats.items.find((it) => it.digit === digit) || { count: 0, headCount: 0, tailCount: 0, rate: '0.0' };
                      const x = padX + idx * (usableW / (ALL_DIGITS.length - 1));
                      const y = (chartH - padBottom) - (item.count / maxC) * usableH;
                      return {
                        digit,
                        x,
                        y,
                        count: item.count,
                        headCount: item.headCount,
                        tailCount: item.tailCount,
                        rate: item.rate,
                        isTop: item.count > 0 && item.count === digitStats.maxCount,
                      };
                    });

                    const linePath = generateStraightSvgPath(linePoints);
                    const fillPath = linePoints.length > 0
                      ? `${linePath} L ${linePoints[linePoints.length - 1].x.toFixed(1)} ${(chartH - padBottom).toFixed(1)} L ${linePoints[0].x.toFixed(1)} ${(chartH - padBottom).toFixed(1)} Z`
                      : '';

                    return (
                      <svg
                        viewBox={`0 0 ${chartW} ${chartH}`}
                        className="w-full h-auto overflow-visible select-none"
                      >
                        <defs>
                          <linearGradient id="straightAreaGrad" x1="0" y1="0" x2="0" y2="1">
                            <stop offset="0%" stopColor="#0f172a" stopOpacity="0.10" />
                            <stop offset="70%" stopColor="#0f172a" stopOpacity="0.03" />
                            <stop offset="100%" stopColor="#0f172a" stopOpacity="0.0" />
                          </linearGradient>
                        </defs>

                        {/* Horizontal subtle guide lines */}
                        {[0, 0.33, 0.66, 1].map((ratio, i) => {
                          const yVal = (chartH - padBottom) - ratio * usableH;
                          const labelVal = Math.round(ratio * maxC);
                          return (
                            <g key={i}>
                              <line
                                x1={padX - 10}
                                y1={yVal}
                                x2={chartW - padX + 10}
                                y2={yVal}
                                stroke="#e2e8f0"
                                strokeDasharray="3 3"
                                strokeWidth="0.8"
                              />
                              <text
                                x={padX - 16}
                                y={yVal + 3}
                                fill="#64748b"
                                fontSize="10"
                                textAnchor="end"
                                fontFamily="monospace"
                              >
                                {labelVal}
                              </text>
                            </g>
                          );
                        })}

                        {/* Straight polygon area fill under line */}
                        {fillPath && <path d={fillPath} fill="url(#straightAreaGrad)" />}

                        {/* Point-to-Point Straight Lines */}
                        {linePath && (
                          <path
                            d={linePath}
                            fill="none"
                            stroke="#0f172a"
                            strokeWidth="2.5"
                            strokeLinecap="round"
                            strokeLinejoin="round"
                          />
                        )}

                        {/* Vertex Points & Count Badges */}
                        {linePoints.map((pt) => {
                          const isHovered = hoveredDigit?.digit === pt.digit;
                          const isSelected = selectedDetailDigit === pt.digit;
                          return (
                            <g
                              key={pt.digit}
                              className="cursor-pointer transition-transform"
                              onMouseEnter={() => setHoveredDigit(pt)}
                              onMouseLeave={() => setHoveredDigit(null)}
                              onClick={() => setSelectedDetailDigit(pt.digit)}
                            >
                              {/* Value badge directly above point */}
                              <g transform={`translate(${pt.x}, ${pt.y - 14})`}>
                                <rect
                                  x="-13"
                                  y="-12"
                                  width="26"
                                  height="15"
                                  rx="4"
                                  fill={pt.isTop || isSelected ? '#0f172a' : '#ffffff'}
                                  stroke={pt.isTop || isSelected ? '#0f172a' : '#cbd5e1'}
                                  strokeWidth="1"
                                />
                                <text
                                  x="0"
                                  y="-1"
                                  fill={pt.isTop || isSelected ? '#ffffff' : '#0f172a'}
                                  fontSize="10"
                                  fontWeight="bold"
                                  textAnchor="middle"
                                  fontFamily="monospace"
                                >
                                  {pt.count}
                                </text>
                              </g>

                              {/* Peak glow circle */}
                              {pt.isTop && (
                                <circle
                                  cx={pt.x}
                                  cy={pt.y}
                                  r={isHovered ? '10' : '7'}
                                  fill="#0f172a"
                                  fillOpacity="0.15"
                                  className="animate-pulse"
                                />
                              )}

                              {/* Point Dot */}
                              <circle
                                cx={pt.x}
                                cy={pt.y}
                                r={isHovered || isSelected ? '6' : pt.isTop ? '5' : '4'}
                                fill="#0f172a"
                                stroke="#ffffff"
                                strokeWidth="2"
                              />

                              {/* X-axis digit label */}
                              <text
                                x={pt.x}
                                y={chartH - 12}
                                fill={isSelected || isHovered || pt.isTop ? '#0f172a' : pt.count > 0 ? '#334155' : '#94a3b8'}
                                fontSize={isSelected || isHovered ? '15' : '13'}
                                fontWeight={isSelected || isHovered || pt.isTop ? '900' : '700'}
                                textAnchor="middle"
                                fontFamily="monospace"
                              >
                                {pt.digit}
                              </text>
                            </g>
                          );
                        })}
                      </svg>
                    );
                  })()}
                </div>
              </div>

              {/* 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 Quick Stat Pills */}
              <div className="grid grid-cols-5 sm:grid-cols-10 gap-2 pt-3 border-t border-slate-200 mt-2">
                {ALL_DIGITS.map((d) => {
                  const item = digitStats.items.find((it) => it.digit === d) || { count: 0, headCount: 0, tailCount: 0, rate: '0.0' };
                  const isSelected = selectedDetailDigit === d;
                  return (
                    <div
                      key={d}
                      onClick={() => setSelectedDetailDigit(d)}
                      className={`p-2 rounded-xl border transition cursor-pointer flex flex-col items-center gap-1 ${
                        isSelected
                          ? 'bg-slate-100 border-slate-900 ring-2 ring-slate-900 shadow-xs'
                          : 'bg-white border-slate-200 hover:border-slate-300'
                      }`}
                    >
                      <span className="w-7 h-7 rounded-lg bg-slate-100 text-slate-900 border border-slate-300 font-mono font-black text-sm flex items-center justify-center shadow-2xs">
                        {d}
                      </span>
                      <span className="text-xs font-mono font-bold text-slate-900">
                        {item.count} ကြိမ်
                      </span>
                      <span className="text-[10px] text-slate-500 font-mono">
                        {item.rate}%
                      </span>
                    </div>
                  );
                })}
              </div>
            </div>
          </div>
        )}
      </section>
    </div>
  )}

  {/* ───────────────────────────────────────────────────────────── */}
  {/* 3. USER MANUAL VIEW (ACTIVE WHEN activeMenu === 'manual') */}
  {/* ───────────────────────────────────────────────────────────── */}
  {activeMenu === 'manual' && (
        <div className="space-y-6 animate-fadeIn">
          {/* Sub-Header & Navigation */}
          <div className="bg-white text-slate-900 rounded-2xl p-4 sm:p-5 shadow-sm border border-slate-200 flex flex-col sm:flex-row sm:items-center justify-between gap-3">
            <div className="flex items-center gap-3">
              <button
                type="button"
                onClick={() => setActiveMenu(null)}
                className="px-3 py-2 rounded-xl bg-slate-100 hover:bg-slate-200 text-slate-800 text-xs font-bold transition flex items-center gap-1.5 cursor-pointer border border-slate-200"
              >
                <span>← မီနူးသို့ ပြန်သွားမည်</span>
              </button>
              <div className="h-5 w-[1px] bg-slate-200 hidden sm:block" />
              <div>
                <h1 className="text-base sm:text-lg font-bold text-slate-900 flex items-center gap-2">
                  <span>📖 1. User Manual</span>
                  <span className="text-xs font-normal text-slate-500 hidden md:inline">
                    (2D စာရင်းသွင်း သင်္ကေတများ လမ်းညွှန်)
                  </span>
                </h1>
              </div>
            </div>

            <div className="flex items-center gap-2">
              <button
                type="button"
                onClick={() => setActiveMenu('analyze')}
                className="px-3 py-1.5 rounded-xl bg-slate-50 hover:bg-slate-100 text-slate-700 text-xs font-semibold transition flex items-center gap-1.5 cursor-pointer border border-slate-200"
              >
                <span>📊 Data Analyze သို့ →</span>
              </button>
            </div>
          </div>

          {/* User Manual Card */}
          <section className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
            {/* Header */}
            <div className="px-6 py-4 bg-slate-50/70 border-b border-slate-200 flex flex-wrap items-center justify-between gap-3">
              <div>
                <h2 className="text-base font-bold text-slate-900 flex items-center gap-2">
                  <span>📖 2D စာရင်းသွင်း သင်္ကေတများ အသုံးပြုနည်း လမ်းညွှန် (User Manual)</span>
                </h2>
                <p className="text-xs text-slate-500 mt-0.5">
                  အရောင်းနှင့် အဝယ် စာရင်းသွင်းရာတွင် အသုံးပြုနိုင်သော သင်္ကေတများ၊ စည်းမျဉ်းများနှင့် နမူနာများ
                </p>
              </div>

              <button
                type="button"
                onClick={handleToggleAll}
                className="text-xs font-semibold text-indigo-600 hover:text-indigo-800 bg-indigo-50 hover:bg-indigo-100 border border-indigo-200 px-3 py-1.5 rounded-lg transition whitespace-nowrap cursor-pointer"
              >
                {expandedIds.size > 0 ? '▲ အားလုံး ပိတ်မည်' : '▼ အားလုံး ဖွင့်မည်'}
              </button>
            </div>

            {/* Minimalist Live Test Sandbox */}
            <div className="px-6 py-4 bg-slate-50/90 border-b border-slate-200">
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
                    className="w-full px-3.5 py-2 font-mono text-xs sm:text-sm font-semibold bg-white border border-slate-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 text-slate-900 placeholder-slate-400 shadow-2xs"
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
                <div className="mt-3 p-3.5 rounded-xl bg-white border border-slate-200 shadow-2xs text-xs">
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
                      <div className="flex flex-wrap gap-1.5 max-h-28 overflow-y-auto p-2.5 bg-slate-50 rounded-lg border border-slate-100 font-mono text-xs">
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

            {/* 1-Column Accordion Guide List */}
            <div className="p-6 space-y-2.5 bg-slate-50/40">
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
                              <div className="flex flex-wrap gap-1 max-h-28 overflow-y-auto p-2 bg-white rounded-lg border border-slate-200 font-mono text-[11px]">
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
          </section>
        </div>
      )}
    </div>
  );
}
