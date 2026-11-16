#!/usr/bin/env python3
"""fon37 "The Winner" : RSA-1024 avec d petit -> attaque de Wiener.

Usage: the-winner-solve.py [-q] [--check] [binaire ELF extrait du ZIP]
Le ZIP (original/download.bin, mdp crackmes.one) contient l'ELF `crackme`.
"""
import re, sys, zipfile, io, subprocess, os, tempfile
from math import isqrt

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
M = (1 << 1024) - 1
ror = lambda x, k: ((x >> k) | (x << (1024 - k))) & M
rol = lambda x, k: ((x << k) | (x >> (1024 - k))) & M


def load():
    elf = zipfile.ZipFile(ZIP).read("crackme", pwd=b"crackmes.one")
    v = [int(x) for x in re.findall(rb"\d{100,}", elf)]
    return elf, ror(v[0], 3), rol(v[1], 4), rol(v[2], 7)  # n, e, C


def wiener(e, n):
    h0, h1, k0, k1 = 0, 1, 1, 0
    a, b = e, n
    while b:
        q = a // b
        a, b = b, a - q * b
        h0, h1 = h1, q * h1 + h0
        k0, k1 = k1, q * k1 + k0
        if k1 > 1 and (e * k1 - 1) % h1 == 0:
            s = n - (e * k1 - 1) // h1 + 1
            D = s * s - 4 * n
            if D >= 0 and isqrt(D) ** 2 == D:
                return k1  # d
    raise SystemExit("Wiener a échoué")


def main():
    elf, n, e, C = load()
    d = wiener(e, n)
    m = pow(C, d, n)
    pw = m.to_bytes((m.bit_length() + 7) // 8, "big")
    if "-q" in sys.argv:
        print(pw.decode())
    else:
        print("d =", d)
        print("password =", pw.decode())
    if "--check" in sys.argv:
        with tempfile.TemporaryDirectory() as t:
            p = os.path.join(t, "crackme")
            open(p, "wb").write(elf); os.chmod(p, 0o755)
            r = subprocess.run([p], input=pw + b"\n", capture_output=True)
            print(r.stdout.decode()); sys.exit(0 if b"You win" in r.stdout else 1)


main()
