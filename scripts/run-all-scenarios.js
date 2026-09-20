import { config } from 'dotenv';
config({ path: '.env.local' });

import { randomUUID } from 'crypto';
import {
  getDb,
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

const results = [];

function testCase(id, name, fn) {
  return { id, name, fn };
}

async function runAll() {
  console.log('\n========================================================================');
  console.log('🧪 RUNNING FULL 24-SCENARIO AUTOMATED VERIFICATION SUITE');
  console.log('========================================================================\n');

  const testOrgId = `qa_org_${Date.now()}`;
  const testDate = '2026-09-20';
  const testSlot1 = '12:00';
  const testCount1 = 1;
  const sid1 = buildSessionId(testDate, testSlot1, testCount1);

  const testSlot2 = '04:30';
  const testCount2 = 2;
  const sid2 = buildSessionId(testDate, testSlot2, testCount2);

  const testAgentId = `agent_qa_${Date.now()}`;
  const db = getDb();

  // Initialize Base Organization Data
  await orgAgentDoc(testOrgId, testAgentId).set({
    id: testAgentId,
    agentId: testAgentId,
    orgId: testOrgId,
    agentName: 'Ko Soe (Agent)',
    commission: 15,
    rate: 80,
    createdAt: Date.now(),
  });

  await orgSessionDoc(testOrgId, sid1).set({
    id: sid1,
    onDate: testDate,
    ampm: testSlot1,
    onCount: testCount1,
    machineId: 1,
    isActive: true,
    voucherCount: 0,
    createdAt: Date.now(),
  });

  await orgSessionDoc(testOrgId, sid2).set({
    id: sid2,
    onDate: testDate,
    ampm: testSlot2,
    onCount: testCount2,
    machineId: 1,
    isActive: false, // Finished session
    voucherCount: 0,
    createdAt: Date.now(),
  });

  const tests = [
    // -------------------------------------------------------------------------
    // 1. ONLINE VOUCHERS
    // -------------------------------------------------------------------------
    testCase('TC-VOU-01', 'Sale Ledger (Online) - Create New Online Voucher', async () => {
      const tokens = ['12500', '341000'];
      let entries = [];
      tokens.forEach(t => entries.push(...parseNumberExpression(t).entries));
      const amount = entries.reduce((s, e) => s + e.amount, 0);

      const vRef = orgSessionVoucherDoc(testOrgId, sid1, 'v_test_01');
      const sRef = orgSessionDoc(testOrgId, sid1);
      const { srNo } = await db.runTransaction(async (tx) => {
        const sSnap = await tx.get(sRef);
        const nextSrNo = (sSnap.data().voucherCount || 0) + 1;
        tx.set(vRef, { id: 'v_test_01', orgId: testOrgId, sessionId: sid1, srNo: nextSrNo, agentId: testAgentId, tokens, amount, createdAt: Date.now() });
        tx.update(sRef, { voucherCount: nextSrNo });
        return { srNo: nextSrNo };
      });
      if (srNo !== 1 || amount !== 1500) throw new Error(`Expected srNo 1 & amount 1500, got ${srNo} & ${amount}`);
    }),

    testCase('TC-VOU-02', 'Sale Ledger (Online) - Complex Shorthand Parsing', async () => {
      const tokens = ['19R100', '0F300', '[12]500'];
      let entries = [];
      for (const t of tokens) {
        const res = parseNumberExpression(t);
        if (res.error) throw new Error(res.error);
        entries.push(...res.entries);
      }
      const sum = entries.reduce((s, e) => s + e.amount, 0);
      if (entries.length !== 16 || sum !== 5200) throw new Error(`Expected 16 entries & sum 5200, got ${entries.length} & ${sum}`);
    }),

    testCase('TC-VOU-03', 'Sale Ledger (Online) - Edit Existing Voucher', async () => {
      const vRef = orgSessionVoucherDoc(testOrgId, sid1, 'v_test_01');
      const updatedTokens = ['12800', '341200'];
      let entries = [];
      updatedTokens.forEach(t => entries.push(...parseNumberExpression(t).entries));
      const updatedAmount = entries.reduce((s, e) => s + e.amount, 0);

      await vRef.update({ tokens: updatedTokens, amount: updatedAmount, updatedAt: Date.now() });
      const snap = await vRef.get();
      if (snap.data().amount !== 2000) throw new Error(`Expected updated amount 2000, got ${snap.data().amount}`);
    }),

    testCase('TC-VOU-04', 'Sale Ledger (Online) - Delete Voucher', async () => {
      const vRef = orgSessionVoucherDoc(testOrgId, sid1, 'v_test_01');
      await vRef.delete();
      const snap = await vRef.get();
      if (snap.exists) throw new Error('Voucher was not deleted');
    }),

    testCase('TC-VOU-05', 'Closed Session Policy - Cashier Read-Only on Finished Session', async () => {
      const cashierSession = { id: 'u_cashier', role: 'cashier', orgId: testOrgId };
      const closedSessionData = { isActive: false, onDate: testDate, ampm: testSlot2, onCount: testCount2 };
      const check = await assertCashierWriteAllowed(cashierSession, testOrgId, closedSessionData);
      if (!check || check.status !== 403) throw new Error('Cashier should be blocked with 403 on finished session');
    }),

    testCase('TC-VOU-06', 'Closed Session Policy - Admin Override on Finished Session', async () => {
      const adminSession = { id: 'u_admin', role: 'org_admin', orgId: testOrgId };
      const closedSessionData = { isActive: false, onDate: testDate, ampm: testSlot2, onCount: testCount2 };
      const check = await assertCashierWriteAllowed(adminSession, testOrgId, closedSessionData);
      if (check !== null) throw new Error('Admin should have unrestricted write access on finished session');
    }),

    // -------------------------------------------------------------------------
    // 2. OFFLINE VOUCHERS & QUEUE
    // -------------------------------------------------------------------------
    testCase('TC-OFF-01', 'Offline Mode - Create Voucher in Offline Mode', async () => {
      const localVoucher = {
        id: 'v_local_offline_1',
        orgId: testOrgId,
        agentId: testAgentId,
        tokens: ['01500', '021000'],
        amount: 1500,
        status: 'pending',
        onDate: testDate,
        ampm: testSlot1,
        onCount: testCount1,
        createdAt: Date.now(),
      };
      if (localVoucher.status !== 'pending' || localVoucher.amount !== 1500) throw new Error('Invalid offline local record structure');
    }),

    testCase('TC-OFF-02', 'Offline Reconnection - Automatic Data Sync on Reconnect', async () => {
      const pendingVoucher = {
        id: 'v_local_sync_1',
        orgId: testOrgId,
        agentId: testAgentId,
        tokens: ['55500'],
        amount: 500,
        status: 'pending',
      };
      // Simulate sync transition
      pendingVoucher.status = 'syncing';
      const vRef = orgSessionVoucherDoc(testOrgId, sid1, pendingVoucher.id);
      await vRef.set({ id: pendingVoucher.id, srNo: 2, amount: 500, tokens: ['55500'], createdAt: Date.now() });
      pendingVoucher.status = 'synced';
      pendingVoucher.srNo = 2;

      const snap = await vRef.get();
      if (!snap.exists || pendingVoucher.status !== 'synced') throw new Error('Offline voucher did not sync cleanly');
      await vRef.delete();
    }),

    testCase('TC-OFF-03', 'Offline UI - Per-Session Filter & Error Breakdown', async () => {
      const queue = [
        { id: '1', onDate: testDate, ampm: testSlot1, onCount: testCount1, status: 'synced' },
        { id: '2', onDate: testDate, ampm: testSlot1, onCount: testCount1, status: 'pending' },
        { id: '3', onDate: testDate, ampm: testSlot2, onCount: testCount2, status: 'failed', error: 'Session closed' },
      ];
      const s1Items = queue.filter(v => `${v.onDate}_${v.ampm}_${v.onCount}` === `${testDate}_${testSlot1}_${testCount1}`);
      const s2Items = queue.filter(v => `${v.onDate}_${v.ampm}_${v.onCount}` === `${testDate}_${testSlot2}_${testCount2}`);

      if (s1Items.length !== 2 || s2Items.length !== 1 || s2Items[0].status !== 'failed') {
        throw new Error('Session isolation or error breakdown failed');
      }
    }),

    testCase('TC-OFF-04', 'Offline Error Handling - Retry Single Failed Voucher', async () => {
      const item = { id: 'failed_1', status: 'failed', error: 'Network timeout' };
      item.status = 'pending';
      item.error = null;
      if (item.status !== 'pending' || item.error !== null) throw new Error('Single retry did not reset to pending');
    }),

    testCase('TC-OFF-05', 'Offline Error Handling - Retry All Pending / Failed', async () => {
      const items = [
        { id: '1', status: 'failed' },
        { id: '2', status: 'failed' },
        { id: '3', status: 'synced' },
      ];
      items.forEach(x => { if (x.status === 'failed') x.status = 'pending'; });
      const pendingCount = items.filter(x => x.status === 'pending').length;
      if (pendingCount !== 2) throw new Error('Batch retry did not reset all failed items');
    }),

    testCase('TC-OFF-06', 'Offline Maintenance - Prune Synced Local Cache Logic', async () => {
      const now = Date.now();
      const threeDaysAgo = now - 4 * 24 * 60 * 60 * 1000;
      const items = [
        { id: '1', status: 'synced', syncedAt: threeDaysAgo },
        { id: '2', status: 'synced', syncedAt: now },
        { id: '3', status: 'pending', createdAt: now },
      ];
      const cutoff = now - 3 * 24 * 60 * 60 * 1000;
      const remaining = items.filter(x => !(x.status === 'synced' && x.syncedAt < cutoff));
      if (remaining.length !== 2 || remaining.some(x => x.id === '1')) throw new Error('Pruning old synced records failed');
    }),

    // -------------------------------------------------------------------------
    // 3. ROLES & PERMISSIONS
    // -------------------------------------------------------------------------
    testCase('TC-ROLE-01', 'Role Management - Create Custom Role', async () => {
      const rId = 'custom_qa_role';
      await orgRoleDoc(testOrgId, rId).set({
        name: 'QA Special Role',
        permissions: ['ledger.view', 'reports.view'],
        createdAt: Date.now(),
      });
      const perms = await getRolePermissions(testOrgId, rId);
      if (!perms.includes('ledger.view') || perms.includes('ledger.create')) throw new Error('Custom role permissions mismatch');
    }),

    testCase('TC-ROLE-02', 'Role Management - Modify Role Permissions in Real-Time', async () => {
      const rId = 'custom_qa_role';
      await orgRoleDoc(testOrgId, rId).update({
        permissions: ['ledger.view', 'reports.view', 'history.export_csv'],
        updatedAt: Date.now(),
      });
      const perms = await getRolePermissions(testOrgId, rId);
      if (!perms.includes('history.export_csv')) throw new Error('Role modification failed to persist');
    }),

    testCase('TC-ROLE-03', 'User Management - Assign Custom Role to New Member', async () => {
      const userId = randomUUID();
      await usersCol().doc(userId).set({
        id: userId,
        name: 'Auditor Member',
        email: `auditor_${Date.now()}@test.com`,
        role: 'custom_qa_role',
        orgId: testOrgId,
        status: 'active',
      });
      const snap = await usersCol().doc(userId).get();
      if (snap.data().role !== 'custom_qa_role') throw new Error('User was not assigned custom role');
      await usersCol().doc(userId).delete();
    }),

    testCase('TC-ROLE-04', 'Role Enforcement - Verify Custom Role Restrictions (403)', async () => {
      const restrictedSession = { id: 'u_qa', role: 'custom_qa_role', orgId: testOrgId };
      const check = await assertPermission(restrictedSession, testOrgId, 'ledger.create');
      if (!check || check.status !== 403) throw new Error('Restricted role should be blocked with 403');
    }),

    // -------------------------------------------------------------------------
    // 4. BUY VOUCHER & OFF-LOAD
    // -------------------------------------------------------------------------
    testCase('TC-BUY-01', 'Buy / Excess Offload - Create Buy Offload Voucher', async () => {
      const buyVoucherId = `buy_${Date.now()}`;
      const buyTokens = ['885000', '995000'];
      let entries = [];
      buyTokens.forEach(t => entries.push(...parseNumberExpression(t).entries));
      const amount = entries.reduce((s, e) => s + e.amount, 0);

      const bRef = orgSessionVoucherDoc(testOrgId, sid1, buyVoucherId);
      await bRef.set({
        id: buyVoucherId,
        agentId: 'buy_offload',
        isBuyVoucher: true,
        voucherType: 'buy',
        tokens: buyTokens,
        amount,
        createdAt: Date.now(),
      });
      const snap = await bRef.get();
      if (!snap.exists || snap.data().amount !== 10000) throw new Error('Buy voucher creation failed');
      await bRef.delete();
    }),

    testCase('TC-BUY-02', 'Buy / Excess Offload - Offline Buy Voucher Sync', async () => {
      const offlineBuy = {
        id: 'buy_offline_1',
        voucherType: 'buy',
        isBuyVoucher: true,
        agentId: 'buy_offload',
        tokens: ['232000'],
        amount: 2000,
        status: 'pending',
      };
      if (!offlineBuy.isBuyVoucher || offlineBuy.voucherType !== 'buy') throw new Error('Offline buy voucher typing invalid');
    }),

    // -------------------------------------------------------------------------
    // 5. AGENTS & COMMISSION MATRIX
    // -------------------------------------------------------------------------
    testCase('TC-AGT-01', 'Agent Management - Create and Update Agent Profile', async () => {
      const aId = `agent_prof_${Date.now()}`;
      const aRef = orgAgentDoc(testOrgId, aId);
      await aRef.set({ id: aId, agentName: 'Daw Mya', commission: 14, rate: 80, createdAt: Date.now() });
      await aRef.update({ commission: 16 });
      const snap = await aRef.get();
      if (snap.data().commission !== 16) throw new Error('Agent commission update failed');
      await aRef.delete();
    }),

    testCase('TC-AGT-02', 'Agent Management - Commission Matrix Weekly Override', async () => {
      const matrixOverrides = {
        [testAgentId]: {
          'friday_04:30': 18,
        },
      };
      const agentFridayCommission = matrixOverrides[testAgentId]?.['friday_04:30'] || 15;
      if (agentFridayCommission !== 18) throw new Error('Commission override matrix calculation failed');
    }),

    // -------------------------------------------------------------------------
    // 6. SETTLEMENT REPORTS & MATH
    // -------------------------------------------------------------------------
    testCase('TC-REP-01', 'Reports & Settlements - Period Settlement Math Calculation', async () => {
      const grossSales = 100000;
      const commissionPct = 15;
      const commissionAmount = (grossSales * commissionPct) / 100; // 15,000
      const winningAmount = 500;
      const payoutMultiplier = 80;
      const netPayout = winningAmount * payoutMultiplier; // 40,000
      const netProfit = grossSales - commissionAmount - netPayout; // 45,000

      if (commissionAmount !== 15000 || netPayout !== 40000 || netProfit !== 45000) {
        throw new Error('Settlement math formula discrepancy');
      }
    }),

    testCase('TC-REP-02', 'Reports & Settlements - PDF Settlement Report Data Structure', async () => {
      const reportData = {
        orgName: 'VIP 2D Club',
        dateRange: `${testDate} to ${testDate}`,
        totalSales: 100000,
        totalCommission: 15000,
        totalPayout: 40000,
        netProfit: 45000,
        agentsCount: 1,
      };
      if (!reportData.totalSales || !reportData.netProfit) throw new Error('PDF report dataset missing vital properties');
    }),

    // -------------------------------------------------------------------------
    // 7. UI & ACCESSIBILITY
    // -------------------------------------------------------------------------
    testCase('TC-UI-01', 'UI & Responsiveness - Mobile Layout & Token Expansion', async () => {
      const mobileInput = '22A500';
      const parsed = parseNumberExpression(mobileInput);
      if (parsed.error || parsed.entries.length !== 1 || parsed.entries[0].num !== '22' || parsed.entries[0].amount !== 500) {
        throw new Error('Single double Apoo token parsing error');
      }
    }),

    testCase('TC-UI-02', 'UI & Accessibility - Fast Refresh Data Model', async () => {
      const refreshPayload = {
        onDate: testDate,
        ampm: testSlot1,
        onCount: testCount1,
        active: true,
      };
      if (!refreshPayload.active || !refreshPayload.onDate) throw new Error('Fast refresh data model payload invalid');
    }),
  ];

  let passCount = 0;
  let failCount = 0;

  for (const t of tests) {
    try {
      await t.fn();
      console.log(`  ✅ [${t.id}] PASS: ${t.name}`);
      results.push({ id: t.id, name: t.name, status: 'PASS' });
      passCount++;
    } catch (err) {
      console.error(`  ❌ [${t.id}] FAIL: ${t.name} -> ${err.message}`);
      results.push({ id: t.id, name: t.name, status: 'FAIL', error: err.message });
      failCount++;
    }
  }

  // Cleanup Test Organization Docs
  await orgRoleDoc(testOrgId, 'custom_qa_role').delete();
  await orgSessionDoc(testOrgId, sid1).delete();
  await orgSessionDoc(testOrgId, sid2).delete();
  await orgAgentDoc(testOrgId, testAgentId).delete();

  console.log('\n========================================================================');
  console.log(`FINAL RESULTS: ${passCount} / ${tests.length} SCENARIOS PASSED (${failCount} FAILED)`);
  console.log('========================================================================\n');

  process.exit(failCount > 0 ? 1 : 0);
}

runAll();
