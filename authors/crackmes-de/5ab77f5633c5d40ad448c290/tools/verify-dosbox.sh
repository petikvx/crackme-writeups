#!/usr/bin/env bash
# Vérification live sous DOSBox (headless), entrée redirigée depuis un fichier.
set -euo pipefail
HERE=$(cd "$(dirname "$0")/.." && pwd)
W=$(mktemp -d)
7z x -y -o"$W" "$HERE/original/therapy_crackme1.zip" >/dev/null
printf '%s\r\n' "${1:-hhTTTq%%7777662}" > "$W/OK.TXT"
printf 'petik\r\n' > "$W/KO.TXT"
SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy timeout 30 xvfb-run -a dosbox \
  -c "mount c $W" -c "c:" -c "CRACKME.COM < OK.TXT > OUTOK.TXT" \
  -c "CRACKME.COM < KO.TXT > OUTKO.TXT" -c exit >/dev/null 2>&1
echo "== OK ($(cat "$W/OK.TXT" | tr -d '\r'))"; cat "$W/OUTOK.TXT"; echo; echo "== KO (petik)"; cat "$W/OUTKO.TXT"
