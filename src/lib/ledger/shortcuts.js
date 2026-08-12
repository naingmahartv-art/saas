// Central config for the Ledger page's keyboard shortcuts. Combos are stored
// as lowercase strings like "alt+k" or "f1" (modifiers alphabetical, joined
// by "+", final key last) so they're easy to persist as JSON and compare.
export const DEFAULT_SHORTCUTS = {
  focusAgent: 'alt+a',
  focusNumber: 'alt+n',
  sortVoucher: 'alt+e',
  checkAgent: 'alt+g',
  luckyNumber: 'alt+k',
  limit: 'alt+l',
  reports: 'alt+p',
  refresh: 'alt+r',
  sortExceedNum: 'alt+1',
  sortExceedAmount: 'alt+2',
  sortExceedExcess: 'alt+3',
  save: 'f1',
  rate: 'f6',
  clear: 'f9',
  history: 'f8',
  exportExceed: 'alt+x',
  sortGridNum: 'alt+4',
  sortGridAmount: 'alt+5',
  exportGrid: 'alt+y',
  sale1: 'f7',
  sale2: 'f10',
};

export const SHORTCUT_ACTIONS = Object.keys(DEFAULT_SHORTCUTS);

const MODIFIER_ORDER = ['alt', 'ctrl', 'meta', 'shift'];

/** "Alt+K" | "alt+k" | " ALT + K " -> { alt, ctrl, meta, shift, key } (lowercase key) */
export function parseCombo(combo) {
  const parts = String(combo || '').toLowerCase().split('+').map(p => p.trim()).filter(Boolean);
  if (parts.length === 0) return null;
  const key = parts[parts.length - 1];
  const mods = new Set(parts.slice(0, -1));
  return {
    alt: mods.has('alt'),
    ctrl: mods.has('ctrl'),
    meta: mods.has('meta'),
    shift: mods.has('shift'),
    key,
  };
}

/** { alt:true, key:'k' } -> "alt+k" */
export function comboToString({ alt, ctrl, meta, shift, key }) {
  const mods = MODIFIER_ORDER.filter(m => ({ alt, ctrl, meta, shift })[m]);
  return [...mods, key].join('+');
}

/** "alt+k" -> "Alt+K" or "Opt+K" (on macOS), "f1" -> "F1" */
export function formatCombo(combo, isMac = false) {
  const parsed = parseCombo(combo);
  if (!parsed) return '';
  const altLabel = isMac ? 'Opt' : 'Alt';
  const mods = MODIFIER_ORDER.filter(m => parsed[m]).map(m => m === 'alt' ? altLabel : m[0].toUpperCase() + m.slice(1));
  const key = parsed.key.length === 1 ? parsed.key.toUpperCase() : parsed.key.toUpperCase();
  return [...mods, key].join('+');
}

/** Does this keydown event match the given combo string? */
export function matchesCombo(event, combo) {
  const parsed = parseCombo(combo);
  if (!parsed) return false;

  const keyMatch = event.key.toLowerCase() === parsed.key;
  let codeMatch = false;
  if (event.code) {
    const codeLower = event.code.toLowerCase();
    if (parsed.key.length === 1) {
      if (parsed.key >= 'a' && parsed.key <= 'z') {
        codeMatch = codeLower === `key${parsed.key}`;
      } else if (parsed.key >= '0' && parsed.key <= '9') {
        codeMatch = codeLower === `digit${parsed.key}`;
      }
    }
  }

  return (
    event.altKey === parsed.alt &&
    event.ctrlKey === parsed.ctrl &&
    event.metaKey === parsed.meta &&
    event.shiftKey === parsed.shift &&
    (keyMatch || codeMatch)
  );
}

const BARE_ALLOWED_KEYS = /^f([1-9]|1[0-9]|2[0-4])$/; // F1-F24

/** A combo needs at least one modifier, or must be a bare function key —
 *  otherwise it'd swallow normal typing in the number/agent inputs. */
export function isValidCombo(combo) {
  const parsed = parseCombo(combo);
  if (!parsed || !parsed.key) return false;
  if (['alt', 'ctrl', 'meta', 'shift', 'escape'].includes(parsed.key)) return false;
  const hasModifier = parsed.alt || parsed.ctrl || parsed.meta;
  return hasModifier || BARE_ALLOWED_KEYS.test(parsed.key);
}

/** Build a combo string from a live KeyboardEvent, for a "press keys" recorder UI. */
export function captureCombo(event) {
  let key = event.key.toLowerCase();
  if (['alt', 'control', 'meta', 'shift'].includes(key)) return null; // modifier-only press

  if (event.altKey && event.code) {
    if (event.code.startsWith('Key')) {
      key = event.code.slice(3).toLowerCase();
    } else if (event.code.startsWith('Digit')) {
      key = event.code.slice(5);
    }
  }

  return comboToString({
    alt: event.altKey,
    ctrl: event.ctrlKey,
    meta: event.metaKey,
    shift: event.shiftKey,
    key,
  });
}

/** Merge saved per-user overrides over the defaults, dropping unknown/invalid entries. */
export function mergeShortcuts(overrides) {
  const merged = { ...DEFAULT_SHORTCUTS };
  if (overrides && typeof overrides === 'object') {
    for (const action of SHORTCUT_ACTIONS) {
      const combo = overrides[action];
      if (typeof combo === 'string' && isValidCombo(combo)) merged[action] = combo;
    }
  }
  if (merged.reports === 'alt+r' || merged.reports === merged.refresh) {
    merged.reports = 'alt+p';
  }
  return merged;
}

/** Find action(s) already bound to a combo, other than `exceptAction`. */
export function findConflicts(shortcuts, combo, exceptAction) {
  return SHORTCUT_ACTIONS.filter(a => a !== exceptAction && shortcuts[a] === combo);
}
