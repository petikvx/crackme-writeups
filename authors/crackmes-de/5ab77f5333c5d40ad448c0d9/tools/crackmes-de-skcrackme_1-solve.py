#!/usr/bin/env python3
"""Keygen skcrackme_1 by sknine9 : serial = octets de DES_k1(DES_k2(nom)) + 167, séparés par des espaces."""
import sys
from Cryptodome.Cipher import DES
from Cryptodome.Util.Padding import pad

K1, K2 = b"13248657", b"13377331"   # KClass.a() puis XClass.xmpio() (deux DECRYPT côté crackme)
DELTA = 1337 * 32 // (16 * 16)       # var*32 / (16*16) = 167

def keygen(name: str) -> str:
    c = DES.new(K2, DES.MODE_ECB).encrypt(pad(name.encode("latin-1"), 8))
    c = DES.new(K1, DES.MODE_ECB).encrypt(pad(c, 8))
    signed = [b - 256 if b > 127 else b for b in c]   # Java byte signé
    return " ".join(str(b + DELTA) for b in signed)

if __name__ == "__main__":
    for n in sys.argv[1:] or ["petik"]:
        print(n, "->", keygen(n))
