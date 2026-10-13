#!/bin/bash
# xvfb-run -a bash tools/verify-wine.sh
set -u
T="$(cd "$(dirname "$0")" && pwd)"
i686-w64-mingw32-gcc -O2 -o "$T/drive.exe" "$T/drive.c" || exit 1
python3 "$T/crackme3-solve.py" --write "$T/../original/crackme3.key"
echo "== with key =="
(cd "$T/../original" && wine CrackMe3.exe >/dev/null 2>&1 &)
sleep 2.5
wine "$T/drive.exe" dump
wineserver -k 2>/dev/null; sleep 1
echo "== without key =="
rm -f "$T/../original/crackme3.key"
(cd "$T/../original" && wine CrackMe3.exe >/dev/null 2>&1 &)
sleep 2.5
wine "$T/drive.exe" dump
wineserver -k 2>/dev/null
# restore sample key for local re-runs
python3 "$T/crackme3-solve.py" --write "$T/../original/crackme3.key" >/dev/null
