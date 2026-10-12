#!/usr/bin/env bash
# Preuve live : exe original sous wine/Xvfb, piloté par tools/drive.c.   usage : tools/verify-wine.sh NOM A B C D
set -u
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/KeygenMe1/KeyGen Me - 1.exe" "$W/c.exe"; i686-w64-mingw32-gcc -O2 -o "$W/drive.exe" "$T/drive.c"
cd "$W"; Xvfb :87 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:87
wine c.exe >/dev/null 2>&1 & sleep 5
timeout 30 wine drive.exe "$@" 2>/dev/null | tr -d '\r'
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
