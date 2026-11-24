pw="$1"
export DISPLAY=:77
Xvfb :77 -screen 0 800x600x24 >/dev/null 2>&1 & X=$!
sleep 2
wine original/crackme.exe >/tmp/w.log 2>&1 & 
for i in $(seq 30); do sleep 2; w=$(xdotool search --name 'crackme by Simba' 2>/dev/null|head -1); [ -n "$w" ] && break; done
echo win=$w
sleep 2
xdotool windowfocus $w; sleep 1; xdotool type --delay 80 "$pw"; xdotool key Tab; sleep 1; xdotool key space
sleep 4
xdotool search --name '.' 2>/dev/null | while read i; do xdotool getwindowname $i; done | sort -u

pkill -f "wine|crackme.exe" ; kill $X
