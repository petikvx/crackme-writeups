#!/usr/bin/env bash
# Preuve live : exe original (UPX) sous wine/Xvfb, piloté par tools/dlgdrive.c.   usage : tools/verify-wine.sh SERIAL
set -u
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/Crackme1/Crackme#1.exe" "$W/c.exe"; i686-w64-mingw32-gcc -O2 -o "$W/dlgdrive.exe" "$T/dlgdrive.c"
cd "$W"; Xvfb :87 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:87
wine c.exe >/dev/null 2>&1 & sleep 5
timeout 30 wine dlgdrive.exe "$1" 2>/dev/null | tr -d '\r'
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
