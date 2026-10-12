#!/usr/bin/env bash
# Vérif réelle sous wine + Xvfb : Edit1 = nom, Edit2 = serial, bouton OK (Button1) ; capture l'écran
# (ShowMessage Delphi « Correct » / « Wrong »). Navigation clavier (TabOrder : OK, Edit1, Edit2…).
# usage : tools/verify-wine.sh NOM SERIAL [out.png]
set -u
cd "$(dirname "$0")/../original"
OUT=${3:-/tmp/sams2-result.png}
Xvfb :85 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:85
wine crackme.exe >/tmp/sams2.log 2>&1 & sleep 8
w=$(xdotool search --onlyvisible --name "Form1" | tail -1)
xdotool windowfocus $w 2>/dev/null; sleep .5
xdotool key Tab; sleep .3; printf %s "$1" | xdotool type --delay 50 --file -; sleep .3
xdotool key Tab; sleep .3; printf %s "$2" | xdotool type --delay 50 --file -; sleep .3
xdotool key shift+Tab; sleep .2; xdotool key shift+Tab; sleep .3; xdotool key space; sleep 2
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':85').save('$OUT')"
echo "capture : $OUT"
wineserver -k; sleep 1; kill $XV 2>/dev/null
