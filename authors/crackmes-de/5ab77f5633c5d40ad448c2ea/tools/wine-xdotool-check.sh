#!/bin/bash
# Usage : xvfb-run -a -s "-screen 0 1024x768x24" tools/wine-xdotool-check.sh <nombre> <edad> <empresa> <clave> <cases ex. "5 15">
# Affiche les fenêtres visibles après clic sur l'icône OK (Image2) : Form1 toujours visible = succès ; échec = Form1 masquée.
export WINEDEBUG=-all
D="$(dirname "$0")/../original"; EXE=/tmp/anon5/v.exe
mkdir -p /tmp/anon5; [ -f $EXE ] || 7z e -y -pcrackmes.one -o/tmp/anon5 "$D/crackme5.zip" "AnonimoSer CrackMe V.exe" >/dev/null && mv -f "/tmp/anon5/AnonimoSer CrackMe V.exe" $EXE 2>/dev/null
wine $EXE & P=$!
for i in $(seq 40); do W=$(xdotool search --onlyvisible --name '^Form1$' 2>/dev/null | head -1); [ -n "$W" ] && break; sleep 0.5; done
echo "win=$W"; sleep 2
xdotool windowactivate --sync $W 2>/dev/null; xdotool windowfocus $W
T(){ xdotool type --delay 30 "$1"; xdotool key Tab; }
xdotool mousemove 567 198 click 1; sleep 0.3; T "$1"; T "$2"; T "$3"; T "$4"
for i in $(seq 1 15); do [[ " $5 " == *" $i "* ]] && xdotool key space; xdotool key Tab; done
sleep 0.5
xdotool mousemove 512 432 click 1
sleep 3
for w in $(xdotool search --onlyvisible --name '.' 2>/dev/null); do echo "visible: $(xdotool getwindowname $w)"; done
eval $(xdotool getwindowgeometry --shell $W); python3 -c "from PIL import ImageGrab;ImageGrab.grab(bbox=($X,$Y,$X+$WIDTH,$Y+$HEIGHT)).save(\"${SHOT:-/tmp/anon5/shot.png}\")"; echo "geom $X $Y $WIDTH $HEIGHT"
kill $P 2>/dev/null; wineserver -k 2>/dev/null
