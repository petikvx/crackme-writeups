#!/usr/bin/env python3
"""paypain — de_tcrack1 : gabarit sur argv[1].

main() verifie :
  - strlen(argv[1]) > 8  (longueur >= 9)
  - exactement 3 occurrences du caractere 'b' (0x62) dans argv[1]
  - argv[1][4] == '@'

Exemple : "xxxx@bbbxx" (10 caracteres, index4='@', 3 'b').

Usage : detcrack1-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "de_tcrack1"
PASSWORD = "xxxx@bbbxx"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD)
        return 0
    print(f"password = {PASSWORD!r} (gabarit : len>8, [4]=='@', 3x 'b')")
    if a.check:
        ok = subprocess.run([str(EXE), PASSWORD], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "wrongpassword"], capture_output=True, text=True).stdout
        good = "Login Complete" in ok and "WRONG" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
