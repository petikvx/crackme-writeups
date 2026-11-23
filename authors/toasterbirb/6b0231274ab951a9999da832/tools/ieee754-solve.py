#!/usr/bin/env python3
"""toasterbirb ieee_754 : génère les floats à saisir (un par caractère du mot de passe).

Pour chaque caractère c : float32 négatif, exposant non biaisé e = c-127,
8 premiers bits de mantisse = 0xC3 (m = 0xC3/256), terminé par -inf.
Usage : ieee754-solve.py [-q] [--check BIN] [--word password]
"""
import argparse, struct, subprocess, sys

def make(c):
    e = c - 127
    bits = (1 << 31) | ((e + 127) << 23) | (0xC3 << 15)   # signe | exp biaisé = c | mantisse
    return struct.unpack('<f', struct.pack('<I', bits))[0]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', metavar='BIN')
    ap.add_argument('--word', default='password')
    a = ap.parse_args()
    vals = ['%.9e' % make(ord(ch)) for ch in a.word] + ['-inf']
    if a.q:
        print('\n'.join(vals))
    else:
        for ch, v in zip(a.word, vals):
            print(f'{ch!r} -> {v}')
        print('-inf (terminateur)')
    if a.check:
        r = subprocess.run([a.check], input='\n'.join(vals) + '\n', capture_output=True, text=True)
        print(r.stdout, end='')
        sys.exit(0 if 'Correct!' in r.stdout else 1)

main()
