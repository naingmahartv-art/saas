export async function buildSaleTotals(db, { onCount, ampm }) {
  await db.transaction(async tx => {
    await tx.run('DELETE FROM TmpLGTotalSale');
    await tx.run('DELETE FROM TmpLGTotalSale_1');
    await tx.run(`INSERT INTO TmpLGTotalSale (Num1, TotalSale, Balance)
      SELECT Num1, SUM(Value), SUM(Value) FROM LGDetail
      WHERE OnCount = ? AND AMPM = ? GROUP BY Num1 ORDER BY Num1`, [onCount, ampm]);
    await tx.run(`INSERT INTO TmpLGTotalSale_1 (Num1, TotalSale)
      SELECT Num1, SUM(Value) FROM LGSaleDetail
      WHERE OnCount = ? AND AMPM = ? GROUP BY Num1 ORDER BY Num1`, [onCount, ampm]);
  });
}

export async function saveLedgerEntry(db, entry) {
  if (!entry.agentName || !entry.number) throw new Error('Agent and number are required');
  return db.transaction(tx => tx.saveLedgerEntry(entry));
}

export async function buildAgentReport(db, viewer, appPath, key) {
  await db.transaction(async tx => {
    await tx.run('DELETE FROM TmpLG_Zlg1');
    await tx.run(`INSERT INTO TmpLG_Zlg1
      SELECT OnCount, AMPM, AgentID, AgentName, SrNo, Num, MachineID, OnDate, OnTime
      FROM LG WHERE OnCount = ? AND AMPM = ? AND AgentName = ?`,
      [key.onCount, key.ampm, key.agentName]);
  });
  return viewer.open({ reportPath: `${appPath}\\Reports\\ZLg1.rpt` });
}

export async function buildDetailReport(db, viewer, appPath, key) {
  await db.transaction(async tx => {
    await tx.run('DELETE FROM TmpLGDetail');
    await tx.run('INSERT INTO TmpLGDetail SELECT * FROM LGDetail WHERE OnCount = ? AND AMPM = ?', [key.onCount, key.ampm]);
  });
  return viewer.open({ reportPath: `${appPath}\\Reports\\ZLg3.rpt` });
}
