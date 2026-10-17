#!/usr/bin/env python3
"""D4RKFL0W — Crack3-by-D4RK_FL0W : code a 4 chiffres = 3 6 7 4.

check_code() compare chaque chiffre saisi au resultat de get_digit(pN, 10)
pour N=1..4. get_digit() implemente un circuit de propagation de carry
bit a bit (style additionneur binaire) applique a un tableau fixe de 10
entiers (p1..p4, lus en .data) :

    carry, acc = 0, 0
    for x in array:
        v6 = (acc & x) | carry
        v8 = x ^ acc
        v3 = ~(v6 & v8) & 0xFFFFFFFF
        acc   = v3 & v8
        carry = v3 & v6
    return acc

Usage : crack3-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crack3-by-D4RK_FL0W"

P1 = [1, 3, 1, 1, 4, 4, 4, 6, 6, 6]
P2 = [10, 10, 10, 6, 70, 70, 70, 35, 35, 35]
P3 = [7, 68, 68, 68, 23, 23, 23, 40, 40, 40]
P4 = [4, 3, 3, 3, 5, 5, 5, 7, 7, 7]


def get_digit(a: list[int]) -> int:
    carry = 0
    acc = 0
    for x in a:
        v6 = (acc & x) | carry
        v8 = x ^ acc
        v3 = (~(v6 & v8)) & 0xFFFFFFFF
        acc = v3 & v8
        carry = v3 & v6
    return acc


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que les 4 chiffres")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    digits = [get_digit(p) for p in (P1, P2, P3, P4)]
    if a.q:
        print(" ".join(map(str, digits)))
        return 0
    print(f"code = {digits}")
    if a.check:
        run = lambda ds: subprocess.run([str(EXE)], input="\n".join(map(str, ds)) + "\n",
                                         capture_output=True, text=True).stdout
        ok, ko = run(digits), run([1, 2, 3, 4])
        good = "You Did It." in ok and "WRONG" in ko
        print("OK:", "You Did It." in ok, "| KO:", "WRONG" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
