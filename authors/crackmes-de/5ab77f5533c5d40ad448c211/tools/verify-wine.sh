#!/usr/bin/env bash
# Preuve live : exe original (FSG) sous wine/Xvfb, piloté par tools/dlgdrive.c (WM_SETTEXT + WM_COMMAND 0x65),
# lit le texte de statut (contrôle 0x37) + capture.   usage : tools/verify-wine.sh NOM CLE [capture.png]
set -u
T="$(cd "$(dirname "$0")" && pwd)"; OUT="${3:+$(realpath -m "$3")}"; W=$(mktemp -d)
cp "$T/../original/Keygenme051.exe" "$W/k.exe"; i686-w64-mingw32-gcc -O2 -o "$W/dlgdrive.exe" "$T/dlgdrive.c"
cd "$W"; Xvfb :84 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:84
wine k.exe >/dev/null 2>&1 & sleep 5
wine dlgdrive.exe "$1" "$2" 2>/dev/null | tr -d '\r'
if [ -n "$OUT" ]; then WID=$(xdotool search --onlyvisible --name '.' 2>/dev/null | tail -1); sleep 0.5
  python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':84').crop((262,184,762,584)).save('$OUT')"; fi
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
