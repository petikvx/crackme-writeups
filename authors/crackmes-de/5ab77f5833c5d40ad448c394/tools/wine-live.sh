#!/bin/bash
# Preuve live : lance KeygenME.exe sous Xvfb+Wine, tape la cle, clique Check, capture l'ecran.
# usage: wine-live.sh <cle> <sortie.png>
KEY="$1"; OUT="$2"
EXE="$(dirname "$0")/../analysis/extracted/KeygenME.exe"
FB=$(mktemp -d)
Xvfb :${DSP:-377} -screen 0 800x600x24 -fbdir "$FB" >/dev/null 2>&1 &
XP=$!; export DISPLAY=:${DSP:-377}; sleep 2
WINEDEBUG=-all wine "$EXE" >/dev/null 2>&1 &
sleep 8
# fenetre principale 232x93 a (227,181) ; textbox (340,198), bouton Check (288,221)
if [ -n "$KEY" ]; then
  xdotool mousemove 400 221 click 1; sleep 0.5; xdotool mousemove 340 198 click 1; sleep 0.5
  xdotool key ctrl+a; xdotool type --delay 80 "$KEY"; sleep 0.5
  xdotool mousemove 288 221 click 1
fi
sleep 2
python3 - "$FB/Xvfb_screen0" "$OUT" <<'PY'
import sys
from PIL import Image
d=open(sys.argv[1],'rb').read()
hs=int.from_bytes(d[0:4],'big'); w=int.from_bytes(d[4*4:4*5],'big'); h=int.from_bytes(d[5*4:6*4],"big")
ncol=int.from_bytes(d[19*4:20*4],'big')
off=hs+ncol*12
Image.frombuffer('RGB',(w,h),d[off:off+w*h*4],'raw','BGRX',0,1).save(sys.argv[2])
PY
wineserver -k; kill $XP
