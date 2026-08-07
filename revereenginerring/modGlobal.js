export async function importMachineDatabase({ db, archive, externalDb, sourceArchive, range, onCount, tables = ['LG', 'LGDetail', 'LGSale', 'LGSaleDetail'] }) {
  await archive.extract(sourceArchive);
  await db.transaction(async tx => {
    for (const table of tables) {
      await tx.run(`DELETE FROM ${table} WHERE SrNo BETWEEN ? AND ? AND OnCount = ?`, [range.min, range.max, onCount]);
    }
    await externalDb.copyTablesInto(tx, tables);
  });
}

export async function importWithVerification(options) {
  if (!options.sourceArchive || !options.range) throw new Error('Archive and serial range are required');
  return importMachineDatabase(options);
}
