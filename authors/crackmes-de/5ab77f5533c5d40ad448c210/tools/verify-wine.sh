#!/usr/bin/env bash
# Preuve live : génère le keyfile Bswap.2003, lance l'exe original sous wine/Xvfb,
# lui envoie un WM_DROPFILES (tools/dropfile.c) puis lit les contrôles + capture.
# usage : tools/verify-wine.sh [NOM] [VILLE] [capture.png]
set -u
T="$(cd "$(dirname "$0")" && pwd)"; OUT="${3:+$(realpath -m "$3")}"; W=$(mktemp -d)
cp "$T/../original/SuperFunky082.exe" "$W/sf.exe"
python3 "$T/superfunky082-solve.py" "${1:-petik}" "${2:-Paris}" -o "$W/Bswap.2003" >/dev/null
i686-w64-mingw32-gcc -O2 -o "$W/dropfile.exe" "$T/dropfile.c"
cd "$W"; Xvfb :83 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:83
wine sf.exe >/dev/null 2>&1 & sleep 5
wine dropfile.exe "Z:${W//\//\\}\\Bswap.2003" 2>/dev/null | tr -d '\r'
[ -n "$OUT" ] && python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':83').crop((300,250,724,520)).save('$OUT')"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
