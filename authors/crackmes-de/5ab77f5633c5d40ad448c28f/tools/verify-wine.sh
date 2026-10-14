#!/usr/bin/env bash
# Preuve live : [easyone]-therapy.exe sous Wine + Xvfb, saisie via xdotool,
# succès = MessageBox titrée « Correct! » (« Good job! Now make a keygen! »).
# usage : tools/verify-wine.sh [NAME] [SERIAL]   (SERIAL par défaut = keygen)
set -u
cd "$(dirname "$0")/.."
NAME=${1:-petik}; SERIAL=${2:-$(python3 tools/easyone-solve.py -q --name "$NAME")}
export DISPLAY=:79
Xvfb :79 -screen 0 1024x768x24 >/dev/null 2>&1 & XP=$!
sleep 1
wine 'original/[easyone]-therapy.exe' >/dev/null 2>&1 &
for i in $(seq 30); do W=$(xdotool search --name '^\[Easyone\]$' 2>/dev/null | head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 1.5
eval "$(xdotool getwindowgeometry --shell "$W")"
fill() {  # clic dans l'EDIT, efface le texte d'invite, tape
  xdotool mousemove $((X+$1)) $((Y+$2)) click 1; xdotool key End shift+Home BackSpace; xdotool type --delay 30 "$3"; }
fill 135 26 "$NAME"      # EDIT id 0x65 « Enter Name Here »
fill 135 58 "$SERIAL"    # EDIT id 0x66 « Enter Serial Here »
xdotool mousemove $((X+52)) $((Y+92)) click 1   # bouton Check
sleep 2
echo "name=$NAME serial=$SERIAL"
if xdotool search --name '^Correct!$' >/dev/null 2>&1; then echo 'MessageBox "Correct!" -> OK'; R=0; else echo 'pas de MessageBox -> KO'; R=1; fi
[ -n "${SHOT:-}" ] && python3 -c "from PIL import ImageGrab; ImageGrab.grab(xdisplay=':79').save('$SHOT')"
pkill -f 'easyone\]-therapy'; kill $XP 2>/dev/null; wineserver -k 2>/dev/null
exit $R
