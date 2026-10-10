#!/usr/bin/env python3
"""Rith CrackMe #1 — keygen (routine 0x401590, MFC, UpdateData)."""
import sys
PI = b"31415926535897932384"   # CString construit depuis .data:0x403048

def sbyte(c):
    return c - 256 if c > 127 else c

def keygen(name: str) -> str:
    n = name.encode("latin-1")
    if not 5 <= len(n) <= 20:
        raise ValueError("nom de 5 à 20 caractères")
    out = []
    for i, c in enumerate(n):
        a, b = sbyte(c), PI[i]
        r = abs(a) % b * (1 if a >= 0 else -1)   # idiv C : reste du signe du dividende
        e = r * 2
        if e > 0x7b:
            e -= 0x1a
        if e < 0x41:
            e = 0x82 - e
        if 0x5b < e < 0x61:
            e = e % 10 + 0x30
        out.append(e & 0xff)
    return bytes(out).decode("latin-1")

if __name__ == "__main__":
    for nm in sys.argv[1:] or ["petik"]:
        k = keygen(nm)
        print(f"{nm} -> {k.encode('latin-1').decode('cp1252', 'replace')}  ({k.encode('latin-1').hex()})")
