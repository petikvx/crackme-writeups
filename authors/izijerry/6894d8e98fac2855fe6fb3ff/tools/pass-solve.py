#!/usr/bin/env python3
"""izijerry — int overflow (pass) : atoi(saisie) == 0xdfdc1c3e en int32.

main @0x1198 : cmp DWORD PTR [rbp-0xc],0xdfdc1c3e ; atoi() = (int)strtol(...) tronque modulo 2^32.
Valides : -539222978 (signé), 3755744318 (non signé = "l'overflow"), et tout x = 3755744318 + k*2^32.
Usage : pass-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "pass"
TARGET = 0xDFDC1C3E
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true", help="n'affiche que la forme signée")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
signed, unsigned = TARGET - 2**32, TARGET
if a.q:
    print(signed); sys.exit(0)
print(f"signé    : {signed}\nnon signé: {unsigned}\n+2^32    : {unsigned + 2**32}")
if a.check:
    run = lambda k: subprocess.run([str(EXE)], input=f"{k}\n", capture_output=True, text=True).stdout
    oks = [run(k) for k in (signed, unsigned, unsigned + 2**32)]
    ko = run(-signed)
    good = all("Correct!!!" in o and "Incorrect" not in o for o in oks) and "Incorrect" in ko
    print("check:", "OK" if good else "KO")
    sys.exit(0 if good else 1)
