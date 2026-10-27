#!/usr/bin/env python3
"""Keygen crackme_1 by dip22e (crcme.exe).

Règle : serial de 8 lettres a-z, avec serial[i] % (8-i) == 0.
Pas de nom d'utilisateur : le serial ne dépend de rien (petik n'est pas utilisé).

  crcme-solve.py            -> serial par défaut
  crcme-solve.py -r [-n N]  -> serials aléatoires
  crcme-solve.py --check S  -> vérifie S (code 0 si valide)
  crcme-solve.py -q         -> n'affiche que le serial
"""
import argparse, random, sys

def ok(s):
    return len(s) == 8 and all('a' <= c <= 'z' and ord(c) % (8 - i) == 0 for i, c in enumerate(s))

def cands(i):
    return [chr(c) for c in range(0x61, 0x7b) if c % (8 - i) == 0]

def main():
    a = argparse.ArgumentParser()
    a.add_argument('-r', action='store_true'); a.add_argument('-n', type=int, default=1)
    a.add_argument('-q', action='store_true'); a.add_argument('--check')
    a = a.parse_args()
    if a.check is not None:
        print('OK' if ok(a.check) else 'KO'); sys.exit(0 if ok(a.check) else 1)
    for _ in range(a.n):
        s = ''.join(random.choice(cands(i)) if a.r else cands(i)[1] for i in range(8))
        assert ok(s)
        print(s if a.q else f'serial = {s}')
        if not a.r: break

if __name__ == '__main__':
    main()
