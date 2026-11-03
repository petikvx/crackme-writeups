#!/usr/bin/env bash
# Preuve live : copie patchée (trial Delphi expiré) dans /tmp, original/ intact.
# usage: tools/verify-wine.sh <name> <serial> <out.png>   (nécessite wine, xvfb-run, xdotool, ffmpeg)
set -e
here=$(cd "$(dirname "$0")/.." && pwd)
R=$(mktemp -d)
unzip -q -o -P crackmes.one "$here/original/tossics_crackme1.zip" Crackme1.exe -d "$R"
# 0x455b8d (off. 0x54f8d) : jb -> jmp, saute le jmp 0x403ff8 « trial period has expired »
python3 -I - "$R/Crackme1.exe" <<'PY'
import sys; p=sys.argv[1]; d=bytearray(open(p,'rb').read()); assert d[0x54f8d]==0x72; d[0x54f8d]=0xEB; open(p,'wb').write(d)
PY
export WINEDEBUG=-all
cat > "$R/drive.sh" <<DRV
cd "$R"; wine Crackme1.exe >/dev/null 2>&1 &
sleep 8
xdotool mousemove 298 285 click 1; xdotool type --delay 120 "\$1"
xdotool mousemove 298 317 click 1; xdotool type --delay 120 "\$2"
xdotool mousemove 415 286 click 1; sleep 3
ffmpeg -loglevel error -y -f x11grab -video_size 800x600 -i \$DISPLAY -frames:v 1 "\$3"
DRV
xvfb-run -a -s "-screen 0 800x600x24" bash "$R/drive.sh" "$1" "$2" "${3:-/tmp/verify.png}"
