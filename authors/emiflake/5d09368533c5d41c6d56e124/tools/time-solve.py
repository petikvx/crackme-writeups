#!/usr/bin/env python3
"""
emiflake's Time is of the Essence (crackmes.one 5d09368533c5d41c6d56e124)
-- solveur.

Decryptor::decrypt() (voir README) construit un vecteur d'entiers en
bouclant `for (i = 0; i < tm_min; i++) push_back(tm_year * i)` -- la
valeur poussee ne sert a rien, seule la TAILLE du vecteur compte, et elle
vaut exactement `tm_min` (la minute courante, 0-59). Le mot de passe
attendu est `std::to_string(vector.size())`, donc simplement la MINUTE
COURANTE de l'heure locale de la machine, en decimal sans zero de tete
(ex. minute 3 -> "3", pas "03").

Usage:
    ./time-solve.py              # affiche le mot de passe valide MAINTENANT
    ./time-solve.py --check      # lance le binaire avec ce mot de passe, 0/1
"""
import argparse
import datetime
import os
import subprocess
import sys

DEFAULT_BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "crackme")


def password_now() -> str:
    return str(datetime.datetime.now().minute)


def check(binary, password):
    p = subprocess.run([binary], input=(password + "\n").encode(),
                        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=5)
    return b"Password Correct" in p.stdout, p.stdout


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="chemin du binaire crackme")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="lance le binaire, code de sortie 0/1")
    args = ap.parse_args()

    pw = password_now()

    if args.check:
        ok, _ = check(args.binary, pw)
        sys.exit(0 if ok else 1)

    if args.quiet:
        print(pw)
    else:
        print(f"Mot de passe (minute courante) : {pw}")


if __name__ == "__main__":
    main()
