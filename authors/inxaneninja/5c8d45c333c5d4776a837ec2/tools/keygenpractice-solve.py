#!/usr/bin/env python3
"""inxaneninja — Keygen Practice (license) : gabarit, checksum pondere.

main() calcule : sum(ord(c) for c in argv[1]) * len(argv[1])**2 == 0xcdaa
(52650). Infinite d'entrees valides ; la plus simple a longueur 9, somme
des codes ASCII = 650 (52650 / 9**2).

Exemple : "HHHHHHHHJ" (8x 'H'=72 + 1x 'J'=74, somme=650, longueur=9).

Usage : keygenpractice-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "license"
PASSWORD = "HHHHHHHHJ"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD)
        return 0
    checksum = sum(ord(c) for c in PASSWORD) * len(PASSWORD) ** 2
    print(f"password = {PASSWORD!r} (checksum={checksum:#x})")
    if a.check:
        ok = subprocess.run([str(EXE), PASSWORD], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "wrongpass"], capture_output=True, text=True).stdout
        good = "Good job!" in ok and "Wrong password!" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
