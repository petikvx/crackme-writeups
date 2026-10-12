#!/usr/bin/env bash
# Vérif réelle sous wine + Xvfb : écrit la clé dans le registre wine, lance le binaire ORIGINAL (packé FSG),
# capture la fenêtre (statics « Not Registered / No Code » ou nom + code).
# usage : tools/verify-wine.sh NOM [KEY2_HEX_FORCÉ] [out.png]
set -u
here="$(cd "$(dirname "$0")" && pwd)"; cd "$here/../original"
NAME=${1:-petik}; OUT=${3:-/tmp/kgm072.png}
read K1 K2 < <(python3 "$here/keygenme072-solve.py" "$NAME" | awk '/Key 1/{a=$4}/Key 2/{b=$4}END{print a, b}')
[ -n "${2:-}" ] && K2=$2
K='HKCU\Software\Keygeme072\Your Key'
wine reg add "$K" /v "Key 1" /t REG_DWORD /d $((K1)) /f >/dev/null 2>&1
wine reg add "$K" /v "Key 2" /t REG_DWORD /d $((K2)) /f >/dev/null 2>&1
wine reg add "$K" /v Name /t REG_SZ /d "$NAME" /f >/dev/null 2>&1
echo "Name=$NAME Key1=$K1 Key2=$K2"
Xvfb :88 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:88
wine KeygenMe072.exe >/tmp/kgm072.log 2>&1 & sleep 8
python3 -c "
from PIL import ImageGrab; im=ImageGrab.grab(xdisplay=':88'); bb=im.convert('L').point(lambda p:p>10 and 255).getbbox(); im.crop(bb).save('$OUT')"
echo "capture : $OUT"
wineserver -k; sleep 1; kill $XV 2>/dev/null
wine reg delete 'HKCU\Software\Keygeme072' /f >/dev/null 2>&1
