#!/usr/bin/env python3
"""facets (monads) — id 5ab77f5833c5d40ad448c411. ELF32, code auto-modifiant, un nombre en argument.

main @0x8049754 : strtol(argv[1], NULL, 10) -> f(n) @0x80496e0 ; f != 0 -> « good. », sinon « bad. ».
f réécrit son propre code (segment RWX) et finit par `cmp word [esp+4], 7` : seuls les 16 bits bas
comptent -> n & 0xffff == 7   (l'exemple « ./prog 90 » du message d'usage est un leurre).

  facets-solve.py [-q] [--check]
"""
import argparse, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "facets_main"


def run(n):
    return subprocess.run([str(BIN), str(n)], capture_output=True, text=True, timeout=5).stdout


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    print(7 if a.q else "argument : 7   (ou tout n tel que n & 0xffff == 7 : 65543, -65529, …)")
    if a.check:
        good = [7, 65543, -65529]
        bad = [0, 8, 90, 23, 65536]
        ok = all("good." in run(n) for n in good) and all("bad." in run(n) for n in bad)
        print("check:", "OK" if ok else "KO", f"(good={good}, bad={bad})")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
