/**
 * Machine Adapter for managing cashier machine terminal configs,
 * serial number ranges, and offline serial allocations.
 */

export function toCanonicalMachine(raw = {}, defaultOrgId = '') {
  const orgId = raw.orgId || defaultOrgId || '';
  const machineId = Number(raw.machineId) || 1;
  const id = `${orgId}_${machineId}`;

  return {
    id,
    orgId,
    machineId,
    label: raw.label || `Machine ${machineId}`,
    minSerial: Number(raw.minSerial) || 1,
    maxSerial: Number(raw.maxSerial) || 9999,
    lastSrNo: typeof raw.lastSrNo === 'number' ? raw.lastSrNo : (Number(raw.minSerial) || 1) - 1,
    updatedAt: raw.updatedAt ? (typeof raw.updatedAt === 'number' ? raw.updatedAt : Date.now()) : Date.now(),
  };
}

export function fromFirestoreMachines(machinesListOrDoc, orgId = '') {
  if (!machinesListOrDoc) return [];
  const list = Array.isArray(machinesListOrDoc)
    ? machinesListOrDoc
    : Array.isArray(machinesListOrDoc.machines)
    ? machinesListOrDoc.machines
    : [];

  return list.map((m) => toCanonicalMachine(m, orgId));
}

/**
 * Atomically allocates the next sequential receipt number (srNo) for a cashier machine.
 */
export function allocateNextSerial(machine) {
  const min = machine.minSerial || 1;
  const max = machine.maxSerial || 9999;
  let next = (machine.lastSrNo !== undefined && machine.lastSrNo !== null ? machine.lastSrNo : min - 1) + 1;

  if (next > max) {
    next = min; // Wrap around if reaching maximum allocated serial
  }

  return {
    srNo: next,
    updatedMachine: {
      ...machine,
      lastSrNo: next,
      updatedAt: Date.now(),
    },
  };
}
