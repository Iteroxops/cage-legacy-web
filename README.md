# Cage Legacy (web build)

Play in the browser: https://cage-legacy.pages.dev/ (Cloudflare Pages) or https://iteroxops.github.io/cage-legacy-web/

A single-threaded Godot 4.7.2 web export of Cage Legacy, the MMA career simulator. This repo holds only the
built game; careers are saved in your browser's storage, on that browser only.

Built from `stats-foundation` @ 5f83f35 plus uncommitted work in progress (2026-11-16).

Every push to `main` also deploys to Cloudflare Pages (`.github/workflows/deploy-cloudflare.yml`): `tools/make_site.sh` gzips the engine and the pack, splits the pack into 20 MiB pieces (Cloudflare's per-file limit is 25 MiB) and writes `site/index.html` from `tools/site.html`, which joins and unpacks them in the browser. It needs the `CLOUDFLARE_API_TOKEN` repository secret.
