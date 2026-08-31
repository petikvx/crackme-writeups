#!/bin/bash
set -uo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
AUTOIT=/home/petik/CAPEv2/analyzer/windows/bin/autoit3.exe
PIDFILE=/tmp/cm2-try.pid

kill_cm2() {
  if [ -f "$PIDFILE" ]; then
    local pid
    pid=$(cat "$PIDFILE" 2>/dev/null || true)
    if [ -n "${pid}" ]; then
      kill "$pid" 2>/dev/null || true
      # wine spawns children; best-effort
      sleep 0.2
      kill -9 "$pid" 2>/dev/null || true
    fi
    rm -f "$PIDFILE"
  fi
}

try_one() {
  local pw="$1"
  kill_cm2
  sleep 0.3
  xvfb-run -a wine "$ROOT/original/crackme2.exe" >/tmp/cm2-wine.log 2>&1 &
  echo $! > "$PIDFILE"
  sleep 2.8
  wine "$AUTOIT" "$ROOT/tools/live-try.au3" "$pw" >/tmp/au3.log 2>&1 || true
  echo "=== TRY ${pw} ==="
  cat "$ROOT/tools/try-result.txt" 2>/dev/null || echo '(no result)'
  echo
  kill_cm2
  sleep 0.2
}

for pw in sdfg45erzdqf SDFG45ERZDQF gfds45zredqf GFDS45ZREDQF fdgs45rezdqf sdfgerzdqf45 zred45gfdsqf; do
  try_one "$pw"
done
