#!/bin/bash
# usage: wine-live-test.sh NAME SERIAL OUT.png  (exe extrait dans analysis/x/)
D=$(cd "$(dirname "$0")/.." && pwd)
export DISPLAY=:77
Xvfb :77 -screen 0 800x600x24 & XV=$!; sleep 2
wine "$D/analysis/x/Crackmeh.exe" >/dev/null 2>&1 & sleep 6
# Edit1 (name) @ (54,~40) ; Edit2 (serial) @ (54,~80) ; Check @ (78,~73+..)
xdotool mousemove 410 285 click 1; xdotool type "$1"
xdotool mousemove 410 302 click 1; xdotool type "$2"
xdotool mousemove 397 321 click 1; sleep 2
ffmpeg -loglevel error -y -f x11grab -video_size 800x600 -i :77 -frames:v 1 "$3"
kill $XV; wineserver -k
