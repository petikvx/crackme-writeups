#!/usr/bin/env python3
"""Firox CrackME #1 : serial en dur (chaîne UTF-16 référencée avant __vbaStrCmp)."""
import sys
exe = sys.argv[1] if len(sys.argv) > 1 else "FiroxCrackME1.exe"
d = open(exe, "rb").read()
o = d.find("DFT1-".encode("utf-16le"))
print(d[o:o + 38].decode("utf-16le"))
