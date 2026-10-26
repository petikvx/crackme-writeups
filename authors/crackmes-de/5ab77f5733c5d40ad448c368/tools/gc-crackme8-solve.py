#!/usr/bin/env python3
"""Keygen gc_crackme_8 (gandalf) — Delphi, UPX 0.92.

Edit1 = nom (identifiant Delphi valide, >= 5 car., assigné comme Name du TForm1)
Edit2 = texte quelconque non vide (ignoré par le prédicat)
Edit3 = A, Edit4 = B (entiers décimaux signés 32 bits), dérivés des 5 premiers
        caractères du nom dans l'ordre n[3], n[1], n[4], n[0], n[2].

Usage : gc-crackme8-solve.py [--name petik] [-q] [--check]
"""
import argparse, re

def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x

def keygen(name):
    if len(name) < 5 or not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", name):
        raise ValueError("nom : identifiant Delphi valide, >= 5 caractères")
    arr = [ord(name[i]) for i in (3, 1, 4, 0, 2)]
    a = b = 0
    for v in arr:
        a = (((v * 0xD80 + a) & 0xFFFFFFFF) ^ 0x3A115)
        b = (((v * 0x1A62 + b) & 0xFFFFFFFF) ^ 0xDDC36)
    return s32(a), s32(b)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true", help="n'affiche que Edit3 Edit4")
    ap.add_argument("--check", action="store_true", help="auto-test sur petik")
    o = ap.parse_args()
    a, b = keygen(o.name)
    if o.check:
        # vecteurs validés en live (Wine) : écran « Success! »
        assert keygen("petik") == (1402517, 4834592)
        assert keygen("Gandalf") == (1961877, 4673424)
        print("OK")
    elif o.q:
        print(a, b)
    else:
        print(f"Edit1 (nom)    : {o.name}\nEdit2          : x (non vide)\nEdit3          : {a}\nEdit4          : {b}")
