#!/usr/bin/env python3
"""paypain — EasyCrack - Much0l0k0 (de_mucholoko) : flag gabarit, 39 octets.

./de_mucholoko check <flag>

Format : 5 groupes de 7 caracteres separes par '-', mais chaque groupe
"mord" sur le tiret suivant (le tiret fait partie de la fenetre de 7 lue
par main, donc chaque groupe n'a que 6 caracteres "libres" + 1 tiret) et
un octet de bourrage (jamais lu) suit chaque tiret sauf le dernier :

    [grp1: 7]-[fill]grp2(6)[-][fill]grp3(6)[-][fill]grp4(6)[-][fill]grp5(6)

Longueur totale EXACTE requise : 39 (voir section Debug GDB — calculee a
partir d'une fonction qui lit une variable non initialisee, impossible a
deriver par relecture statique seule).

Chaque "groupe" (fenetre de 7 octets, tiret inclus pour les groupes 2-5)
doit contenir un nombre CROISSANT de caracteres dans les plages ASCII
35-43 (#$%&'()*+) ou 60-64 (<=>?@) : >0, >1, >2, >3, >4 pour les groupes
1 a 5 respectivement.

Usage : easycrack-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "de_mucholoko"
FLAG = "#AAAAAA-Z##AAAA-Z###AAA-Z####AA-Z#####A"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le flag")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(FLAG)
        return 0
    print(f"flag = {FLAG!r} (longueur {len(FLAG)})")
    if a.check:
        ok = subprocess.run([str(EXE), "check", FLAG], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "check", "wrongflag"], capture_output=True, text=True).stdout
        good = "Welcome: Mr. Satan 666" in ok and "Unknow Format" in ko
        print("OK:", "Welcome: Mr. Satan 666" in ok, "| KO:", "Unknow Format" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
