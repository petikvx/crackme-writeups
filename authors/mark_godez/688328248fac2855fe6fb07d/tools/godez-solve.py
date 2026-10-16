#!/usr/bin/env python3
"""Mark_Godez — Godez_Mark crackme : secret en clair dans .rodata (offset 0x201e).

main @0x1169 : scanf("%s", buf) puis strcmp(buf, (char*)0x201e) ; l'octet 0x201e démarre "godez123".
Usage : godez-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "godez-crackme.exe"
OFF = 0x201e
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
d = EXE.read_bytes()
pw = d[OFF:d.index(b"\0", OFF)].decode()
if a.q:
    print(pw); sys.exit(0)
print("Serial =", pw)
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(pw), run("nope")
    print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
    sys.exit(0 if 'Correct!' in ok and 'Wrong!' in ko else 1)
