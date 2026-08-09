// Run: node scripts/seed.js
// Creates the super admin account in Firestore.

import { config } from 'dotenv';
config({ path: '.env.local' });

import { randomUUID } from 'crypto';
import bcrypt from 'bcryptjs';

const { usersCol } = await import('../src/lib/db/firestore.js');

const email = process.env.SEED_ADMIN_EMAIL || 'admin@saasplatform.com';
const password = process.env.SEED_ADMIN_PASSWORD || 'Admin@12345';
const name = process.env.SEED_ADMIN_NAME || 'Super Admin';

async function seed() {
  const existing = await usersCol().where('role', '==', 'super_admin').limit(1).get();

  if (!existing.empty) {
    console.log(`✓ Super admin already exists: ${existing.docs[0].data().email}`);
    return;
  }

  const id = randomUUID();
  await usersCol().doc(id).set({
    id,
    name,
    email: email.toLowerCase(),
    passwordHash: bcrypt.hashSync(password, 10),
    role: 'super_admin',
    status: 'active',
    orgId: null,
    createdAt: Date.now(),
  });

  console.log(`✅ Super admin created: ${email} / ${password}`);
}

seed()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error('Seed failed:', err);
    process.exit(1);
  });
