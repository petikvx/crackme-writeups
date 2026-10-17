#!/usr/bin/env python3
"""bahha — easy_keygenme : vrai keygen.

gks(username, N) applique un ROT-N (N = longueur du username) a chaque
lettre du username, en bouclant dans l'alphabet (z->a, Z->A). Le username
doit faire 3 a 10 caracteres, uniquement des lettres (isalpha).

Exemple (user de reference petik, N=5) : petik -> ujynp.

Usage : easykeygenme-solve.py --user petik [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "keygenme"


def rot(s: str, n: int) -> str:
    out = []
    for c in s:
        if c.islower():
            out.append(chr((ord(c) - 97 + n) % 26 + 97))
        elif c.isupper():
            out.append(chr((ord(c) - 65 + n) % 26 + 65))
        else:
            out.append(c)
    return "".join(out)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik", help="username (3-10 lettres, defaut: petik)")
    ap.add_argument("-q", action="store_true", help="n'affiche que la cle")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    key = rot(a.user, len(a.user))
    if a.q:
        print(key)
        return 0
    print(f"user={a.user!r} -> key={key!r}")
    if a.check:
        stdin = f"{a.user}\n{key}\n"
        ok = subprocess.run([str(EXE)], input=stdin, capture_output=True, text=True).stdout
        ko = subprocess.run([str(EXE)], input=f"{a.user}\nwrong\n", capture_output=True, text=True).stdout
        good = "Congratulation" in ok and "Wrong key" in ko
        print("OK:", "Congratulation" in ok, "| KO:", "Wrong key" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
