export async function findAgent(db, name) {
  return db.get('SELECT * FROM AgentThai WHERE AgentName = ?', [String(name).trim()]);
}

export async function saveAgent(db, agent, existingName = null) {
  if (!String(agent.name ?? '').trim()) throw new Error('Agent name is required');
  if (existingName) {
    return db.run(`UPDATE AgentThai SET AgentName = ?, Address = ?, Phone = ?, Commission = ?, Rate = ? WHERE AgentName = ?`,
      [agent.name, agent.address, agent.phone, agent.commission, agent.rate, existingName]);
  }
  return db.run(`INSERT INTO AgentThai (AgentName, Address, Phone, Commission, Rate) VALUES (?, ?, ?, ?, ?)`,
    [agent.name, agent.address, agent.phone, agent.commission, agent.rate]);
}

export async function deleteAgent(db, name) {
  return db.run('DELETE FROM AgentThai WHERE AgentName = ?', [name]);
}

export async function openAgentReport(viewer, appPath) {
  return viewer.open({ reportPath: `${appPath}\\Reports\\Agent.rpt` });
}
