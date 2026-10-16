#!/usr/bin/env python3
"""YandereMia — Introduction to RE (passguess) : mot de passe en clair en .rodata+0x4.

main charge `lea rax,[rip+0xe6a]` (=0x2004) puis strcmp(saisie, rax).
Usage : passguess-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "passguess"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
d = EXE.read_bytes()
pw = d[0x2004:d.index(b"\0", 0x2004)].decode()
if a.q:
    print(pw); sys.exit(0)
print("password =", pw)
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(pw), run("nope")
    print("OK:", ok.strip(), "| KO:", ko.strip())
    sys.exit(0 if "[OK]" in ok and "[ERROR]" in ko else 1)
