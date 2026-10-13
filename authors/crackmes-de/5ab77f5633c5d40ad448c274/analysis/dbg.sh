#!/bin/bash
cd "$(dirname "$0")"
( sleep 4
  echo "break *0x4019b0"
  sleep 1; echo "cont"; sleep 20
  echo "print \$edi"; echo "print \$eax"
  echo "kill"; echo "quit" ) | WINEDEBUG=-all winedbg cm2.exe > /tmp/dbg274.log 2>&1 &
for i in $(seq 1 60); do W=$(xdotool search --onlyvisible --name "Mayhem" 2>/dev/null| head -1); [ -n "$W" ] && break; sleep 0.5; done
sleep 1.5
xdotool mousemove 535 364 click 1; sleep 0.3; xdotool type --delay 50 petik
xdotool mousemove 535 393 click 1; sleep 0.3; xdotool type --delay 50 52h5; sleep 0.3
xdotool mousemove 581 427 click 1; sleep 18
pkill -f cm2.exe; wineserver -k 2>/dev/null; sleep 1
