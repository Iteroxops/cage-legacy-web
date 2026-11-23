# Cage Legacy (web build)

Play in the browser: https://cage-legacy.pages.dev/ (Cloudflare Pages) or https://iteroxops.github.io/cage-legacy-web/

A single-threaded Godot 4.7.2 web export of Cage Legacy, the MMA career simulator. This repo holds only the
built game; careers are saved in your browser's storage, on that browser only.

Built from the `web` branch of Iteroxops/cage-legacy (@ 31d39b2) on main @ cc9aec3: Elias Venn's Contender
Series (EVCS) annual AFL tryout showcase (#145), Sizing Him Up / Fight Night scouting / CoachRead aligned
with Profile ratings (#144), playtest adjustments (#143: fixed specialist camp & weekly training progression,
contact promotions directly to sign / buyout / free-agency radar, 153 career events
with Wave 2 arcs, live weigh-in face-offs & post-fight mic call-out picker with cageside confrontations,
performance-scaled renewals & free agency, mum camp guard, right of first refusal on renewal), sit-down
negotiations (#141), and main @ e12d76b (your own promotion #140, money matters #138, world P4P #139, ground map
#137, proper emails #136, quick wins #135, staff market #134, personal coaching #133) plus web-only changes the desktop game doesn't have: saving right after fights in the single-threaded export, saves
written a piece at a time (big careers save within a browser's memory), and SET / MAX ALL cheats that teach
every technique and position (2026-11-23).

Every push to `main` also deploys to Cloudflare Pages (`.github/workflows/deploy-cloudflare.yml`): `tools/make_site.sh` gzips the engine and the pack, splits the pack into 20 MiB pieces (Cloudflare's per-file limit is 25 MiB) and writes `site/index.html` from `tools/site.html`, which joins and unpacks them in the browser. It needs the `CLOUDFLARE_API_TOKEN` repository secret.
