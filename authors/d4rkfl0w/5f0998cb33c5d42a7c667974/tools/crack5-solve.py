#!/usr/bin/env python3
"""D4RKFL0W — Crack_5 (C++) : password = "P0iNT3R_tYPe5_M4tt3r".

main(argc,argv) exige argv[1] et argv[2] satisfaisant args() @0x17ab :
    strlen(argv[1]) == 8
    strlen(argv[2]) != 8          (pas égale, contre-intuitif)
    argv[2][strlen(argv[2])-2] == 'X'
    argv[2][0] > 'X' (0x58)
Si args() réussit : main scramble deux tableaux globaux (fake_password, coded_password, 5 uint32
chacun) avec func1/func2 sur plusieurs boucles FIXES (indépendantes de argv), affiche "Password: ",
lit une ligne, convertit coded_password (20 octets) en chaîne via convert(), et compare.

La valeur finale de coded_password (après scramble) n'a pas été recalculée à la main (func1/func2
sont des opérations bit à bit répétées de nombreuses fois) : elle a été lue directement sous GDB,
juste après l'appel à convert(), avec des argv[1]/argv[2] satisfaisant args().
Usage : crack5-solve.py [-q] [--check]
"""
import argparse, shutil, subprocess, sys, tempfile
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crack_5"
ARG1, ARG2 = "AAAAAAAA", "YAAAAXA"     # len(ARG1)=8 ; len(ARG2)=7(!=8) ; ARG2[-2]='X' ; ARG2[0]='Y'>'X'
PASSWORD = "P0iNT3R_tYPe5_M4tt3r"
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PASSWORD); sys.exit(0)
print(f"argv = [{ARG1!r}, {ARG2!r}]\npassword = {PASSWORD}")
if a.check:
    with tempfile.TemporaryDirectory() as t:
        # le gate sur argv[1]/argv[2] ne dépend pas d'argv[0] : on exécute le binaire d'origine tel quel.
        run = lambda s, a1=ARG1, a2=ARG2: subprocess.run([str(EXE), a1, a2], input=s + "\n",
                                                          capture_output=True, text=True).stdout
        ok, ko = run(PASSWORD), run("wrong")
        ko_gate = run(PASSWORD, "AAAAAAAA", "YAAAAAXA")   # argv[2] de longueur 8 -> gate refusé
    good = "Correct" in ok and "Wrong" in ko and "Wrong" in ko_gate
    print("OK:", "Correct" in ok, "| KO mot de passe:", "Wrong" in ko, "| KO gate (len argv2==8):", "Wrong" in ko_gate)
    sys.exit(0 if good else 1)
