import { sqliteTable, text, integer, real } from 'drizzle-orm/sqlite-core';
import { sql } from 'drizzle-orm';

// Auto-populated at insert time so existing call sites (which don't set
// updatedAt) keep working unchanged; bumped on update by a generated trigger
// (see scripts/generate-sync-triggers.js) rather than app code.
const nowMs = sql`(cast(unixepoch() as integer) * 1000)`;

export const organizations = sqliteTable('organizations', {
  id: text('id').primaryKey(),
  name: text('name').notNull(),
  slug: text('slug').notNull().unique(),
  plan: text('plan').notNull(),
  status: text('status').notNull().default('active'),
  createdBy: text('created_by'),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

export const users = sqliteTable('users', {
  id: text('id').primaryKey(),
  name: text('name').notNull(),
  email: text('email').notNull().unique(),
  passwordHash: text('password_hash').notNull(),
  // roles: 'super_admin' | 'org_admin' | 'user'
  role: text('role').notNull().default('user'),
  orgId: text('org_id').references(() => organizations.id, { onDelete: 'cascade' }),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

export const subscriptions = sqliteTable('subscriptions', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull().references(() => organizations.id, { onDelete: 'cascade' }),
  plan: text('plan').notNull(),
  // basic: $29/mo, advance: $99/mo
  amount: integer('amount').notNull(),
  status: text('status').notNull().default('active'),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

// ─── Lottery tables ───────────────────────────────────────────────────────────

/** Machine configuration — one row per machine per org */
export const machineConfig = sqliteTable('machine_config', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  machineId: integer('machine_id').notNull(),
  minSerial: integer('min_serial').notNull().default(1),
  maxSerial: integer('max_serial').notNull().default(999),
  label: text('label'),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Active betting session per org */
export const lotterySessions = sqliteTable('lottery_sessions', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),               // 'AM' | 'PM' | 'FULL'
  onDate: text('on_date').notNull(),          // YYYY-MM-DD
  machineId: integer('machine_id').notNull().default(1),
  isActive: integer('is_active').notNull().default(1), // 1 = current session
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Payout rate configuration per org */
export const rates = sqliteTable('rates', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num1Rate: real('num1_rate').notNull().default(0),
  num2Rate: real('num2_rate').notNull().default(0),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Agents / customers */
export const agents = sqliteTable('agents', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  agentName: text('agent_name').notNull(),
  address: text('address'),
  phone: text('phone'),
  commission: real('commission').notNull().default(0),
  rate: real('rate').notNull().default(0),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Ledger entry header */
export const lg = sqliteTable('lg', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  onDate: text('on_date').notNull(),
  machineId: integer('machine_id').notNull().default(1),
  agentName: text('agent_name').notNull(),
  num1: text('num1'),
  amount: real('amount').notNull().default(0),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Ledger entry detail lines */
export const lgDetail = sqliteTable('lg_detail', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  agentName: text('agent_name').notNull(),
  num1: text('num1').notNull(),
  value: real('value').notNull().default(0),
  post: integer('post').notNull().default(0),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Raw as-typed voucher tokens — the source of truth a cashier can find/edit/delete by; lgDetail is always re-derived from these. */
export const lgVoucherToken = sqliteTable('lg_voucher_token', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  tokenText: text('token_text').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Sale entry header */
export const lgSale = sqliteTable('lg_sale', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  onDate: text('on_date').notNull(),
  agentId: text('agent_id'),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Sale entry detail lines */
export const lgSaleDetail = sqliteTable('lg_sale_detail', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  srNo: integer('sr_no').notNull(),
  onCount: integer('on_count').notNull(),
  ampm: text('ampm').notNull(),
  num: text('num').notNull(),
  value: real('value').notNull().default(0),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Agent balance ledger */
export const balance = sqliteTable('balance', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  agentName: text('agent_name').notNull(),
  amount: real('amount').notNull().default(0),
  onDate: text('on_date').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Cash receipts from agents */
export const receive = sqliteTable('receive', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  agentName: text('agent_name').notNull(),
  amount: real('amount').notNull().default(0),
  onDate: text('on_date').notNull(),
  onCount: integer('on_count'),
  ampm: text('ampm'),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Lucky number per session */
export const luckyNo = sqliteTable('lucky_no', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onDate: text('on_date').notNull(),
  ampm: text('ampm').notNull(),
  lNo: text('l_no').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

// ─── Restriction tables ───────────────────────────────────────────────────────

/** Hot numbers — numbers to highlight (warn on entry) */
export const hotNumbers = sqliteTable('hot_numbers', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onCount: integer('on_count').notNull(),
  num: text('num').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Not-buy numbers — numbers to block from entry */
export const notBuyNumbers = sqliteTable('not_buy_numbers', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  onCount: integer('on_count').notNull(),
  num: text('num').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Bet limit per number per session */
export const limits = sqliteTable('limits', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  limitValue: real('limit_value').notNull().default(0),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Brade restriction */
export const brade = sqliteTable('brade', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  bradeCode: text('brade_code').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Power restriction */
export const power = sqliteTable('power', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** APoo restriction — same-digit numbers (00,11,...,99) */
export const aPoo = sqliteTable('a_poo', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** NetKhat restriction */
export const netKhat = sqliteTable('net_khat', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** NetKhat Thai variant */
export const netKhatThai = sqliteTable('net_khat_thai', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Part restriction */
export const part = sqliteTable('part', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  partDigit: text('part_digit').notNull(),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/**
 * SMALL restriction — SS/BB/SB/BS digit-size classification
 */
export const small = sqliteTable('small', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  flag: text('flag').notNull(), // 'SS' | 'BB' | 'SB' | 'BS'
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/**
 * SM restriction — SS/MM classification
 */
export const sm = sqliteTable('sm', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  flag: text('flag').notNull(), // 'SS' | 'MM'
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Series Medium — number series with PP flag */
export const serieM = sqliteTable('serie_m', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  pp: integer('pp').notNull().default(0),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Series Small — number series variant */
export const serieS = sqliteTable('serie_s', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  num: text('num').notNull(),
  pp: integer('pp').notNull().default(0),
  createdAt: integer('created_at', { mode: 'number' }).notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});

/** Key configuration */
export const keyConfig = sqliteTable('key_config', {
  id: text('id').primaryKey(),
  orgId: text('org_id').notNull(),
  keyValue: text('key_value').notNull(),
  updatedAt: integer('updated_at', { mode: 'number' }).notNull().default(nowMs),
});
