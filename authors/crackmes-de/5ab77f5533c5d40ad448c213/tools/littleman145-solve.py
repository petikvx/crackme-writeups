#!/usr/bin/env python3
"""Keymaker « Little Man 1.45 » (bswap). Un seul champ (0xc9) ; le clic « Register » ne valide jamais
(or al,1 / jne) : c'est le handler WM_TIMER (0x401691) qui teste le dword key[4..7] :
  key[5] == '-'  et (key[4] == '1' ou key[5] == '-')   -> 2e test toujours vrai
  puis bswap : key[7] == 'S' ou key[6] == '8'
usage : littleman145-solve.py [PREFIXE5] | --check CLE
"""
import sys

def check(k):
    k = (k.encode() + bytes(8))[:8]
    if k[5] != 0x2d: return False
    if not (k[4] == 0x31 or k[5] == 0x2d): return False
    return k[7] == 0x53 or k[6] == 0x38

def keygen(prefix='petik'):
    p = (prefix + '#####')[:5]
    return p + '-8S'

if __name__ == '__main__':
    a = sys.argv[1:]
    if a[:1] == ['--check']:
        print('OK' if check(a[1]) else 'KO'); sys.exit()
    k = keygen(a[0] if a else 'petik')
    print(f'Key = {k}  ({"OK" if check(k) else "KO"})')
