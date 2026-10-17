#!/usr/bin/env python3
"""nutcake — PrettyDamnEasy (crack) : mot de passe = "easycrack".

Construit sur la pile par main() via des immediates (movabs 8 octets LE
"easycrac" + word "k\\0"), compare par strcmp a la saisie.
La chaine visible via `strings` ("easycracH") est un leurre a un caractere
pres (majuscule finale au lieu de "k" minuscule) : jamais celle utilisee
par le strcmp reel.

Usage : prettydamneasy-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crack"
PASSWORD = "easycrack"


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
        ok, ko = run(PASSWORD), run("easycracH")
        good = "Correct password" in ok and "Wrong password" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
