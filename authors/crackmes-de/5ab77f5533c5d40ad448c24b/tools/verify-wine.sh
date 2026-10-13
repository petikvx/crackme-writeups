#!/bin/bash
# Vérification live sous wine/Xvfb :  xvfb-run -a bash tools/verify-wine.sh petik
# Nécessite msvbvm50.dll (winetricks --force vb5run). Compile tools/vbdrive.c (mingw).
# Une instance fraîche par essai (la clé attendue s'accumule à chaque clic).
set -u
T="$(cd "$(dirname "$0")" && pwd)"; N="${1:-petik}"
i686-w64-mingw32-gcc -O2 -o /tmp/c6drive.exe "$T/vbdrive.c" || exit 1
K=$(python3 "$T/crackme6-solve.py" "$N" | sed 's/.* -> //')
for KEY in "$K" "706574696b" "1234"; do
  echo "== $N / $KEY"
  (cd "$T/../original" && wine CrackMe6.exe >/dev/null 2>&1 &)
  wine /tmp/c6drive.exe "$N" "$KEY" 2>/dev/null | grep -v '^  '
  wineserver -k 2>/dev/null; sleep 1
done
