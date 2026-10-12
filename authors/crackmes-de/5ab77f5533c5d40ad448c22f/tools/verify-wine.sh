#!/usr/bin/env bash
# Preuve live : exe original sous wine/Xvfb, piloté par tools/drive.c.   usage : tools/verify-wine.sh NOM SERIAL
set -u
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/CrackMe1.exe" "$W/c.exe"; i686-w64-mingw32-gcc -O2 -o "$W/drive.exe" "$T/drive.c"
cd "$W"; Xvfb :86 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:86
wine c.exe >/dev/null 2>&1 & sleep 7
timeout 30 wine drive.exe "$1" "$2" 2>/dev/null | tr -d '\r'
[ -n "${SHOT:-}" ] && python3 -c "import sys;from PIL import ImageGrab;ImageGrab.grab(xdisplay=\":86\").crop((250,200,780,560)).save(sys.argv[1])" "$SHOT"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
