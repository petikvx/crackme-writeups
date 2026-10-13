#!/usr/bin/env bash
# Preuve live : exe original sous wine/Xvfb (runtime VB6 installé dans le préfixe), piloté par tools/drive.c.
# usage : tools/verify-wine.sh NOM SERIAL   (une instance neuve par essai)
set -u
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/renascense.exe" "$W/c.exe"; i686-w64-mingw32-gcc -O2 -o "$W/drive.exe" "$T/drive.c"
cd "$W"; Xvfb :88 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:88
wine c.exe >/dev/null 2>&1 & sleep 7
timeout 30 wine drive.exe "$1" "$2" 2>/dev/null | tr -d '\r'
[ -n "${SHOT:-}" ] && python3 -c "import sys;from PIL import ImageGrab;ImageGrab.grab(xdisplay=\":88\").crop((0,0,640,420)).save(sys.argv[1])" "$SHOT"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
