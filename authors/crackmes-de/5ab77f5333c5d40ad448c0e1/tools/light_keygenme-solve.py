#!/usr/bin/env python3
"""Keygen « Light keygenme » (salazan) : MD5(nom+serial) en hex MAJ,
les 8 premiers caractères doivent passer StrToInt (donc 8 chiffres décimaux)."""
import hashlib, itertools, string, sys

def ok(name, serial):
    h = hashlib.md5((name + serial).encode('latin-1')).hexdigest().upper()
    try:
        int(h[:8], 10)
        return h[:8].isdigit()
    except ValueError:
        return False

def keygen(name):
    for n in itertools.count(1):
        if ok(name, str(n)):
            return str(n)

if __name__ == '__main__':
    name = sys.argv[1] if len(sys.argv) > 1 else 'petik'
    s = keygen(name)
    print(name, s, hashlib.md5((name + s).encode()).hexdigest().upper())
