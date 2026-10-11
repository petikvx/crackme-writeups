#!/usr/bin/env python3
"""NTS Crackme4 (crackmes.de / cyclops) — brute force des 3 hachages (rip de 0x401320/0x401360/0x4013c0).
Cible : sprintf("%08X-%08X-%08X", f1, f3, f2) == "0CEAC848-A1F55297-18B3DD62".
Longueurs 1..4 en Python (quelques secondes) ; tools/crackmes-de-nts_crackme4-bf.c pour aller plus loin."""
import itertools
M = 0xFFFFFFFF
def f1(s):
    a = 0
    for c in s:
        e = (((c ^ 0xBAD0BEEF) + a) & M) | (c & 0xFEFEFEFE)
        a = ((~e & M) * (c % 13)) & M
    return a
def f2(s):
    a = 0
    for c in s:
        e = (((c ^ 0xB00BFACE) + a) & M) & (c | 0xFEFEFEFE)
        e = (e + (c * 3492) % 17) & M
        a = (e * (c % 5 + 5)) & M
    return a
def f3(s):
    a = 0
    for c in s:
        e = (((c ^ 0xBAD0BEEF) + a) & M) ^ (c | 0xDEADC0DE)
        a = (e * c) & M
    return a
TARGET = "0CEAC848-A1F55297-18B3DD62"
for n in range(1, 5):
    for t in itertools.product(range(32, 127), repeat=n):
        if f3(t) == 0xA1F55297 and "%08X-%08X-%08X" % (f1(t), f3(t), f2(t)) == TARGET:
            print("serial :", bytes(t).decode()); raise SystemExit
print("rien trouvé (len ≤ 4)")
