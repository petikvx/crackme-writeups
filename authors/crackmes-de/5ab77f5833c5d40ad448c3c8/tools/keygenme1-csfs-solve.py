#!/usr/bin/env python3
"""Keygen — keygenme1 (csfs, crackmes4beginners). Usage : keygenme1-csfs-solve.py [-q] [name ...]  (défaut : petik)
serial = ord(dernier caractère du nom) * 0x16 * 0x38 + 2*ord(...)  = ord * 1234, en décimal."""
import sys
def serial(name):
    if not name: raise ValueError("nom vide")
    c = name.encode("latin-1")[-1]
    return str((c * 0x16 * 0x38 + 2 * c) & 0xffffffff)
if __name__ == "__main__":
    a = sys.argv[1:]; q = "-q" in a; a = [x for x in a if x != "-q"] or ["petik"]
    for n in a: print(serial(n) if q else f"{n} -> {serial(n)}")
