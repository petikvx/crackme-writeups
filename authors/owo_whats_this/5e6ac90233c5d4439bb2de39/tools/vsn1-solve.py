#!/usr/bin/env python3
"""owo_whats_this — Very Special Number v1 : nombre = 109713430479.

generate() == genNum(magic_number1+magic_number2, magic_number2, 5, 0, 0),
une fonction C++ recursive/switch (5 cas arithmetiques + wrap autour de deux
constantes 64 bits magic_number1/magic_number2 et d'un tableau magic_arr)
dont la condition de terminaison de la recursion n'est pas triviale a
retracer a la main depuis l'asm (compteur qui semble decroitre sous zero
sans jamais remonter). Plus simple et plus fiable : appeler generate()
directement sous GDB (voir README, section Debug GDB).

Usage : vsn1-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "OwO_vsn_1"
NUMBER = 109713430479


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le nombre")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(NUMBER)
        return 0
    print(f"nombre = {NUMBER}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = run(str(NUMBER)), run("123")
        good = "psychic" in ok and "Wrong" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
