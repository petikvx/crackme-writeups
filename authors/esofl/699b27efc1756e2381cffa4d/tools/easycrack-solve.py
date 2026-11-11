#!/usr/bin/env python3
"""esofl's easycrack : le mot de passe est le préimage SHA-256 du hash stocké.

Usage : easycrack-solve.py [-q] [--check CANDIDAT] [--hash HEX]
Retrouve le préimage dans une petite wordlist (le hash est celui de « password »).
"""
import argparse, hashlib, sys

STORED = "5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8"  # .rdata de main.exe
WORDS = ["password", "admin", "123456", "easycrack", "esofl", "petik", "letmein", "qwerty"]

def ok(pw, h=STORED):
    return hashlib.sha256(pw.encode()).hexdigest() == h

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    ap.add_argument("--hash", default=STORED)
    a = ap.parse_args()
    if a.check is not None:
        good = ok(a.check, a.hash)
        print("OK" if good else "KO")
        sys.exit(0 if good else 1)
    for w in WORDS:
        if ok(w, a.hash):
            print(w if a.q else f"password = {w}")
            return
    sys.exit("pas trouvé dans la wordlist")

main()
