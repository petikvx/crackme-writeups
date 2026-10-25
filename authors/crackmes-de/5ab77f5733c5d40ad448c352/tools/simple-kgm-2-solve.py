#!/usr/bin/env python3
"""Simple KGM 2 (v3sa) keygen : name -> (serial1 decimal, serial2 hex RSA).

Usage: simple-kgm-2-solve.py [name] [-q]   (défaut : petik)
"""
import sys

M = 0xFFFFFFFF
N = 0xF1CB476270EA27E9          # module RSA (chaîne en .data 0x40401b)
E = 0x10001                     # exposant public (0x40402c)


def ror(x, n): return ((x >> n) | (x << (32 - n))) & M
def rol(x, n): return ((x << n) | (x >> (32 - n))) & M


def f(x):  # sub_401283
    a = x
    for _ in range(0x666):
        a = (a + 0x68656865) & M
        a = ror(a, 8)
        a = (a - 0x65686568) & M
        a = rol(a, 0x16)
        b = a
        a = (~a) & M
        cf = 1 if b < a else 0
        b = (b - a) & M
        a = (a + b + cf) & M
        a = ror(a, 6)
    a = (a + 0x61733376) & M
    a ^= 0x76337361
    a = ((a & 0xFFFF) << 16) | 0xDEAD
    return (a - 0xD00EA00D) & M


def name_hash(name):
    b = name.encode()
    n = len(b)
    assert 4 <= n <= 32, "nom : 4..32 caractères"
    esi = 0
    edx = 0
    eax = 0
    for _ in range(31):
        edx += 1
        c = b[edx - 1]
        if edx == n:
            edx = 0
        eax = f((((c + esi) & M) << 4) + 0x10001 & M)
        esi = (esi + eax) & M
    return eax


def factor(n):
    from math import isqrt
    # Pollard rho
    import random
    from math import gcd
    while True:
        c = random.randrange(1, n)
        x = y = random.randrange(2, n)
        d = 1
        while d == 1:
            x = (x * x + c) % n
            y = (y * y + c) % n
            y = (y * y + c) % n
            d = gcd(abs(x - y), n)
        if d != n:
            return d, n // d


def keygen(name):
    h = name_hash(name)
    s1 = (h + 0xD4) & M
    target = int("%08X" % h, 16)
    if "%08X" % h != "%X" % h:
        print("! hash avec zéro de tête (%08X) : le binaire compare sans zéros, choisir un autre nom" % h, file=sys.stderr)
    p, q = factor(N)
    d = pow(E, -1, (p - 1) * (q - 1))
    s2 = pow(target, d, N)
    return s1, "%X" % s2, h


if __name__ == "__main__":
    args = [a for a in sys.argv[1:] if a != "-q"]
    name = args[0] if args else "petik"
    s1, s2, h = keygen(name)
    if "-q" in sys.argv:
        print(s1, s2)
    else:
        print("name   =", name)
        print("hash   = %08X" % h)
        print("serial1 (décimal) =", s1)
        print("serial2 (hex)     =", s2)
