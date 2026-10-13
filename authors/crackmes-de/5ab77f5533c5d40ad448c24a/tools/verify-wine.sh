#!/bin/bash
# Vérification live sous wine/Xvfb :  xvfb-run -a bash tools/verify-wine.sh petik
# Compile tools/dlgdrive.c (mingw), lance original/crackme.exe, teste le bon serial puis un faux.
set -u
T="$(cd "$(dirname "$0")" && pwd)"; N="${1:-petik}"
i686-w64-mingw32-gcc -O2 -o /tmp/c8drive.exe "$T/dlgdrive.c" || exit 1
S=$(python3 "$T/crackme8-solve.py" "$N" | sed 's/.* -> //')
for SER in "$S" "123Q_W65"; do
  echo "== $N / $SER"
  (cd "$T/../original" && wine crackme.exe >/dev/null 2>&1 &)
  wine /tmp/c8drive.exe "$N" "$SER" 2>/dev/null
  wineserver -k 2>/dev/null; sleep 1
done
