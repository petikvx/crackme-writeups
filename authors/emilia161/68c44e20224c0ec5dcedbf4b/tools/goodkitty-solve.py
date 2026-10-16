#!/usr/bin/env python3
"""Emilia161 — good kitty (crack) : mot de passe de 8 caractères dérivé d'un calcul.

main @0x12ac :
  p = ppeuler_3()            # plus grand facteur premier de 0x8be589eac7 = 600851475143 -> 6857
  p = (int)cbrt((double)p)   # cvttsd2si -> 18 (18.99.. tronqué, pas 19)
  p = factorial(p)           # 18! = 6402373705728000, uint64
  8 octets LE de p, chacun replié vers [0-9A-Za-z] (boucle @0x1329..0x1367)
  read(0, buf, 0x40) ; il faut read()-1 == 8 et buf[0..7] == octets repliés
Usage : goodkitty-solve.py [-q] [--check]
"""
import argparse, math, struct, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crack"


def lpf(n):                       # ppeuler_3 : division par d croissant tant que d*d <= n
    d = 2; best = 1
    while d * d <= n:
        if n % d == 0:
            n //= d; best = d
        else:
            d += 1
    return n if n > 1 else best


def fold(c):                      # 0x1329..0x1367
    if (c & 0xDF) - 0x41 in range(26) or c - 0x30 in range(10):
        return c
    q = (((c >> 1) * 0x85) & 0xFFFF) >> 12
    s = c - q * 62
    if 10 <= s <= 35:
        return s + 0x37           # 'A'..'Z'
    al = (s + 0x30) & 0xFF
    return s + 0x3D if al > 0x53 else al   # 'a'..'z' ou '0'..'9'


def solve():
    p = lpf(0x8BE589EAC7)
    p = int(math.cbrt(p))
    f = math.factorial(p) & 0xFFFFFFFFFFFFFFFF
    return bytes(fold(b) for b in struct.pack("<Q", f)).decode()


ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
pw = solve()
if a.q:
    print(pw); sys.exit(0)
print("password =", pw)
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(pw), run("nopenope")
    print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
    sys.exit(0 if "good kitty" in ok and "bad kitty" in ko else 1)
