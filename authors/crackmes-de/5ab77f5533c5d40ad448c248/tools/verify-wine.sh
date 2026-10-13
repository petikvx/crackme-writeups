#!/bin/bash
# Pilote Crackme2.exe sous wine/Xvfb : bash tools/verify-wine.sh <nom> <serial> <capture>
# (lancer via: xvfb-run -a -s "-screen 0 800x600x24" bash tools/verify-wine.sh petik 988535 ok)
# Nécessite msvbvm50.dll (winetricks --force vb5run). Positions de clic pour un écran 800x600.
cd "$(dirname "$0")/../original"
wine Crackme2.exe >/dev/null 2>&1 &
for i in $(seq 30); do W=$(xdotool search --name "CrackMe by Fr1c" 2>/dev/null|head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 1.5
xdotool mousemove 340 284 click 1; sleep 0.3; xdotool type --delay 40 "$1"
xdotool mousemove 340 364 click 1; sleep 0.3; xdotool type --delay 40 "$2"
xdotool mousemove 484 336 click 1; sleep 1.5
python3 -c "from PIL import ImageGrab; ImageGrab.grab().save('/tmp/$3.png')"
for w in $(xdotool search --name . 2>/dev/null); do n=$(xdotool getwindowname $w 2>/dev/null); [ -n "$n" ] && echo "WIN: $n"; done | sort -u
