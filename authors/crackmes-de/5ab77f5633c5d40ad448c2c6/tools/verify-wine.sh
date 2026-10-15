#!/usr/bin/env bash
# Vérif réelle sous wine (runtime VB6) + Xvfb privé : patch, lance, liste les fenêtres.
# Attendu : PAS de fenêtre "NaG!!! ..." ; MsgBox "BYE" (« PatchME Solved ! Good BYe »).
set -u
cd "$(dirname "$0")/.."
OUT=${1:-/tmp/patchme1-result.png}
python3 tools/patchme1-patch.py original/PatchME1.exe /tmp/PatchME1-patched.exe
Xvfb :88 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:88
wine /tmp/PatchME1-patched.exe >/tmp/patchme1.log 2>&1 & sleep 7
for w in $(xdotool search --onlyvisible --name . 2>/dev/null); do echo "fenêtre : $(xdotool getwindowname $w)"; done
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':88').save('$OUT')" && echo "capture : $OUT"
wineserver -k; sleep 1; kill $XV 2>/dev/null
