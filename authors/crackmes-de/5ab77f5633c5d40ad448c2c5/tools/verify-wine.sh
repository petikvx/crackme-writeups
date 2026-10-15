#!/usr/bin/env bash
# Vérif réelle sous wine (runtime VB6) + Xvfb privé : tape les 3 lettres du serial
# dans les 3 cases, le code dans txtCode, clic sur Register, cherche la MsgBox.
# usage : tools/verify-wine.sh S1S2S3 CODE [out.png]     ex. : tools/verify-wine.sh PET ZYXKVGXXX
set -u
cd "$(dirname "$0")/../original"
SER=$1; CODE=$2; OUT=${3:-/tmp/d00m2-result.png}
Xvfb :86 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:86
wine d00m2.exe >/tmp/d00m2.log 2>&1 & sleep 8
w=$(xdotool search --onlyvisible --name "CrackMe 2 by d00msweek" | tail -1)
eval "$(xdotool getwindowgeometry --shell $w)"
typeat() { xdotool mousemove $((X+$1)) $((Y+$2)); sleep .3; xdotool click 1; sleep .3; xdotool type --delay 60 "$3"; sleep .3; }
typeat 79 49 "${SER:0:1}"; typeat 103 49 "${SER:1:1}"; typeat 127 49 "${SER:2:1}"
typeat 107 105 "$CODE"
xdotool mousemove $((X+108)) $((Y+133)); sleep .3; xdotool click 1; sleep 2
for t in "Congrats!" "Try Again!" "Sorry! :p"; do
  xdotool search --onlyvisible --name "^$t\$" >/dev/null 2>&1 && echo "MsgBox : $t"
done
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':86').save('$OUT')" && echo "capture : $OUT"
wineserver -k; sleep 1; kill $XV 2>/dev/null
