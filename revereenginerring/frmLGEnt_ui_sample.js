const updateStatus = (message) => {
  console.log(message);
  const footer = document.querySelector('.footer');
  if (footer) footer.textContent = `Status: ${message}`;
};

const handleSave = () => {
  if (typeof cmdSave_Click === 'function') cmdSave_Click();
  updateStatus('Save action triggered');
};
const handleSearch = () => {
  if (typeof cmdSearch_Click === 'function') cmdSearch_Click();
  updateStatus('Search action triggered');
};
const handleRefresh = () => {
  if (typeof cmdRefresh_Click === 'function') cmdRefresh_Click();
  updateStatus('Refresh action triggered');
};
const handleBuy = () => {
  if (typeof cmdCheck_Click === 'function') cmdCheck_Click();
  updateStatus('Buy action triggered (Alt+B)');
};
const handleAdv = () => {
  if (typeof cmdAdv_Click === 'function') cmdAdv_Click();
  updateStatus('Adv action triggered (Alt+A)');
};
const handleLimit = () => {
  if (typeof cmdLimit_Click === 'function') cmdLimit_Click();
  updateStatus('Limit action triggered (Alt+L)');
};
const handleLucky = () => {
  if (typeof cmdLucky_Click === 'function') cmdLucky_Click();
  updateStatus('Lucky action triggered (Alt+C)');
};
const handleHot = () => {
  if (typeof cmdHot_Click === 'function') cmdHot_Click();
  updateStatus('Hot action triggered (Alt+H)');
};
const handleNotSale = () => {
  if (typeof cmdNotBuy_Click === 'function') cmdNotBuy_Click();
  updateStatus('NotSale action triggered (Alt+S)');
};
const handleCheckNum = () => {
  if (typeof cmdCheck_Agent_Click === 'function') cmdCheck_Agent_Click();
  updateStatus('Checking Num action triggered (F12)');
};
const handleExit = () => {
  if (typeof cmdExit_Click === 'function') cmdExit_Click();
  updateStatus('Exit action triggered (F4)');
};

const register = (id, handler) => {
  const button = document.getElementById(id);
  if (button) button.addEventListener('click', handler);
};

document.addEventListener('DOMContentLoaded', () => {
  register('btnSave', handleSave);
  register('btnSearch', handleSearch);
  register('btnRefresh', handleRefresh);
  register('btnBuy', handleBuy);
  register('btnAdv', handleAdv);
  register('btnLimit', handleLimit);
  register('btnLucky', handleLucky);
  register('btnHot', handleHot);
  register('btnNotSale', handleNotSale);
  register('btnCheckNum', handleCheckNum);
  register('btnExit', handleExit);

  const txtAgentName = document.getElementById('txtAgentName');
  if (txtAgentName) {
    txtAgentName.addEventListener('keypress', txtAgentName_KeyPress);
    txtAgentName.addEventListener('blur', txtAgentName_LostFocus);
  }

  const txtNum = document.getElementById('txtNum');
  if (txtNum) {
    txtNum.addEventListener('input', txtNum_Change);
    txtNum.addEventListener('keypress', txtNum_KeyPress);
  }
});

