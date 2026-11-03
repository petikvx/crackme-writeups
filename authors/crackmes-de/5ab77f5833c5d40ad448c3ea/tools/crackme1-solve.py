#!/usr/bin/env python3
"""Keygen pour tossic_shamrock Crackme1 (Delphi, crackmes.de).

mid[i] = chr(((ord(name[i-1]) ^ i) + (i | 3)) & 0xFF)   pour i = 1..n   (LStrFromChar)
serial = UpperCase("LL2TF-" + mid + "-ALFIGH")           (UpperCase : a-z -> A-Z uniquement)
Nom : >= 4 caractères.

usage: crackme1-solve.py [--name petik] [-q]
"""
import argparse, sys

def keygen(name: str) -> str:
    if len(name) < 4:
        raise ValueError("le nom doit faire au moins 4 caractères")
    mid = "".join(chr(((ord(c) ^ i) + (i | 3)) & 0xFF) for i, c in enumerate(name, 1))
    s = "LL2TF-" + mid + "-ALFIGH"
    # UpperCase Delphi (0x4082bc) : seulement 'a'..'z'
    return "".join(chr(ord(c) - 0x20) if "a" <= c <= "z" else c for c in s)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    s = keygen(a.name)
    if not all(32 <= ord(c) < 127 for c in s):
        print("attention: serial avec caractères non imprimables (nom peu pratique)", file=sys.stderr)
    print(s if a.q else f"name={a.name}\nserial={s}")
