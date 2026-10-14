#!/usr/bin/env bash
# Vérif réelle sous wine (xvfb-run) : lance CKGM1a.exe, injecte le serial dans le champ 0x3ED
# via tools/inject.c (compilé en /tmp/ckgm1-inject.exe) (SetDlgItemTextA + WM_COMMAND IDOK = « Check serial »), lit la MessageBox (+msgbox).
# usage : tools/verify-wine.sh SERIAL
set -u
T="$(cd "$(dirname "$0")" && pwd)"
EXE=/tmp/ckgm1-inject.exe; [ -f $EXE ] || i686-w64-mingw32-gcc -O2 -o $EXE "$T/inject.c" -luser32
cd "$T/../original"
xvfb-run -a bash -c '
  WINEDEBUG=+msgbox wine CKGM1a.exe > /tmp/ckgm1.log 2>&1 &
  sleep 3; wine '"$EXE"' "'"$1"'"; sleep 3
  grep -a MSGBOX_OnInit /tmp/ckgm1.log; wineserver -k'
