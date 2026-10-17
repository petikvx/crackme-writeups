#!/usr/bin/env python3
"""NomanProdhan — License Checker 0x02 : nom et clé codés en dur, pas de paramètre variable.

main @0x1159 : strcmp(argv[1], "NomanProdhan") et strcmp(argv[2], "KS-LICENSE-KEY-2021-REV-2") doivent
TOUS DEUX réussir. Le nom est le pseudo de l'auteur lui-même (pas de variante possible) : convention
`petik` du dépôt inapplicable, le nom est une constante exacte.
Usage : license2-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "license_checker_2"
NAME, KEY = "NomanProdhan", "KS-LICENSE-KEY-2021-REV-2"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(NAME, KEY); sys.exit(0)
print(f"name = {NAME}\nkey  = {KEY}")
if a.check:
    run = lambda *x: subprocess.run([str(EXE), *x], capture_output=True, text=True).stdout.strip()
    ok, ko1, ko2 = run(NAME, KEY), run("petik", KEY), run(NAME, "wrong")
    good = "Congratulations" in ok and "don't have a license" in ko1 and "invalid license" in ko2
    print("OK:", "Congratulations" in ok, "| KO nom:", "don't have a license" in ko1, "| KO clé:", "invalid license" in ko2)
    sys.exit(0 if good else 1)
