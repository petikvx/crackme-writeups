#!/usr/bin/env python3
"""Keygen — crackmes.de's easyone (name/serial) by therapy.

Pour chaque caractère c = name[i] :
  r = racine carrée entière de c, par dichotomie 8 bits (_checkserial 0x401300..0x401361)
  serial[i] = '0' + ((c - r*r + i*i) % 10)
len(name) >= 5, len(serial) == len(name).
Usage : easyone-solve.py [--name petik] [-q] [--check SERIAL]
"""
import argparse

def isqrt_bisect(c):
    """Réplique exacte de la boucle de dichotomie (lo=[ebp-5], hi=[ebp-7], mid=[ebp-6])."""
    lo, hi = 0, c
    while True:
        mid = ((lo + hi) >> 1) & 0xff
        sq = mid * mid
        if sq > c:
            hi = mid
        if sq < c:
            lo = mid
        flag = 0
        if lo + 1 == hi:
            flag = 2
        if sq == c:
            flag = 1
        if flag:
            return lo if flag == 2 else mid

def serial(name: str) -> str:
    nb = name.encode('ascii')
    if len(nb) < 5:
        raise SystemExit('Name must be at least 5 chars long!')
    out = ''
    for i, c in enumerate(nb):
        r = isqrt_bisect(c)
        out += chr(0x30 + (c - r * r + i * i) % 10)
    return out

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check')
    a = ap.parse_args()
    s = serial(a.name)
    if a.check is not None:
        ok = a.check == s
        print('OK' if ok else f'KO (attendu {s})'); raise SystemExit(0 if ok else 1)
    print(s if a.q else f'name={a.name}  serial={s}')
