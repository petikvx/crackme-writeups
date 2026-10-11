#!/bin/bash
# $1 = output png
wine Crackme6.exe >/dev/null 2>&1 &
sleep 6; xdotool mousemove 256 265 click 1; sleep 2
python3 -c "from PIL import ImageGrab; ImageGrab.grab(xdisplay=None).save(\"$1\")"
wineserver -k
