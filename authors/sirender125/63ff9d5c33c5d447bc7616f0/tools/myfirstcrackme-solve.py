#!/usr/bin/env python3
"""SirEnder125 — MyFirstCrackme : password = "crackmes4ever:)" + un PIN de 15 caractères (contenu libre).

main @0x11e9 : scanf("%s") -> buf ; test(buf, [rbp-0x88]) @0x1275 : strcmp(buf, password) == 0 ->
"Correct! ..." puis re-scanf("%s") DANS LE MÊME buffer (le pin écrase le mot de passe) ; strlen(buf) == 15
-> "Crackme solved!..." (aucune autre comparaison : le PIN n'a pas de valeur fixe, juste une longueur).
Usage : myfirstcrackme-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"
PASSWORD = "crackmes4ever:)"
PIN = "1" * 15
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PASSWORD, PIN); sys.exit(0)
print(f"password = {PASSWORD!r}\npin      = {PIN!r} (longueur 15 ; contenu libre)")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s, capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok = run(f"{PASSWORD}\n{PIN}\n")
    ko_pin = run(f"{PASSWORD}\n{'1'*14}\n")
    ko_pw = run("wrong\n")
    good = "solved" in ok and "Incorrect" in ko_pin and "incorrect" in ko_pw.lower()
    print("OK:", "solved" in ok, "| KO pin 14 car.:", "Incorrect" in ko_pin, "| KO password:", "incorrect" in ko_pw.lower())
    sys.exit(0 if good else 1)
