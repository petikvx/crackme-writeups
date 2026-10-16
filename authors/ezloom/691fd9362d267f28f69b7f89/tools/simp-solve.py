#!/usr/bin/env python3
"""ezloom — really easy (simp-password) : mot de passe en clair en .rodata+0x1a.

main : scanf("%41s", buf) ; strcmp(buf, (char*)0x201a) -> "I love ice cream too!".
Usage : simp-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "simp-password"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
d = EXE.read_bytes()
pw = d[0x201A:d.index(b"\0", 0x201A)].decode()
if a.q:
    print(pw); sys.exit(0)
print("password =", pw)
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(pw), run("bad")
    print("OK:", ok.strip(), "| KO:", ko.strip())
    sys.exit(0 if "ice cream too" in ok and "Wrong" in ko else 1)
