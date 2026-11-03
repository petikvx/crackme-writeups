#!/usr/bin/env python3
"""Keygen KeyWizard 1 (Disasm Disease) : name -> serial.

Usage: keywizard1-solve.py [-q] [--check SERIAL] [NAME]   (défaut NAME = petik1 : "petik" fait 5 car., minimum 6)
Le nom doit faire >= 6 caractères (ASCII) ; le serial = 8 derniers caractères
du nom transformé par Button1_Click (VB.NET).
"""
import argparse, sys

TABLE = {
    "N": "7A(C(KAL", "O": "AC(/3AVK", "P": "9!?988DA", "Q": "CAKEAJKH",
    "R": "CAEK8462", "S": "TUAIJKEW", "T": "AMM(X/78", "U": "RAPHHUXA",
    "V": "D7A)(HAK", "W": "ECMLEKKK", "X": "AWEFHANN", "Y": "EWJKANBX",
    "Z": "NOCPWWXY",
}

def keygen(name: str) -> str:
    if len(name) < 6:
        raise ValueError("nom trop court (>= 6 caractères)")
    w = name
    # boucle VB : Replace(w, Chr(n), Chr(n-19)) pour n = 65..255 (séquentiel)
    for n in range(65, 256):
        w = w.replace(chr(n), chr(n - 19))
    # puis Replace séquentiel N..Z (les expansions peuvent être re-remplacées)
    for k in "NOPQRSTUVWXYZ":
        w = w.replace(k, TABLE[k])
    return w[-8:]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik1")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    s = keygen(a.name)
    if a.check is not None:
        ok = s == a.check
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    print(s if a.q else f"name={a.name!r} serial={s!r}")

if __name__ == "__main__":
    main()
