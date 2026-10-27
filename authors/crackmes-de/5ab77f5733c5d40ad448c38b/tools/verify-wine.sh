# $1 = sequence of button indexes 1-5 ; $2 = out png
wine lolcrackme1.exe >/dev/null 2>&1 &
sleep 8
for b in $1; do xdotool mousemove $((11+16*(b-1))) 39 click 1; sleep 0.5; done
python3 -c "
from PIL import ImageGrab
ImageGrab.grab().crop((0,0,300,200)).resize((900,600)).save('$2.pre.png')"
xdotool mousemove 75 86 click 1; sleep 2
python3 -c "
from PIL import ImageGrab
ImageGrab.grab().crop((0,0,500,400)).save('$2')"
