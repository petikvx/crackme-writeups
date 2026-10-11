Xvfb :77 -screen 0 1024x768x24 >/dev/null 2>&1 & X=$!; sleep 1; export DISPLAY=:77
WINEDEBUG=+msgbox wine FiroxCrackME1.exe > log 2>&1 & sleep 7
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':77').save('shot.png')" 2>/dev/null
w=$(xdotool search --name "Firox CrackME" | tail -1); xdotool windowfocus $w
xdotool type --window $w --delay 50 "$1"; sleep 0.5; xdotool mousemove 223 108 click 1; sleep 2
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':77').save('shot2.png')" 2>/dev/null
grep MSGBOX_OnInit log; wineserver -k; kill $X
