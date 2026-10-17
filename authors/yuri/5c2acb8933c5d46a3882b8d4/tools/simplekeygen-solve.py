#!/usr/bin/env python3
"""Yuri — Simple Keygen (SimpleKeyGen) : gabarit, 16 caracteres.

checkSerial() exige strlen(serial)==16 puis, pour chaque paire
(i, i+1) avec i pair (0,2,4,...,14) : serial[i] - serial[i+1] == -1,
c'est a dire serial[i+1] == serial[i] + 1 (paires de caracteres
consecutifs croissants).

Exemple : "0123456789ABCDEF" (8 paires : 01,23,45,67,89,AB,CD,EF).

Usage : simplekeygen-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "SimpleKeyGen"
SERIAL = "0123456789ABCDEF"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(SERIAL)
        return 0
    print(f"serial = {SERIAL!r}")
    if a.check:
        ok = subprocess.run([str(EXE), SERIAL], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "wrongwrongwrong1"], capture_output=True, text=True).stdout
        good = "Good Serial" in ok and "Bad Serial" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
