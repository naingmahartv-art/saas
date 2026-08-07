import './globals.css';
import { I18nProvider } from '@/lib/i18n/index.js';

export const metadata = {
  title: 'SaaS Platform',
  description: 'Multi-tenant SaaS platform',
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <I18nProvider>
          {children}
        </I18nProvider>
      </body>
    </html>
  );
}
