#!/usr/bin/env python3
"""NTS Crackme5 (crackmes.de / cyclops) — keygen : serial = f1(nom) + '+' + f2(nom)."""
import sys
M = 0xFFFFFFFF
def sx(b): return b - 256 if b > 127 else b
def f1(name):
    ecx, edx = 0, 1
    for b in name:
        c = sx(b) & M
        eax = (c * edx) & M
        esi = c ^ 0x32142001
        ecx = (ecx + esi) & M
        eax |= ecx
        esi = eax
        edx = esi % 7 + 2
        ecx = (ecx * edx) & M
        edx = ((ecx % 5 + 3) * esi) & M
    return "%08X-%08X" % (ecx, edx)
def f2(name):
    ecx, esi, edi = 1, 0, 0
    for b in name:
        c = sx(b) & M
        eax = (c * ecx) & M
        edx = c | 0xF001F001
        ecx = eax
        esi = (esi - edx) & M
        eax = (ecx + esi) & M
        ecx |= esi
        edi = (edi + eax) & M
        ecx = (ecx * (edi % 7 + 3) + edi) & M
        esi = ((edi % 11 + 2) * esi + edi) & M
    return "%08X-%08X" % (esi, ecx)
def keygen(name):
    n = name.encode("latin-1")
    assert len(n) >= 7, "nom : 7 caractères minimum"
    return f1(n) + "+" + f2(n)
if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petikvx"
    print(name, keygen(name))
