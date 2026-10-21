#!/bin/bash
# Usage: live-wine.sh <name> <serial> — pilote le crackme (wine-mono + Xvfb) et liste les fenêtres après clic.
# MessageBox OK = titre "Nelix CrackMe" ; échec = "Try again!" (titre vide/par défaut).
EXE="$(dirname "$0")/../analysis/x/Nelix_CrackMe_1.exe"
export DISPLAY=:97 WINEDEBUG=-all
Xvfb :97 -screen 0 1024x768x24 & XP=$!
sleep 2
wine "$EXE" & sleep 12
xdotool mousemove 120 77 click 1; xdotool type --delay 50 "$1"
xdotool mousemove 116 134 click 1; xdotool type --delay 20 "$2"
xdotool mousemove 145 165 click 1; sleep 4
for w in $(xdotool search --name "" 2>/dev/null); do n=$(xdotool getwindowname $w); [ -n "$n" ] && echo "$n"; done | grep -v "IME\|Broadcast"
import -window root /tmp/live-$1.png 2>/dev/null
kill $XP; wineserver -k 2>/dev/null
