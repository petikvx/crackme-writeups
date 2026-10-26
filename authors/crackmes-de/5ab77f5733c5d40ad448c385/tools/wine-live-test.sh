#!/bin/bash
# usage: wine-live-test.sh <texte> <out.png>  (lancer via: xvfb-run -a -s "-screen 0 1024x768x24" ...)
# BRK175.EXE extrait du zip dans analysis/x/ ; textbox ~(405,520), bouton ~(678,523)
cd "$(dirname "$0")/../analysis/x"
export WINEDEBUG=-all
wine BRK175.EXE &
sleep 8
xdotool mousemove 405 520 click 1 key End; xdotool key --repeat 40 --delay 20 BackSpace
xdotool type --delay 60 "$1"
xdotool mousemove 678 523 click 1
sleep 2
python3 -I -c "
from PIL import ImageGrab
ImageGrab.grab(xdisplay=None).save('../$2')"
