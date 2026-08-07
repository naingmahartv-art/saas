export async function loadLuckyNumber(db, { date, ampm }) {
  return db.get(
    'SELECT * FROM LuckyNo WHERE OnDate = ? AND AMPM = ?',
    [date, ampm]
  );
}

export async function saveLuckyNumber(db, { date, ampm, luckyNumber }) {
  if (!String(luckyNumber ?? '').trim()) {
    throw new Error('Lucky number is required');
  }

  await db.transaction(async tx => {
    await tx.run(
      'DELETE FROM LuckyNo WHERE OnDate = ? AND AMPM = ?',
      [date, ampm]
    );
    await tx.run(
      'INSERT INTO LuckyNo (OnDate, AMPM, LNo) VALUES (?, ?, ?)',
      [date, ampm, String(luckyNumber).trim()]
    );
  });
}

export function onLuckyNumberKeyPress(key, save) {
  return key === 'Enter' ? save() : { handled: false };
}
