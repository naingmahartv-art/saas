import { NextResponse } from 'next/server';
import { verifyToken } from './lib/auth.js';

const PUBLIC_PATHS = ['/login', '/api/auth/login'];

const ROLE_PATHS = {
  super_admin: ['/admin'],
  org_admin: ['/org'],
  user: ['/dashboard'],
};

export async function middleware(request) {
  const { pathname } = request.nextUrl;

  // Allow public paths — root is an exact match (not startsWith, which
  // would otherwise match every path and disable auth entirely)
  if (pathname === '/' || PUBLIC_PATHS.some((p) => pathname.startsWith(p))) {
    return NextResponse.next();
  }

  // Allow static files, Next.js internals, and public downloads
  if (
    pathname.startsWith('/_next') ||
    pathname.startsWith('/favicon') ||
    pathname.startsWith('/downloads')
  ) {
    return NextResponse.next();
  }

  const token = request.cookies.get('saas_session')?.value;
  const session = token ? await verifyToken(token) : null;

  if (!session) {
    return NextResponse.redirect(new URL('/login', request.url));
  }

  // Role-based path guarding
  if (pathname.startsWith('/admin') && session.role !== 'super_admin') {
    return NextResponse.redirect(new URL('/login', request.url));
  }
  if (pathname.startsWith('/org') && !['super_admin', 'org_admin'].includes(session.role)) {
    return NextResponse.redirect(new URL('/dashboard', request.url));
  }

  // Inject user info into headers for server components
  const headers = new Headers(request.headers);
  headers.set('x-user-id', session.id);
  headers.set('x-user-role', session.role);
  headers.set('x-user-org', session.orgId || '');
  headers.set('x-user-name', session.name || '');

  return NextResponse.next({ request: { headers } });
}

export const config = {
  matcher: ['/((?!_next/static|_next/image|favicon.ico).*)'],
};
