#!/usr/bin/env bash
# Preuve live : matrix.exe (VB6 P-code) sous Wine + Xvfb (runtime msvbvm60 requis).
# Saisie du serial dans Text1, clic sur le label « Check », capture + fenêtres visibles.
# usage : tools/verify-wine.sh [SERIAL] [SHOT.png]
set -u
cd "$(dirname "$0")/.."
S=${1:-$(python3 tools/matrix_acid_crack-solve.py -q)}; SHOT=${2:-}
export DISPLAY=:81
Xvfb :81 -screen 0 800x600x24 >/dev/null 2>&1 & XP=$!
sleep 1
wine original/matrix.exe >/dev/null 2>&1 &
sleep 8   # pas de WM : Form1 en (0,0)
xdotool mousemove 130 79 click 1; sleep 0.3          # Text1 (« Serial: »)
xdotool type --delay 40 "$S"; sleep 0.5
xdotool mousemove 126 106 click 1                    # Label3 « Check »
sleep 3
[ -n "$SHOT" ] && python3 -c "from PIL import ImageGrab; ImageGrab.grab(xdisplay=':81').crop((0,0,400,200)).save('$SHOT')"
echo "serial=$S"
pkill -f matrix.exe; wineserver -k 2>/dev/null; kill $XP 2>/dev/null
