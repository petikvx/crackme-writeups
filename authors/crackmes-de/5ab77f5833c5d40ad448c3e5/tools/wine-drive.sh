#!/bin/bash
# Pilote Wine+Xvfb+xdotool : wine-drive.sh <user> <key> <out.png>  (CRACKME=chemin/Crackme.exe)
# usage: run.sh user key out.png
export DISPLAY=:77
Xvfb :77 -screen 0 800x600x24 >/dev/null 2>&1 &
XP=$!
sleep 1
wine ${CRACKME:-/tmp/utw/Crackme.exe} >/tmp/wine.log 2>&1 &
for i in $(seq 1 30); do sleep 1; W=$(xdotool search --onlyvisible --name "UTW Crackme by" 2>/dev/null | head -1); [ -n "$W" ] && break; done
sleep 2
clr(){ xdotool mousemove $1 $2 click 1; xdotool key End; for i in $(seq 1 25); do xdotool key BackSpace; done; }
clr 80 55; xdotool type --delay 60 "$1"
clr 80 79; xdotool type --delay 60 "$2"
xdotool mousemove 220 50 click 1
sleep 3
python3 /tmp/shot.py ${3:-/tmp/shot.png}; xdotool search --onlyvisible --name "" | while read w; do xdotool getwindowname $w; done | tr "\n" "|"; echo
kill $XP; pkill -x Crackme.exe; true
