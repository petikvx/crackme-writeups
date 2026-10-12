#!/usr/bin/env bash
# Vérif réelle sous wine (runtime VB6) + Xvfb : champ du haut = nom, champ du bas = serial, Check.
# Bon serial → le crackme ouvre une 2e fiche puis End (le processus se termine) ; mauvais → reste ouvert.
# usage : tools/verify-wine.sh NOM SERIAL
set -u
cd "$(dirname "$0")/../original"
Xvfb :87 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:87
wine crackme3.exe >/tmp/sams3.log 2>&1 & sleep 12   # 1er lancement de wine parfois lent
# la fiche n'a pas de titre : on prend la fenêtre visible de 362 px de large
for i in $(xdotool search --onlyvisible --name ""); do eval "$(xdotool getwindowgeometry --shell $i)"; [ "$WIDTH" = 362 ] && w=$i; done
eval "$(xdotool getwindowgeometry --shell $w)"
xdotool mousemove $((X+180)) $((Y+20)); sleep .3; xdotool click 1; sleep .3; printf %s "$1" | xdotool type --delay 50 --file -
xdotool mousemove $((X+180)) $((Y+68)); sleep .3; xdotool click 1; sleep .3; printf %s "$2" | xdotool type --delay 50 --file -
xdotool mousemove $((X+188)) $((Y+108)); sleep .3; xdotool click 1; sleep 4
if pgrep -f crackme3.exe >/dev/null; then echo "RESULT: toujours ouvert (serial refusé)"; else echo "RESULT: processus terminé (serial accepté)"; fi
wineserver -k; sleep 1; kill $XV 2>/dev/null
