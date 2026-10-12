#!/usr/bin/env bash
# Preuve live : exe Win16 d'origine sous wine (support NE/krnl386) + Xvfb, saisie par tools/crtdrive.c, capture d'écran.
# usage : tools/verify-wine.sh NOM SERIAL capture.png
set -u
T="$(cd "$(dirname "$0")" && pwd)"; OUT="$(realpath -m "$3")"; W=$(mktemp -d)
cp "$T/../original/SacredCrackme 5.0/SacredCrackme 5.0.exe" "$W/sc5.exe"; i686-w64-mingw32-gcc -O2 -o "$W/crtdrive.exe" "$T/crtdrive.c"
cd "$W"; Xvfb :89 -screen 0 800x600x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:89 WINEDEBUG=-all
wine sc5.exe >/dev/null 2>&1 & sleep 6
timeout 30 wine crtdrive.exe "$1" "$2" 2>/dev/null | tr -d '\r'
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':89').save('$OUT')"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
