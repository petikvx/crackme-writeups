#!/bin/bash
# Pilote CrackMe5.exe sous wine/Xvfb (écran 800x600) :
#   xvfb-run -a -s "-screen 0 800x600x24" bash tools/verify-wine.sh ok "3 4 7 8 10"
# Nécessite msvbvm50.dll (winetricks --force vb5run). Captures dans /tmp/<out>.png
# usage: drive.sh out "1 3 4 7 8"   (numéros des cases à cocher, selon leur libellé à l'écran)
cd "$(dirname "$0")/../original"
wine CrackMe5.exe >/dev/null 2>&1 &
for i in $(seq 30); do W=$(xdotool search --name "CrackMe5 by Fr1c" 2>/dev/null|head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 1.5
for n in $2; do
  if [ $n -le 5 ]; then x=288; y=$((252+32*(n-1))); else x=423; y=$((252+32*(n-6))); fi
  xdotool mousemove $x $y click 1; sleep 0.2
done
python3 -c "from PIL import ImageGrab; ImageGrab.grab().save('/tmp/$1-pre.png')"
xdotool mousemove 302 436 click 1; sleep 1.5
python3 -c "from PIL import ImageGrab; ImageGrab.grab().save('/tmp/$1.png')"
for w in $(xdotool search --name . 2>/dev/null); do n=$(xdotool getwindowname $w 2>/dev/null); [ -n "$n" ] && echo "WIN: $n"; done | sort -u
