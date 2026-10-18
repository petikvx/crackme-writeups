#!/usr/bin/env python3
"""Keygen nirvana_crackme_i (anonimoser) — crackmes.one 5ab77f5633c5d40ad448c2e6.

serial = "%d" % int32(S*S) + "AS" + str(9*n*n)
  n = len(nom) (>= 4), L = nombre de chiffres de 9*n*n (retour de wsprintfA),
  S = (somme des octets du nom) * L   (mod 2^32), %d = entier signé 32 bits.
"""
import sys
def u32(x): return x & 0xFFFFFFFF
def s32(x): x = u32(x); return x - (1 << 32) if x & 0x80000000 else x
def serial(name: str) -> str:
    b = name.encode("latin-1")
    n = len(b)
    if n < 4:
        raise ValueError("nom de 4 caractères minimum")
    a = str(u32(9 * n * n))
    s = u32(sum(b) * len(a))
    return f"{s32(s * s)}AS{a}"
if __name__ == "__main__":
    for nm in sys.argv[1:] or ["petik"]:
        print(nm, serial(nm))
