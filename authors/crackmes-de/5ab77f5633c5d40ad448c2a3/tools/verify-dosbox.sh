#!/bin/bash
# usage: xvfb-run -a -s "-screen 0 800x600x24" tools/verify-dosbox.sh <name> <password> <out.png>
# Lance le crackme sous DOSBox, tape nom + password via xdotool, capture l'écran.
set -e
HERE=$(cd "$(dirname "$0")/.." && pwd)
W=$(mktemp -d); cp "$HERE/original/CRACKME1_by_AndSoOn.EXE" "$W/CRACKME1.EXE"
dosbox -noconsole -c "mount c $W" -c "c:" -c "CRACKME1.EXE" >/dev/null 2>&1 &
P=$!
sleep 3
xdotool type --delay 80 "$1"; xdotool key Return; sleep 0.5
xdotool type --delay 80 "$2"; xdotool key Return; sleep 1
python3 -c "import sys; from PIL import ImageGrab; ImageGrab.grab().save(sys.argv[1])" "$3"
kill $P; rm -rf "$W"
