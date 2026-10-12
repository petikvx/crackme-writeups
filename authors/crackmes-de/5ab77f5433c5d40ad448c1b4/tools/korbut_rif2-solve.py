#!/usr/bin/env python3
"""Keygen RIF crackme #2 (Dr. rED mEAT / korbut) : somme de 4 termes signés ^0x90 == 0x14F."""
import sys, itertools
def sx(b): b &= 0xff; return b - 256 if b > 127 else b
def score(a, b):
    t1 = sx(a[0] ^ 0x3c ^ 9)
    t2 = sx((b[0] ^ 9) ^ (t1 & 0xff))
    t3 = sx(a[2] + b[2]) + sx(b[2])
    t4 = sx(b[4]) + sx(a[4])
    return ((t1 + t2 + t3 + t4) & 0xffffffff) ^ 0x90
def keygen(name):
    a = name.encode('latin-1')
    assert len(a) >= 5, "nom >= 5 caractères"
    pr = range(0x30, 0x7b)
    for b0, b2, b4 in itertools.product(pr, pr, pr):
        b = bytes([b0, ord('X'), b2, ord('X'), b4])
        if score(a, b) == 0x14f:
            return b.decode()
if __name__ == '__main__':
    n = sys.argv[1] if len(sys.argv) > 1 else 'petik'
    print(n, '->', keygen(n))
