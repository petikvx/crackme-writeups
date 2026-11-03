#!/bin/bash
# wine-drive.sh <exe> <user> <serial> <out.png>   (Xvfb + wine + xdotool)
export DISPLAY=:79
Xvfb :79 -screen 0 800x600x24 >/dev/null 2>&1 & XP=$!
sleep 1
wine "$1" >/dev/null 2>&1 &
for i in $(seq 1 30); do sleep 1; W=$(xdotool search --onlyvisible --name "UTW KeyGenMe" 2>/dev/null | head -1); [ -n "$W" ] && break; done
sleep 2
clr(){ xdotool mousemove $1 $2 click 1; xdotool key End; for i in $(seq 1 25); do xdotool key BackSpace; done; }
clr 75 50; xdotool type --delay 60 "$2"
clr 75 82; xdotool type --delay 60 "$3"
xdotool mousemove 188 50 click 1
sleep 3
python3 -c "
from PIL import ImageGrab
ImageGrab.grab(xdisplay=':79').save('$4')"
# titres des fenêtres visibles : une 2e "UTW KeyGenMe" = MessageBox "Serial number is correct!"
xdotool search --onlyvisible --name "" | while read w; do xdotool getwindowname $w; done | tr "\n" "|"; echo
kill $(pgrep -x "$(basename "$1")") 2>/dev/null; wineserver -k; kill $XP; true
