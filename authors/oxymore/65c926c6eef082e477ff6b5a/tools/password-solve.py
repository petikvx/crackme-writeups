#!/usr/bin/env python3
"""Oxymore — Password (crackme Rust) : "NoiCe" SANS retour à la ligne.

crackme::main @0x9730 : read_line(&mut s) conserve le '\\n' ; if "NoiCe" == s  -> "Noice !! You did it".
Donc la saisie doit valoir exactement "NoiCe" : sur un terminal c'est impossible avec Entrée, il faut envoyer l'entrée
sans '\\n' (pipe : printf 'NoiCe' | ./crackme, ou Ctrl-D en fin de ligne sans appuyer sur Entrée).
La constante est lue dans le binaire (juste avant le message d'invite en .rodata).
Usage : password-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
d = EXE.read_bytes()
i = d.index(b"NoiCeInput THE password")
pw = d[i:i + 5].decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"password = {pw}  (à envoyer SANS '\\n' : printf '{pw}' | ./original/crackme)")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s, capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko_nl, ko_low, ko_cr = run(pw), run(pw + "\n"), run(pw.lower()), run(pw + "\r")
    print("OK:", ok, "| KO:", ko_nl, "|", ko_low, "|", ko_cr)
    sys.exit(0 if ok == "Noice !! You did it" and all(k == "Nah, try again." for k in (ko_nl, ko_low, ko_cr)) else 1)
