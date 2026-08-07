export async function buildWeeklyTotals(db) {
  await db.transaction(async tx => {
    await tx.run('DELETE FROM TmpTotalWeek1');
    await tx.run(`
      INSERT INTO TmpTotalWeek1
        (Agent, Amount1, LAmount1, Amount2, LAmount2,
         Amount3, LAmount3, Amount4, LAmount4,
         Amount5, LAmount5, Type1)
      SELECT Agent, SUM(Amount1), SUM(LAmount1),
             SUM(Amount2), SUM(LAmount2), SUM(Amount3), SUM(LAmount3),
             SUM(Amount4), SUM(LAmount4), SUM(Amount5), SUM(LAmount5), Type1
      FROM TmpTotalWeek
      GROUP BY Agent, Type1
    `);
    await tx.run('DELETE FROM TmpTotalWeek');
  });
}

export async function openTwoReport(viewer, appPath, { purchase = false } = {}) {
  const reportPath = `${appPath}\\Reports\\${purchase ? 'TotalWeekP.rpt' : 'TotalWeek.rpt'}`;
  return viewer.open({ reportPath });
}

export function dispatchTwoReport(mode, handlers) {
  const handler = handlers[mode];
  if (typeof handler !== 'function') throw new Error(`Unsupported report mode: ${mode}`);
  return handler();
}
