#!/bin/bash
# Preuve live : lance l'exe sous Xvfb+Wine, clique, screenshot (voir README). Prefix Wine hors dépôt.
# usage: fm-live.sh "<xdotool click sequence as x,y;x,y>" out.png wait
export WINEPREFIX=/workspace/crackme-state/wp-fm WINEDEBUG=-all
xvfb-run -a -s "-screen 0 1280x800x24" bash -c '
wine ${FMEXE:-RecordPlayer.exe} >/dev/null 2>&1 &
sleep 8
for c in $(echo "$1" | tr ";" " "); do
  x=${c%,*}; y=${c#*,}
  xdotool mousemove $x $y; sleep 0.3; xdotool click 1; sleep 1
done
sleep $3
ffmpeg -loglevel error -y -f x11grab -video_size 1280x800 -i $DISPLAY -frames:v 1 "$2"
' _ "$1" "$2" "$3"
