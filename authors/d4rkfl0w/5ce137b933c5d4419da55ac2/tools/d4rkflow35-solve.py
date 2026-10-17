#!/usr/bin/env python3
"""D4RKFL0W — D4RK_FL0W-3.5 : code a 4 chiffres = 4 2 7 3.

Password::Password() calcule les 4 chiffres attendus avec des constantes
en dur :
    d1 = (40 + 32445) % 9
    d2 = (2*(1+4) + 1) % 9
    d3 = 70 % 9
    d4 = (837 + 35453 + 10) % 9
puis check_passcode() compare chaque chiffre saisi au chiffre attendu
correspondant.

Usage : d4rkflow35-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "D4RK_FL0W-3.5"


def compute_digits():
    d1 = (40 + 32445) % 9
    d2 = (2 * (1 + 4) + 1) % 9
    d3 = 70 % 9
    d4 = (837 + 35453 + 10) % 9
    return d1, d2, d3, d4


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que les 4 chiffres")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    digits = compute_digits()
    if a.q:
        print(" ".join(map(str, digits)))
        return 0
    print(f"digits = {digits}")
    if a.check:
        run = lambda ds: subprocess.run([str(EXE)], input="\n".join(map(str, ds)) + "\n",
                                         capture_output=True, text=True).stdout
        ok, ko = run(digits), run((1, 2, 3, 4))
        good = "Well done" in ok and "Well done" not in ko
        print("OK:", "Well done" in ok, "| KO:", "Well done" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
