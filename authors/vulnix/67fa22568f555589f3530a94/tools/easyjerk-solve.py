#!/usr/bin/env python3
"""vulnix — easyjerk : serial de 8 caractères, transform(c, i) = (((int8)c ^ (i+7)) + 13) & 0x7f == T[i].

check_serial @0x1189 : strlen == 8 ; pour chaque i, transform(serial[i], i) doit valoir T[i]
avec T = [0x58, 0x6e, 0x60, 0x6b, 0x7b, 0x56, 0x66, 0x75] (immediates sur la pile).
Inverse : c = ((T[i] - 13) & 0x7f) ^ (i + 7)   (unique pour c < 0x80).
Usage : easyjerk-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "easyjerk"
T = [0x58, 0x6E, 0x60, 0x6B, 0x7B, 0x56, 0x66, 0x75]


def transform(c: int, i: int) -> int:
    return (((c ^ (i + 7)) + 13) & 0x7F)


serial = "".join(chr(((t - 13) & 0x7F) ^ (i + 7)) for i, t in enumerate(T))
assert all(transform(ord(c), i) == T[i] for i, c in enumerate(serial))
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(serial); sys.exit(0)
print("serial =", serial)
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip()
    ok, ko = run(serial), run("A" * 8)
    print("OK:", ok, "| KO:", ko)
    sys.exit(0 if "Access Granted" in ok and "Access Denied" in ko else 1)
