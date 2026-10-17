#!/usr/bin/env python3
"""m00ny — am i really random? : mot de passe DEPENDANT de argv[0].

main() exige strlen(argv[0]) > 15 (sinon "cheater, rename me back"), puis
construit le mot de passe attendu (4 caracteres) a partir de argv[0] :
    expected[0] = argv0[5]
    expected[1] = '0'               (constante)
    expected[2] = argv0[2]
    expected[3] = argv0[6]

Pour argv[0] = "./crackMe-by-m00ny-1" (invocation depuis ce dossier) :
    argv0[5]='c', argv0[2]='c', argv0[6]='k' -> mot de passe "c0ck".

Le flag affiche en cas de succes est genere par rand() non seede a chaque
execution : ce n'est PAS une valeur fixe a retrouver, seul le mot de passe
compte comme "reponse" reproductible.

Usage : really_random-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackMe-by-m00ny-1"


def compute_password(argv0: str) -> str:
    return argv0[5] + "0" + argv0[2] + argv0[6]


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire via './crackMe-by-m00ny-1'")
    a = ap.parse_args()
    argv0 = "./crackMe-by-m00ny-1"
    pw = compute_password(argv0)
    if a.q:
        print(pw)
        return 0
    print(f"argv0={argv0!r} -> password={pw!r}")
    if a.check:
        run_dir = EXE.parent
        ok = subprocess.run(["./crackMe-by-m00ny-1", pw], capture_output=True, text=True, cwd=run_dir).stdout
        ko = subprocess.run(["./crackMe-by-m00ny-1", "wrong"], capture_output=True, text=True, cwd=run_dir).stdout
        good = "You cracked me!" in ok and "nope" in ko
        print("OK:", "You cracked me!" in ok, "| KO:", "nope" in ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
