/*
 * Behavioral JavaScript rewrite of frmLG.frm.
 *
 * The original VB6 form is decompiled and depends on DAO/Crystal/MSFlexGrid.
 * Database, report, and UI effects are injected so the core logic is testable.
 */

const DEFAULT_CONFIG = Object.freeze({
  maxEntries: 50,
  groupWidth: 4,
  acceptedTokens: '0123456789RPBWNFAX+-/*.[]T',
  reportDirectory: '\\Reports'
});

function createFrmLGController({ database, reports, ui, config = {} }) {
  const settings = { ...DEFAULT_CONFIG, ...config };
  const state = {
    onCount: 0,
    ampm: '',
    machineId: 0,
    minSerial: 0,
    maxSerial: 0,
    agentName: '',
    serialNo: '',
    amount: 0,
    numberText: '',
    groupIndex: 0,
    entries: [],
    selectedRow: -1,
    sortMode: '',
    formLoaded: false
  };

  const services = {
    database: database || {},
    reports: reports || {},
    ui: ui || {}
  };

  function notify(message, level = 'info') {
    if (typeof services.ui.message === 'function') {
      services.ui.message(message, level);
    }
  }

  function focus(controlName) {
    if (typeof services.ui.focus === 'function') {
      services.ui.focus(controlName);
    }
  }

  function refresh() {
    if (typeof services.ui.refresh === 'function') {
      services.ui.refresh({ ...state, entries: [...state.entries] });
    }
  }

  function setInput(value) {
    state.numberText = String(value ?? '');
    if (typeof services.ui.setValue === 'function') {
      services.ui.setValue('txtNum', state.numberText);
    }
  }

  function appendInput(value) {
    setInput(`${state.numberText}${value}`);
  }

  function normalize(value) {
    return String(value ?? '').trim();
  }

  function isAcceptedToken(character) {
    return settings.acceptedTokens.includes(character);
  }

  function isControlKey(key) {
    return key === 'Backspace' || key === 'Enter' || key === ' ';
  }

  function expandLegacyToken(token, context) {
    if (typeof settings.expandLegacyToken === 'function') {
      return settings.expandLegacyToken(token, context);
    }
    return [token];
  }

  function parseNumberExpression(expression) {
    const text = normalize(expression).toUpperCase();
    if (!text) {
      return [];
    }

    const output = [];
    let fragment = '';

    const flush = () => {
      if (!fragment) {
        return;
      }
      output.push(...expandLegacyToken(fragment, { state: { ...state } }));
      fragment = '';
    };

    for (const character of text) {
      if (/[0-9]/.test(character)) {
        fragment += character;
        continue;
      }

      if ('RPBWNFAXT'.includes(character)) {
        fragment += character;
        continue;
      }

      if ('+-/*[].'.includes(character)) {
        flush();
        output.push({ operator: character });
        continue;
      }

      if (character === ' ') {
        flush();
      }
    }

    flush();
    return output;
  }

  function calculateAmount(entry) {
    if (typeof settings.calculateAmount === 'function') {
      return settings.calculateAmount(entry, { ...state });
    }

    if (typeof entry === 'number') {
      return entry;
    }

    const numeric = Number.parseFloat(String(entry).replace(/[^0-9.-]/g, ''));
    return Number.isFinite(numeric) ? numeric : 0;
  }

  function commitParsedExpression(expression) {
    const parsed = parseNumberExpression(expression).filter(
      item => !(item && typeof item === 'object' && item.operator)
    );

    if (parsed.length === 0) {
      return { committed: 0, reason: 'empty' };
    }

    if (state.entries.length + parsed.length > settings.maxEntries) {
      notify('Too Large.Cann\'t Add. Please save!!', 'warning');
      return { committed: 0, reason: 'limit' };
    }

    for (const value of parsed) {
      const row = {
        onCount: state.onCount,
        ampm: state.ampm,
        machineId: state.machineId,
        agentName: state.agentName,
        serialNo: state.serialNo,
        number: String(value),
        amount: calculateAmount(value),
        groupIndex: state.groupIndex
      };

      state.entries.push(row);
      state.amount += row.amount;
      state.groupIndex += 1;

      if (state.groupIndex >= settings.groupWidth) {
        state.groupIndex = 0;
        state.onCount += 1;
      }
    }

    setInput('');
    refresh();
    return { committed: parsed.length, reason: 'ok' };
  }

  function processSpace() {
    const result = commitParsedExpression(state.numberText);
    if (result.committed === 0 && result.reason === 'empty') {
      focus('txtNum');
    }
    return result;
  }

  function processPeriod() {
    appendInput('00');
    return { handled: true, replacement: '00' };
  }

  function processSpecialOperator(key) {
    if (key === '*' || key === '/') {
      appendInput(key);
      focus('txtNum');
      return { handled: true, operator: key };
    }
    return { handled: false };
  }

  function txtNumKeyPress({ key, value }) {
    const character = key.length === 1 ? key.toUpperCase() : key;
    if (typeof value === 'string') {
      state.numberText = value;
    }

    if (character === 'Backspace') {
      setInput(state.numberText.slice(0, -1));
      return { handled: true, action: 'backspace' };
    }

    if (character === 'Enter') {
      return { handled: true, action: 'commit', result: commitParsedExpression(state.numberText) };
    }

    if (character === ' ') {
      return { handled: true, action: 'space', result: processSpace() };
    }

    if (character === '.') {
      return processPeriod();
    }

    if (character === '*' || character === '/') {
      return processSpecialOperator(character);
    }

    if (!isAcceptedToken(character)) {
      return { handled: true, action: 'reject', key: character };
    }

    appendInput(character);
    return { handled: false, action: 'accept', key: character };
  }

  async function txtAgentNameLostFocus(agentName = state.agentName) {
    state.agentName = normalize(agentName);
    if (!state.agentName) {
      return { found: false, reason: 'empty' };
    }

    if (typeof services.database.findAgentByName !== 'function') {
      return { found: true, reason: 'adapter-not-configured' };
    }

    const agent = await services.database.findAgentByName(state.agentName);
    if (!agent) {
      notify("Agent Name Cann't Found!", 'warning');
      state.agentName = '';
      refresh();
      return { found: false, reason: 'not-found' };
    }

    if (typeof services.ui.setAgent === 'function') {
      services.ui.setAgent(agent);
    }
    return { found: true, agent };
  }

  async function cmdSaveClick() {
    if (!state.agentName) {
      notify("Cann't Save Successfully. Please Agent Name!", 'warning');
      focus('txtAgentName');
      return { saved: false, reason: 'agent-required' };
    }

    const payload = {
      onCount: state.onCount,
      ampm: state.ampm,
      machineId: state.machineId,
      agentName: state.agentName,
      serialNo: state.serialNo,
      amount: state.amount,
      entries: [...state.entries]
    };

    if (typeof services.database.saveLedgerEntry === 'function') {
      await services.database.saveLedgerEntry(payload);
    }

    if (typeof services.ui.refreshAfterSave === 'function') {
      await services.ui.refreshAfterSave(payload);
    } else {
      refresh();
    }

    return { saved: true, payload };
  }

  async function cmdRpt5Click() {
    if (typeof services.database.stageZlg1 === 'function') {
      await services.database.stageZlg1({ onCount: state.onCount, ampm: state.ampm, agentName: state.agentName });
    }
    const path = `${settings.reportDirectory}\\ZLg1.rpt`;
    if (typeof services.reports.run === 'function') {
      await services.reports.run(path, { ...state });
    }
    return { report: path };
  }

  async function cmdRpt6Click() {
    if (typeof services.database.stageZlg3 === 'function') {
      await services.database.stageZlg3({ onCount: state.onCount, ampm: state.ampm });
    }
    const path = `${settings.reportDirectory}\\ZLg3.rpt`;
    if (typeof services.reports.run === 'function') {
      await services.reports.run(path, { ...state });
    }
    return { report: path };
  }

  async function command3Click({ number, count } = {}) {
    const requestedNumber = normalize(number);
    const requestedCount = normalize(count);
    if (!requestedNumber || !requestedCount) {
      return { shown: false, reason: 'input-required' };
    }

    if (typeof services.database.queryTopSales !== 'function') {
      return { shown: false, reason: 'adapter-not-configured' };
    }

    const rows = await services.database.queryTopSales({
      number: requestedNumber,
      count: requestedCount,
      sortMode: state.sortMode
    });
    if (typeof services.ui.showRows === 'function') {
      services.ui.showRows('Grid', rows);
    }
    return { shown: true, rows };
  }

  async function cmdSearchClick() {
    if (typeof services.ui.openSearch === 'function') {
      const result = await services.ui.openSearch({ ...state });
      if (result) {
        Object.assign(state, result);
        refresh();
      }
      return result;
    }
    return null;
  }

  async function cmdCheckClick() {
    if (typeof services.ui.openCheck === 'function') {
      return services.ui.openCheck({ ...state });
    }
    return null;
  }

  async function deleteSelectedRow() {
    const row = state.entries[state.selectedRow];
    if (!row) {
      return { deleted: false, reason: 'no-selection' };
    }

    if (typeof services.ui.confirm === 'function') {
      const confirmed = await services.ui.confirm('Are you sure to Delete ?');
      if (!confirmed) {
        return { deleted: false, reason: 'cancelled' };
      }
    }

    if (typeof services.database.deleteSaleEntry === 'function') {
      await services.database.deleteSaleEntry({ ...row });
    }

    state.entries.splice(state.selectedRow, 1);
    state.selectedRow = -1;
    state.amount = state.entries.reduce((total, entry) => total + Number(entry.amount || 0), 0);
    refresh();
    return { deleted: true, row };
  }

  function gridClick(rowIndex) {
    state.selectedRow = Number(rowIndex);
    const row = state.entries[state.selectedRow];
    if (row) {
      state.serialNo = row.serialNo || state.serialNo;
      state.numberText = row.number || '';
      state.agentName = row.agentName || state.agentName;
      state.amount = Number(row.amount || state.amount);
    }
    refresh();
    return row || null;
  }

  async function gridKeyDown(key) {
    if (key === 'Enter') {
      return gridClick(state.selectedRow);
    }
    if (key === 'Delete') {
      return deleteSelectedRow();
    }
    return { handled: false };
  }

  function gridMouseDown(button) {
    if (button === 'right' && state.entries[state.selectedRow]) {
      if (typeof services.ui.showDeleteMenu === 'function') {
        services.ui.showDeleteMenu();
      }
      return { menuShown: true };
    }
    return { menuShown: false };
  }

  async function formLoad(initial = {}) {
    Object.assign(state, initial);
    state.formLoaded = true;
    if (typeof services.database.loadInitialState === 'function') {
      Object.assign(state, await services.database.loadInitialState());
    }
    refresh();
    return { ...state };
  }

  async function formKeyDown(key) {
    switch (key) {
      case 'F1': return cmdSaveClick();
      case 'F4': return close();
      case 'F8': return cmdSearchClick();
      case 'F12': return cmdCheckClick();
      case 'F2': return cmdRpt5Click();
      case 'F3': return cmdRpt6Click();
      default: return { handled: false, key };
    }
  }

  function close() {
    state.formLoaded = false;
    if (typeof services.ui.closeForm === 'function') {
      services.ui.closeForm('frmLG');
    }
    return { closed: true };
  }

  return {
    state,
    formLoad,
    formKeyDown,
    txtNumKeyPress,
    txtAgentNameLostFocus,
    cmdSaveClick,
    cmdRpt5Click,
    cmdRpt6Click,
    command3Click,
    cmdSearchClick,
    cmdCheckClick,
    cboSort1Click: mode => {
      state.sortMode = mode;
      refresh();
      return { sortMode: mode };
    },
    gridClick,
    gridKeyDown,
    gridMouseDown,
    mnuDeleteClick: deleteSelectedRow,
    cmdExitClick: close
  };
}

export { createFrmLGController };
