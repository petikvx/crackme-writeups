#!/usr/bin/env python3
"""Keygen CrackMe July 8th 2002 (JunkCode).
Validation (0x40148E) : comb = 16 cases -> bits ; key = atoi(edit)
retour = (key ^ comb) - isprime(comb) doit valoir -1
=> key == comb et comb premier impair dans [10000, 20000]."""
import sys
IDS=[0x74,0x65]+list(range(0x66,0x74))   # ID de case -> bit 0..15
def isprime(n):
    if n%2==0 or not 10000<=n<=20000: return 0
    d=3
    while d*d<=n:
        if n%d==0: return 0
        d+=2
    return 1
def check(key,comb): return ((key^comb)-isprime(comb))&0xffffffff==0xffffffff
n=int(sys.argv[1]) if len(sys.argv)>1 else 19991
assert isprime(n), "il faut un premier entre 10000 et 20000"
assert check(n,n) and not check(n+2,n)
print("Name : petik (libre)\nKey  :",n)
bits=[(n>>i)&1 for i in range(16)]
print("Cases (ordre de tab, bit 0 en premier) :")
for r in range(4): print("  "+"  ".join("[X]" if b else "[ ]" for b in bits[4*r:4*r+4]))
print("IDs a cocher :",[hex(IDS[i]) for i in range(16) if bits[i]])
