#!/usr/bin/env bash
# Preuve live : A_C_Crack_me!.exe sous Wine + Xvfb (runtime VB6 msvbvm60 requis).
# Saisie de la clé du jour dans Text1 puis clic « Check it... » ; on lit le titre/texte de la MsgBox.
# usage : tools/verify-wine.sh [CLE] [SHOT.png]
set -u
cd "$(dirname "$0")/.."
K=${1:-$(python3 tools/accm-solve.py)}; SHOT=${2:-}
export DISPLAY=:79
Xvfb :79 -screen 0 800x600x24 >/dev/null 2>&1 & XP=$!
sleep 1
wine 'original/A_C_Crack_me!.exe' >/dev/null 2>&1 &
sleep 6   # pas de WM sous Xvfb : la fiche s'affiche en (0,0), sans barre de titre
xdotool mousemove 150 70 click 1; sleep 0.3          # Text1
xdotool type --delay 30 "$K"; sleep 0.5
xdotool mousemove 155 112 click 1                    # Command1 « Check it... »
sleep 2
for w in $(xdotool search --onlyvisible --name '.' 2>/dev/null); do echo "win $w: $(xdotool getwindowname $w)"; done
[ -n "$SHOT" ] && python3 -c "from PIL import ImageGrab; ImageGrab.grab(xdisplay=':79').save('$SHOT')"
echo "key=$K"
pkill -f 'A_C_Crack_me' ; kill $XP 2>/dev/null; wineserver -k 2>/dev/null
