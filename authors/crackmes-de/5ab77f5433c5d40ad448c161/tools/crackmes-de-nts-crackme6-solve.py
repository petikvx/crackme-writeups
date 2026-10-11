#!/usr/bin/env python3
"""nts_crackme6 (cyclops) — générateur de Key.cyc.

Key.cyc = ligne 1 : nom (5..28 car.) + '\\n'
          ligne 2 : base64( 30 premiers octets de nom*∞ )
  ./crackmes-de-nts-crackme6-solve.py            # petik, affiche le fichier
  ./crackmes-de-nts-crackme6-solve.py -o Key.cyc  # écrit le keyfile
"""
import argparse, base64, sys

def keyfile(name: str) -> bytes:
    n = name.encode()
    if not 5 <= len(n) <= 28:
        raise SystemExit("nom : 5 à 28 caractères")
    rep = (n * 30)[:30]
    return n + b"\n" + base64.b64encode(rep) + b"\n"

ap = argparse.ArgumentParser()
ap.add_argument("--name", default="petik")
ap.add_argument("-o", "--out")
a = ap.parse_args()
k = keyfile(a.name)
if a.out:
    open(a.out, "wb").write(k)
sys.stdout.write(k.decode())
