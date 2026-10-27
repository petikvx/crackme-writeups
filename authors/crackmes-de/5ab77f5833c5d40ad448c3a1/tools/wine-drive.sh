#!/bin/bash
# usage: drive.sh name serial out.png
cd "$(dirname "$0")/../analysis"
Xvfb :77 -screen 0 400x300x24 &
export DISPLAY=:77
sleep 2
wine crackme1.exe >/tmp/wine.log 2>&1 &
sleep 8
xdotool mousemove 110 48 click 1; xdotool key End; for i in $(seq 20); do xdotool key BackSpace; done; xdotool type --delay 50 "$1"
xdotool mousemove 110 80 click 1; xdotool key End; for i in $(seq 20); do xdotool key BackSpace; done; xdotool type --delay 50 "$2"
xdotool mousemove 110 113 click 1
sleep 3
python3 -c "
from PIL import ImageGrab; ImageGrab.grab(xdisplay=':77').save('$3')"
