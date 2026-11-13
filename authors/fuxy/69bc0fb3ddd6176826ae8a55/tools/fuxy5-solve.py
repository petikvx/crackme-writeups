#!/usr/bin/env python3
"""fuxy's Challenge #5 — flag = ASCII -> binaire (8 bits/char, espace entre chars).

Usage : fuxy5-solve.py [-q] [--check EXE]
  -q        n'affiche que le flag
  --check   lance le binaire (wine via xvfb-run) avec le flag + cas limites
"""
import argparse, subprocess

TARGET = ("01000011 01010100 01000110 01111011 01000001 01010011 01000011 01001001 "
          "01001001 00101101 01101101 01001111 01110010 01100101 00101101 01101100 "
          "01101001 01101011 01100101 01011111 01000010 01001001 01001110 01000001 "
          "01010011 01000011 01001001 01001001 00100001 00100001 00100001 01111101")

def flag():
    return "".join(chr(int(b, 2)) for b in TARGET.split())

def run(exe, s):
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=s + "\n", text=True,
                       capture_output=True, timeout=60)
    return "Congratulations" in r.stdout

ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", metavar="EXE")
a = ap.parse_args()
f = flag()
print(f if a.q else f"flag = {f}")
if a.check:
    for s in (f, "CTF{x}", "CTF{ASCII-mOre-like_BINASCII!!!"):
        print(repr(s), "OK" if run(a.check, s) else "KO")
