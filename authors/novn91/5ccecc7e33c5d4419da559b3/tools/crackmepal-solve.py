#!/usr/bin/env python3
"""novn91 — crackmepal (crackmeMario) : gabarit sur 9 caracteres.

main() verifie : strlen(argv[1])==9, argv[1][4]=='-', et la presence
d'au moins un octet '@' (0x40) n'importe ou dans la chaine.

Exemple : "xxxx-@xxx"

Usage : crackmepal-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackmeMario"
PASSWORD = "xxxx-@xxx"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD)
        return 0
    print(f"password = {PASSWORD!r} (gabarit : len==9, [4]=='-', contient '@')")
    if a.check:
        ok = subprocess.run([str(EXE), PASSWORD], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "wrongpass"], capture_output=True, text=True).stdout
        good = "good job!" in ok and "try again" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
