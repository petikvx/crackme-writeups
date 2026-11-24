#!/usr/bin/env python3
"""Keygen Lacks "Ultimate Boss Level" : name -> (Part 1, Part 2).

  part1 = sum(signed bytes du name) * 31
  part2 = (part1 ^ 0x1337) + 0x7b
Usage : ultimateboss-solve.py [--user petik] [-q] [--check]
"""
import argparse, subprocess, os, sys

def keygen(name: str):
    s = sum(b - 256 if b > 127 else b for b in name.encode("latin-1"))
    p1 = (s * 31) & 0xFFFFFFFF
    p2 = ((p1 ^ 0x1337) + 0x7B) & 0xFFFFFFFF
    return p1, p2

def check(name, p1, p2):
    exe = os.path.join(os.path.dirname(__file__), "..", "original", "UltimateBoss.exe")
    inp = f"{name}\n{p1}\n{p2}\n\n"
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=inp.encode(),
                       capture_output=True, timeout=90)
    return b"Access Granted" in r.stdout

ap = argparse.ArgumentParser()
ap.add_argument("--user", default="petik")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true", help="vérifie via Wine sur le binaire d'origine")
a = ap.parse_args()
p1, p2 = keygen(a.user)
if a.q:
    print(p1, p2)
else:
    print(f"Username: {a.user}\nPart 1  : {p1}\nPart 2  : {p2}")
if a.check:
    ok = check(a.user, p1, p2)
    print("check:", "OK (Access Granted)" if ok else "KO")
    sys.exit(0 if ok else 1)
