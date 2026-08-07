import { NextResponse } from 'next/server';
import { syncNow } from '@/lib/db/sync';

export async function POST() {
  const status = await syncNow();
  return NextResponse.json(status);
}
