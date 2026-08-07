export function luckyAgentReportRequest({ appPath, currentDate }) {
  if (!appPath) throw new Error('Application path is required');
  if (!currentDate) throw new Error('Current date is required');

  return {
    reportPath: `${appPath}\\Reports\\Lagent.rpt`,
    selectionFormula: `OnDate='${formatAccessDate(currentDate)}'`,
    windowMode: 'modal',
    viewerOptions: {
      legacyOption67: true,
      legacyOption17: true
    }
  };
}

export async function lblLuckyAgentClick({ appPath, currentDate, reportViewer, closeMaintenance }) {
  const request = luckyAgentReportRequest({ appPath, currentDate });
  await reportViewer.open(request);
  if (typeof closeMaintenance === 'function') await closeMaintenance();
  return request;
}

function formatAccessDate(value) {
  if (value instanceof Date) {
    const month = String(value.getMonth() + 1).padStart(2, '0');
    const day = String(value.getDate()).padStart(2, '0');
    return `${value.getFullYear()}-${month}-${day}`;
  }
  return String(value);
}
