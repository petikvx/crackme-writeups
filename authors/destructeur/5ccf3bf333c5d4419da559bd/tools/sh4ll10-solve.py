#!/usr/bin/env python3
"""destructeur — Sh4ll10 : "mot de passe" = 0x400665.

main() lit la saisie avec scanf("%p", ...) (format construit dynamiquement
sur la pile : '%' + ('s' ^ 3) = '%p') dans un buffer 8 octets, calcule
addr = valeur_saisie - 115 ('s' = 0x73 = 115), puis fait `call rax` sur
cette adresse. goodBoy()/badBoy() appellent exit() et ne reviennent jamais :
tout le code apres le `call` (comparaison strcmp, etc.) est mort, seule
compte l'adresse effectivement appelee.

Binaire NON-PIE (adresses fixes) : il suffit de fournir
    valeur = adresse(goodBoy) + 115 = 0x4005f2 + 0x73 = 0x400665

Usage : sh4ll10-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "Sh4ll10.bin"
GOOD_BOY = 0x4005F2
OFFSET = 0x73  # 's' = 115
ANSWER = GOOD_BOY + OFFSET  # 0x400665


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la valeur a saisir")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(hex(ANSWER))
        return 0
    print(f"valeur a saisir = {hex(ANSWER)} (= goodBoy {hex(GOOD_BOY)} + 0x73)")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok = run(hex(ANSWER))
        good = "Good boy" in ok
        print("OK:", ok.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
