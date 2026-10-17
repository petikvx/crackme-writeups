#!/usr/bin/env python3
"""D4RKFL0W — Crackme-4 (C++) : mot de passe = 'U6-:YL."+'.

PasswordGen::checkPassword compare les 9 premiers octets de la saisie
(indices 0..8, l'indice 9 n'est jamais verifie) a PasswordGen::c0()..c8(),
dans l'ordre d'appel reel c3,c0,c1,c2,c4,c8,c5,c6,c7 (chaque octet incorrect
fait exit(-1) immediatement, avant les appels suivants).

8 des 9 fonctions sont des boucles deterministes (voir README) :
  c0=85 'U'  c1=54 '6'  c2=45 '-'  c3=58 ':'  c4=89 'Y'
  c5=76 'L'  c6=46 '.'  c8=43 '+'

La 9e, c7(), lit une variable locale JAMAIS INITIALISEE par c7 lui-meme :
son resultat depend du residu laisse sur la pile par l'appel precedent
(c6(), dans l'ordre reel d'appel de checkPassword). Ce n'est pas calculable
par relecture statique de c7 seul -> valeur obtenue en appelant le vrai
process sous GDB (breakpoint juste apres `call c7`, voir README section
Debug GDB) : c7 = 34 ('"').

Usage : crackme4-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "Crackme-4"
PASSWORD = 'U6-:YL."+'


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
        good = "CORRECT" in ok and "incorrect" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
