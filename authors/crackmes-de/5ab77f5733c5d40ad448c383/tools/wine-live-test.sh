#!/bin/bash
# $1 name $2 serial
D=$(mktemp -d); cp /workspace/crackme-writeups/authors/crackmes-de/5ab77f5733c5d40ad448c383/analysis/extracted/{crackme1.exe,info.nfo} $D/
cd $D
export WINEPREFIX=$HOME/.wine WINEDEBUG=-all DISPLAY=:77
Xvfb :77 -screen 0 800x600x24 & XP=$!
sleep 2
wine crackme1.exe & 
sleep 6
xdotool search --name "" 2>/dev/null | while read w; do echo "$w $(xdotool getwindowname $w)"; done | grep -v " $"
W=$(xdotool search --name CRACKME | head -1); xdotool windowfocus $W
xdotool mousemove --window $W 259 51 click 1; xdotool type --delay 80 "$1"
xdotool mousemove --window $W 259 98 click 1; xdotool type --delay 80 "$2"
xdotool mousemove --window $W 70 149 click 1
echo SENT; sleep 2; python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=\":77\").save(\"/tmp/shot_ok.png\")"
sleep 3
echo "--- windows after OK"; xdotool search --name "" 2>/dev/null | while read w; do echo "$w $(xdotool getwindowname $w)"; done | grep -v " $"
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=\":77\").save(\"/tmp/shot_after.png\")"; xdotool key Return; sleep 2
echo "--- after dismiss"; xdotool search --name "" 2>/dev/null | while read w; do echo "$w $(xdotool getwindowname $w)"; done | grep -v " $"
xdotool key alt+F4; sleep 1; xdotool key alt+F4;sleep 3
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=\":77\").save(\"/tmp/shot_final.png\")"; echo "--- end"; xdotool search --name "" 2>/dev/null | while read w; do echo "$w $(xdotool getwindowname $w)"; done | grep -v " $"
ls -la $D
kill $XP; wineserver -k
