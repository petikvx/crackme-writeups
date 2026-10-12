#!/usr/bin/env bash
# Preuve live : exe original sous wine/Xvfb, piloté par tools/dlgdrive.c ; lit le titre (Registered/Unregistered).
# usage : tools/verify-wine.sh CLE [capture.png]
set -u
T="$(cd "$(dirname "$0")" && pwd)"; OUT="${2:+$(realpath -m "$2")}"; W=$(mktemp -d)
cp "$T/../original/LittleMan145/LittleMan.exe" "$W/l.exe"; i686-w64-mingw32-gcc -O2 -o "$W/dlgdrive.exe" "$T/dlgdrive.c"
cd "$W"; Xvfb :85 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:85
wine l.exe >/dev/null 2>&1 & sleep 5
wine dlgdrive.exe "$1" 2>/dev/null | tr -d '\r'
[ -n "$OUT" ] && python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':85').save('$OUT')"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
