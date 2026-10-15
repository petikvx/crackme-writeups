#!/usr/bin/env python3
"""time based riddle (marco007) -- repond aux 4 enigmes a temps.

main() pose 4 enigmes, lit une reponse pour chacune, mais NE COMPARE JAMAIS
programme les reponses a quoi que ce soit : le tableau `riddles_a` (reponses
"officielles", chiffrees par un decalage de Cesar FIXE par enigme -- shift =
24-i) est dechiffre dans la boucle mais le resultat est calcule puis
immediatement jete (leurre statique qui donne l'impression d'une
verification). Le vrai gate :
  1) le temps ecoule entre le debut et la fin (chrono::steady_clock) doit
     etre <= 10 s (0x2540BE3FF ns), sinon "Incorrect!" ;
  2) la somme des octets ASCII de la CONCATENATION des 4 reponses saisies
     sert de cle a decrypt_flag(int) (XOR position-dependant sur un blob
     chiffre en .rodata).

Les reponses "officielles" (celles qui donnent le bon flag, dechiffrees de
riddles_a) sont : keyboard / map / footsteps / m -- confirme par execution
directe (le flag affiche est correct et lisible).

Usage : time-riddle-solve.py [-q] [--check BINAIRE]
"""
import argparse
import subprocess

ANSWERS = ["keyboard", "map", "footsteps", "m"]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="BIN")
    a = ap.parse_args()
    if a.q and not a.check:
        print("\n".join(ANSWERS))
        return
    print("réponses (dans l'ordre) : " + ", ".join(ANSWERS))
    if a.check:
        stdin = "\n".join(ANSWERS) + "\n"
        r = subprocess.run([a.check], input=stdin, capture_output=True, text=True, timeout=10)
        print(r.stdout.strip().splitlines()[-1])


if __name__ == "__main__":
    main()
