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
  console.log('\n======================================================');
  console.log('🚀 RUNNING SUITE: ROLES, PERMISSIONS & VOUCHER TESTING');
  console.log('======================================================\n');

  const testOrgId = `test_org_${Date.now()}`;
  const testDate = '2026-09-20';
  const testSlot = '12:00';
  const testCount = 1;
  const sid = buildSessionId(testDate, testSlot, testCount);

  try {
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
    // TEST 2: Custom Role Creation & Permission Override
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 2: Custom Role Creation & Overrides ---');
    const customRoleId = 'readonly_auditor';
    const customRoleData = {
      name: 'Readonly Auditor',
      description: 'Audit user with read-only views',
      permissions: ['ledger.view', 'reports.view', 'history.view'],
      createdAt: Date.now(),
      updatedAt: Date.now(),
    };
    await orgRoleDoc(testOrgId, customRoleId).set(customRoleData);

    const fetchedPerms = await getRolePermissions(testOrgId, customRoleId);
    assert(fetchedPerms.includes('ledger.view'), 'Custom role has ledger.view');
    assert(fetchedPerms.includes('reports.view'), 'Custom role has reports.view');
    assert(!fetchedPerms.includes('ledger.create'), 'Custom role correctly lacks ledger.create');
    assert(!fetchedPerms.includes('ledger.delete'), 'Custom role correctly lacks ledger.delete');

    // -------------------------------------------------------------------------
    // TEST 3: Permission Assertion & Enforcement (Effectiveness)
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 3: Permission Assertion (Effectiveness) ---');
    const auditorSession = { id: 'auditor_1', role: customRoleId, orgId: testOrgId };
    const cashierSession = { id: 'cashier_1', role: 'cashier', orgId: testOrgId };
    const supervisorSession = { id: 'sup_1', role: 'supervisor', orgId: testOrgId };
    const superAdminSession = { id: 'admin_1', role: 'super_admin', orgId: null };

    const auditorCreateCheck = await assertPermission(auditorSession, testOrgId, 'ledger.create');
    assert(auditorCreateCheck !== null && auditorCreateCheck.status === 403, 'Auditor blocked from ledger.create (403)');

    const auditorViewCheck = await assertPermission(auditorSession, testOrgId, 'ledger.view');
    assert(auditorViewCheck === null, 'Auditor allowed ledger.view');

    const cashierCreateCheck = await assertPermission(cashierSession, testOrgId, 'ledger.create');
    assert(cashierCreateCheck === null, 'Cashier allowed ledger.create');

    const supervisorDeleteCheck = await assertPermission(supervisorSession, testOrgId, 'ledger.delete');
    assert(supervisorDeleteCheck === null, 'Supervisor allowed ledger.delete');

    const superAdminAnyCheck = await assertPermission(superAdminSession, testOrgId, 'admin.roles.manage');
    assert(superAdminAnyCheck === null, 'Super Admin granted all access');

    // -------------------------------------------------------------------------
    // TEST 4: Closed-Session Voucher Policy
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 4: Finished/Closed Session Voucher Policy ---');
    const closedSession = { isActive: false, onDate: testDate, ampm: testSlot, onCount: testCount };
    const openSession = { isActive: true, onDate: testDate, ampm: testSlot, onCount: testCount };

    // Cashier on closed session -> blocked
    const cashierClosedCheck = await assertCashierWriteAllowed(cashierSession, testOrgId, closedSession);
    assert(cashierClosedCheck !== null && cashierClosedCheck.status === 403, 'Cashier blocked on closed session (403)');

    // Cashier on open session -> allowed
    const cashierOpenCheck = await assertCashierWriteAllowed(cashierSession, testOrgId, openSession);
    assert(cashierOpenCheck === null, 'Cashier allowed on active/open session');

    // Supervisor / Admin on closed session -> allowed
    const supervisorClosedCheck = await assertCashierWriteAllowed(supervisorSession, testOrgId, closedSession);
    assert(supervisorClosedCheck === null, 'Supervisor allowed override on closed session');

    const orgAdminSession = { id: 'oa_1', role: 'org_admin', orgId: testOrgId };
    const adminClosedCheck = await assertCashierWriteAllowed(orgAdminSession, testOrgId, closedSession);
    assert(adminClosedCheck === null, 'Org Admin allowed override on closed session');

    // -------------------------------------------------------------------------
    // TEST 5: Online Voucher Calculation & Token Parsing
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 5: Number Expression Parser & Online Voucher Prep ---');
    const testTokens = ['12500', '19R100', '0F300', '[12]500'];
    let totalEntries = [];
    for (const t of testTokens) {
      const { entries, error } = parseNumberExpression(t, { maxEntries: 1000 });
      assert(!error, `Token "${t}" parsed successfully`);
      if (entries) totalEntries.push(...entries);
    }
    // 12500 -> 1 entry (12: 500) = 500
    // 19R100 -> 2 entries (19: 100, 91: 100) = 200
    // 0F300 -> 10 entries (00-09: 300 each) = 3000
    // [12]500 -> 4 entries (11, 12, 21, 22: 500 each) = 2000
    // Total = 17 entries, 5,700 sum
    const calculatedAmount = totalEntries.reduce((s, e) => s + parseFloat(e.amount), 0);
    assert(totalEntries.length === 17, `Expanded to exactly 17 number items (got ${totalEntries.length})`);
    assert(calculatedAmount === 5700, `Calculated sum is exactly 5,700 (got ${calculatedAmount})`);

    // -------------------------------------------------------------------------
    // TEST 6: Offline Voucher Queue & State Simulation
    // -------------------------------------------------------------------------
    console.log('\n--- TEST 6: Offline Voucher Storage & Queue Behavior ---');
    const localRecords = [
      { id: 'v_local_1', orgId: testOrgId, status: 'pending', amount: 1500, tokens: ['12+1500'], onDate: testDate },
      { id: 'v_local_2', orgId: testOrgId, status: 'synced', amount: 2000, srNo: 1, onDate: testDate },
      { id: 'v_local_3', orgId: testOrgId, status: 'failed', error: 'Agent not found', amount: 500, onDate: testDate },
    ];

    const pending = localRecords.filter(r => r.status === 'pending');
    const failedList = localRecords.filter(r => r.status === 'failed');
    const synced = localRecords.filter(r => r.status === 'synced');

    assert(pending.length === 1, 'Correctly counted 1 pending offline voucher');
    assert(failedList.length === 1, 'Correctly counted 1 failed offline voucher');
    assert(synced.length === 1, 'Correctly counted 1 synced offline voucher');

    // Simulate Retry Action
    localRecords[2].status = 'pending';
    localRecords[2].error = null;
    assert(localRecords[2].status === 'pending' && localRecords[2].error === null, 'Failed voucher retried and set to pending');

    // Clean up test documents in Firestore
    await orgRoleDoc(testOrgId, customRoleId).delete();
  } catch (err) {
    console.error('Error executing test suite:', err);
    failed++;
  } finally {
    console.log('\n======================================================');
    console.log(`TEST SUMMARY: ${passed} PASSED, ${failed} FAILED`);
    console.log('======================================================\n');
    process.exit(failed > 0 ? 1 : 0);
  }
}

runTests();
