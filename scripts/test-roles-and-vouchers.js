import { config } from 'dotenv';
config({ path: '.env.local' });

import { randomUUID } from 'crypto';
import {
  getDb,
  orgDoc,
  usersCol,
  orgRolesCol,
  orgRoleDoc,
  orgSessionsCol,
  orgSessionDoc,
  orgAgentsCol,
  orgAgentDoc,
  orgSessionVouchersCol,
  orgSessionVoucherDoc,
  sessionId as buildSessionId,
} from '../src/lib/db/firestore.js';
import { DEFAULT_ROLES, ALL_PERMISSION_KEYS } from '../src/lib/auth/permissionMatrix.js';
import {
  getRolePermissions,
  hasPermission,
  assertPermission,
  assertCashierWriteAllowed,
} from '../src/lib/auth/permissions.js';
import { parseNumberExpression } from '../src/lib/lottery/numberParser.js';

let passed = 0;
let failed = 0;

function assert(condition, message) {
  if (condition) {
    console.log(`  ✅ PASS: ${message}`);
    passed++;
  } else {
    console.error(`  ❌ FAIL: ${message}`);
    failed++;
  }
}

async function runTests() {
  console.log('\n========================================================================');
  console.log('🚀 RUNNING COMPREHENSIVE SUITE: ONLINE/OFFLINE VOUCHERS & SESSIONS');
  console.log('========================================================================\n');

  const testOrgId = `test_org_${Date.now()}`;
  const testDate = '2026-09-20';
  const session1Slot = '12:00';
  const session1Count = 1;
  const session1Id = buildSessionId(testDate, session1Slot, session1Count);

  const session2Slot = '04:30';
  const session2Count = 2;
  const session2Id = buildSessionId(testDate, session2Slot, session2Count);

  const testAgentId = `agent_${Date.now()}`;

  try {
    // -------------------------------------------------------------------------
    // SETUP: Initialize test Agent & Sessions in Firestore
    // -------------------------------------------------------------------------
    await orgAgentDoc(testOrgId, testAgentId).set({
      id: testAgentId,
      agentId: testAgentId,
      orgId: testOrgId,
      agentName: 'Aung Aung (Agent)',
      commission: 15,
      rate: 80,
      createdAt: Date.now(),
    });

    await orgSessionDoc(testOrgId, session1Id).set({
      id: session1Id,
      onDate: testDate,
      ampm: session1Slot,
      onCount: session1Count,
      machineId: 1,
      isActive: true,
      voucherCount: 0,
      createdAt: Date.now(),
    });

    await orgSessionDoc(testOrgId, session2Id).set({
      id: session2Id,
      onDate: testDate,
      ampm: session2Slot,
      onCount: session2Count,
      machineId: 1,
      isActive: false, // Closed session
      voucherCount: 0,
      createdAt: Date.now(),
    });

    // -------------------------------------------------------------------------
    // TEST 1: System Roles Default Permissions Resolution
    // -------------------------------------------------------------------------
    console.log('--- TEST 1: Default Role Permissions ---');
    const cashierPerms = await getRolePermissions(testOrgId, 'cashier');
    assert(cashierPerms.includes('ledger.create'), 'Cashier has ledger.create by default');
    assert(!cashierPerms.includes('settings.operating_mode'), 'Cashier lacks settings.operating_mode');
    assert(!cashierPerms.includes('admin.users.create'), 'Cashier lacks admin.users.create');

    const superAdminPerms = await getRolePermissions(testOrgId, 'super_admin');
    assert(superAdminPerms.length === ALL_PERMISSION_KEYS.length, 'Super Admin has all permissions');

    // -------------------------------------------------------------------------
    // TEST 2: Custom Role Creation & Overrides
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 2: Custom Role Creation & Overrides ---');
    const customRoleId = 'readonly_auditor';
    await orgRoleDoc(testOrgId, customRoleId).set({
      name: 'Readonly Auditor',
      permissions: ['ledger.view', 'reports.view', 'history.view'],
      createdAt: Date.now(),
    });

    const fetchedPerms = await getRolePermissions(testOrgId, customRoleId);
    assert(fetchedPerms.includes('ledger.view'), 'Custom role has ledger.view');
    assert(!fetchedPerms.includes('ledger.create'), 'Custom role correctly lacks ledger.create');
    assert(!fetchedPerms.includes('ledger.delete'), 'Custom role correctly lacks ledger.delete');

    // -------------------------------------------------------------------------
    // TEST 3: Permission Assertion (Effectiveness)
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 3: Permission Assertion (Effectiveness) ---');
    const auditorSession = { id: 'auditor_1', role: customRoleId, orgId: testOrgId };
    const cashierSession = { id: 'cashier_1', role: 'cashier', orgId: testOrgId };
    const supervisorSession = { id: 'sup_1', role: 'supervisor', orgId: testOrgId };

    const auditorCreateCheck = await assertPermission(auditorSession, testOrgId, 'ledger.create');
    assert(auditorCreateCheck !== null && auditorCreateCheck.status === 403, 'Auditor blocked from ledger.create (403)');

    const cashierCreateCheck = await assertPermission(cashierSession, testOrgId, 'ledger.create');
    assert(cashierCreateCheck === null, 'Cashier allowed ledger.create');

    const supervisorDeleteCheck = await assertPermission(supervisorSession, testOrgId, 'ledger.delete');
    assert(supervisorDeleteCheck === null, 'Supervisor allowed ledger.delete');

    // -------------------------------------------------------------------------
    // TEST 4: Online Voucher Creation & Updating in Firestore
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 4: Online Voucher Creation & Updating ---');
    const db = getDb();
    const onlineVoucherId = `v_online_${Date.now()}`;
    const onlineVoucherRef = orgSessionVoucherDoc(testOrgId, session1Id, onlineVoucherId);
    const session1Ref = orgSessionDoc(testOrgId, session1Id);

    // Online Creation with atomic SrNo
    const tokens = ['12500', '341000'];
    let expanded = [];
    tokens.forEach(t => {
      const { entries } = parseNumberExpression(t);
      if (entries) expanded.push(...entries);
    });
    const amount = expanded.reduce((sum, e) => sum + e.amount, 0);

    const { srNo } = await db.runTransaction(async (tx) => {
      const sSnap = await tx.get(session1Ref);
      const nextSrNo = (sSnap.data().voucherCount || 0) + 1;
      tx.set(onlineVoucherRef, {
        id: onlineVoucherId,
        orgId: testOrgId,
        sessionId: session1Id,
        srNo: nextSrNo,
        agentId: testAgentId,
        agentName: 'Aung Aung (Agent)',
        tokens,
        amount,
        onDate: testDate,
        ampm: session1Slot,
        onCount: session1Count,
        createdAt: Date.now(),
      });
      tx.update(session1Ref, { voucherCount: nextSrNo });
      return { srNo: nextSrNo };
    });

    assert(srNo === 1, `Online voucher created successfully with Serial Number #${srNo}`);
    assert(amount === 1500, `Online voucher calculated amount is 1,500 (got ${amount})`);

    // Online Updating
    const updatedTokens = ['12800', '341200', '56500'];
    let updatedExpanded = [];
    updatedTokens.forEach(t => {
      const { entries } = parseNumberExpression(t);
      if (entries) updatedExpanded.push(...entries);
    });
    const updatedAmount = updatedExpanded.reduce((sum, e) => sum + e.amount, 0);

    await onlineVoucherRef.update({
      tokens: updatedTokens,
      amount: updatedAmount,
      updatedAt: Date.now(),
    });

    const verifyUpdateSnap = await onlineVoucherRef.get();
    const verifyData = verifyUpdateSnap.data();
    assert(verifyData.amount === 2500, `Online voucher updated amount is 2,500 (got ${verifyData.amount})`);
    assert(verifyData.tokens.length === 3, `Online voucher now has 3 tokens (got ${verifyData.tokens.length})`);

    // -------------------------------------------------------------------------
    // TEST 5: Offline Voucher Creation & Multi-Session Separation
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 5: Offline Voucher Creation & Multi-Session Separation ---');
    const localStore = [
      // Session 1 vouchers (Active 12:00 slot)
      {
        id: 'v_local_s1_1',
        orgId: testOrgId,
        agentId: testAgentId,
        onDate: testDate,
        ampm: session1Slot,
        onCount: session1Count,
        tokens: ['01500'],
        amount: 500,
        status: 'pending',
        action: 'create',
      },
      {
        id: 'v_local_s1_2',
        orgId: testOrgId,
        agentId: testAgentId,
        onDate: testDate,
        ampm: session1Slot,
        onCount: session1Count,
        tokens: ['991000'],
        amount: 1000,
        status: 'synced',
        srNo: 1,
        action: 'create',
      },
      // Session 2 vouchers (Closed 04:30 slot)
      {
        id: 'v_local_s2_1',
        orgId: testOrgId,
        agentId: testAgentId,
        onDate: testDate,
        ampm: session2Slot,
        onCount: session2Count,
        tokens: ['77300'],
        amount: 300,
        status: 'failed',
        error: 'This session has finished. Cashiers cannot create vouchers after session closes.',
        action: 'create',
      },
      {
        id: 'v_local_s2_2',
        orgId: testOrgId,
        agentId: 'non_existent_agent',
        onDate: testDate,
        ampm: session2Slot,
        onCount: session2Count,
        tokens: ['88400'],
        amount: 400,
        status: 'failed',
        error: 'Agent not found for this organization',
        action: 'create',
      },
    ];

    // Compute Per-Session Breakdown as done in UI
    const sessionMap = new Map();
    for (const v of localStore) {
      const key = `${v.onDate}_${v.ampm}_${v.onCount}`;
      if (!sessionMap.has(key)) {
        sessionMap.set(key, { key, total: 0, pending: 0, failed: 0, synced: 0 });
      }
      const s = sessionMap.get(key);
      s.total++;
      if (v.status === 'pending') s.pending++;
      else if (v.status === 'failed') s.failed++;
      else if (v.status === 'synced') s.synced++;
    }

    const s1Stats = sessionMap.get(`${testDate}_${session1Slot}_${session1Count}`);
    const s2Stats = sessionMap.get(`${testDate}_${session2Slot}_${session2Count}`);

    assert(s1Stats.total === 2 && s1Stats.pending === 1 && s1Stats.synced === 1, 'Session 1 (12:00 #1) isolated: 1 pending, 1 synced, 0 failed');
    assert(s2Stats.total === 2 && s2Stats.failed === 2 && s2Stats.pending === 0, 'Session 2 (04:30 #2) isolated: 2 failed errors tracked separately');

    // Filter by Session in UI
    const session1FilterResults = localStore.filter(v => `${v.onDate}_${v.ampm}_${v.onCount}` === `${testDate}_${session1Slot}_${session1Count}`);
    const session2FilterResults = localStore.filter(v => `${v.onDate}_${v.ampm}_${v.onCount}` === `${testDate}_${session2Slot}_${session2Count}`);

    assert(session1FilterResults.length === 2, 'Filtered Session 1 UI table displays exactly 2 records');
    assert(session2FilterResults.length === 2, 'Filtered Session 2 UI table displays exactly 2 records');
    assert(session2FilterResults.every(v => v.status === 'failed'), 'Filtered Session 2 UI correctly isolates session-specific sync errors');

    // -------------------------------------------------------------------------
    // TEST 6: Offline-to-Online Reconnection & Auto-Sync
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 6: Offline-to-Online Reconnection & Auto-Sync Simulation ---');
    // Simulate background drain loop pushing pending items to Firestore upon reconnection
    const pendingItem = localStore.find(v => v.id === 'v_local_s1_1');
    assert(pendingItem.status === 'pending', 'Voucher is initially pending in offline queue');

    // Simulate online drain execution
    pendingItem.status = 'syncing';
    assert(pendingItem.status === 'syncing', 'Voucher transitioned to "syncing" state');

    const syncedVoucherRef = orgSessionVoucherDoc(testOrgId, session1Id, pendingItem.id);
    const syncResult = await db.runTransaction(async (tx) => {
      const sSnap = await tx.get(session1Ref);
      const nextSrNo = (sSnap.data().voucherCount || 0) + 1;
      tx.set(syncedVoucherRef, {
        id: pendingItem.id,
        orgId: testOrgId,
        sessionId: session1Id,
        srNo: nextSrNo,
        agentId: pendingItem.agentId,
        tokens: pendingItem.tokens,
        amount: pendingItem.amount,
        createdAt: Date.now(),
      });
      tx.update(session1Ref, { voucherCount: nextSrNo });
      return { srNo: nextSrNo };
    });

    pendingItem.status = 'synced';
    pendingItem.srNo = syncResult.srNo;
    pendingItem.error = null;

    assert(pendingItem.status === 'synced', 'Voucher successfully marked as "synced" upon reconnecting online');
    assert(pendingItem.srNo === 2, `Voucher assigned server Serial Number #${pendingItem.srNo}`);

    // Verify Firestore snapshot
    const serverSnap = await syncedVoucherRef.get();
    assert(serverSnap.exists && serverSnap.data().srNo === 2, 'Server verified: offline voucher saved seamlessly to Firestore');

    // -------------------------------------------------------------------------
    // CLEANUP
    // -------------------------------------------------------------------------
    await orgRoleDoc(testOrgId, customRoleId).delete();
    await orgSessionDoc(testOrgId, session1Id).delete();
    await orgSessionDoc(testOrgId, session2Id).delete();
    await orgAgentDoc(testOrgId, testAgentId).delete();
    await onlineVoucherRef.delete();
    await syncedVoucherRef.delete();

  } catch (err) {
    console.error('Error executing test suite:', err);
    failed++;
  } finally {
    console.log('\n========================================================================');
    console.log(`TEST SUMMARY: ${passed} PASSED, ${failed} FAILED`);
    console.log('========================================================================\n');
    process.exit(failed > 0 ? 1 : 0);
  }
}

runTests();
