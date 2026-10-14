#!/usr/bin/env bash
# Preuve live : [crackme #2]-FindMe.exe sous Wine + Xvfb, saisie via xdotool dans l'EDIT 0x67.
# Le check s'exécute à chaque EN_CHANGE ; succès = le STATIC 0x29a passe de « INCORRECT » à « CORRECT ».
# usage : tools/verify-wine.sh [PASSWORD] [SHOT.png]
set -u
cd "$(dirname "$0")/.."
PW=${1:-$(python3 tools/findme-solve.py)}; SHOT=${2:-}
export DISPLAY=:78
Xvfb :78 -screen 0 800x600x24 >/dev/null 2>&1 & XP=$!
sleep 1
wine 'original/[crackme #2]-FindMe.exe' >/dev/null 2>&1 &
for i in $(seq 30); do W=$(xdotool search --onlyvisible --class 'findme' 2>/dev/null | head -1); [ -z "$W" ] && W=$(xdotool search --onlyvisible --name '.' 2>/dev/null | tail -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 1.5
xdotool windowactivate --sync "$W" 2>/dev/null; xdotool windowfocus "$W" 2>/dev/null
xdotool type --delay 40 "$PW"
sleep 1
echo "password=$PW window=$(xdotool getwindowname "$W")"
[ -n "$SHOT" ] && python3 -c "from PIL import ImageGrab; ImageGrab.grab(xdisplay=':78').save('$SHOT')"
pkill -f 'FindMe.exe'; kill $XP 2>/dev/null; wineserver -k 2>/dev/null
