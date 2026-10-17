#!/usr/bin/env python3
"""mrT4ntr4 — Save Scooby : reponse DYNAMIQUE, fonction du cwd a l'execution.

main() transforme getcwd() caractere par caractere :
  '/' -> '$'
  minuscule a-z -> (c - 0x1e)   (decalage de 30, sort du charset a-z)
  majuscule A-Z -> (c + 0x1e)
puis demande une saisie (scanf %s) et verifie qu'elle commence par ce
cwd transforme (comparaison tronquee a min(len(input), len(cwd))).

Pas de "la" reponse fixe : il faut toujours recalculer depuis le cwd reel
au moment de lancer le binaire -- c'est pour ca que ce solveur appelle
os.getcwd() lui-meme plutot que d'embarquer une constante.

Usage : savescooby-solve.py [-q] [--check]
"""
import argparse
import os
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "save_scooby"


def transform_cwd(cwd: str) -> str:
    out = []
    for c in cwd:
        if c == "/":
            out.append("$")
        elif "a" <= c <= "z":
            out.append(chr(ord(c) - 0x1E))
        elif "A" <= c <= "Z":
            out.append(chr(ord(c) + 0x1E))
        else:
            out.append(c)
    return "".join(out)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la reponse pour le cwd courant")
    ap.add_argument("--check", action="store_true",
                     help="rejoue le binaire d'origine depuis son propre dossier")
    a = ap.parse_args()
    if a.q:
        print(transform_cwd(os.getcwd()))
        return 0
    print(f"reponse (depuis {os.getcwd()!r}) = {transform_cwd(os.getcwd())!r}")
    if a.check:
        run_dir = EXE.parent
        answer = transform_cwd(str(run_dir))
        ok = subprocess.run([str(EXE)], input=answer + "\n", capture_output=True, text=True, cwd=run_dir).stdout
        ko = subprocess.run([str(EXE)], input="wrong\n", capture_output=True, text=True, cwd=run_dir).stdout
        good = "won a medal" in ok and "Not too easy" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
