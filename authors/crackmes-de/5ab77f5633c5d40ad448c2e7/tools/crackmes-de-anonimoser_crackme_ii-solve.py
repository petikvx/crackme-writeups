#!/usr/bin/env python3
"""Keygen AnonimoSer CrackME II (crackmes.one 5ab77f5633c5d40ad448c2e7).

Reproduit la routine de vérification 0x45B71C (Delphi, après upx -d) :
  n = len(nom) >= 5 ; v = nom[0] * somme(nom) * 6n          (int32 signé)
  S1 = str(v) ; pour chaque caractère c : v += c, acc += somme des chiffres de str(v)
  S1 += str(acc * (len(str(v_final)) + 1))
  T = ''.join(chr(0x41 + int(S1[i]) + int(S1[i+1])))
  code = S1 + T + "-AS"
"""
import sys

def s32(x):
    x &= 0xffffffff
    return x - (1 << 32) if x & 0x80000000 else x

def keygen(name: str) -> str:
    b = name.strip().encode("latin-1")
    n = len(b)
    if n < 5:
        raise ValueError("nom : 5 caractères minimum")
    v = s32(b[0] * sum(b))
    v = s32(v * (6 * n))
    s1 = str(v)
    acc = 0
    esi = 1
    for c in b:
        v = s32(v + c)
        t = str(v)
        if "-" in t:
            raise ValueError("valeur négative : StrToInt('-') lèverait une exception, choisir un autre nom")
        for esi, ch in enumerate(t, 1):
            acc = s32(acc + int(ch))
        esi = len(t) + 1
    s1 += str(s32(acc * esi))
    if "-" in s1:
        raise ValueError("S1 contient '-', choisir un autre nom")
    t = "".join(chr(0x41 + int(s1[i]) + int(s1[i + 1])) for i in range(len(s1) - 1))
    return s1 + t + "-AS"

if __name__ == "__main__":
    for nm in (sys.argv[1:] or ["petik"]):
        print(f"{nm} -> {keygen(nm)}")
