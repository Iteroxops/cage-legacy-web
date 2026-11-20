# Cage Legacy (web build)

Play in the browser: https://cage-legacy.pages.dev/ (Cloudflare Pages) or https://iteroxops.github.io/cage-legacy-web/

A single-threaded Godot 4.7.2 web export of Cage Legacy, the MMA career simulator. This repo holds only the
built game; careers are saved in your browser's storage, on that browser only.

Built from the `web` branch of Iteroxops/cage-legacy (@ 784c692): main @ 243924e (live tactics, #131) plus
web-only changes the desktop game doesn't have: saving right after fights in the single-threaded export, saves
written a piece at a time (big careers save within a browser's memory), a "Not taking fights" switch for your
gym's fighters, pitching an amateur to the pros, and SET / MAX ALL cheats that teach every technique and position (2026-11-20).

Every push to `main` also deploys to Cloudflare Pages (`.github/workflows/deploy-cloudflare.yml`): `tools/make_site.sh` gzips the engine and the pack, splits the pack into 20 MiB pieces (Cloudflare's per-file limit is 25 MiB) and writes `site/index.html` from `tools/site.html`, which joins and unpacks them in the browser. It needs the `CLOUDFLARE_API_TOKEN` repository secret.
