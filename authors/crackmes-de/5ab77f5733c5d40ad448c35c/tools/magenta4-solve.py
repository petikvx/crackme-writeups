#!/usr/bin/env python3
"""Keygen Crackme#4 (magenta, VB5).

Password = 8 chiffres d1..d8 (d1 != 0, car le texte passe par Val()).
Prédicat (Command1_Click, 0x402040) :
    d1*d2 + d5*d6 + d7 - d8 - (d3 & d4) == 10
où (d3 & d4) est la CONCATENATION des chaînes (Variant String + String)
soit 10*d3 + d4.

Usage: magenta4-solve.py [-q] [--all N] [--check PASSWORD]
"""
import argparse, itertools

def ok(p):
    if len(p) != 8 or not p.isdigit() or p[0] == '0':
        return False
    d = [int(c) for c in p]
    return d[0]*d[1] + d[4]*d[5] + d[6] - d[7] - (10*d[2] + d[3]) == 10

def gen():
    for n in range(10_000_000, 100_000_000):
        s = str(n)
        if ok(s):
            yield s

ap = argparse.ArgumentParser()
ap.add_argument('-q', action='store_true')
ap.add_argument('--all', type=int, default=0, help='afficher N solutions')
ap.add_argument('--check')
a = ap.parse_args()
if a.check:
    print('OK' if ok(a.check) else 'KO'); raise SystemExit(0 if ok(a.check) else 1)
if a.all:
    for s in itertools.islice(gen(), a.all): print(s)
else:
    s = next(gen())
    print(s if a.q else f'Password: {s}')
