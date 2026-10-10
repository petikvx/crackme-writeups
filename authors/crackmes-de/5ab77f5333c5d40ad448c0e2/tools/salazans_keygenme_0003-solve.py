#!/usr/bin/env python3
"""Keygen salazan's keygenme #0003 (crackmes.de).
serial = filtre(MD5HEX(nom)) + '-' + 5 groupes de 5 caractères séparés par '-',
avec sommes ASCII 0x18c, 0x18b, 0x18f, 0x187, 0x185 ; filtre = garde 0-3 et A-C."""
import hashlib, sys

SUMS = [0x18c, 0x18b, 0x18f, 0x187, 0x185]

def prefix(name):
    h = hashlib.md5(name.encode('latin-1')).hexdigest().upper()
    return ''.join(c for c in h if c in '0123ABC')

def group(total):
    g = [ord('O')] * 4
    return ''.join(map(chr, g + [total - sum(g)]))

def keygen(name):
    return prefix(name) + '-' + '-'.join(group(s) for s in SUMS)

def check(name, serial):
    p = serial.find('-') + 1  # Pos() Delphi, 1-based
    if len(serial) < 29 or p == 0:
        return False
    groups = [serial[p + off - 1: p + off - 1 + 5] for off in (1, 7, 13, 19, 25)]
    return serial[:p - 1] == prefix(name) and [sum(map(ord, g)) for g in groups] == SUMS

if __name__ == '__main__':
    name = sys.argv[1] if len(sys.argv) > 1 else 'petik'
    s = keygen(name)
    assert check(name, s)
    print(name, s)
