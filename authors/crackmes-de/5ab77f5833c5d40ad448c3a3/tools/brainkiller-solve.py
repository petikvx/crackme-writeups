#!/usr/bin/env python3
"""Keygen BrainKiller KeyGenMe (crackmes.de) -- serial format AAA-BBBB-CCCC-DDDD.

Pas de username : le serial seul est testé (18 caractères).
  AAA   : permutation de {1,3,4} (racines de x^3-8x^2+19x-12) -> "Professional"
  BBBB  : 4 chiffres de somme 8
  CCCC  : 4 chiffres de somme 19
  DDDD  : 4 chiffres de somme 12
Usage : brainkiller-solve.py [-q] [--seed N] [--check SERIAL]
"""
import argparse, itertools, random, re


def check(s):
    """Réplique du prédicat (0x4012f0). Retourne 0..3 racines, ou None si KO."""
    if len(s) != 18 or s[3] != '-' or s[8] != '-' or s[13] != '-':
        return None
    v = [int(c) if c.isdigit() else 0 for c in s]  # atoi d'un seul char
    if sum(v[4:8]) != 8 or sum(v[9:13]) != 19 or sum(v[14:18]) != 12:
        return None
    a, b, c = v[0:3]
    if a == b or b == c or a == c:
        return None
    n = sum(x**3 - 8 * x**2 + 19 * x - 12 == 0 for x in (a, b, c))
    return n if n else None  # 0 racine -> Bad Boy


def group(rng, total):
    while True:
        d = [rng.randint(0, 9) for _ in range(4)]
        if sum(d) == total:
            return ''.join(map(str, d))


def keygen(seed=None):
    rng = random.Random(seed)
    p = list('134'); rng.shuffle(p)
    return '%s-%s-%s-%s' % (''.join(p), group(rng, 8), group(rng, 19), group(rng, 12))


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--seed', type=int)
    ap.add_argument('--check')
    a = ap.parse_args()
    if a.check:
        r = check(a.check)
        print({None: 'KO (Bad Boy)', 1: 'Lite', 2: 'Standard', 3: 'Professional'}[r])
    else:
        k = keygen(a.seed)
        print(k if a.q else 'Serial: ' + k)
