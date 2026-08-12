import path from 'path';

/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  outputFileTracingRoot: path.join(process.cwd()),
  serverExternalPackages: ['@opentelemetry/api'],
};

export default nextConfig;

