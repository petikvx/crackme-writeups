#!/usr/bin/env python3
"""Solveur crackme2 by MaBaKeR (VB6 natif, UPX).
Le bouton « Vérifier » teste : Val(Text1.Text) = Val(Command11.Caption) + 56336980 + 1
Command11 est la touche « 0 » du pavé (Caption "0") → serial constant 56336981.
  ./crackmes-de-crackme2_by_mabaker-solve.py [-q] [--check SERIAL]
"""
import sys
C1, C2, CAPTION = 56336980.0, 1.0, "0"   # doubles .text 0x401150 / 0x401148, Caption de Command11
serial = int(float(CAPTION) + C1 + C2)
a = sys.argv[1:]
if "--check" in a:
    s = a[a.index("--check") + 1]
    ok = s.isdigit() and float(s) == float(CAPTION) + C1 + C2
    print("GOOD" if ok else "NOT GOOD"); sys.exit(0 if ok else 1)
print(serial if "-q" in a else f"serial = {serial}")
