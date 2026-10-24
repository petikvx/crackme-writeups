#!/usr/bin/env python3
"""Keygen crackmes.de KeyGenMe_1 by Toma6868 (VB.NET).

serial = reverse( concat( hex_majuscule(ord(c)) for c in name ) )     (len(name) >= 4)
ex. petik -> 70 65 74 69 6B -> "706574696B" -> "B696475607"

Usage : keygenme1-toma6868-solve.py [--name petik] [-q] [--check KeyGenMe_1.exe]
"""
import argparse, os, shutil, subprocess, sys


def keygen(name: str) -> str:
    if len(name) < 4:
        raise ValueError("le nom doit faire au moins 4 caractères")
    return "".join("%X" % b for b in name.encode("latin-1"))[::-1]


LIVE = r"""#!/bin/bash
export WINEDEBUG=-all
wine "$1" >/dev/null 2>&1 &
sleep 25
ffmpeg -loglevel error -y -f x11grab -video_size 1024x768 -i $DISPLAY -frames:v 1 /tmp/kg-0.png
xdotool mousemove ${X_NAME:-300} ${Y_NAME:-300} click 1; sleep .5; xdotool type --delay 100 "$2"; sleep .3
xdotool key Tab; sleep .3; xdotool type --delay 100 "$3"; sleep .5
xdotool key Tab; sleep .3; xdotool key Return; sleep 3
ffmpeg -loglevel error -y -f x11grab -video_size 1024x768 -i $DISPLAY -frames:v 1 "$4"
"""


def check(exe, name, serial, png="/tmp/kg-check.png"):
    """Wine + xvfb : saisit name/serial, Valider, capture (attendu : MsgBox 'Bravo...')."""
    for t in ("xvfb-run", "wine", "xdotool", "ffmpeg"):
        if not shutil.which(t):
            print("outil manquant :", t); return 2
    sh = "/tmp/kg-live.sh"
    open(sh, "w").write(LIVE); os.chmod(sh, 0o755)
    subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 1024x768x24", sh,
                    os.path.abspath(exe), name, serial, png])
    print("capture :", png)
    return 0


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    s = keygen(a.name)
    print(s if a.q else f"name={a.name} serial={s}")
    if a.check:
        sys.exit(check(a.check, a.name, s))
