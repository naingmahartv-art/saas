// Three fixed daily ledger slots: 00:00-09:00, 09:00-12:00, 12:00-24:00 (legacy labels 09:00/12:00/04:00).
export const SLOTS = [
  { key: '09:00', index: 1, startHour: 0, endHour: 9 },
  { key: '12:00', index: 2, startHour: 9, endHour: 12 },
  { key: '04:00', index: 3, startHour: 12, endHour: 24 },
];

const SLOT_BY_KEY = new Map(SLOTS.map(s => [s.key, s]));

export function isValidSlotKey(key) {
  return SLOT_BY_KEY.has(key);
}

// Deterministic, collision-free integer key for (onDate, slot): 'YYYY-MM-DD' + slot -> YYYYMMDD * 10 + slotIndex
export function computeOnCount(onDate, slotKey) {
  const slot = SLOT_BY_KEY.get(slotKey);
  if (!slot) throw new Error(`Invalid slot key: ${slotKey}`);
  const digits = onDate.replaceAll('-', '');
  return parseInt(digits, 10) * 10 + slot.index;
}

const SLOT_BY_INDEX = new Map(SLOTS.map(s => [s.index, s]));

// Inverse of computeOnCount: 'YYYYMMDD * 10 + slotIndex' -> { onDate, ampm }.
export function onCountToSessionParts(onCount) {
  const n = typeof onCount === 'string' ? parseInt(onCount, 10) : onCount;
  const slotIndex = n % 10;
  const yyyymmdd = String(Math.floor(n / 10)).padStart(8, '0');
  const onDate = `${yyyymmdd.slice(0, 4)}-${yyyymmdd.slice(4, 6)}-${yyyymmdd.slice(6, 8)}`;
  const slot = SLOT_BY_INDEX.get(slotIndex);
  if (!slot) throw new Error(`Invalid onCount: ${onCount}`);
  return { onDate, ampm: slot.key };
}

export function getCurrentSlotKey(date = new Date()) {
  const hour = date.getHours();
  const slot = SLOTS.find(s => hour >= s.startHour && hour < s.endHour);
  return (slot || SLOTS[SLOTS.length - 1]).key;
}

export function todayStr(date = new Date()) {
  const y = date.getFullYear();
  const m = String(date.getMonth() + 1).padStart(2, '0');
  const d = String(date.getDate()).padStart(2, '0');
  return `${y}-${m}-${d}`;
}
