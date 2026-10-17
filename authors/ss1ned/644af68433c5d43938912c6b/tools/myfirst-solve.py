#!/usr/bin/env python3
"""ss1ned — My first crackme : le mot de passe affiché ("P@ssword") n'est PAS le bon.

main @0x11c9 : strncpy(buf, pass, 9) copie la chaîne globale "P@ssword" (8 + NUL) dans buf,
puis main ÉCRASE buf[1] avec l'octet 0x61 ('a') avant de lire la saisie et de comparer (strcmp).
Donc la cible réelle est "P@ssword" avec son 2e caractère forcé à 'a' : "Password".
Usage : myfirst-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
d = EXE.read_bytes()
shown = d[0x2004:d.index(b"\0", 0x2004)]              # "P@ssword" (chaîne affichée, dans .rodata)
pw = bytearray(shown); pw[1] = 0x61                     # main écrase l'octet 1 avec 'a'
pw = pw.decode()
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(pw); sys.exit(0)
print(f"chaîne affichée = {shown.decode()!r} ; mot de passe réel (byte[1]='a') = {pw!r}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok, ko1, ko2 = run(pw), run(shown.decode()), run(pw.lower())
    print("OK:", ok, "| KO (chaîne affichée, casse):", ko1, "|", ko2)
    sys.exit(0 if ok == "Welcome!" and ko1 == ko2 == "Go away!" else 1)
