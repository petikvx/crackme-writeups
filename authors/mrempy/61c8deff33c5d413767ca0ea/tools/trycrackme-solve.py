#!/usr/bin/env python3
"""MrEmpy — TryCrackMe : key = hex de "4@ss724536" (chaque octet -> "%02x" via sprintf).

main @0x11af : secret = "4@ss724536" (movabs 0x3534323773734034 + word 0x3633) ;
pour chaque octet, sprintf(buf, "%02x", octet) concatène les 2 caractères hex ; strncmp avec la saisie.
Usage : trycrackme-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "trycrackme"
SECRET = "4@ss724536"
KEY = "".join(f"{ord(c):02x}" for c in SECRET)
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(KEY); sys.exit(0)
print(f"secret = {SECRET!r}  ->  key = {KEY}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(KEY), run("deadbeef")
    good = "Correct key" in ok and "Incorrect key" in ko
    print("OK:", "Correct key" in ok, "| KO:", "Incorrect key" in ko)
    sys.exit(0 if good else 1)
