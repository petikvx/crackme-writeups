#!/usr/bin/env bash
# Preuve live : RaMMy.exe (ASPack, d'origine) sous Wine + Xvfb, saisie via xdotool,
# succès = apparition de la MessageBox titrée « Great Job ».
# usage : tools/verify-wine.sh [NAME] [SERIAL]   (SERIAL par défaut = keygen)
set -u
cd "$(dirname "$0")/.."
NAME=${1:-petik}; SERIAL=${2:-$(python3 tools/rammy1-solve.py -q --name "$NAME")}
export DISPLAY=:77
Xvfb :77 -screen 0 1024x768x24 >/dev/null 2>&1 & XP=$!
sleep 1
wine original/RaMMy.exe >/dev/null 2>&1 &
# attendre la MessageBox de démarrage (fenêtre 98x63 sans titre)
sleep 7
# WM_CREATE affiche d'abord une MessageBox "..::Name::.." (bug de l'auteur) : clic sur OK
for w in $(xdotool search --name '' 2>/dev/null); do
  eval "$(xdotool getwindowgeometry --shell "$w")"
  if [ "$WIDTH" = 98 ] && [ "$HEIGHT" = 63 ]; then xdotool mousemove $((X+50)) $((Y+41)) click 1; fi
done; sleep 1.5
W=$(xdotool search --name '^RaMMy$' 2>/dev/null | head -1)
eval "$(xdotool getwindowgeometry --shell "$W")"
xdotool windowfocus "$W" 2>/dev/null
# coordonnées client lues dans les CreateWindowExA (0x401116) :
#   EDIT id 0xa (name) x=0x7d y=0x55 130x23 ; EDIT id 0xb (serial) x=0x7d y=0x82 ; BUTTON "TrY!" x=0xad y=0xbe 40x40
xdotool mousemove $((X+180)) $((Y+96))  click 1; xdotool type --delay 30 "$NAME"
xdotool mousemove $((X+180)) $((Y+141)) click 1; xdotool type --delay 30 "$SERIAL"
xdotool mousemove $((X+193)) $((Y+210)) click 1
sleep 2
echo "name=$NAME serial=$SERIAL"
if xdotool search --name '^Great Job$' >/dev/null 2>&1; then echo 'MessageBox "Great Job" -> OK'; R=0; else echo 'pas de MessageBox -> KO'; R=1; fi
[ -n "${SHOT:-}" ] && python3 -c "from PIL import ImageGrab; ImageGrab.grab(xdisplay=':77').save('$SHOT')"
pkill -f RaMMy.exe; kill $XP 2>/dev/null; wineserver -k 2>/dev/null
exit $R
