#!/usr/bin/env python3
"""Exxtra12 — Ext.challenges (xordemo) : argv[1] = "rungirl34".

checkPassword() XOR chaque octet de argv[1] avec la cle en dur "badbeef12"
(meme indice, pas cyclique au-dela de sa longueur) et compare au strncmp()
une constante cible (9 octets, embarquee en deux movabs/mov immediate).
argv1[i] attendu = key[i] ^ target[i].

Usage : xordemo-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "xordemo"
KEY = b"badbeef12"
TARGET = [0x10, 0x14, 0x0a, 0x05, 0x0c, 0x17, 0x0a, 0x02, 0x06]


def compute() -> str:
    return "".join(chr(KEY[i] ^ TARGET[i]) for i in range(len(TARGET)))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que l'argument")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    answer = compute()
    if a.q:
        print(answer)
        return 0
    print(f"argv[1] = {answer!r}")
    if a.check:
        ok = subprocess.run([str(EXE), answer], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "wrong"], capture_output=True, text=True).stdout
        good = "Jackpot" in ok and "fail" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
