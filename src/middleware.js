import { NextResponse } from 'next/server';
import { verifyToken } from './lib/auth.js';

const PUBLIC_PATHS = ['/login', '/api/auth/login', '/suspended'];

const ADMIN_ROLES = ['super_admin', 'org_admin'];
const ALL_ROLES = ['super_admin', 'org_admin', 'supervisor', 'cashier'];

// Where each role lands after login / when it hits a route it can't use.
function homeFor(session) {
  if (session.role === 'super_admin') return '/admin';
  if (session.role === 'org_admin') return `/org/${session.orgId}/admin/dashboard`;
  if (session.orgId) return `/org/${session.orgId}/2d/dashboard`;
  return '/login';
}

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

  // Suspended accounts are locked out everywhere except /suspended and
  // /login. This is a fast JWT-carried check — the authoritative,
  // always-fresh check lives in the org/admin layouts, which re-read the
  // user's status from the database on every render.
  if (session.status === 'suspended') {
    return NextResponse.redirect(new URL('/suspended', request.url));
  }

  const segments = pathname.split('/').filter(Boolean);

  // /admin/* — top-level (cross-org) admin panel: super_admin only
  if (segments[0] === 'admin') {
    if (session.role !== 'super_admin') {
      return NextResponse.redirect(new URL(homeFor(session), request.url));
    }
  } else if (segments[0] === 'org' && segments[1]) {
    const orgId = segments[1];
    const belongsToOrg = session.role === 'super_admin' || session.orgId === orgId;
    const section = segments[2]; // 'admin' | '2d' | '3d' | 'select-app'

    if (!belongsToOrg) {
      return NextResponse.redirect(new URL(homeFor(session), request.url));
    }

    if (section === 'admin') {
      // Org admin panel: org_admin + super_admin only
      if (!ADMIN_ROLES.includes(session.role)) {
        return NextResponse.redirect(new URL(homeFor(session), request.url));
      }
    } else if (section === '2d' || section === '3d' || section === 'select-app') {
      // App routes: any authenticated role belonging to this org
      if (!ALL_ROLES.includes(session.role)) {
        return NextResponse.redirect(new URL('/login', request.url));
      }
    }
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
