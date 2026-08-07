import { defineConfig } from 'drizzle-kit';

export default defineConfig({
  schema: './src/lib/db/schema.sqlite.js',
  out: './drizzle/sqlite',
  dialect: 'sqlite',
});
