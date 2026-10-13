#!/usr/bin/env bash
# Preuve live : exe original (UPX) sous wine/Xvfb, piloté par tools/drive.c.  usage : tools/verify-wine.sh NOM SERIAL [capture.png]
set -u; [ -n "${3:-}" ] && set -- "$1" "$2" "$(realpath -m "$3")"
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/Crackme 1.exe" "$W/c.exe"; i686-w64-mingw32-gcc -O2 -o "$W/drive.exe" "$T/drive.c"
cd "$W"; Xvfb :87 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:87
wine c.exe >/dev/null 2>&1 & sleep 5
echo "== $1 / $2"; timeout 30 wine drive.exe "$1" "$2" 2>/dev/null | tr -d '\r'
[ -n "${3:-}" ] && python3 -c "import sys;from PIL import ImageGrab;ImageGrab.grab(xdisplay=':87').crop((0,0,640,420)).save(sys.argv[1])" "$3"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
