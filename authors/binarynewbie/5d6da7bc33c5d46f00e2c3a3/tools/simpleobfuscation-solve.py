#!/usr/bin/env python3
"""BinaryNewbie — Simple obfuscation (crackme) : cle = "jcdefghiab".

verify_key(input, 10) construit "abcdefghij", applique une double boucle de
swaps (i=0..9, j=0..8) qui finit par le reduire a "jcdefghiab", puis compte
les positions ou input[i]==password[i] (c decremente a chaque match). Le
check final (`(c ^ 0xdeadbeef>>10 & 0xc ^ 0xffffffff) + 5 ^ 10) == 0`) exige
c == -10, c'est a dire que LES 10 CARACTERES matchent : input == password.

Cette meme cle dechiffre aussi original/source/flag.zip (fourni par
l'auteur, protege par mot de passe) -> flag.txt = "FL4G{Ass1st4nt_Pr0f3ss0r}".

Usage : simpleobfuscation-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "cr4ckme" / "crackme"
KEY = "jcdefghiab"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(KEY)
        return 0
    print(f"key = {KEY!r}")
    if a.check:
        ok = subprocess.run([str(EXE), KEY], capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE), "wrongkey12"], capture_output=True, text=True).stdout
        good = "Cracked" in ok and "Wrong key" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
