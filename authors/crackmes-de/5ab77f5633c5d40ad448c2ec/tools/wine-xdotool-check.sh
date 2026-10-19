#!/bin/bash
# Usage : xvfb-run -a -s "-screen 0 800x600x24" tools/wine-xdotool-check.sh <exe> <capture.png>  (clave.txt dans le dossier courant)
export WINEDEBUG=-all
wine "$1" & P=$!
sleep 7
for w in $(xdotool search --onlyvisible --name '.' 2>/dev/null); do echo "visible: $(xdotool getwindowname $w)"; done
python3 -c "from PIL import ImageGrab;ImageGrab.grab().save('$2')"
kill $P 2>/dev/null; wineserver -k 2>/dev/null
