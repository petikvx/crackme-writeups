#!/bin/bash
# xvfb-run -a bash tools/verify-wine.sh [SERIAL]
set -u
T="$(cd "$(dirname "$0")" && pwd)"
SER="${1:-F988f91}"
i686-w64-mingw32-gcc -O2 -o "$T/drive.exe" "$T/drive.c" || exit 1
(cd "$T/../original" && wine CrackME.exe >/dev/null 2>&1 &)
sleep 2.5
wine "$T/drive.exe" "$SER"
wineserver -k 2>/dev/null
