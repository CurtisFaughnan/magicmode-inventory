# MagicMode Inventory

Production inventory control built from the company bill of materials.

## Live app

[Open MagicMode Inventory](https://magicmode-inventory.faughnancurtis2.chatgpt.site)

The app supports receiving packages, consuming individual materials, recording a complete chair build, undoing recent stock movements, low-stock alerts below five builds, and a durable transaction history.

## Architecture

- Next.js-compatible interface built with vinext
- Cloudflare Worker API
- Cloudflare D1 persistent inventory and transaction storage
- Drizzle schema and migration files
- GitHub Pages landing page in `docs/`

## Local development

Requires Node.js 22.13 or newer.

```bash
npm install
npm run dev
```

Create a production build with:

```bash
npm run build
```

GitHub Pages hosts the public landing page. The functional application remains on database-backed hosting because GitHub Pages cannot run server APIs or D1.
