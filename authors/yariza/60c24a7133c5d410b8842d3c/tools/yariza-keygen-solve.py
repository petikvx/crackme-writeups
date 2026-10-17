#!/usr/bin/env python3
"""Yariza — Keygen Me : gabarit, seuls 4 octets sont vérifiés (sur 16 minimum).

check_pw @0x1658 : key[4]=='@' , key[6]=='-' , key[9]=='l' , key[15]=='?' ; aucune autre contrainte
(ni longueur exacte, ni les autres octets). "donut" affiche une animation (effet, sans rapport avec la clé).
Usage : yariza-keygen-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "keygen.me"


def make() -> str:
    s = list("x" * 16)
    s[4], s[6], s[9], s[15] = "@", "-", "l", "?"
    return "".join(s)


KEY = make()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(KEY); sys.exit(0)
print(f"key = {KEY}  (seuls key[4]='@', key[6]='-', key[9]='l', key[15]='?' comptent)")
def run(k: str) -> str:
    # la clé correcte lance l'animation "donut" qui ne rend jamais la main : on force la
    # sortie non bufferisée (stdbuf -o0) et on tue le processus après un court délai.
    p = subprocess.Popen(["stdbuf", "-o0", str(EXE), k], stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, text=True)
    try:
        out, _ = p.communicate(timeout=1.5)
    except subprocess.TimeoutExpired:
        p.kill()
        out, _ = p.communicate()
    return out


if a.check:
    ok = run(KEY)
    bad = list(KEY); bad[4] = "y"
    ko = run("".join(bad))
    good = "Good job!" in ok and "Wrong" in ko
    print("OK:", "Good job!" in ok, "| KO:", "Wrong" in ko)
    sys.exit(0 if good else 1)
