#!/usr/bin/env python3
"""Keygen — crackmes.de's anonimoser_crackme_i by anonimoser (5ab77f5633c5d40ad448c2e8).

Handler Delphi « aver » (BitBtn1.OnClick, 0x45b0a4 dans l'exe dépacké UPX) :
  nom = Trim(Edit1), n = len(nom) >= 5
  v   = nom[0] * Σnom + 2n                (entier 32 bits signé)
  S1  = str(v)
  pour chaque caractère c : v += c ; acc += somme des chiffres de str(v)
  S1 += str(acc)
  T   = chr(0x41 + d_i + d_{i+1}) pour chaque paire de chiffres consécutifs de S1
  code = S1 + T
Usage : python3 crackmes-de-anonimoser_crackme_i-solve.py [nom]   (défaut : petik)
"""
import sys

def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x

def serial(name: str) -> str:
    name = name.strip()
    b = name.encode("latin-1")
    n = len(b)
    if n < 5:
        raise SystemExit("le nom doit faire au moins 5 caractères")
    v = s32(b[0] * sum(b) + 2 * n)
    s1 = str(v)
    acc = 0
    for c in b:
        v = s32(v + c)
        acc += sum(int(ch) for ch in str(v) if ch.isdigit())
    s1 += str(acc)
    t = "".join(chr(0x41 + int(s1[i]) + int(s1[i + 1])) for i in range(len(s1) - 1))
    return s1 + t

if __name__ == "__main__":
    nom = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{nom} -> {serial(nom)}")
