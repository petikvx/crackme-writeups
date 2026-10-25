export WINEDEBUG=-all
wine /tmp/kgmrun/k.exe &
sleep 6
xdotool mousemove 655 496 click 1; xdotool type --delay 60 "$1"
xdotool mousemove 595 523 click 1; xdotool type --delay 60 "$2"
xdotool mousemove 595 547 click 1; xdotool type --delay 60 "$3"
sleep 1
cp /tmp/fb/Xvfb_screen0 /tmp/kgmrun/$4-1.xwd
xdotool mousemove 680 520 click 1
sleep 2
cp /tmp/fb/Xvfb_screen0 /tmp/kgmrun/$4-2.xwd
