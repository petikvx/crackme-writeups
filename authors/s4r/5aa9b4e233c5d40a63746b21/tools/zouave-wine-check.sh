#!/bin/bash
# Usage: zouave-wine-check.sh <name> <serial> [out.png]
# Pilote le vrai zouave.exe (Wine + Xvfb + xdotool) et capture l'écran (PIL ImageGrab).
# Prérequis : zouave.exe extrait (zip password crackmes.one) dans analysis/extract/
D=$(cd "$(dirname "$0")/.." && pwd)
OUT=${3:-/tmp/zouave-shot.png}
export WINEDEBUG=-all
xvfb-run -a -s "-screen 0 1280x1024x24" bash -c '
wine "'"$D"'/analysis/extract/zouave.exe" >/dev/null 2>&1 & sleep 8
xdotool mousemove 640 459 click 1; sleep 0.5; xdotool key Home shift+End; xdotool type --delay 40 "'"$1"'"
xdotool mousemove 640 487 click 1; sleep 0.5; xdotool key Home shift+End; xdotool type --delay 40 "'"$2"'"
sleep 0.5; xdotool mousemove 374 477 click 1; sleep 3
python3 -I -c "
from PIL import ImageGrab
ImageGrab.grab(xdisplay=None).save(\"'"$OUT"'\")"
wineserver -k'
