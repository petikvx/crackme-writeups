#!/usr/bin/env python3
"""Keygen — lfalchs_1st_crackme (LFalch, crackmes.one 5ab77f5633c5d40ad448c2df).

serial = 16 caractères tirés de ALPHABET avec java.util.Random(seed),
seed = name.hashCode() | "LFalch".hashCode()   (OR bit à bit, int 32 bits signé).
Le serial est comparé en minuscules (la saisie est passée en toLowerCase()).
"""
import sys

ALPHABET = "01234589abcdefghijklmnopqrstuvwxyz"  # 34 car. (pas de 6 ni de 7)

def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x

def java_hash(s):
    h = 0
    units = s.encode("utf-16-le")
    for i in range(0, len(units), 2):
        h = (31 * h + int.from_bytes(units[i:i + 2], "little")) & 0xFFFFFFFF
    return s32(h)

class JavaRandom:
    MULT, ADD, MASK = 0x5DEECE66D, 0xB, (1 << 48) - 1

    def __init__(self, seed):
        self.seed = (seed ^ self.MULT) & self.MASK

    def next(self, bits):
        self.seed = (self.seed * self.MULT + self.ADD) & self.MASK
        return s32(self.seed >> (48 - bits))

    def next_int(self, bound):
        if bound & -bound == bound:
            return s32((bound * self.next(31)) >> 31)
        while True:
            bits = self.next(31)
            val = bits % bound
            if bits - val + (bound - 1) < (1 << 31):
                return val

def keygen(name):
    seed = s32(java_hash(name) | java_hash("LFalch"))
    r = JavaRandom(seed)
    return "".join(ALPHABET[r.next_int(len(ALPHABET))] for _ in range(16))

if __name__ == "__main__":
    for n in (sys.argv[1:] or ["petik"]):
        print(f"{n} -> {keygen(n)}")
