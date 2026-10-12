#!/usr/bin/env bash
# Vérif réelle sous wine + Xvfb : tape nom/serial (EN_CHANGE), clique Register, lit MessageBox (+msgbox)
# usage : tools/verify-wine.sh NOM SERIAL
set -u
cd "$(dirname "$0")/../original"
Xvfb :80 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:80
WINEDEBUG=+msgbox wine 'keygenme #1.exe' > /tmp/kg1.log 2>&1 & sleep 6
w=$(xdotool search --onlyvisible --name KeyGen | tail -1)
eval "$(xdotool getwindowgeometry --shell "$w")"
xdotool mousemove $((X+130)) $((Y+32)) click 1; sleep .3; xdotool type --delay 40 "$1"
xdotool mousemove $((X+130)) $((Y+80)) click 1; sleep .3; xdotool type --delay 40 "$2"; sleep .3
xdotool mousemove $((X+135)) $((Y+124)) click 1; sleep 2
grep -a 'MSGBOX_OnInit' /tmp/kg1.log
wineserver -k; sleep 1; kill $XV 2>/dev/null
