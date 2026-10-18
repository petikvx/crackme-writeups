#!/usr/bin/env python3
"""
fedguy's FedGuy easy crack (crackmes.one 691abffc2d267f28f69b7e8a) -- solveur.

main() : lit un mot de passe (`scanf("%s")`), calcule `SHA256(password)` puis
compare sa représentation hexadécimale (`bytes_to_hex`, `%02x` par octet) à
la constante codée en dur :

    811eb81b9d11d65a36c53c3ebdb738ee303403cb79d781ccf4b40764e0a9d12a

Pas de salage, pas de troncature : préimage SHA-256 directe. Mot de passe
trouvé par attaque au dictionnaire (`/usr/share/dict/american-english`,
~104k mots, variantes casse) : "chicken".

Usage:
    ./fedguy-solve.py                 # affiche le mot de passe connu
    ./fedguy-solve.py --check         # lance le binaire, code de sortie 0/1
    ./fedguy-solve.py --bruteforce    # refait l'attaque au dictionnaire (preuve)
"""
import argparse
import hashlib
import os
import subprocess
import sys

DEFAULT_BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "crack")
TARGET_HASH = "811eb81b9d11d65a36c53c3ebdb738ee303403cb79d781ccf4b40764e0a9d12a"
PASSWORD = "chicken"
WORDLIST = "/usr/share/dict/american-english"


def bruteforce(wordlist=WORDLIST):
    target = bytes.fromhex(TARGET_HASH)
    with open(wordlist, errors="ignore") as f:
        for line in f:
            w = line.strip()
            if not w:
                continue
            for cand in (w, w.lower(), w.upper(), w.capitalize()):
                if hashlib.sha256(cand.encode()).digest() == target:
                    return cand
    return None


def check(binary, password):
    p = subprocess.run([binary], input=(password + "\n").encode(),
                        stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=5)
    return b"You win" in p.stdout, p.stdout


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="chemin du binaire crack")
    ap.add_argument("-q", "--quiet", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="lance le binaire, code de sortie 0/1")
    ap.add_argument("--bruteforce", action="store_true", help="refait l'attaque au dictionnaire au lieu d'utiliser la reponse connue")
    ap.add_argument("--wordlist", default=WORDLIST, help="dictionnaire pour --bruteforce")
    args = ap.parse_args()

    password = PASSWORD
    if args.bruteforce:
        found = bruteforce(args.wordlist)
        if not found:
            print("[-] aucune correspondance dans le dictionnaire", file=sys.stderr)
            sys.exit(1)
        password = found

    if args.check:
        ok, _ = check(args.binary, password)
        sys.exit(0 if ok else 1)

    if args.quiet:
        print(password)
    else:
        print(f"Mot de passe : {password}  (sha256={hashlib.sha256(password.encode()).hexdigest()})")


if __name__ == "__main__":
    main()
