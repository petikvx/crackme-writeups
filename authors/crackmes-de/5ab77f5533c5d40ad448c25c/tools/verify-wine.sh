#!/usr/bin/env bash
# Usage: tools/verify-wine.sh <username> <password> [shot.png]
# Xvfb + Wine : Form1 « Login » -> Form2 (Edit1 = username, Edit2 = password) -> « Submit », puis capture.
set -u
cd "$(dirname "$0")/../original"
U="$1"; PW="$2"; SHOT="${3:-/tmp/defc0n1-2-shot.png}"
Xvfb :80 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:80
wine crackme_delphi_2.0.exe >/tmp/defc0n1-2-wine.log 2>&1 & sleep 8
geo() { w=$(xdotool search --name "$1" | tail -1); xdotool windowactivate --sync "$w" 2>/dev/null; xdotool windowfocus "$w"; eval "$(xdotool getwindowgeometry --shell "$w")"; }
geo "^CrackMe Delphi 2.0 by Defc0n1$"
xdotool mousemove $((X+213)) $((Y+348)) click 1; sleep 2          # Form1.Button1 « Login » (176,336)
geo "^Login$"
xdotool mousemove $((X+204)) $((Y+45)) click 1; sleep 0.3          # Edit1 (144,35)
xdotool key End shift+Home BackSpace; xdotool type --delay 40 "$U"; sleep 0.3
xdotool mousemove $((X+204)) $((Y+77)) click 1; sleep 0.3          # Edit2 (144,67) — OnChange recalcule la constante
xdotool key End shift+Home BackSpace; xdotool type --delay 40 "$PW"; sleep 0.3
xdotool mousemove $((X+197)) $((Y+124)) click 1; sleep 2           # Button1 « Submit » (160,112)
xdotool search --onlyvisible --name "." getwindowname %@ 2>/dev/null | sort -u
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':80').save('$SHOT')"
wineserver -k; kill $XV 2>/dev/null
