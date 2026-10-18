#!/usr/bin/env python3
"""
Computerboy's Gemy (crackmes.one 673ff5da9b533b4c22bd2fff) -- solveur.

Clé d'accès codée en dur dans le binaire (UPX 4.22, dépaqueté en mémoire au
runtime) : la chaîne "mysteryKEY" en .data sert de double leurre/réponse :
  - "mystery" (7 octets) alimente une boucle `sum += byte[i] ^ 0xAB` dont le
    résultat n'est JAMAIS réutilisé (code mort, piège pour détourner du vrai
    check) ;
  - "KEY" (les 3 octets suivants, offset +7) est copié tel quel (pas de XOR)
    dans le buffer comparé par `strcmp` à la saisie utilisateur.

Usage:
    ./gemy-solve.py                # affiche la clé
    ./gemy-solve.py --check        # lance le binaire, code de sortie 0/1
    ./gemy-solve.py --binary PATH  # cible un autre exemplaire
"""
import argparse
import os
import subprocess
import sys

DEFAULT_BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "gem")
KEY = "KEY"
OK_TEXT = b"Congrats you solves this challenge"


def check(binary):
    p = subprocess.run([binary], input=(KEY + "\n").encode(),
                        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=5)
    return OK_TEXT in p.stdout, p.stdout


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="chemin du binaire gem")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que la clé")
    ap.add_argument("--check", action="store_true", help="lance le binaire, code de sortie 0/1")
    args = ap.parse_args()

    if args.check:
        ok, _ = check(args.binary)
        sys.exit(0 if ok else 1)

    if args.quiet:
        print(KEY)
    else:
        print(f"Clé d'accès : {KEY}")


if __name__ == "__main__":
    main()
