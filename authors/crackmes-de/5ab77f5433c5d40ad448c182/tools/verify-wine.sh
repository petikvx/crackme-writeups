wine Crackme2.exe >/dev/null 2>&1 & sleep 6
W=$(xdotool search --name . 2>/dev/null | while read w; do n=$(xdotool getwindowname $w); case "$n" in *rack*|Form1*) echo $w;; esac; done | head -1)
echo win $W $(xdotool getwindowname $W)
xdotool windowactivate --sync $W 2>/dev/null; xdotool windowfocus $W
# focus first edit via tab order: type name, tab, serial, enter
xdotool type --delay 50 "$1"; xdotool key Tab; xdotool type --delay 50 "$2"; xdotool key Tab; sleep 0.5; xdotool key Return; sleep 2
for w in $(xdotool search --name . ); do echo "[$(xdotool getwindowname $w)]"; done | sort -u | grep -v '^\[\]$'
wineserver -k
