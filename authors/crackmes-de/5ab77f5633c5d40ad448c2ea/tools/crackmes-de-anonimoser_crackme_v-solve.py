#!/usr/bin/env python3
"""Keygen anonimoser_crackme_v : Nombre + Empresa + Edad + n° de série du volume C: -> Contraseña.
Usage : crackmes-de-anonimoser_crackme_v-solve.py <nombre> <empresa> <edad 1..120> [serial_hex, défaut 43000000 = wine]
"""
import sys

def cases(age):
    """Cases à cocher (1..15) dont la somme des numéros vaut l'âge (glouton)."""
    if not 1 <= age <= 120:
        raise SystemExit("edad doit valoir 1..120 (somme max 1+..+15)")
    out, r = [], age
    for i in range(15, 0, -1):
        if i <= r:
            out.append(i); r -= i
    return sorted(out)

def key(nombre, empresa, serial):
    n = sum(nombre.encode('latin-1')) + sum(empresa.encode('latin-1'))
    lettres = ''.join(chr(0x41 + int(c)) for c in str(n))
    return f"{n}{lettres}AS{serial}CM5"

if __name__ == '__main__':
    if len(sys.argv) < 4:
        print(__doc__); sys.exit(1)
    nombre, empresa, age = sys.argv[1], sys.argv[2], int(sys.argv[3])
    serial = int(sys.argv[4], 16) if len(sys.argv) > 4 else 0x43000000
    print(f"Nombre={nombre} Edad={age} Empresa={empresa}")
    print("Cases à cocher :", ' '.join(map(str, cases(age))))
    print("Contraseña :", key(nombre, empresa, serial))
