#!/usr/bin/env bash
# Preuve live : exe original (packé FSG, non patché) sous wine/Xvfb via tools/int68-loader.c (saute le int 68h
# anti-SoftICE qui crashe sur NT/wine), nom Windows forcé par WINEUSERNAME, piloté par tools/dlgdrive.c.
# usage : tools/verify-wine.sh USER SERIAL [capture.png]
set -u
T="$(cd "$(dirname "$0")" && pwd)"; OUT="${3:+$(realpath -m "$3")}"; W=$(mktemp -d)
cp "$T/../original/Small.exe" "$W/a.exe"
i686-w64-mingw32-gcc -O2 -o "$W/dlgdrive.exe" "$T/dlgdrive.c" -ladvapi32
i686-w64-mingw32-gcc -O2 -o "$W/loader.exe" "$T/int68-loader.c"
cd "$W"; Xvfb :87 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:87 WINEUSERNAME="$1" USER="$1" LOGNAME="$1" WINEDEBUG=-all
wine loader.exe a.exe >loader.log 2>&1 & sleep 6
timeout 30 wine dlgdrive.exe "$2" 2>/dev/null | tr -d '\r'
grep loader loader.log
[ -n "$OUT" ] && python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':87').save('$OUT')"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
