#!/usr/bin/env python3
"""SilentWraith — lockcode : gabarit, pas un code unique.

val(len, s) @0x1189 : somme des codes ASCII (signés) des octets de s.
res(a, b)   @0x11cf : a == b (via a+1-b==1).
main : exige sum(argv[1]) == sum(constante interne "wzJCPjBHBsHAkHbazmhYdflzLdhapPUE") == 2977.
Usage : lockcode-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "lockcode"
CODE = "wzJCPjBHBsHAkHbazmhYdflzLdhapPUE"           # constante interne (solution évidente)
assert sum(CODE.encode()) == 2977
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(CODE); sys.exit(0)
print(f"code = {CODE}  (toute chaîne de somme ASCII == 2977 convient)")
if a.check:
    run = lambda c: subprocess.run([str(EXE), c], capture_output=True, text=True).stdout
    ok, ko = run(CODE), run("wrong")
    good = "unlocked the code" in ok and "you failed" in ko
    print("OK:", "unlocked the code" in ok, "| KO:", "you failed" in ko)
    sys.exit(0 if good else 1)
