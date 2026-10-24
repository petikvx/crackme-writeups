#!/usr/bin/env python3
"""Keygen crackmes.de KeygenMe #1 by boonz.

serial = "Bon-" + hex(A) + "-" + hex(A^3) + "-" + hex(C)   (%lX, majuscules, 32 bits)
  A = -sum(c - 0x19) mod 2^32   (c = octets du nom, 4 <= len <= 50)
  C = 0x40E0F8*(0x40E0F8-1)      constante (adresse du buffer de A, pas son contenu)

Usage : keygenme1-solve.py [--name petik] [-q] [--check EXE]
"""
import argparse, os, shutil, subprocess, sys, time

M = 0xFFFFFFFF
BUF_A = 0x40E0F8


def keygen(name: str) -> str:
    b = name.encode("latin-1")
    if not 4 <= len(b) <= 50:
        raise ValueError("le nom doit faire 4 à 50 caractères")
    a = (-sum(c - 0x19 for c in b)) & M
    b3 = a * a % (1 << 32) * a & M
    c = (BUF_A * BUF_A - BUF_A) & M
    return "Bon-%X-%X-%X" % (a, b3, c)


LIVE = r"""#!/bin/bash
export WINEDEBUG=-all
wine "$1" >/dev/null 2>&1 &
sleep 8
xdotool mousemove 513 301 click 1; sleep .5; xdotool type --delay 100 "$2"; sleep .3
xdotool mousemove 513 331 click 1; sleep .5; xdotool type --delay 100 "$3"; sleep .5
xdotool mousemove 375 405 click 1; sleep 3
ffmpeg -loglevel error -y -f x11grab -video_size 1024x768 -i $DISPLAY -frames:v 1 "$4"
"""


def check(exe: str, name: str, serial: str, png: str = "/tmp/keygenme1-check.png") -> int:
    """Wine + xvfb : clique les champs/CHECK, capture l'écran (-> lire le PNG : Goodboy/Badboy)."""
    for t in ("xvfb-run", "wine", "xdotool", "ffmpeg"):
        if not shutil.which(t):
            print("outil manquant :", t); return 2
    sh = "/tmp/keygenme1-live.sh"
    open(sh, "w").write(LIVE); os.chmod(sh, 0o755)
    subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 1024x768x24", sh,
                    os.path.abspath(exe), name, serial, png])
    print("capture :", png, "(attendu : 'Hello, Mr. Goodboy!')")
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
