export WINEDEBUG=-all
NAME="$1"; SER="$2"; OUT="$3"
wine thorwakcm01.exe & sleep 5
W=$(xdotool search --name thorwakcm01 | head -1)
xdotool windowfocus $W; sleep 1
xdotool key alt+f; sleep 0.5; xdotool key r; sleep 1.5
ffmpeg -loglevel quiet -y -f x11grab -video_size 1024x768 -i $DISPLAY -frames:v 1 ${OUT}-dlg.png
xdotool mousemove 527 351 click 1; xdotool type --delay 80 "$NAME"
xdotool mousemove 527 387 click 1; xdotool type --delay 80 "$SER"; sleep 0.5
ffmpeg -loglevel quiet -y -f x11grab -video_size 1024x768 -i $DISPLAY -frames:v 1 ${OUT}-filled.png
xdotool mousemove 447 443 click 1; sleep 2
ffmpeg -loglevel quiet -y -f x11grab -video_size 1024x768 -i $DISPLAY -frames:v 1 ${OUT}.png
