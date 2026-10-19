#!/bin/bash
# Usage : xvfb-run -a -s "-screen 0 800x600x24" wine-xdotool-check.sh <exe> <capture.png>
# Lance le crackme, clique « Push me » (centre écran 800x600), capture après le Sleep(1000).
export WINEDEBUG=-all
wine "$1" & P=$!
sleep 6
xdotool mousemove 398 298 click 1; sleep 3
python3 -c "from PIL import ImageGrab;ImageGrab.grab().crop((240,245,560,355)).save('$2')"
kill $P 2>/dev/null; wineserver -k 2>/dev/null
