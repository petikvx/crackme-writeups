#!/usr/bin/env python3
"""Keygen Spear (Cyclops) : partage de secret de Shamir mod 251.
Pour chaque caractère c de "CyClOpS", on tire un polynôme P de degré 4 avec P(0)=c (coefs < 251),
le champ k (1..5) reçoit P(k). Chaque champ = 7 valeurs hex séparées par '-'."""
import random, sys
SECRET, P = b"CyClOpS", 251
rnd = random.Random(sys.argv[1] if len(sys.argv) > 1 else "petik")
polys = [[c] + [rnd.randrange(P) for _ in range(4)] for c in SECRET]
ev = lambda co, x: sum(a * x**i for i, a in enumerate(co)) % P
for k in range(1, 6):
    print("-".join("%x" % ev(co, k) for co in polys))
