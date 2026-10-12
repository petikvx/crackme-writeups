#!/usr/bin/env python3
"""Keygen SacredCrackme 5.0 (sacredlamat, Turbo Pascal for Windows / WinCrt, Win16 NE).
  s      = nom + 'Sorry, wrong!'          (constante concaténée, jamais affichée)
  serial = 0x15D + somme( UpCase(c) + 0x381  pour c dans s )
Le serial est lu en Integer (16 bits signé) puis comparé, après cwd, au longint : il faut serial <= 32767
(noms d'environ 20 caractères max).
usage : sacred5-solve.py [--name petik] [-q] [--check SERIAL]
"""
import argparse
SALT = 'Sorry, wrong!'

def upcase(c):  # System.UpCase de TPW : seulement 'a'..'z'
    return c - 0x20 if 0x61 <= c <= 0x7a else c

def keygen(name: str) -> int:
    s = (name.encode('latin-1') + SALT.encode())[:255]
    return 0x15D + sum(upcase(c) + 0x381 for c in s)

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik'); ap.add_argument('-q', action='store_true'); ap.add_argument('--check', type=int)
    a = ap.parse_args(); k = keygen(a.name)
    if k > 32767: raise SystemExit(f'{a.name}: somme {k} > 32767, aucun serial Integer possible')
    if a.check is not None:
        print('OK' if a.check == k else 'KO'); raise SystemExit(a.check != k)
    print(k if a.q else f'{a.name} -> {k}')
