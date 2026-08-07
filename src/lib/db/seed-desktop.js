import { eq } from 'drizzle-orm';
import { randomUUID } from 'crypto';
import bcrypt from 'bcryptjs';

// Same logic as scripts/seed.js, adapted to be called from inside the running
// server process (index.js's sqlite branch) rather than as a standalone CLI —
// parameterized instead of importing the singleton db/schema to avoid a
// circular import back into index.js.
export async function seedIfEmpty(db, schema) {
  const existing = await db
    .select()
    .from(schema.users)
    .where(eq(schema.users.role, 'super_admin'))
    .limit(1);

  if (existing.length > 0) {
    return { seeded: false, email: existing[0].email };
  }

  const email = process.env.SEED_ADMIN_EMAIL || 'admin@saasplatform.com';
  const password = process.env.SEED_ADMIN_PASSWORD || 'Admin@12345';
  const name = process.env.SEED_ADMIN_NAME || 'Super Admin';
  const hash = bcrypt.hashSync(password, 10);

  await db.insert(schema.users).values({
    id: randomUUID(),
    name,
    email,
    passwordHash: hash,
    role: 'super_admin',
    orgId: null,
    createdAt: Date.now(),
  });

  return { seeded: true, email, password };
}
