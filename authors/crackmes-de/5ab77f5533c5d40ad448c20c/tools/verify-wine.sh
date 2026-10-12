#!/usr/bin/env bash
# Vérif réelle : exe original (packé FSG) sous wine/Xvfb, pilotage xdotool :
#   1. dialogue « Enter code to entry » : tape CODE ;
#   2. KeygenMe : tape NAME et KEY, clique « Register » ;
#   3. capture + comparaison aux bitmaps ressources : smiley (501) = enregistré, tête triste (500) = non.
# usage : tools/verify-wine.sh CODE NAME KEY [capture.png]
set -u
OUT="${4:+$(realpath -m "$4")}"
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/KeygenMe068.exe" "$W/"
cd "$W"; Xvfb :83 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:83
wine KeygenMe068.exe >/dev/null 2>&1 & sleep 7
E=$(xdotool search --onlyvisible --name 'Enter code' | head -1)
eval "$(xdotool getwindowgeometry --shell "$E")"
xdotool mousemove $((X+140)) $((Y+20)) click 1; sleep 0.3; xdotool type --delay 60 "$1"; sleep 3
M=$(xdotool search --onlyvisible --name '^KeygenMe 0.68 .*Bswap' | head -1)
[ -z "$M" ] && { echo "code d'entrée refusé"; wineserver -k; kill $XV; rm -rf "$W"; exit 1; }
echo "entrée OK, fenêtre : $(xdotool getwindowname "$M")"
eval "$(xdotool getwindowgeometry --shell "$M")"
xdotool mousemove $((X+193)) $((Y+30)) click 1; xdotool type --delay 60 "$2"
xdotool mousemove $((X+193)) $((Y+54)) click 1; xdotool type --delay 60 "$3"
xdotool mousemove $((X+147)) $((Y+79)) click 1; sleep 2
python3 - "$X" "$Y" "$WIDTH" "$HEIGHT" "$OUT" "$T/../analysis" <<'PY'
import sys
import numpy as np
from PIL import ImageGrab, Image
x, y, w, h = map(int, sys.argv[1:5]); im = ImageGrab.grab(xdisplay=':83').crop((x, y, x + w, y + h))
if sys.argv[5]: im.save(sys.argv[5])
s = np.asarray(im.convert('RGB')).astype(int)
def score(png):   # meilleure distance moyenne du bitmap ressource dans la zone du visage
    t = np.asarray(Image.open(png).convert('RGB')).astype(int); th, tw, _ = t.shape
    return min(np.abs(s[yy:yy+th, xx:xx+tw] - t).mean()
               for yy in range(80, s.shape[0] - th) for xx in range(90, s.shape[1] - tw - 80))
sad, smile = score(sys.argv[6] + '/bitmap500-triste.png'), score(sys.argv[6] + '/bitmap501-smiley.png')
print(f"visage : {'SMILEY (bitmap 501) = enregistré' if smile < sad else 'TRISTE (bitmap 500) = refusé'}  [d501={smile:.1f} d500={sad:.1f}]")
PY
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
