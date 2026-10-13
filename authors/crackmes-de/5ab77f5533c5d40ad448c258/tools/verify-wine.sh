#!/usr/bin/env bash
# Usage: tools/verify-wine.sh <password> [shot.png]  — saisit le mot de passe dans Edit1, clique "crackme", capture le ShowMessage
set -u
cd "$(dirname "$0")/../original"
PW="$1"; SHOT="${2:-/tmp/nev-shot.png}"
Xvfb :78 -screen 0 800x600x24 >/dev/null 2>&1 & X=$!; sleep 1; export DISPLAY=:78
wine nev-crackme.exe >/tmp/nev-wine.log 2>&1 & sleep 6
w=$(xdotool search --name "^crackme$" | tail -1); xdotool windowactivate --sync "$w" 2>/dev/null; xdotool windowfocus "$w"
eval "$(xdotool getwindowgeometry --shell "$w")"   # X/Y = coin client de la fiche
xdotool mousemove $((X+84)) $((Y+17)) click 1; sleep 0.3          # Edit1
xdotool type --delay 40 "$PW"; sleep 0.3
xdotool mousemove $((X+84)) $((Y+44)) click 1; sleep 2            # Button1 "crackme"
xdotool search --onlyvisible --name "." getwindowname %@ 2>/dev/null | sort -u
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':78').save('$SHOT')"
wineserver -k; kill $X 2>/dev/null
