#!/usr/bin/env python3
"""salazan's keygenme #0001 (crackmes.de) : le nom n'intervient pas (>= 3 car.).
Serial de 29 car. = 5 blocs de 5 (positions 1,7,13,19,25), sommes ASCII
0x18d, 0x18c, 0x190, 0x188, 0x186 ; séparateurs libres."""
import sys
SUMS = [0x18d, 0x18c, 0x190, 0x188, 0x186]

def keygen(name='petik'):
    return '-'.join('OOOO' + chr(s - 4 * ord('O')) for s in SUMS)

def check(name, serial):
    if len(name) < 3 or len(serial) < 3 or len(serial) != 29:
        return False
    return [sum(map(ord, serial[o - 1:o + 4])) for o in (1, 7, 13, 19, 25)] == SUMS

if __name__ == '__main__':
    name = sys.argv[1] if len(sys.argv) > 1 else 'petik'
    s = keygen(name); assert check(name, s); print(name, s)
