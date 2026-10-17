#!/usr/bin/env python3
"""rion — keyGme : gabarit, 16 caracteres. Serial valide pour un prefixe
quelconque de 15 lettres majuscules (A-Z) ou chiffres (0-9), + 1 octet
de controle.

checkKey(key) :
    v3 = 0
    for c in key[:-1]:                       # 15 premiers octets
        if not (c in A-Z or c in 0-9):
            print("Found invalid character!") ; exit(3)
        v3 = ((ord(c) + v3) >> 1) % 3840 + 10
    return v3 == key[-1]                      # 16e octet = checksum

Exemple : prefixe "AAAAAAAAAAAAAAA" (15x 'A') -> checksum 'T' (84).

Usage : keygme-solve.py [-q] [--prefix AAAAAAAAAAAAAAA] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "keyGme"


def compute_checksum(prefix: str) -> int:
    v3 = 0
    for c in prefix:
        v3 = ((ord(c) + v3) >> 1) % 3840 + 10
    return v3


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--prefix", default="A" * 15, help="15 caracteres A-Z/0-9 (defaut: 15x 'A')")
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    checksum = compute_checksum(a.prefix)
    key = a.prefix + chr(checksum)
    if a.q:
        print(key)
        return 0
    print(f"key = {key!r} (checksum octet = {checksum} = {chr(checksum)!r})")
    if a.check:
        ok = subprocess.run([str(EXE), key], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), a.prefix + "A"], capture_output=True, text=True).stdout
        good = "Congratulation" in ok and "invalid" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
