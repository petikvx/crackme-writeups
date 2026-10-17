#!/usr/bin/env python3
"""Bkamp — glow wine [keygen practice] : gabarit de cle a 5 caracteres.

main() verifie : len(key)==5, key[1]=='@', key[2]+key[3]+key[4]==300 (somme
des codes ASCII, signed char). key[0] est libre.

Exemple : "A@ddd" ('d'=100, 100*3=300).

Usage : glowwine-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "glowwine"
KEY = "A@ddd"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(KEY)
        return 0
    print(f"key = {KEY!r} (gabarit : key[1]='@', sum(key[2:5])==300, key[0] libre)")
    if a.check:
        ok = subprocess.run([str(EXE), KEY], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "wrong"], capture_output=True, text=True).stdout
        good = "keygen me" in ok and "wrong key" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
