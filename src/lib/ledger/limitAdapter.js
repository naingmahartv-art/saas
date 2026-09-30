/**
 * Limit Adapter & Calculation Engine
 * Handles number limits, individual limit overrides, clearances, and over-limit excess math.
 */

export function toCanonicalLimit(num, limitAmount, clearedAmount = 0, orgId = '', sessionId = '') {
  const numStr = String(num).padStart(2, '0');
  const lim = typeof limitAmount === 'number' ? limitAmount : 0;
  const clr = typeof clearedAmount === 'number' ? clearedAmount : 0;
  const effectiveLimit = Math.max(0, lim - clr);

  return {
    id: `${orgId}_${sessionId}_${numStr}`,
    orgId,
    sessionId,
    num: numStr,
    limitAmount: lim,
    clearedAmount: clr,
    effectiveLimit,
    updatedAt: Date.now(),
  };
}

/**
 * Resolves the effective limit for all 100 numbers (00-99).
 * Takes into account:
 * - default global limit
 * - number specific limits (hot numbers or custom limits)
 * - cleared amounts (manual clear limit operations)
 */
export function resolveEffectiveLimits(defaultLimit = 0, customLimits = {}, clearedLimits = {}) {
  const effectiveMap = {};
  const globalLimit = Number(defaultLimit) || 0;

  for (let i = 0; i < 100; i++) {
    const numStr = String(i).padStart(2, '0');
    const baseLimit =
      customLimits[numStr] !== undefined && customLimits[numStr] !== null
        ? Number(customLimits[numStr])
        : globalLimit;

    const cleared = Number(clearedLimits[numStr]) || 0;
    effectiveMap[numStr] = Math.max(0, baseLimit - cleared);
  }

  return effectiveMap;
}

/**
 * Computes over-limit excess for 00-99 numbers.
 * Exceed = max(0, totals[num] - effectiveLimit[num]) - buyTotals[num]
 */
export function computeExceedsList(totals = {}, buyTotals = {}, effectiveLimits = {}, defaultLimit = 0) {
  const exceeds = [];
  const globalLim = Number(defaultLimit) || 0;

  for (let i = 0; i < 100; i++) {
    const num = String(i).padStart(2, '0');
    const total = Number(totals[num]) || 0;
    const buyTotal = Number(buyTotals[num]) || 0;

    const lim =
      effectiveLimits[num] !== undefined
        ? Number(effectiveLimits[num])
        : globalLim;

    if (lim <= 0 && total === 0 && buyTotal === 0) continue;

    const rawOver = lim > 0 ? Math.max(0, total - lim) : 0;
    const netExcess = Math.max(0, rawOver - buyTotal);

    if (netExcess > 0 || rawOver > 0 || buyTotal > 0) {
      exceeds.push({
        num,
        total,
        limit: lim,
        rawOver,
        buyTotal,
        netExcess,
      });
    }
  }

  // Sort by highest net excess first
  exceeds.sort((a, b) => b.netExcess - a.netExcess);
  return exceeds;
}
