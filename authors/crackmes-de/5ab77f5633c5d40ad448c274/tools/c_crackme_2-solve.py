#!/usr/bin/env python3
"""Keygen — Mayhem's C++ CrackMe #2 (crackmes.de, c_crackme_2 by mayhem).

hash(nom)  = Σ (60·ord(nom[i])·T[i] + 0x699)  mod 2^32   (T = table dword @0x416c98)
val(serial)= Σ idx(serial[i]) · 62^i  (alphabet a-z0-9A-Z, poids FAIBLE en tête)
Valide ssi (u32)val(serial) == hash(nom) ; nom non vide, ≤ 40 caractères.

  ./c_crackme_2-solve.py            # petik
  ./c_crackme_2-solve.py -n NOM -q  # serial seul
  ./c_crackme_2-solve.py -n petik --check SERIAL
"""
import argparse, sys

ALPHA = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
T = [211, 316, 282, 189, 156, 195, 122, 369, 324, 335, 239, 173, 314, 356, 179, 162,
     280, 164, 353, 192, 332, 392, 223, 245, 284, 212, 146, 167, 244, 311, 354, 308,
     141, 342, 290, 307, 183, 398, 139, 292]

def name_hash(name):
    h = 0
    for i, c in enumerate(name):
        h = (h + 60 * ord(c) * T[i] + 0x699) & 0xFFFFFFFF
    return h

def serial_value(s):
    v = 0
    for k, c in enumerate(s):
        i = ALPHA.find(c)
        if i < 0:
            i = 0xFFFFFFFF          # find() == -1 traité comme non signé par le binaire
        v += i * 62 ** k
    return v & 0xFFFFFFFF

def keygen(name):
    h = name_hash(name)
    out = ""
    while True:
        out += ALPHA[h % 62]
        h //= 62
        if not h:
            return out

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-n", "--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    if not 0 < len(a.name) <= 40:
        sys.exit("nom : 1 à 40 caractères")
    if a.check is not None:
        ok = serial_value(a.check) == name_hash(a.name)
        print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    s = keygen(a.name)
    print(s if a.q else f"{a.name} / {s}  (hash 0x{name_hash(a.name):08x})")

if __name__ == "__main__":
    main()
