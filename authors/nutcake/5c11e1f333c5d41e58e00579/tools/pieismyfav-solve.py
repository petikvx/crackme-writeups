#!/usr/bin/env python3
"""nutcake — PieIsMyFav (simple) : numero magico = 3.

main() calcule : (v1*3 + v2) / v1, avec v1=100 (0x64), v2=14 (0xe), en
division entiere -> (300+14)/100 = 3. Compare au nombre saisi.

Usage : pieismyfav-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "simple"


def compute() -> int:
    v1, v2 = 100, 14
    return (v1 * 3 + v2) // v1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le nombre")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    n = compute()
    if a.q:
        print(n)
        return 0
    print(f"numero magico = {n}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=f"{s}\n", capture_output=True, text=True).stdout
        ok, ko = run(n), run(5)
        good = "sua flag" in ok and "Try harder" in ko
        print("OK:", ok.strip().splitlines()[-1], "| KO:", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
