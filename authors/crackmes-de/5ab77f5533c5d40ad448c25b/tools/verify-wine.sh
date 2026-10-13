#!/usr/bin/env bash
# Usage: tools/verify-wine.sh <password> [shot.png]
# Lance l'exe sous Xvfb + Wine, remplace le texte de Insert1 (TEdit), clique « Crack! » et capture l'écran.
set -u
cd "$(dirname "$0")/../original"
PW="$1"; SHOT="${2:-/tmp/defc0n1-shot.png}"
Xvfb :79 -screen 0 800x600x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:79
wine crackme_delphi_1.0.exe >/tmp/defc0n1-wine.log 2>&1 & sleep 7
w=$(xdotool search --name "^Crackme Delphi 1.0 by Defc0n1$" | tail -1); xdotool windowactivate --sync "$w" 2>/dev/null; xdotool windowfocus "$w"
eval "$(xdotool getwindowgeometry --shell "$w")"     # X/Y = coin client de la fiche
xdotool mousemove $((X+290)) $((Y+58)) click 1; sleep 0.3   # Insert1 (Left 204, Top 48, 172x21)
xdotool key End shift+Home BackSpace; sleep 0.2              # efface le texte par défaut
xdotool type --delay 40 "$PW"; sleep 0.3
xdotool mousemove $((X+338)) $((Y+116)) click 1; sleep 2    # Button1 « Crack! » (Left 301, Top 104)
xdotool search --onlyvisible --name "." getwindowname %@ 2>/dev/null | sort -u
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':79').save('$SHOT')"
wineserver -k; kill $XV 2>/dev/null
