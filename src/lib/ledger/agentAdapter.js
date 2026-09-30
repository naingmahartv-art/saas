/**
 * Agent Adapter for normalizing agent records between Firestore and IndexedDB.
 */

export function toCanonicalAgent(raw = {}, defaultOrgId = '') {
  const orgId = raw.orgId || defaultOrgId || '';
  const id =
    raw.id ||
    raw.agentId ||
    (typeof crypto !== 'undefined' && crypto.randomUUID
      ? crypto.randomUUID()
      : `ag_${Date.now()}_${Math.random().toString(36).slice(2, 6)}`);

  const agentId = raw.agentId || id;

  return {
    id,
    agentId,
    orgId,
    agentName: raw.agentName || raw.name || '',
    address: raw.address || '',
    phone: raw.phone || '',
    commission: raw.commission !== undefined ? Number(raw.commission) : 0,
    rate: raw.rate !== undefined ? Number(raw.rate) : 80,
    status: raw.status || 'active', // 'active' | 'disabled'
    balance: typeof raw.balance === 'number' ? raw.balance : 0,
    updatedAt: raw.updatedAt ? (typeof raw.updatedAt === 'number' ? raw.updatedAt : Date.now()) : Date.now(),
  };
}

export function fromFirestoreAgent(docSnapOrData, orgId = '') {
  if (!docSnapOrData) return null;
  const isDocSnap = typeof docSnapOrData.data === 'function';
  const data = isDocSnap ? docSnapOrData.data() : docSnapOrData;
  const id = isDocSnap ? docSnapOrData.id : (data.id || data.agentId);

  return toCanonicalAgent({
    ...data,
    id,
    agentId: data.agentId || id,
  }, orgId || data.orgId);
}

export function toFirestoreAgent(canonical) {
  return {
    id: canonical.id,
    agentId: canonical.agentId,
    orgId: canonical.orgId,
    agentName: canonical.agentName,
    address: canonical.address,
    phone: canonical.phone,
    commission: canonical.commission,
    rate: canonical.rate,
    status: canonical.status,
    balance: canonical.balance,
    updatedAt: new Date(canonical.updatedAt),
  };
}

/**
 * Resolves commission hierarchy: Session Override -> Agent Specific -> Organization Default
 */
export function resolveAgentCommission(agent = {}, sessionCommissions = {}, defaultOrgCommission = 0) {
  const agentKey = agent.agentId || agent.id;
  if (sessionCommissions && agentKey && sessionCommissions[agentKey] !== undefined) {
    return Number(sessionCommissions[agentKey]);
  }
  if (agent.commission !== undefined && agent.commission !== null) {
    return Number(agent.commission);
  }
  return Number(defaultOrgCommission) || 0;
}
