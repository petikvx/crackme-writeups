#!/usr/bin/env python3
"""Keygen gc_crackme_10 (gandalf) — Delphi, UPX.

Edit1 = nom (lettres uniquement, >= 5 car. ; le TEdit force les MAJUSCULES)
Edit2 = f(nom) : edi = 0x8991b ^ XOR_{i=1,3,5..<=len-1}((nom[i] % 5) * 0xefd5f), puis ^ 0x8991b
Edit3 = constante (indépendante du nom) : n chiffres tel que n fois
        y = (y ^ 0x15e86) & 0x11ef0 donne 0x10ae0  (plus petite : 13408)

Usage : gc-crackme10-solve.py [--name petik] [-q] [--check]
"""
import argparse

def edit3():
    f = lambda y: (y ^ 0x15E86) & 0x11EF0
    for x in range(1, 10**9):
        z = x
        for _ in range(len(str(x))):
            z = f(z)
        if z == 0x10AE0:
            return x

def edit2(name):
    if len(name) < 5 or not name.isalpha() or not name.isascii():
        raise ValueError("nom : lettres ASCII uniquement, >= 5 caractères")
    name = name.upper()                           # Edit1.CharCase = ecUpperCase
    edi = 0x8991B
    for esi in range(2, len(name) + 1, 2):       # bl += 2 ; tant que len >= esi
        edi ^= (ord(name[esi - 1]) % 5) * 0xEFD5F
    return edi ^ 0x8991B

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true", help="n'affiche que Edit2 Edit3")
    ap.add_argument("--check", action="store_true", help="auto-test (vecteurs validés live)")
    o = ap.parse_args()
    if o.check:
        assert edit3() == 13408
        print("OK", edit2("petik"), edit3())
    elif o.q:
        print(edit2(o.name), edit3())
    else:
        print(f"Edit1 (nom) : {o.name}\nEdit2       : {edit2(o.name)}\nEdit3       : {edit3()}")
