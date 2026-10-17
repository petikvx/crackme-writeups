#!/usr/bin/env python3
"""4N0NY31TY — 4N0NY31TY's First Crackme : gabarit, pas une licence unique.

main @0x12da : lit la saisie via input() (getchar, requiert un '\\n' final, sinon realloc(0) échoue).
Condition : sum(ord(c) for c in licence) == len(licence)*(-10) + 0x34e7 (13543), i.e.
somme des codes ASCII == 13543 - 10*longueur.
Usage : 4n0ny31ty-solve.py [--length N] [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"


def make(length: int) -> str:
    target = 13543 - 10 * length
    if target <= 0 or target // length > 126 or target // length < 32:
        raise SystemExit(f"longueur {length} infaisable (cible={target})")
    base, rem = divmod(target, length)
    s = [chr(base)] * length
    for i in range(rem):
        s[i] = chr(base + 1)
    return "".join(s)


ap = argparse.ArgumentParser()
ap.add_argument("--length", type=int, default=150)
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
lic = make(a.length)
assert sum(ord(c) for c in lic) == 13543 - 10 * len(lic)
if a.q:
    print(lic); sys.exit(0)
print(f"licence (longueur {len(lic)}) = {lic!r}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(lic), run("wrong")
    good = "License is valid!" in ok and "Invalid license!" in ko
    print("OK:", "License is valid!" in ok, "| KO:", "Invalid license!" in ko)
    sys.exit(0 if good else 1)
