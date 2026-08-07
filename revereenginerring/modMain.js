export async function loadRate(db) {
  const row = await db.get('SELECT * FROM Rate');
  return Number(row?.Rate ?? 0);
}

export async function loadMachineIps(db) {
  return db.all('SELECT * FROM MachineIP ORDER BY MachineID');
}

export function selectMachine(machineRows, machineId) {
  const machine = machineRows.find(row => Number(row.MachineID) === Number(machineId));
  if (!machine) throw new Error(`Machine ${machineId} is not configured`);
  return { machineId: machine.MachineID, minSerial: machine.MinSerial, maxSerial: machine.MaxSerial, ...machine };
}

export async function initializeMain(db, machineId) {
  const [rate, rows] = await Promise.all([loadRate(db), loadMachineIps(db)]);
  return { rate, ...selectMachine(rows, machineId) };
}
