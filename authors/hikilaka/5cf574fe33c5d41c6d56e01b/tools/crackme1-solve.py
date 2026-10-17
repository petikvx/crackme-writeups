#!/usr/bin/env python3
"""hikilaka — crackme #1 : mot de passe = "ghnuhbijra" (10 caracteres).

main() lit d'abord un ENTIER N via cin (clampe a 10 : min(N,10)), puis lit
N caracteres via cin>>char (saute les espaces). Ces N caracteres sont
compares (std::mismatch) a une sequence generee par un generateur de
Fibonacci entier :
    x,y = 5, 1
    pour chaque octet : v = x+y ; octet = (v % 26) + 'a' ; x,y = y,v
10 octets generes -> "ghnuhbijra". Le succes exige le match EXACT sur les
10 positions (les deux "bornes" du mismatch doivent etre les fins de
plage).

Usage : crackme1-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "crackme"


def generate(n: int = 10) -> str:
    x, y = 5, 1
    out = []
    for _ in range(n):
        v = x + y
        out.append(chr(v % 26 + 97))
        x, y = y, v
    return "".join(out)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    pw = generate()
    if a.q:
        print(pw)
        return 0
    print(f"password = {pw!r}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=f"10 {s}\n", capture_output=True, text=True).stdout
        ok, ko = run(pw), run("wrongpass1")
        good = "successful" in ok and "unsuccessful" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
