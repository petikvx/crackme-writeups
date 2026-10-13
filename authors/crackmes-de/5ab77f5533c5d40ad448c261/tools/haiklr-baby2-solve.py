#!/usr/bin/env python3
"""Keyfile generator — Baby Crackme #2 (haiklr).

Le binaire ouvre le fichier « BC#2 » (répertoire courant), en lit 0x14 octets k[0..19]
et vérifie :
  1. k[1..4] = k[0]+1 .. k[0]+4 (suite d'octets consécutifs)
  2. k0² + k1² + k2² == k3² + k4²          → seule solution : k0 = 10 (10,11,12,13,14)
  3. k11 - k10 == 1  et  k10*k11 - 0x1145 == k10 + k11   → k10 = 67 ('C'), k11 = 68 ('D')
  4. n = (10*k12 + k13)² + (10*k13 + k12) + 2 doit être un carré parfait (test fsqrt/frndint)
Les autres octets sont libres.
"""
import argparse, math
from pathlib import Path

def check(k: bytes) -> bool:
    k = k.ljust(20, b"\0")
    if any(k[i] - k[i - 1] != 1 for i in range(1, 5)):
        return False
    if k[0]**2 + k[1]**2 + k[2]**2 != k[3]**2 + k[4]**2:
        return False
    a, b = k[10], k[11]
    if b - a != 1 or a * b - 0x1145 != a + b:
        return False
    p, q = k[12], k[13]
    n = (10 * p + q) ** 2 + (10 * q + p) + 2
    return math.isqrt(n) ** 2 == n

def solve() -> bytes:
    a0 = next(a for a in range(256 - 4)
              if a*a + (a+1)**2 + (a+2)**2 == (a+3)**2 + (a+4)**2)
    x = next(x for x in range(255) if x*(x+1) - 0x1145 == 2*x + 1)
    # préférence : k12/k13 imprimables, sinon le plus petit couple
    pairs = [(p, q) for p in range(256) for q in range(256)
             if math.isqrt((10*p+q)**2 + 10*q + p + 2)**2 == (10*p+q)**2 + 10*q + p + 2]
    pr = [pq for pq in pairs if all(0x21 <= c < 0x7f for c in pq)]
    p, q = (pr or pairs)[0]
    k = bytearray(b"-----petik".ljust(20, b"-"))   # octets libres : décoratifs
    k[0:5] = bytes(range(a0, a0 + 5))
    k[10:12] = bytes([x, x + 1])
    k[12:14] = bytes([p, q])
    return bytes(k)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-o", "--out", type=Path, default=Path("BC#2"))
    a = ap.parse_args()
    k = solve()
    assert check(k)
    a.out.write_bytes(k)
    print(f"{a.out} = {k.hex()}  ({k!r})")
