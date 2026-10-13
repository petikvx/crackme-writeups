#!/bin/bash
# usage : xvfb-run -a -s "-screen 0 1024x768x24" ./run.sh NOM SERIAL out.png
cd "$(dirname "$0")"
wine cm2.exe >/dev/null 2>&1 &
for i in $(seq 1 60); do W=$(xdotool search --onlyvisible --name "Mayhem" 2>/dev/null| head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 1.5
xdotool windowactivate --sync $W 2>/dev/null; xdotool windowfocus $W
xdotool mousemove 535 364 click 1; sleep 0.3; xdotool type --delay 50 "$1"
xdotool mousemove 535 393 click 1; sleep 0.3; xdotool type --delay 50 "$2"; sleep 0.3
python3 -c "from PIL import ImageGrab; ImageGrab.grab().save('${3%.png}-form.png')"
xdotool mousemove 581 427 click 1   # bouton Check Serial (écran 1024x768)
sleep 2
for w in $(xdotool search --onlyvisible --name ""); do echo "$w: $(xdotool getwindowname $w)"; done
python3 -c "from PIL import ImageGrab; ImageGrab.grab().save('$3')"
pkill -f cm2.exe; wineserver -k 2>/dev/null; sleep 1
