#!/usr/bin/env python3
"""ezman — easy keyg3nme : gabarit, la cle doit etre un multiple de 1223.

validate_key(key) est une division magique du compilateur pour `key % 1223`
(imul 0x1acb0aad puis sar 7, correction de signe, *1223, soustraction : le
classique "division par constante" de GCC). Succes si le reste est nul.

Usage : keyg3nme-solve.py [-q] [--key N] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "keyg3nme"
MODULUS = 1223


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--key", type=int, default=MODULUS, help="multiple de 1223 (defaut: 1223)")
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    key = a.key if a.key % MODULUS == 0 else MODULUS
    if a.q:
        print(key)
        return 0
    print(f"key = {key} (multiple de {MODULUS})")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=f"{s}\n", capture_output=True, text=True).stdout
        ok, ko = run(key), run(5)
        good = "Good job" in ok and "nope" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
