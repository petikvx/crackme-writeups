#!/usr/bin/env python3
"""RaphDev — PleaseCrackMe : password[i] = (username[i] + number) & 0xff, number dans [1,9].

main @0x11e9 : scanf username ; scanf number (1..9 sinon erreur) ; password[i] = username[i] + number
pour chaque octet ; strcmp avec la saisie du mot de passe.
Usage : pleasecrackme-solve.py [--user petik] [--number N] [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "PleaseCrackMe"
ap = argparse.ArgumentParser()
ap.add_argument("--user", default="petik")
ap.add_argument("--number", type=int, default=5, choices=range(1, 10))
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
pw = "".join(chr((ord(c) + a.number) & 0xFF) for c in a.user)
if a.q:
    print(pw); sys.exit(0)
print(f"username = {a.user}\nnumber   = {a.number}\npassword = {pw}")
if a.check:
    run = lambda n, p: subprocess.run([str(EXE)], input=f"{a.user}\n{n}\n{p}\n", capture_output=True, text=True).stdout
    ok, ko = run(a.number, pw), run(a.number, "wrong")
    good = "succesfully logged in" in ok and "Wrong password" in ko
    print("OK:", "succesfully logged in" in ok, "| KO:", "Wrong password" in ko)
    sys.exit(0 if good else 1)
