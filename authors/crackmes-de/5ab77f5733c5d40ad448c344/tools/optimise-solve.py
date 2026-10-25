#!/usr/bin/env python3
"""Keygen pour crackmes.de « optimise » (obnoxious) — .NET WinForms.

Champs : Name | a | b | c | d
  d = somme des 16 octets du MD5(ASCII(name))
  (a,b,c) : système de contraintes linéaires (checkkey) — 16a+17b+10c = 20625 et 3 inégalités.
"""
import argparse, hashlib

T = "16171011420002113600122240013020625"
def n(o, l): return int(T[o:o + l])

def check(a, b, c):
    ok = [n(0,2)*a + n(2,2)*b + n(4,2)*c == n(30,5),
          n(5,1)*a + n(6,1)*b + n(8,1)*c <= n(9,4),
          n(13,1)*a + n(14,1)*b + n(15,1)*c <= n(16,4),
          n(20,1)*a + n(21,1)*b + n(22,1)*c <= n(23,4),
          n(27,1) <= n(28,2)]
    return all(ok)

def solve_abc():
    """Première solution entière >= 0 maximisant a+b+c (« optimise »)."""
    best = None
    for c in range(0, 2063):
        for b in range(0, 1213):
            r = n(30,5) - n(2,2)*b - n(4,2)*c
            if r < 0 or r % n(0,2): continue
            a = r // n(0,2)
            if check(a, b, c) and (best is None or a+b+c > sum(best)):
                best = (a, b, c)
    return best

def md5sum(name):
    return sum(hashlib.md5(name.encode("ascii")).digest())

def main():
    p = argparse.ArgumentParser()
    p.add_argument("--name", default="petik")
    p.add_argument("-q", action="store_true")
    p.add_argument("--check", nargs=4, type=int, metavar=("A", "B", "C", "D"))
    p.add_argument("--check-name", default=None)
    o = p.parse_args()
    if o.check:
        name = o.check_name or o.name
        print(check(*o.check[:3]) and o.check[3] == md5sum(name)); return
    a, b, c = solve_abc()
    d = md5sum(o.name)
    print(f"{a} {b} {c} {d}" if o.q else f"Name={o.name}\nKey: {a} | {b} | {c} | {d}")

if __name__ == "__main__":
    main()
