#!/bin/bash
# usage: wine-live-test.sh <texte> <out.png> [x y bx by]  (via: xvfb-run -a -s "-screen 0 1024x768x24" ...)
# B-CRKME2.EXE extrait du zip dans analysis/x/
cd "$(dirname "$0")/../analysis/x"
export WINEDEBUG=-all
wine B-CRKME2.EXE &
sleep 8
xdotool mousemove ${3:-475} ${4:-397} click 1 key End; xdotool key --repeat 60 --delay 20 BackSpace
xdotool type --delay 60 "$1"
xdotool mousemove ${5:-619} ${6:-397} click 1
sleep 2
python3 -I -c "
from PIL import ImageGrab
ImageGrab.grab(xdisplay=None).save('../$2')"
