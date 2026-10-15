#!/usr/bin/env bash
# Vérif réelle sous wine (runtime VB6) + Xvfb privé : tape le serial dans txtSerial,
# clic sur Check !, puis cherche la MsgBox « Congrats » / « Sorry ».
# usage : tools/verify-wine.sh SERIAL [out.png]
set -u
cd "$(dirname "$0")/../original"
OUT=${2:-/tmp/d00m1-result.png}
Xvfb :84 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:84
wine d00m1.exe >/tmp/d00m1.log 2>&1 & sleep 8
w=$(xdotool search --onlyvisible --name "CrackMe 1 by d00msweek" | tail -1)
eval "$(xdotool getwindowgeometry --shell $w)"   # X Y (fenêtre centrée, 355x146 client)
# txtSerial ≈ (+167,+52), cmdCheck ≈ (+172,+116) relatifs au coin client
xdotool mousemove $((X+167)) $((Y+52)); sleep .3; xdotool click 1; sleep .3; xdotool type --delay 60 "$1"; sleep .3
xdotool mousemove $((X+172)) $((Y+116)); sleep .3; xdotool click 1; sleep 2
for t in Congrats Sorry; do
  if xdotool search --onlyvisible --name "^$t\$" >/dev/null 2>&1; then echo "MsgBox : $t"; fi
done
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':84').save('$OUT')" && echo "capture : $OUT"
wineserver -k; sleep 1; kill $XV 2>/dev/null
