const TABLES = ['LG', 'LGDetail', 'LGSale', 'LGSaleDetail'];

export async function exportMachineData({ db, externalDb, archive, files, range, onCount, machineId }) {
  await db.transaction(async tx => {
    for (const table of TABLES) {
      await tx.run(`DELETE FROM ${table} WHERE SrNo BETWEEN ? AND ? AND OnCount = ? AND MachineID = ?`,
        [range.min, range.max, onCount, machineId]);
    }
    await externalDb.copyTablesFrom(tx, TABLES);
  });
  await archive.create(files.sourceDatabase, files.archivePath);
  await files.copy(files.archivePath, files.destination);
}

export async function loadDataPath(db) {
  return db.get('SELECT * FROM DataPath');
}

export async function loadLimit(db) {
  const row = await db.get('SELECT * FROM Limit');
  return row?.Limit ?? 0;
}
