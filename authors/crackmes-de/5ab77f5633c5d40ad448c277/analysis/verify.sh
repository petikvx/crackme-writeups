#!/bin/bash
# usage : ./verify.sh NOM SERIAL
# Console _kbhit/_getch => il faut un pty (script) ; le module XM a besoin
# d'une sortie audio => ALSA « null » ; cout n'est pas flushé à la sortie sous
# Wine, donc on lit le message via le relay msvcirt (ostream << char*).
cd "$(dirname "$0")/../original"
printf 'pcm.!default { type null }\n' > /tmp/asound-null.conf
(sleep 4; printf "%s\r" "$1"; sleep 1; printf "%s\r" "$2"; sleep 6) | \
  ALSA_CONFIG_PATH=/tmp/asound-null.conf WINEDEBUG=+relay \
  timeout 30 script -qfc "wine keygenme.exe >/tmp/mishka-out.txt 2>/tmp/mishka-relay.txt" /dev/null >/dev/null 2>&1
grep -a 'ret=0040125a' /tmp/mishka-relay.txt | grep -ao '"[^"]*"'
