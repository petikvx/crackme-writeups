#!/usr/bin/env python3
"""m3hd1 — half-twins : gabarit sur deux arguments (Abby, Gabby).

Contraintes (lues en main()) :
  - argc == 3 (./half-twins <abby> <gabby>)
  - len(abby) > 6 ET len(gabby) > 6   (le "ja" sur cmp len,6 saute le cas
    d'erreur quand len > 6 : l'erreur est donc affichee quand len <= 6)
  - len(abby) == len(gabby), et paire (meme nombre de caracteres)
  - les n/2 premiers caracteres de abby et gabby sont IDENTIQUES
  - les n/2 caracteres restants sont TOUS DIFFERENTS (position a position)

Exemple (longueur 8, demi = 4) : abby="abcdwxyz", gabby="abcdWXYZ".

Usage : halftwins-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "half-twins"
ABBY = "abcdwxyz"
GABBY = "abcdWXYZ"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que 'abby gabby'")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(ABBY, GABBY)
        return 0
    print(f"abby={ABBY!r} gabby={GABBY!r}")
    if a.check:
        ok = subprocess.run([str(EXE), ABBY, GABBY], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "ab", "ac"], capture_output=True, text=True).stdout
        good = "nice job" in ok and "older than" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
