// Runtime dispatcher — re-exports the active dialect's table definitions so
// existing `import { X } from '@/lib/db/schema.js'` call sites keep working
// unchanged regardless of DATABASE_DRIVER. Table definitions are pure
// synchronous metadata (no I/O), so picking one at module-eval time is safe.
import * as pg from './schema.pg.js';
import * as sqlite from './schema.sqlite.js';

const active = process.env.DATABASE_DRIVER === 'sqlite' ? sqlite : pg;

export const organizations = active.organizations;
export const users = active.users;
export const subscriptions = active.subscriptions;
export const machineConfig = active.machineConfig;
export const lotterySessions = active.lotterySessions;
export const rates = active.rates;
export const agents = active.agents;
export const lg = active.lg;
export const lgDetail = active.lgDetail;
export const lgVoucherToken = active.lgVoucherToken;
export const lgSale = active.lgSale;
export const lgSaleDetail = active.lgSaleDetail;
export const balance = active.balance;
export const receive = active.receive;
export const luckyNo = active.luckyNo;
export const hotNumbers = active.hotNumbers;
export const notBuyNumbers = active.notBuyNumbers;
export const limits = active.limits;
export const brade = active.brade;
export const power = active.power;
export const aPoo = active.aPoo;
export const netKhat = active.netKhat;
export const netKhatThai = active.netKhatThai;
export const part = active.part;
export const small = active.small;
export const sm = active.sm;
export const serieM = active.serieM;
export const serieS = active.serieS;
export const keyConfig = active.keyConfig;
