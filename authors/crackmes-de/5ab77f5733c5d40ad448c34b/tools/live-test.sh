#!/bin/bash
# Test live sous wine-mono + xvfb : clique Check en boucle avec un serial fixe (key=50) jusqu'à "Good!!".
# Usage : live-test.sh path/Parts.exe
EXE="$1"; SER=$(python3 "$(dirname "$0")/parts-solve.py" petik --key 50 -q)
xvfb-run -a bash -c '
wine "'"$EXE"'" >/dev/null 2>&1 &
for i in $(seq 60); do W=$(xdotool search --name "^Parts$" | head -1); [ -n "$W" ] && break; sleep 1; done
echo "fenetre=$W"; sleep 2
xdotool windowfocus $W; eval $(xdotool getwindowgeometry --shell $W)
xdotool mousemove --window $W 100 16 click 1; xdotool type "petik"
xdotool mousemove --window $W 100 41 click 1; xdotool type "'"$SER"'"
for n in $(seq 200); do
  xdotool mousemove --window $W 38 70 click 1; sleep 0.7
  G=$(xdotool search --name "^Good!!$" | head -1); B=$(xdotool search --name "^MMMM!!$" | head -1)
  if [ -n "$G" ]; then echo "SUCCESS après $n clics"; exit 0; fi
  [ -n "$B" ] && xdotool windowfocus $B key Return; sleep 0.5
done; echo FAIL; exit 1'
