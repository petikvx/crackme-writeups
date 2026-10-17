#!/usr/bin/env python3
"""Loz — Password Login : mot de passe = "cracked".

checkPassword() construit une chaine v9 a partir de la constante "dec"
(unk_2005), en insistant deux fragments supplementaires "k" et "car" juste
avant le dernier caractere de "dec" :
    'd' 'e' + "k" + "car" + 'c'  = "dekcarc"
puis compare std::reverse(input) a "dekcarc". Il suffit donc d'inverser
"dekcarc" pour obtenir le mot de passe.

Usage : passwordlogin-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
V9 = "dekcarc"
PASSWORD = V9[::-1]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD)
        return 0
    print(f"password = {PASSWORD!r}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = run(PASSWORD), run("wrong")
        good = "successful" in ok and "failed" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
