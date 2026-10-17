#!/usr/bin/env python3
"""NomanProdhan — License Checker 0x03 (license_checker_3) : IDENTIQUE octet pour octet
(même SHA-256) à authors/pourmeadrinkwhileimfloating/62327b0433c5d46c8bcc0335 (« licesnse_checker_3 »).

main @0x1179 : somme des chiffres de argv[1] (atoi caractère par caractère) doit valoir 50 (0x32).
Voir le write-up de pourmeadrinkwhileimfloating pour l'analyse complète.
Usage : license0x03-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "license_checker_3"
CODE = "999995"
assert sum(int(c) for c in CODE) == 50
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(CODE); sys.exit(0)
print(f"code = {CODE}  (somme des chiffres == 50)")
if a.check:
    run = lambda c: subprocess.run([str(EXE), c], capture_output=True, text=True).stdout.strip()
    ok, ko = run(CODE), run("123456")
    good = "activated" in ok and "Wrong" in ko
    print("OK:", "activated" in ok, "| KO:", "Wrong" in ko)
    sys.exit(0 if good else 1)
