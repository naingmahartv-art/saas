import { pgTable, text, integer, bigint, doublePrecision } from 'drizzle-orm/pg-core';
import { sql } from 'drizzle-orm';

// Auto-populated at insert time so existing call sites (which don't set
// updatedAt) keep working unchanged; bumped on update by a generated trigger
// (see scripts/generate-sync-triggers.js) rather than app code.
const nowMs = sql`(extract(epoch from now()) * 1000)::bigint`;

export const organizations = pgTable('organizations', {
  id: text('id').primaryKey(),
  name: text('name').notNull(),
  slug: text('slug').notNull().unique(),
  plan: text('plan').notNull(),
  status: text('status').notNull().default('active'),
  createdBy: text('created_by'),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

export const users = pgTable('users', {
  id: text('id').primaryKey(),
  name: text('name').notNull(),
  email: text('email').notNull().unique(),
  passwordHash: text('password_hash').notNull(),
  // roles: 'super_admin' | 'org_admin' | 'supervisor' | 'cashier'
  role: text('role').notNull().default('cashier'),
  // 'active' | 'suspended'
  status: text('status').notNull().default('active'),
  orgId: text('org_id').references(() => organizations.id, { onDelete: 'cascade' }),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

export const subscriptions = pgTable('subscriptions', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull().references(() => organizations.id, { onDelete: 'cascade' }),
  plan: text('plan').notNull(),
  // basic: $29/mo, advance: $99/mo
  amount: integer('amount').notNull(),
  status: text('status').notNull().default('active'),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

// ─── Lottery tables ───────────────────────────────────────────────────────────

/** Machine configuration — one row per machine per org */
export const machineConfig = pgTable('machine_config', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  machineId: integer('machine_id').notNull(),
  minSerial: integer('min_serial').notNull().default(1),
  maxSerial: integer('max_serial').notNull().default(999),
  label: text('label'),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Active betting session per org */
export const lotterySessions = pgTable('lottery_sessions', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),               // 'AM' | 'PM' | 'FULL'
  onDate: text('on_date').notNull(),          // YYYY-MM-DD
  machineId: integer('machine_id').notNull().default(1),
  isActive: integer('is_active').notNull().default(1), // 1 = current session
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Payout rate configuration per org */
export const rates = pgTable('rates', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num1Rate: doublePrecision('num1_rate').notNull().default(0),
  num2Rate: doublePrecision('num2_rate').notNull().default(0),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Agents / customers */
export const agents = pgTable('agents', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  agentName: text('agent_name').notNull(),
  address: text('address'),
  phone: text('phone'),
  commission: doublePrecision('commission').notNull().default(0),
  rate: doublePrecision('rate').notNull().default(0),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Ledger entry header */
export const lg = pgTable('lg', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  onDate: text('on_date').notNull(),
  machineId: integer('machine_id').notNull().default(1),
  agentName: text('agent_name').notNull(),
  num1: text('num1'),
  amount: doublePrecision('amount').notNull().default(0),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Ledger entry detail lines */
export const lgDetail = pgTable('lg_detail', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  agentName: text('agent_name').notNull(),
  num1: text('num1').notNull(),
  value: doublePrecision('value').notNull().default(0),
  post: integer('post').notNull().default(0),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Raw as-typed voucher tokens — the source of truth a cashier can find/edit/delete by; lgDetail is always re-derived from these. */
export const lgVoucherToken = pgTable('lg_voucher_token', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  tokenText: text('token_text').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Sale entry header */
export const lgSale = pgTable('lg_sale', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  onDate: text('on_date').notNull(),
  agentId: text('agent_id'),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Sale entry detail lines */
export const lgSaleDetail = pgTable('lg_sale_detail', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  num: text('num').notNull(),
  value: doublePrecision('value').notNull().default(0),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Agent balance ledger */
export const balance = pgTable('balance', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  agentName: text('agent_name').notNull(),
  amount: doublePrecision('amount').notNull().default(0),
  onDate: text('on_date').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Cash receipts from agents */
export const receive = pgTable('receive', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  agentName: text('agent_name').notNull(),
  amount: doublePrecision('amount').notNull().default(0),
  onDate: text('on_date').notNull(),
  onCount: integer('on_count'),
  ampm: text('ampm'),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Lucky number per session */
export const luckyNo = pgTable('lucky_no', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onDate: text('on_date').notNull(),
  ampm: text('ampm').notNull(),
  lNo: text('l_no').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

// ─── Restriction tables ───────────────────────────────────────────────────────

/** Hot numbers — numbers to highlight (warn on entry) */
export const hotNumbers = pgTable('hot_numbers', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onCount: integer('on_count').notNull(),
  num: text('num').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Not-buy numbers — numbers to block from entry */
export const notBuyNumbers = pgTable('not_buy_numbers', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onCount: integer('on_count').notNull(),
  num: text('num').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Bet limit per number per session */
export const limits = pgTable('limits', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  limitValue: doublePrecision('limit_value').notNull().default(0),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Brade restriction */
export const brade = pgTable('brade', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  bradeCode: text('brade_code').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Power restriction */
export const power = pgTable('power', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** APoo restriction — same-digit numbers (00,11,...,99) */
export const aPoo = pgTable('a_poo', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** NetKhat restriction */
export const netKhat = pgTable('net_khat', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** NetKhat Thai variant */
export const netKhatThai = pgTable('net_khat_thai', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Part restriction */
export const part = pgTable('part', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  partDigit: text('part_digit').notNull(),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/**
 * SMALL restriction — SS/BB/SB/BS digit-size classification
 */
export const small = pgTable('small', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  flag: text('flag').notNull(), // 'SS' | 'BB' | 'SB' | 'BS'
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/**
 * SM restriction — SS/MM classification
 */
export const sm = pgTable('sm', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  flag: text('flag').notNull(), // 'SS' | 'MM'
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Series Medium — number series with PP flag */
export const serieM = pgTable('serie_m', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  pp: integer('pp').notNull().default(0),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Series Small — number series variant */
export const serieS = pgTable('serie_s', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  pp: integer('pp').notNull().default(0),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Key configuration */
export const keyConfig = pgTable('key_config', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  keyValue: text('key_value').notNull(),
  updatedAt: bigint('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

// ─── Audit log ────────────────────────────────────────────────────────────────

/** Append-only activity/audit trail — no updatedAt (rows are never edited), so
 *  intentionally excluded from the two-way sync bump/trigger machinery. */
export const activityLogs = pgTable('activity_logs', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  userId: text('user_id').notNull(),
  userName: text('user_name').notNull(),
  userRole: text('user_role').notNull(),
  action: text('action').notNull(),      // 'create' | 'edit' | 'delete' | 'login' | 'logout' | 'view' | 'suspend'
  entity: text('entity').notNull(),      // 'voucher' | 'session' | 'agent' | 'user' | 'lucky_no' | etc.
  entityId: text('entity_id'),
  details: text('details'),              // JSON string with before/after values
  ipAddress: text('ip_address'),
  createdAt: bigint('created_at', { mode: 'number' }).notNull(),
});
