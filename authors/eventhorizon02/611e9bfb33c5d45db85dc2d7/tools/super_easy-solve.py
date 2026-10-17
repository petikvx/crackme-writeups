#!/usr/bin/env python3
"""eventhorizon02 — super_easy : gabarit, pas un code unique.

check_pass @0x7f5 : strlen(argv[1]) % 3 == 0 ET is_prime(atoi(argv[1])). Flag = flag{argv[1]}.
Usage : super_easy-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "linux_64_bit"


def is_prime(n):
    if n < 2: return False
    i = 2
    while i * i <= n:
        if n % i == 0: return False
        i += 1
    return True


CODE = "101"           # longueur 3 (%3==0), premier
assert len(CODE) % 3 == 0 and is_prime(int(CODE))
ap = argparse.ArgumentParser()
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
if a.q:
    print(CODE); sys.exit(0)
print(f"code = {CODE}  (longueur multiple de 3, valeur première)")
if a.check:
    run = lambda c: subprocess.run([str(EXE), c], capture_output=True, text=True).stdout
    ok, ko = run(CODE), run("100")
    good = f"flag{{{CODE}}}" in ok and "access denied" in ko
    print("OK:", f"flag{{{CODE}}}" in ok, "| KO:", "access denied" in ko)
    sys.exit(0 if good else 1)
