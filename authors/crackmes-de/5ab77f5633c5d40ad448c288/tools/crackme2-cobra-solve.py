#!/usr/bin/env python3
"""Keygen crackme_2 by cobrasniper555 (crackmes.one 5ab77f5633c5d40ad448c288)."""
import sys

def s8(c):            # movsx BYTE -> int
    return c - 256 if c >= 128 else c

def mix(t):
    t ^= 0x12C
    t = (t * 20) & 0xFFFFFFFF
    t = t - (1 << 32) if t & 0x80000000 else t
    t = int(t / 4)    # idiv-like : (t<0 ? t+3 : t) >> 2
    return t & 0xF0F0F0F0

def serial(name: str) -> str:
    b = name.encode('latin-1')[:19]   # GetDlgItemTextA(..., 20)
    n = len(b)
    if n == 0:
        raise ValueError("nom vide (variable non initialisée côté binaire)")
    nb = list(b) + [0, 0]              # NUL terminal lu par la 2e boucle
    a = 0
    for i in range(n):                 # boucle avant : seule la dernière valeur compte
        t = s8(nb[i]) + (s8(nb[i-1]) if i else 5)
        a = mix(t)
    c = 0
    for i in range(n, 0, -1):          # boucle arrière : i = n .. 1
        t = s8(nb[i]) + (s8(nb[i+1]) if i != n else 5)
        c = mix(t)
    return "REG-%X-%X-KEY" % (a & 0xFFFFFFFF, (a + c) & 0xFFFFFFFF)

if __name__ == "__main__":
    a = sys.argv[1:]
    if len(a) == 3 and a[0] == "--check":
        ok = serial(a[1]) == a[2]
        print("OK" if ok else f"KO (attendu {serial(a[1])})")
        sys.exit(0 if ok else 1)
    for nm in (a or ["petik"]):
        print(f"{nm} -> {serial(nm)}")
