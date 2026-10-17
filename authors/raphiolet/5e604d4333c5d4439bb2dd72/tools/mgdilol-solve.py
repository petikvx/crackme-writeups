#!/usr/bin/env python3
"""raphiolet — mgdilolmsoamasiug : pour un mot donne, "Guess result" doit
etre le mot apres transformation en place :
    n = len(mot)
    for i in 0..n-1:
        c = mot[i]            # valeur courante (mutations precedentes visibles)
        mot[ord(c) % n] = c

Exemple (user de reference petik) : mot "petik" -> guess "iekik".

Usage : mgdilol-solve.py [-q] [--word petik] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "mgdilolmsoamasiug"


def transform(word: str) -> str:
    buf = list(word)
    n = len(buf)
    for i in range(n):
        c = buf[i]
        buf[ord(c) % n] = c
    return "".join(buf)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--word", default="petik", help="mot d'entree (defaut: petik)")
    ap.add_argument("-q", action="store_true", help="n'affiche que le guess result")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    guess = transform(a.word)
    if a.q:
        print(guess)
        return 0
    print(f"word = {a.word!r} -> guess result = {guess!r}")
    if a.check:
        run = lambda w, g: subprocess.run([str(EXE)], input=f"{w}\n{g}\n", capture_output=True, text=True).stdout
        ok = run(a.word, guess)
        ko = run(a.word, "wrong")
        good = "Good job!" in ok and "Not exactly" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
