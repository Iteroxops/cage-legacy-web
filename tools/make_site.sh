#!/usr/bin/env bash
# Builds site/ for Cloudflare Pages from the Godot web export in the repo root.
# Cloudflare Pages takes files up to 25 MiB, so the pack and the engine go up gzipped,
# the pack in 20 MiB pieces; tools/site.html downloads, joins and unpacks them in the browser.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf site && mkdir -p site/game
cp index.js index.audio.worklet.js index.audio.position.worklet.js index.icon.png site/game/
gzip -9 -n -c index.wasm > site/game/wasm.gz.wasm
tmp=$(mktemp)
gzip -9 -n -c index.pck > "$tmp"
split -b 20m -d -a 2 "$tmp" site/game/pck.gz.part
rm -f "$tmp"
total=$(stat -c %s site/game/wasm.gz.wasm)
parts=""
for f in site/game/pck.gz.part??; do
  mv "$f" "$f.wasm"
  parts+="'game/$(basename "$f").wasm', "
  total=$((total + $(stat -c %s "$f.wasm")))
done
sed -e "s|__PCK_PARTS__|[${parts%, }]|" -e "s|__TOTAL__|$total|" tools/site.html > site/index.html
cp tools/_headers site/_headers
ls -l site site/game
