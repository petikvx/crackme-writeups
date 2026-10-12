#!/usr/bin/env bash
# Preuve live : exe original (packé) sous wine/Xvfb, piloté par tools/dlgdrive.c ; lit le message du champ Serial.
# usage : tools/verify-wine.sh NOM SERIAL [capture.png]
set -u
T="$(cd "$(dirname "$0")" && pwd)"; OUT="${3:+$(realpath -m "$3")}"; W=$(mktemp -d)
cp "$T/../original/Assassination.exe" "$W/a.exe"; i686-w64-mingw32-gcc -O2 -o "$W/dlgdrive.exe" "$T/dlgdrive.c"
cd "$W"; Xvfb :86 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:86
wine a.exe >/dev/null 2>&1 & sleep 5
wine dlgdrive.exe "$1" "$2" 2>/dev/null | tr -d '\r'
[ -n "$OUT" ] && python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':86').save('$OUT')"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
