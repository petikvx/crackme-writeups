#!/bin/bash
# usage : xvfb-run -a -s "-screen 0 1024x768x24" ./run.sh 'XDOTOOL_AFTER_FOCUS' out.png
# Window title is a single space; class is zi-crackme v2.exe; Graphics 640x100.
cd "$(dirname "$0")"
pkill -f "Zi-Crackme V2.exe" 2>/dev/null
wineserver -k 2>/dev/null
sleep 0.5
wine "../original/Zi-Crackme V2.exe" >/tmp/zi_v2_wine.log 2>&1 &
W=""
for i in $(seq 1 50); do
  W=$(xdotool search --onlyvisible --class "zi-crackme" 2>/dev/null | head -1)
  [ -n "$W" ] && break
  W=$(xwininfo -root -tree 2>/dev/null | awk '/zi-crackme v2.exe/ && /640x100/{print $1; exit}')
  [ -n "$W" ] && break
  sleep 0.4
done
if [ -z "$W" ]; then
  echo "NO_WINDOW" >&2
  xwininfo -root -tree 2>/dev/null | head -30 >&2
  exit 1
fi
echo "WINDOW=$W"
sleep 1.5
xdotool windowactivate --sync "$W" 2>/dev/null
xdotool windowfocus --sync "$W" 2>/dev/null
eval "$1"
sleep 0.4
xdotool key Return
sleep 1.2
python3 -c "from PIL import ImageGrab; ImageGrab.grab().crop((180,300,700,460)).save('$2')"
# also full screen dump
python3 -c "from PIL import ImageGrab; ImageGrab.grab().save('${2%.png}_full.png')"
pkill -f "Zi-Crackme V2.exe" 2>/dev/null
wineserver -k 2>/dev/null
sleep 1
echo "OK_SHOT $2"
