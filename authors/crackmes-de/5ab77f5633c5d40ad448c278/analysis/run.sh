#!/bin/bash
# usage : xvfb-run -a -s "-screen 0 1024x768x24" ./run.sh 'COMMANDES_XDOTOOL' out.png
# ex.   : ./run.sh 'xdotool key --delay 150 shift+a shift+x 9 4 3' good.png
# (xdotool type perd le Shift sous le runtime Blitz3D/DirectInput -> shift+<lettre> explicite)
cd "$(dirname "$0")"
wine "../original/Zi _Crackme.exe" >/dev/null 2>&1 &
for i in $(seq 1 40); do W=$(xdotool search --onlyvisible --name "Zi" 2>/dev/null| head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 2
xdotool windowactivate --sync $W 2>/dev/null; xdotool windowfocus $W
eval "$1"
sleep 0.3; xdotool key Return; sleep 1.5
python3 -c "from PIL import ImageGrab; ImageGrab.grab().crop((240,320,560,410)).save('$2')"
pkill -f "Zi _Crackme.exe"; wineserver -k 2>/dev/null; sleep 1
