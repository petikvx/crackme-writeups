#!/usr/bin/env bash
# Vérif réelle : copie l'exe dans un dossier temporaire avec DrPepur5.key, lance sous wine/Xvfb,
# lit le titre de la fenêtre (SetWindowTextA) + capture d'écran.
# usage : tools/verify-wine.sh SERIAL [NOM]
set -u
T="$(cd "$(dirname "$0")" && pwd)"; W=$(mktemp -d)
cp "$T/../original/DrPepUr5.exe" "$W/"
printf '[DrPepur #5 Registration]\r\nName=%s\r\nSerial=%s\r\n' "${2:-petik}" "$1" > "$W/DrPepur5.key"
cd "$W"; Xvfb :79 -screen 0 1024x768x24 >/dev/null 2>&1 & XV=$!; sleep 1; export DISPLAY=:79
wine DrPepUr5.exe >/dev/null 2>&1 & sleep 7
for w in $(xdotool search --onlyvisible --name . 2>/dev/null); do echo "fenêtre: $(xdotool getwindowname $w)"; done
python3 -c "from PIL import ImageGrab;ImageGrab.grab(xdisplay=':79').save('/tmp/dp5.png')"
wineserver -k; sleep 1; kill $XV 2>/dev/null; rm -rf "$W"
