#!/bin/bash
# Usage : xvfb-run -a -s "-screen 0 1024x768x24" tools/wine-xdotool-check.sh <exe> <capture.png>
# Lance l'exe, liste les fenêtres visibles (succès = boîte de dialogue « RASTE! Mandame un email… ») et capture Form1.
export WINEDEBUG=-all
wine "$1" & P=$!
for i in $(seq 40); do W=$(xdotool search --onlyvisible --name '^Form1$' 2>/dev/null | head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 3
for w in $(xdotool search --onlyvisible --name '.' 2>/dev/null); do echo "visible: $(xdotool getwindowname $w)"; done
python3 -c "from PIL import ImageGrab;ImageGrab.grab().save('$2')"
kill $P 2>/dev/null; wineserver -k 2>/dev/null
