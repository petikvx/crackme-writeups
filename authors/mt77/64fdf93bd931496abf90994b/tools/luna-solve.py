#!/usr/bin/env python3
"""mt77 — based (luna) : un nombre qui passe un test de Luhn et qui est compris entre 100000 et 10 000 000.

luna(n) @0x401156 : tant que n != 0 : d = n % 10 ; d2 = 2 * ((n / 10) % 10) (moins 9 si > 9) ; somme += d + d2 ; n /= 100
                    retourne (somme % 10 == 0)                            -> algorithme de Luhn
main @0x401262 : cin >> unsigned long long n ; refuse n <= 99999 (0x1869f) et n > 10000000 (0x989680) ; luna(n) doit valoir 1 -> "Welcome!".
Usage : luna-solve.py [--count K] [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "luna"


def luhn(n: int) -> bool:
    s = 0
    while n:
        d, d2 = n % 10, ((n // 10) % 10) * 2
        s += d + (d2 - 9 if d2 > 9 else d2)
        n //= 100
    return s % 10 == 0


def valid(n: int) -> bool:
    return 99999 < n <= 10000000 and luhn(n)


ap = argparse.ArgumentParser()
ap.add_argument("--count", type=int, default=5)
ap.add_argument("-q", action="store_true")
ap.add_argument("--check", action="store_true")
a = ap.parse_args()
sols = []
n = 100000
while len(sols) < a.count:
    if valid(n):
        sols.append(n)
    n += 1
if a.q:
    print(sols[0]); sys.exit(0)
print("premières solutions :", sols, "(toute valeur de 100000 à 10000000 qui passe Luhn convient)")
if a.check:
    run = lambda v: "Welcome!" in subprocess.run([str(EXE)], input=f"{v}\n", capture_output=True, text=True).stdout
    oks = [run(v) for v in sols]
    kos = [run(v) for v in (sols[0] + 1, 99999, 10000001, 0)]
    big = max(v for v in range(9999990, 10000001) if valid(v))
    print("OK:", oks, "| KO (n+1, 99999, 10000001, 0):", kos, "| plus grande valeur:", big, run(big))
    sys.exit(0 if all(oks) and not any(kos) and run(big) else 1)
