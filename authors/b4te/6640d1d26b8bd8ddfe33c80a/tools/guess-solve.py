#!/usr/bin/env python3
"""b4te — guess_the_password : check() @0x12a6 accepte toute chaîne de 10 caractères avec s[0]=='1' et s[4]=='9'.

    cmp strlen,0xa ; s[0]==0x31 ; s[4]==0x39
Les 8 autres caractères sont libres : `solve.py [FILL]` produit '1' + 3 car. + '9' + 5 car. (défaut : motif petik).
Usage : guess-solve.py [FILL] [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "guess_the_password"
ap = argparse.ArgumentParser()
ap.add_argument("fill", nargs="?", default="petikpet", help="8 caractères pour les positions libres (défaut : petikpet)")
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
f = (a.fill * 2)[:8]
pw = "1" + f[:3] + "9" + f[3:8]
assert len(pw) == 10
if a.q:
    print(pw); sys.exit(0)
print("password =", pw, "(s[0]=='1', s[4]=='9', len==10 ; autres positions libres)")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout.strip().splitlines()[-1]
    ok = run(pw).endswith("Correct")
    kos = [run(x).endswith("Incorrect") for x in ("2" + pw[1:], pw[:4] + "8" + pw[5:], pw[:-1], pw + "x")]
    print("OK:", ok, "| KO (s0, s4, len-1, len+1):", kos)
    sys.exit(0 if ok and all(kos) else 1)
