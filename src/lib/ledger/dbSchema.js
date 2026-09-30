'use client';

/**
 * IndexedDB Enterprise Schema Definition (DB Version 5)
 * Standardized across 5 core stores:
 * 1. local_sessions
 * 2. local_limits
 * 3. local_agents
 * 4. local_machines
 * 5. local_vouchers
 */

export const DB_NAME = 'lottery_local_vouchers_db';
export const DB_VERSION = 5;

export const STORES = {
  SESSIONS: 'local_sessions',
  LIMITS: 'local_limits',
  AGENTS: 'local_agents',
  MACHINES: 'local_machines',
  VOUCHERS: 'local_vouchers',
};

/**
 * Initializes and upgrades the IndexedDB schema to Version 5.
 */
export function initDbSchema(db, transaction) {
  // 1. local_sessions
  let sessionsStore;
  if (!db.objectStoreNames.contains(STORES.SESSIONS)) {
    sessionsStore = db.createObjectStore(STORES.SESSIONS, { keyPath: 'id' });
  } else {
    sessionsStore = transaction.objectStore(STORES.SESSIONS);
  }
  if (!sessionsStore.indexNames.contains('orgId')) {
    sessionsStore.createIndex('orgId', 'orgId', { unique: false });
  }
  if (!sessionsStore.indexNames.contains('onDate')) {
    sessionsStore.createIndex('onDate', 'onDate', { unique: false });
  }
  if (!sessionsStore.indexNames.contains('sessionId')) {
    sessionsStore.createIndex('sessionId', 'sessionId', { unique: false });
  }
  if (!sessionsStore.indexNames.contains('orgId_sessionId')) {
    sessionsStore.createIndex('orgId_sessionId', ['orgId', 'sessionId'], { unique: false });
  }

  // 2. local_limits
  let limitsStore;
  if (!db.objectStoreNames.contains(STORES.LIMITS)) {
    limitsStore = db.createObjectStore(STORES.LIMITS, { keyPath: 'id' });
  } else {
    limitsStore = transaction.objectStore(STORES.LIMITS);
  }
  if (!limitsStore.indexNames.contains('orgId')) {
    limitsStore.createIndex('orgId', 'orgId', { unique: false });
  }
  if (!limitsStore.indexNames.contains('sessionId')) {
    limitsStore.createIndex('sessionId', 'sessionId', { unique: false });
  }
  if (!limitsStore.indexNames.contains('orgId_sessionId')) {
    limitsStore.createIndex('orgId_sessionId', ['orgId', 'sessionId'], { unique: false });
  }

  // 3. local_agents
  let agentsStore;
  if (!db.objectStoreNames.contains(STORES.AGENTS)) {
    agentsStore = db.createObjectStore(STORES.AGENTS, { keyPath: 'id' });
  } else {
    agentsStore = transaction.objectStore(STORES.AGENTS);
  }
  if (!agentsStore.indexNames.contains('orgId')) {
    agentsStore.createIndex('orgId', 'orgId', { unique: false });
  }
  if (!agentsStore.indexNames.contains('agentName')) {
    agentsStore.createIndex('agentName', 'agentName', { unique: false });
  }
  if (!agentsStore.indexNames.contains('agentId')) {
    agentsStore.createIndex('agentId', 'agentId', { unique: false });
  }
  if (!agentsStore.indexNames.contains('orgId_agentName')) {
    agentsStore.createIndex('orgId_agentName', ['orgId', 'agentName'], { unique: false });
  }

  // 4. local_machines
  let machinesStore;
  if (!db.objectStoreNames.contains(STORES.MACHINES)) {
    machinesStore = db.createObjectStore(STORES.MACHINES, { keyPath: 'id' });
  } else {
    machinesStore = transaction.objectStore(STORES.MACHINES);
  }
  if (!machinesStore.indexNames.contains('orgId')) {
    machinesStore.createIndex('orgId', 'orgId', { unique: false });
  }
  if (!machinesStore.indexNames.contains('machineId')) {
    machinesStore.createIndex('machineId', 'machineId', { unique: false });
  }

  // 5. local_vouchers
  let vouchersStore;
  if (!db.objectStoreNames.contains(STORES.VOUCHERS)) {
    vouchersStore = db.createObjectStore(STORES.VOUCHERS, { keyPath: 'id' });
  } else {
    vouchersStore = transaction.objectStore(STORES.VOUCHERS);
  }
  if (!vouchersStore.indexNames.contains('orgId')) {
    vouchersStore.createIndex('orgId', 'orgId', { unique: false });
  }
  if (!vouchersStore.indexNames.contains('status')) {
    vouchersStore.createIndex('status', 'status', { unique: false });
  }
  if (!vouchersStore.indexNames.contains('orgId_status')) {
    vouchersStore.createIndex('orgId_status', ['orgId', 'status'], { unique: false });
  }
  if (!vouchersStore.indexNames.contains('createdAt')) {
    vouchersStore.createIndex('createdAt', 'createdAt', { unique: false });
  }
  if (!vouchersStore.indexNames.contains('onDate')) {
    vouchersStore.createIndex('onDate', 'onDate', { unique: false });
  }
  if (!vouchersStore.indexNames.contains('voucherType')) {
    vouchersStore.createIndex('voucherType', 'voucherType', { unique: false });
  }
  if (!vouchersStore.indexNames.contains('sessionId')) {
    vouchersStore.createIndex('sessionId', 'sessionId', { unique: false });
  }
  if (!vouchersStore.indexNames.contains('orgId_sessionId')) {
    vouchersStore.createIndex('orgId_sessionId', ['orgId', 'sessionId'], { unique: false });
  }
  if (!vouchersStore.indexNames.contains('orgId_sessionId_type')) {
    vouchersStore.createIndex('orgId_sessionId_type', ['orgId', 'sessionId', 'voucherType'], { unique: false });
  }
}
