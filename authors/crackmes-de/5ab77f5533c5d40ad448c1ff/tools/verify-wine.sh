#!/usr/bin/env bash
# Vérif réelle sous wine (runtime VB6) + Xvfb : tape le serial, Check, puis Register ; lit les MessageBox.
# usage : tools/verify-wine.sh SERIAL
set -u
cd "$(dirname "$0")/../original"
Xvfb :81 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:81
WINEDEBUG=+msgbox wine CrackMe.exe > /tmp/vb2.log 2>&1 & sleep 7
w=$(xdotool search --onlyvisible --name "CrackMe 2.0" | tail -1)
xdotool windowmove $w 0 0; sleep .5
xdotool mousemove 110 40 click 1; sleep .3; xdotool type --delay 40 "$1"; sleep .3
xdotool mousemove 55 63 click 1; sleep 2
python3 -c "from PIL import ImageGrab;im=ImageGrab.grab(xdisplay=':81');im.crop((0,0,320,200)).save('/tmp/vb2-after-check.png')"
xdotool key Return; sleep 1
xdotool mousemove 160 63 click 1; sleep 2
grep -a 'MSGBOX_OnInit' /tmp/vb2.log
wineserver -k; sleep 1; kill $XV 2>/dev/null
