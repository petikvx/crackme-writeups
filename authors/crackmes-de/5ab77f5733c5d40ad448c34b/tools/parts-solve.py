#!/usr/bin/env python3
"""Keygen — Parts (axel.net, crackmes.de). serial = concat(str(ord(c)) + str(key)) pour chaque c du name.
key() du binaire vaut un entier aléatoire 50..89 (re-tiré à CHAQUE clic sur Check) ;
0 uniquement si (seconde+minute)//2 == 0.
Usage : parts-solve.py [name] [--key N] [--all] [-q]
"""
import argparse

def serial(name, key):
    return "".join("%d%d" % (ord(c), key) for c in name)

ap = argparse.ArgumentParser()
ap.add_argument("name", nargs="?", default="petik")
ap.add_argument("--key", type=int, default=50, help="valeur de key() visée (50..89, 0 à hh:00)")
ap.add_argument("--all", action="store_true", help="les 40 serials possibles (50..89)")
ap.add_argument("-q", action="store_true")
a = ap.parse_args()
keys = range(50, 90) if a.all else [a.key]
for k in keys:
    s = serial(a.name, k)
    print(s if a.q else "%s key=%d -> %s" % (a.name, k, s))
