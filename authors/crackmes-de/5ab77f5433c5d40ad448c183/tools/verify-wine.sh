wine Crackme5.exe >/dev/null 2>&1 & sleep 6
W=$(xdotool search --name '^Crackme$' | head -1)
xdotool windowactivate --sync $W 2>/dev/null; xdotool windowfocus $W
xdotool type --delay 60 "$1"; sleep 2
for w in $(xdotool search --name . ); do echo "[$(xdotool getwindowname $w)]"; done | sort -u | grep -v '^\[\]$'
wineserver -k
