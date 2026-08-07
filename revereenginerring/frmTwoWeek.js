export async function loadLuckyNumber(db, { date, ampm }) {
  const row = await db.get('SELECT * FROM LuckyNo WHERE OnDate = ? AND AMPM = ?', [date, ampm]);
  return row?.LNo ?? null;
}

export async function prepareLuckyCustomers(db, { luckyNumber, onCount, ampm }) {
  await db.transaction(async tx => {
    await tx.run('DELETE FROM TmpLuckyCustomer');
    await tx.run(`
      INSERT INTO TmpLuckyCustomer (SrNo, Num, AgentName, Amount)
      SELECT SrNo, Num, AgentName, Value
      FROM LGDetail
      WHERE Num1 = ? AND OnCount = ? AND AMPM = ? AND Post = 1
      ORDER BY SrNo
    `, [luckyNumber, onCount, ampm]);
  });
  return db.all('SELECT * FROM TmpLuckyCustomer ORDER BY SrNo');
}

export async function openWeeklyReport(viewer, appPath, reportName) {
  const allowed = new Set(['TotalWeek.rpt', 'TotalWeekP.rpt', 'TotalWeek3.rpt', 'TotalWeek4.rpt', 'TotalWeek6.rpt', 'TotalWeek1.rpt', 'TotalWeek2.rpt', '10Days.rpt']);
  if (!allowed.has(reportName)) throw new Error('Unsupported report name');
  return viewer.open({ reportPath: `${appPath}\\Reports\\${reportName}` });
}
