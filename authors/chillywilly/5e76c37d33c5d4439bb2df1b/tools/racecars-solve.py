#!/usr/bin/env python3
"""chillywilly — racecars : condition = le basename de argv[0] doit etre un
palindrome. main() ne lit ni argv[1] ni stdin : il prend strlen(argv[0]),
cherche le dernier '/' pour isoler le nom de fichier, puis compare les
caracteres symetriquement depuis les deux bouts (boucle classique de test
de palindrome). "racecars" (avec le 's' final) n'est PAS un palindrome ->
il faut copier/symlinker le binaire sous un nom qui en est un, p.ex.
"racecar" (sans le 's').

Usage : racecars-solve.py [-q] [--check]
"""
import argparse
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "racecars"
PALINDROME_NAME = "racecar"


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le nom palindrome a utiliser")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire sous ce nom")
    a = ap.parse_args()
    if a.q:
        print(PALINDROME_NAME)
        return 0
    print(f"renommer / copier le binaire en : {PALINDROME_NAME!r} (puis l'exécuter sous ce nom)")
    if a.check:
        with tempfile.TemporaryDirectory() as tmp:
            dst = Path(tmp) / PALINDROME_NAME
            shutil.copy(EXE, dst)
            dst.chmod(0o755)
            ok = subprocess.run([str(dst)], capture_output=True, text=True).stdout
            ko = subprocess.run([str(EXE)], capture_output=True, text=True).stdout
        good = "That's exactly what I wanted!" in ok and "Gimme what I want!" in ko
        print("OK (racecar):", ok.strip(), "| KO (racecars):", ko.strip())
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
