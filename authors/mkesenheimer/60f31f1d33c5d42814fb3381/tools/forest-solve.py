#!/usr/bin/env python3
"""MKesenheimer — Forest : flag = "redridinghood" (13 caractères, références au conte).

main @0x1080 : scanf("%13s") ; contraintes sur les 13 octets :
  [0]=='r' ; [1]%10==1 ; sqrt([2])*5.0 == 10.0 (donc [2]==4 ? -> en fait voir calcul) ;
  [3] <= 0x72 (quasi libre) ; [4..12] == "idinghood" (littéral).
Usage : forest-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "forest"
FLAG = "redridinghood"
assert len(FLAG) == 13
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(FLAG); sys.exit(0)
print(f"flag = {FLAG}")
if a.check:
    run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
    ok, ko = run(FLAG), run("wrongwrongw")
    good = "Flag is correct" in ok and "not correct" in ko
    print("OK:", "Flag is correct" in ok, "| KO:", "not correct" in ko)
    sys.exit(0 if good else 1)
