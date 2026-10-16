#!/usr/bin/env python3
"""userrrrrr — EasyCrackme : secret en clair dans .rodata (offset 0x2004).

main @0x11e9 : fgets, retrait du \n par strcspn, strcmp(buf, storedPassword) avec storedPassword @0x2004 (.rodata).
Usage : easycrackme-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
OFF = 0x2004
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
d = EXE.read_bytes()
pw = d[OFF:d.index(b"\0", OFF)].decode()
if a.q:
    print(pw); sys.exit(0)
print("Mot de passe =", pw)
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(pw), run("nope")
    print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
    sys.exit(0 if 'Access granted' in ok and 'Access denied' in ko else 1)
