#!/usr/bin/env python3
"""ASBO_GENERAL — My_first_ever_crackme (C++) : key = "iusearchbtw" (« I use Arch btw »).

boringFunc(input) @0x1249 : pour i = 0..len-2 (le DERNIER caractère n'est jamais touché) :
    input[i] ^= "XYZ"[i % 3]
puis renvoie une copie de input ainsi modifié. main compare ce résultat à la constante
"1,)=8(" + ";18,w" = "1,)=8(;18,w" (deux littéraux concaténés).
Inversion : key[i] = target[i] ^ "XYZ"[i%3] pour i<len-1 ; key[len-1] = target[len-1] (inchangé).
Usage : first-evercrackme-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "first-evercrackme"
TARGET = "1,)=8(" + ";18,w"
XORKEY = "XYZ"


def solve(target: str) -> str:
    n = len(target)
    out = "".join(chr(ord(target[i]) ^ ord(XORKEY[i % 3])) for i in range(n - 1))
    return out + target[-1]


KEY = solve(TARGET)
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(KEY); sys.exit(0)
print(f"target = {TARGET!r}\nkey    = {KEY!r}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(KEY), run("wrong")
    good = "Weldone" in ok and "Wrong!!!" in ko
    print("OK:", "Weldone" in ok, "| KO:", "Wrong!!!" in ko)
    sys.exit(0 if good else 1)
