#!/usr/bin/env python3
"""Loz — Password Login 2 : mot de passe = "lozlvl2".

password::password() (constructeur) stocke une cle XOR (0x42 = 'B') et une
chaine membre "x_.1:.-8.4.p6-e.!-".
password::checkLength() exige strlen(input) == 7 (calcule via un detour
std::to_string(360).at(1)+1 = '6'+1... en realite atoi("6")+1 = 7, juste
une obfuscation d'une constante).
password::checkPassword() XOR chaque octet de l'entree avec 0x42, et
compare au sous-texte [5:12] (7 caracteres) de la chaine membre.

Usage : passwordlogin2-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "main"
MEMBER_STRING = "x_.1:.-8.4.p6-e.!-"
KEY = 0x42


def compute_password() -> str:
    sub = MEMBER_STRING[5:5 + 7]
    return "".join(chr(ord(c) ^ KEY) for c in sub)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    pw = compute_password()
    if a.q:
        print(pw)
        return 0
    print(f"password = {pw!r}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = run(pw), run("wrong")
        good = "successful" in ok and "failed" in ko
        print("OK:", ok.strip(), "| KO:", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
