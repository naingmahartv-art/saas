import { NextResponse } from 'next/server';
import { getStatus } from '@/lib/db/sync';

export async function GET() {
  return NextResponse.json(getStatus());
}
