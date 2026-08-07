export async function findBooking(db, { serial, onCount, ampm }) {
  const header = await db.get(
    'SELECT * FROM LG WHERE SrNo = ? AND OnCount = ? AND AMPM = ?',
    [serial, onCount, ampm]
  );
  const details = await db.all(
    'SELECT AgentName AS name, Num1, Value AS totalAmount FROM LGDetail WHERE SrNo = ? AND OnCount = ? AND AMPM = ?',
    [serial, onCount, ampm]
  );
  return { header, details };
}

export async function findCustomer(db, name) {
  return db.get('SELECT * FROM AgentThai WHERE AgentName = ?', [String(name).trim()]);
}

export async function deleteBooking(db, { serial, onCount, ampm }) {
  await db.transaction(async tx => {
    await tx.run('DELETE FROM LGDetail WHERE SrNo = ? AND OnCount = ? AND AMPM = ?', [serial, onCount, ampm]);
    await tx.run('DELETE FROM LG WHERE SrNo = ? AND OnCount = ? AND AMPM = ?', [serial, onCount, ampm]);
  });
}

export async function nextSerial(db, { onCount, ampm, machineId }) {
  const row = await db.get(
    'SELECT Max(SrNo) AS MaxNo FROM LG WHERE OnCount = ? AND AMPM = ? AND MachineID = ?',
    [onCount, ampm, machineId]
  );
  return Number(row?.MaxNo || 0) + 1;
}

export function validateCommission(value) {
  return /^\d+(\.\d+)?$/.test(String(value).trim());
}
