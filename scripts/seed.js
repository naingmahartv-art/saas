// Run: node scripts/seed.js
// Creates the super admin account

import { config } from 'dotenv';
config({ path: '.env.local' });

import { eq } from 'drizzle-orm';
import { randomUUID } from 'crypto';
import bcrypt from 'bcryptjs';

const { db } = await import('../src/lib/db/index.js');
const { users } = await import('../src/lib/db/schema.js');

const email = process.env.SEED_ADMIN_EMAIL || 'admin@saasplatform.com';
const password = process.env.SEED_ADMIN_PASSWORD || 'Admin@12345';
const name = process.env.SEED_ADMIN_NAME || 'Super Admin';

async function seed() {
  const existing = await db
    .select()
    .from(users)
    .where(eq(users.role, 'super_admin'))
    .limit(1);

  if (existing.length > 0) {
    console.log(`✓ Super admin already exists: ${existing[0].email}`);
    return;
  }

  const hash = bcrypt.hashSync(password, 10);

  await db.insert(users).values({
    id: randomUUID(),
    name,
    email,
    passwordHash: hash,
    role: 'super_admin',
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
