#!/usr/bin/env bash
# Vérif réelle sous wine (runtime VB6) + Xvfb : tape Name + Serial, clique Check, capture la fenêtre
# (le résultat « Great Job » / « Incorect Serial » s'affiche dans un label, pas en MessageBox).
# usage : tools/verify-wine.sh NOM SERIAL [out.png]
set -u
cd "$(dirname "$0")/../original"
OUT=${3:-/tmp/c0de0f1-result.png}
Xvfb :83 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:83
wine CrackMe.exe >/tmp/c0de0f1.log 2>&1 & sleep 10
w=$(xdotool search --onlyvisible --name "CrackMe 1.0" | tail -1)
eval "$(xdotool getwindowgeometry --shell $w)"   # X Y WIDTH HEIGHT (pas de windowmove : wine ne suit pas)
xdotool mousemove --window $w 100 100; sleep 1; xdotool mousemove --window $w 150 53; sleep .3; xdotool click 1; sleep .3; xdotool type --delay 60 "$1"; sleep .3
xdotool mousemove --window $w 150 77; sleep .3; xdotool click 1; sleep .3; xdotool type --delay 60 "$2"; sleep .3
xdotool mousemove --window $w 81 126; sleep .3; xdotool click 1; sleep 2
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':83').crop(($X,$Y,$X+$WIDTH,$Y+$HEIGHT)).save('$OUT')"
echo "capture : $OUT"
wineserver -k; sleep 1; kill $XV 2>/dev/null
