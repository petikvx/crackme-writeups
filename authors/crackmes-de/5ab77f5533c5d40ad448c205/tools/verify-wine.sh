#!/usr/bin/env bash
# Vérif réelle : lance l'exe original sous wine/Xvfb, tape la clé dans « Enter your Key »,
# clique « Register » (xdotool), lit le titre de la fenêtre + capture.
# usage : tools/verify-wine.sh CLE [capture.png]
set -u
OUT="${2:+$(realpath -m "$2")}"   # chemin absolu (on fait cd dans un dossier temporaire)
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/Ribbere 1.4/Ribbere 1.4.exe" "$W/r.exe"
cd "$W"; Xvfb :82 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:82
wine r.exe >/dev/null 2>&1 & sleep 8
WID=$(xdotool search --onlyvisible --name 'Ribbere' | head -1)
eval "$(xdotool getwindowgeometry --shell "$WID")"            # X Y WIDTH HEIGHT
xdotool mousemove $((X+158)) $((Y+147)) click 1; sleep 0.5      # champ « Enter your Key »
xdotool type --delay 80 "$1"; sleep 0.5
xdotool mousemove $((X+66)) $((Y+214)) click 1; sleep 2         # bouton « Register »
echo "titre: $(xdotool getwindowname "$WID")"
[ -n "$OUT" ] && python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':82').crop(($X,$Y,$X+$WIDTH,$Y+$HEIGHT)).save('$OUT')"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
