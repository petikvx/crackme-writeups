#!/usr/bin/env python3
"""D4RKFL0W — Easy_firstCrackme (crack1_by_D4RK_FL0W) : mot de passe = "H1DD3N".

main() compare chaque octet de la saisie a une constante en dur :
    72 49 68 68 51 78 0  ->  'H' '1' 'D' 'D' '3' 'N' '\\0'

Usage : crack1-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crack1_by_D4RK_FL0W"
PASSWORD = bytes([72, 49, 68, 68, 51, 78]).decode()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD)
        return 0
    print(f"password = {PASSWORD!r}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = run(PASSWORD), run("wrong")
        good = "Well Done" in ok and "WRONG" in ko
        print("OK:", "Well Done" in ok, "| KO:", "WRONG" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
