#!/usr/bin/env bash
# Vérif réelle sous wine + Xvfb (+ gdb pour reproduire lstrlenA XP, cf. xp-lstrlen.gdb)
# usage : tools/verify-wine.sh NOM SERIAL [--no-gdb]   (sans gdb : échec attendu sous wine)
set -u
T="$(cd "$(dirname "$0")" && pwd)"; cd "$T/../original"
Xvfb :78 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:78
WINEDEBUG=+msgbox wine 'DrPepUr #2.exe' > /tmp/dp2.log 2>&1 & sleep 6
if [ "${3:-}" != "--no-gdb" ]; then
  P=$(pgrep -f 'DrPepUr #2.exe' | tail -1)
  timeout 40 gdb -q -batch -p "$P" -x "$T/xp-lstrlen.gdb" > /tmp/dp2gdb.out 2>&1 & sleep 5
fi
w=$(xdotool search --name "DrPepUr #2" | tail -1)
eval "$(xdotool getwindowgeometry --shell "$w")"
xdotool mousemove $((X+150)) $((Y+31)) click 1; sleep .3
xdotool key End shift+Home BackSpace; xdotool type --delay 40 "$1"
xdotool mousemove $((X+150)) $((Y+53)) click 1; sleep .3
xdotool type --delay 40 "$2"; sleep .3
xdotool mousemove $((X+260)) $((Y+74)) click 1; sleep 3
grep -a 'MSGBOX_OnInit' /tmp/dp2.log
wineserver -k; sleep 1; kill $XV 2>/dev/null
[ -f /tmp/dp2gdb.out ] && grep -a -E '^\[(xp|chk)\]' /tmp/dp2gdb.out; rm -f /tmp/dp2gdb.out
