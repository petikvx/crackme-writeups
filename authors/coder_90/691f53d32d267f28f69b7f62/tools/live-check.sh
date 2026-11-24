#!/bin/bash
# usage: live-check.sh <name> <serial_hex>  — pilote le GUI sous Wine+Xvfb, affiche le titre de la MessageBox (Success/Failed)
EXE="$(dirname "$0")/../analysis/KeyGenMe.exe"
NAME="$1"; KEY="$2"
export WINEDEBUG=-all
xvfb-run -a bash -c '
wine "$0" >/dev/null 2>&1 & 
for i in $(seq 40); do W=$(xdotool search --name "^KeygenMe$" | head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 1; eval $(xdotool getwindowgeometry --shell $W)
xdotool mousemove $((X+150)) $((Y+32)) click 1; xdotool type --delay 50 "$1"
xdotool mousemove $((X+150)) $((Y+72)) click 1; xdotool type --delay 50 "$2"
xdotool mousemove $((X+150)) $((Y+115)) click 1
for i in $(seq 10); do sleep 1; for t in Success Failed; do xdotool search --name "^$t\$" >/dev/null 2>&1 && { echo "$t"; pkill -f wineserver; exit 0; }; done; done
echo "NOWIN"; xwininfo -root -tree | head -20' "$EXE" "$NAME" "$KEY"
