#!/usr/bin/env python3
"""pranav — unlockme : password[i] ^ 0x50 == table[i], longueur fixe 15.

c_fun003 : vérifie 2*strlen(argv[1])-1 == 0x1d -> strlen == 15.
c_fun004 : XOR chaque octet de argv[1] avec 0x50 (dans une copie).
c_fun001 : compare le résultat octet par octet à la table posée sur la pile (15 octets + NUL).
Usage : unlockme-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "a.out"
TABLE = [0x09, 0x35, 0x23, 0x09, 0x3F, 0x25, 0x13, 0x22, 0x31, 0x33, 0x3B, 0x35, 0x34, 0x1D, 0x35]
PASSWORD = "".join(chr(b ^ 0x50) for b in TABLE)
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(PASSWORD); sys.exit(0)
print(f"password = {PASSWORD}  ({len(PASSWORD)} caractères)")
if a.check:
    run = lambda s: subprocess.run([str(EXE), s], capture_output=True, text=True).stdout
    ok, ko = run(PASSWORD), run("wrong_wrong_15c")
    good = "You have done it" in ok and "You have failed" in ko
    print("OK:", "You have done it" in ok, "| KO:", "You have failed" in ko)
    sys.exit(0 if good else 1)
