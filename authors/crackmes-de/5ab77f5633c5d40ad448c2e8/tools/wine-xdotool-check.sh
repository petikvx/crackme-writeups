#!/bin/bash
# Usage : xvfb-run -a tools/wine-xdotool-check.sh <nom> <code>  → affiche les fenêtres visibles (« Ok, lo lograste! » = succès, « Error » = échec)
export WINEDEBUG=-all
wine "$(dirname "$0")/../original/AnonimoSer CrackME I.exe" & P=$!
for i in $(seq 40); do W=$(xdotool search --name '^Form1$' 2>/dev/null | head -1); [ -n "$W" ] && break; sleep 0.5; done
echo "win=$W"; sleep 2
xdotool windowactivate --sync $W 2>/dev/null; xdotool windowfocus $W
xdotool type --delay 30 "$1"; xdotool key Tab; xdotool type --delay 30 "$2"; sleep 0.5; xdotool key Tab; sleep 0.3; xdotool key Return
sleep 3
for w in $(xdotool search --onlyvisible --name '.' 2>/dev/null); do echo "visible: $(xdotool getwindowname $w)"; done
kill $P 2>/dev/null; wineserver -k 2>/dev/null
