# SaaS Platform — Desktop Shell

Wraps the existing Next.js app in a native window. This folder is fully
isolated from the main project — its own `package.json` and `node_modules`,
nothing here touches `../package.json`, `../src`, or any other project file.

## How it works

On launch, `main.js`:
1. Finds a port it can actually bind, starting at 3000 and incrementing until
   one is free (does NOT just check "does something respond on 3000" — dev
   machines often have unrelated services on common ports, which would risk
   loading the wrong app into the window; confirmed this exact collision
   during testing, see below).
2. Spawns `npm run dev -- -p <that port>` in the parent project directory as
   a background process.
3. Shows a small "Starting local server…" screen while polling that URL
   until it responds.
4. Loads that URL into the window once the server is ready.
5. Kills the spawned server process when the app quits.

It always runs the project's current source via `next dev` rather than a
production build, so there's no separate build step to keep in sync — this
is meant for local/offline shop use, not distribution-grade performance yet.

## Setup

This folder uses Yarn (`npm install` failed here on an unrelated
root-owned-cache permissions issue on the dev machine — `sudo chown -R
$(id -u):$(id -g) ~/.npm` fixes that if you hit it, or just use Yarn):

```bash
cd electron-app
yarn install
```

## Run

```bash
yarn start
```

This opens a window titled "SaaS Platform" pointing at your local Next.js
app. Closing the window stops the app (and the spawned server) on
Windows/Linux; on macOS it stays running in the dock until you quit
explicitly, matching normal macOS app behavior.

## Notes / next steps

- **Port**: tries 3000 first, auto-increments to the next free port if taken.
  Override the starting point with `SAAS_DESKTOP_PORT=<port> yarn start`.
- **Packaging into an installer** (`.exe` / `.dmg` / `.AppImage`): run
  `yarn dist` (uses `electron-builder`, already configured in
  `package.json`). Not yet tested end-to-end — do a real build before
  shipping to a shop machine.
- **Still on Neon (cloud DB)**: this shell does not change the app's data
  layer. It still needs internet to reach Neon. True offline operation
  requires the separate SQLite/libSQL migration discussed but not yet
  built — this Electron wrapper is the "native app window" piece only.
