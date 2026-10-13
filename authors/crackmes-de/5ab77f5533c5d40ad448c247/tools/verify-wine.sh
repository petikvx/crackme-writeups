#!/usr/bin/env bash
# Preuve live : exe original (UPX) sous wine/Xvfb, piloté par tools/drive.c.  usage : tools/verify-wine.sh NOM [faux] [capture.png]
set -u
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d); SHOT=""; [ -n "${3:-}" ] && SHOT="$(realpath -m "$3")"
cp "$T/../original/CrackMe7.exe" "$W/c.exe"; i686-w64-mingw32-gcc -O2 -o "$W/drive.exe" "$T/drive.c"
cd "$W"; Xvfb :86 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:86
wine c.exe >/dev/null 2>&1 & sleep 5
echo "== $1 ${2:-}"; timeout 40 wine drive.exe "$1" ${2:+"$2"} 2>/dev/null | tr -d '\r'
[ -n "$SHOT" ] && python3 -c "import sys;from PIL import ImageGrab;ImageGrab.grab(xdisplay=':86').crop((0,0,800,600)).save(sys.argv[1])" "$SHOT"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
