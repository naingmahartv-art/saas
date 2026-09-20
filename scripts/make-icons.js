import fs from 'fs';
import path from 'path';
import { execSync } from 'child_process';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const ROOT_DIR = path.join(__dirname, '..');
const SOURCE_IMAGE = 'C:\\Users\\naing\\.gemini\\antigravity\\brain\\b4d5da2c-c741-4392-87d0-793dcf8dec1c\\saas_app_icon_1789828523386.jpg';

const SIZES = [16, 24, 32, 48, 64, 128, 256, 512];
const TEMP_DIR = path.join(ROOT_DIR, '.temp_icons');

if (!fs.existsSync(TEMP_DIR)) {
  fs.mkdirSync(TEMP_DIR, { recursive: true });
}

// Generate a PowerShell script to export all sizes cleanly
const psLines = [
  'Add-Type -AssemblyName System.Drawing;',
  `$src = [System.Drawing.Image]::FromFile('${SOURCE_IMAGE.replace(/\\/g, '\\\\')}');`
];

for (const size of SIZES) {
  const outPng = path.join(TEMP_DIR, `icon_${size}.png`).replace(/\\/g, '\\\\');
  psLines.push(
    `$bmp = New-Object System.Drawing.Bitmap(${size}, ${size});`,
    `$graphics = [System.Drawing.Graphics]::FromImage($bmp);`,
    `$graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic;`,
    `$graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality;`,
    `$graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality;`,
    `$graphics.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality;`,
    `$graphics.DrawImage($src, 0, 0, ${size}, ${size});`,
    `$bmp.Save('${outPng}', [System.Drawing.Imaging.ImageFormat]::Png);`,
    `$graphics.Dispose();`,
    `$bmp.Dispose();`
  );
}

psLines.push('$src.Dispose();');

const psFile = path.join(TEMP_DIR, 'convert.ps1');
fs.writeFileSync(psFile, psLines.join('\r\n'), 'utf8');

console.log('Generating PNGs from source...');
execSync(`powershell -NoProfile -ExecutionPolicy Bypass -File "${psFile}"`, { stdio: 'inherit' });

// Build ICO from sizes 16, 24, 32, 48, 64, 128, 256
const icoSizes = [16, 24, 32, 48, 64, 128, 256];
const pngBuffers = icoSizes.map(size => ({
  size,
  buffer: fs.readFileSync(path.join(TEMP_DIR, `icon_${size}.png`))
}));

function createIco(images) {
  const count = images.length;
  const headerSize = 6;
  const entrySize = 16;
  let offset = headerSize + count * entrySize;

  const header = Buffer.alloc(headerSize);
  header.writeUInt16LE(0, 0); // reserved
  header.writeUInt16LE(1, 2); // type: 1 = ICO
  header.writeUInt16LE(count, 4); // count

  const entries = [];
  for (const img of images) {
    const entry = Buffer.alloc(entrySize);
    const width = img.size >= 256 ? 0 : img.size;
    const height = img.size >= 256 ? 0 : img.size;
    entry.writeUInt8(width, 0);
    entry.writeUInt8(height, 1);
    entry.writeUInt8(0, 2); // color palette count
    entry.writeUInt8(0, 3); // reserved
    entry.writeUInt16LE(1, 4); // color planes
    entry.writeUInt16LE(32, 6); // bits per pixel
    entry.writeUInt32LE(img.buffer.length, 8); // size of image data
    entry.writeUInt32LE(offset, 12); // offset of image data
    entries.push(entry);
    offset += img.buffer.length;
  }

  return Buffer.concat([
    header,
    ...entries,
    ...images.map(img => img.buffer)
  ]);
}

const icoBuffer = createIco(pngBuffers);

// Targets
const BUILD_DIR = path.join(ROOT_DIR, 'electron-app', 'build');
const ELECTRON_ASSETS_DIR = path.join(ROOT_DIR, 'electron-app', 'assets');
const PUBLIC_DIR = path.join(ROOT_DIR, 'public');

[BUILD_DIR, ELECTRON_ASSETS_DIR, PUBLIC_DIR].forEach(dir => {
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
});

// Write to electron-app/build (standard electron-builder location)
fs.writeFileSync(path.join(BUILD_DIR, 'icon.ico'), icoBuffer);
fs.copyFileSync(path.join(TEMP_DIR, 'icon_512.png'), path.join(BUILD_DIR, 'icon.png'));

// Write to electron-app/assets
fs.writeFileSync(path.join(ELECTRON_ASSETS_DIR, 'icon.ico'), icoBuffer);
fs.copyFileSync(path.join(TEMP_DIR, 'icon_256.png'), path.join(ELECTRON_ASSETS_DIR, 'icon.png'));

// Write to public for Next.js web
fs.writeFileSync(path.join(PUBLIC_DIR, 'favicon.ico'), icoBuffer);
fs.copyFileSync(path.join(TEMP_DIR, 'icon_512.png'), path.join(PUBLIC_DIR, 'icon.png'));
fs.copyFileSync(path.join(TEMP_DIR, 'icon_128.png'), path.join(PUBLIC_DIR, 'apple-touch-icon.png'));

// Clean temp
fs.rmSync(TEMP_DIR, { recursive: true, force: true });

console.log('Successfully created all icons (ICO + PNG) for Electron and Next.js!');
