#!/bin/bash
# Usage : xvfb-run -a -s "-screen 0 800x600x24" chk.sh <exe> <serial> <capture.png>
# Saisie du serial via le pavé numérique (Text1 verrouillé), puis clic « Vérifier ».
export WINEDEBUG=-all
wine "$1" & P=$!
sleep 7
declare -A X=([1]=71 [2]=103 [3]=135 [4]=71 [5]=103 [6]=135 [7]=71 [8]=103 [9]=135 [0]=103)
declare -A Y=([1]=101 [2]=101 [3]=101 [4]=125 [5]=125 [6]=125 [7]=149 [8]=149 [9]=149 [0]=173)
s="$2"; for ((i=0;i<${#s};i++)); do c=${s:i:1}; xdotool mousemove ${X[$c]} ${Y[$c]} click 1; sleep 0.3; done
xdotool mousemove 103 205 click 1; sleep 2
for w in $(xdotool search --onlyvisible --name '.' 2>/dev/null); do echo "visible: $(xdotool getwindowname $w)"; done
python3 -c "from PIL import ImageGrab;ImageGrab.grab().save('$3')"
kill $P 2>/dev/null; wineserver -k 2>/dev/null
