#!/usr/bin/env bash
# Preuve live : crackme.exe original sous wine/Xvfb, mot de passe sur stdin, puis tools/listmsg.c
# liste la MessageBox affichée.   usage : tools/verify-wine.sh MOTDEPASSE
set -u
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/crackme.exe" "$W/c.exe"; i686-w64-mingw32-gcc -O2 -o "$W/listmsg.exe" "$T/listmsg.c"
cd "$W"; Xvfb :87 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:87
echo "$1" | wine c.exe 2>/dev/null | tr -d '\r' & sleep 5; echo
timeout 20 wine listmsg.exe 2>/dev/null | tr -d '\r'
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
