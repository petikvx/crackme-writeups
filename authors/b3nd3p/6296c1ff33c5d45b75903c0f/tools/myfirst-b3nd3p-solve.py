#!/usr/bin/env python3
"""b3nd3p — my_f1rs7_cr4ckm3 (first) : digit attendu = 1000+300+30+7 = 1337.

entry1() @0x11fd appelle sum.0(1000,300,30,7) (addition simple) ; check() @0x1275 compare ce total
à la saisie (scanf("%d")). Usage : myfirst-b3nd3p-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "first"
DIGIT = 1000 + 300 + 30 + 7
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(DIGIT); sys.exit(0)
print(f"digit = {DIGIT}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=f"{s}\n", capture_output=True, text=True).stdout
    ok, ko = run(DIGIT), run(DIGIT - 1)
    good = "congrut" in ok and "try again" in ko
    print("OK:", "congrut" in ok, "| KO:", "try again" in ko)
    sys.exit(0 if good else 1)
