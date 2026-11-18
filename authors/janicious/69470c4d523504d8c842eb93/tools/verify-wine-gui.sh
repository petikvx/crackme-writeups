#!/bin/bash
cd "$(dirname "$0")/../analysis/x"
SER="$1" OUT="$2" xvfb-run -a -s "-screen 0 800x600x24" bash -c '
xfwm4 --compositor=off >/dev/null 2>&1 & sleep 3; wine winapi-crackme.exe & sleep 6
W=$(xdotool search --name "License Activation" | head -1)
xdotool windowmove $W 50 50; sleep 1; xdotool windowactivate $W; sleep 1; eval $(xdotool getwindowgeometry --shell $W); echo $X $Y
xdotool mousemove 220 82 click 1; sleep 0.5; xdotool type --delay 60 "$SER"; sleep 1
xdotool mousemove 145 119 click 1; sleep 2
ffmpeg -loglevel error -y -f x11grab -video_size 800x600 -i $DISPLAY -frames:v 1 $OUT
' 2>&1 | grep -v "X conn"
