#!/usr/bin/env python3
"""Générateur de serial — Baby Crackme #1 (haiklr).

Serial : exactement 29 caractères dans '0'..'?' (0x30..0x3f), convertis en « chiffres »
d[i] = c - 0x30 (donc 0..15). Un seul '7', obligatoirement en position 6.
d0, d4, d8, d12, d16, d21 ≠ 0. Découpage « décimal » (v = v*10 + d) :
  N1 = d0..d3, N2 = d4..d7, N3 = d8..d11, N4 = d12..d15, N5 = d16..d20, N6 = d21..d28
Conditions : d5 == 0, N3 == 7*N1 (d6 = 7), N4 == d4*N1, N5 == d7*N1,
             N6 == N5 + 10*N3 + 1000*N4.
"""
import argparse, sys

def digits_of(s):
    return [ord(c) - 0x30 for c in s]

def parse(d):
    v = 0
    for x in d:
        v = v * 10 + x
    return v

def check(s: str) -> bool:
    if len(s) != 29 or any(not (0x30 <= ord(c) < 0x40) for c in s):
        return False
    if s.count("7") != 1 or s[6] != "7":
        return False
    d = digits_of(s)
    if 0 in (d[0], d[4], d[8], d[12], d[16], d[21]):
        return False
    n1, n3, n4, n5, n6 = parse(d[0:4]), parse(d[8:12]), parse(d[12:16]), parse(d[16:21]), parse(d[21:29])
    return (d[5] * n1 == 0 and d[6] * n1 == n3 and d[4] * n1 == n4 and d[7] * n1 == n5
            and n5 + 10 * n3 + 1000 * n4 == n6)

def enc(v: int, length: int):
    """Représentation de v sur `length` chiffres 0..15 sans 7, premier ≠ 0 (préfère 0..9)."""
    def rec(v, L, first):
        if L == 0:
            return "" if v == 0 else None
        p = 10 ** (L - 1)
        for dgt in sorted(range(16), key=lambda x: (x > 9, -x)):
            if dgt == 7 or (first and dgt == 0) or dgt * p > v:
                continue
            r = rec(v - dgt * p, L - 1, False)
            if r is not None:
                return chr(0x30 + dgt) + r
        return None
    return rec(v, length, True)

def solve(n1_start=1234):
    for n1 in range(n1_start, 10000):
        a1 = enc(n1, 4)
        if not a1:
            continue
        for a in [x for x in range(1, 16) if x != 7]:
            for b in [x for x in range(0, 16) if x != 7]:
                parts = [a1, chr(0x30 + a) + "07" + chr(0x30 + b), enc(7 * n1, 4), enc(a * n1, 4),
                         enc(b * n1, 5), enc(b * n1 + 70 * n1 + 1000 * a * n1, 8)]
                if None in parts:
                    continue
                s = "".join(parts)
                if check(s):
                    return s
    raise SystemExit("aucune solution")

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", metavar="SERIAL")
    ap.add_argument("--n1", type=int, default=1234)
    a = ap.parse_args()
    if a.check:
        print("OK" if check(a.check) else "FAIL"); sys.exit(0 if check(a.check) else 1)
    print(solve(a.n1))
