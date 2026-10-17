#!/usr/bin/env python3
"""pourmeadrinkwhileimfloating — licesnse_checker_3 : gabarit, pas un code unique.

main @0x1179 : pour chaque caractère de argv[1], atoi(un seul caractère) (= sa valeur si chiffre, 0 sinon),
somme accumulée ; la somme doit valoir exactement 50 (0x32). Toute chaîne de chiffres dont la somme == 50 convient.
Usage : license3-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "analysis" / "x" / "license_checker_3"
CODE = "999995"          # 9*5 + 5 = 50
assert sum(int(c) for c in CODE) == 50
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(CODE); sys.exit(0)
print(f"code = {CODE}  (somme des chiffres == 50, n'importe quelle combinaison convient)")
if a.check:
    run = lambda c: subprocess.run([str(EXE), c], capture_output=True, text=True).stdout.strip()
    ok, ko = run(CODE), run("123456")
    good = "activated" in ok and "Wrong" in ko
    print("OK:", "activated" in ok, "| KO:", "Wrong" in ko)
    sys.exit(0 if good else 1)
