#!/usr/bin/env python3
"""Solveur — JoeJoeJoe's thefirsttest.

ELF64 non strippé, GCC. main lit un int avec scanf("%d\\n") et le
compare à l'immediate 0x72abb3c9.

Usage:
  python3 tools/thefirsttest-solve.py -q
  python3 tools/thefirsttest-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "thefirsttest"
IMM = 0x72ABB3C9
PASSWORD = str(IMM)  # 1923855305, tient dans un int32 signé
OK = "Well done, you are a master hacker!"
KO = "Wrong password, try agian!"


def run(payload: str) -> str:
    proc = subprocess.run(
        [str(BIN)],
        input=payload.encode() + b"\n",
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=False,
    )
    return proc.stdout.decode(errors="replace")


def check() -> int:
    good = run(PASSWORD)
    bad = run("0")
    text = run("password")
    if OK not in good:
        print("KO: password accepté manquant", file=sys.stderr)
        print(good, file=sys.stderr)
        return 1
    if KO not in bad or OK in bad:
        print("KO: entier 0 devrait échouer", file=sys.stderr)
        print(bad, file=sys.stderr)
        return 1
    if OK in text:
        print("KO: texte non numérique accepté", file=sys.stderr)
        print(text, file=sys.stderr)
        return 1
    print(f"OK  {PASSWORD}")
    print(f"KO  0 → {KO}")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("-q", action="store_true", help="n'afficher que le password")
    parser.add_argument("--check", action="store_true", help="prouver sur original/thefirsttest")
    args = parser.parse_args()
    if args.check:
        return check()
    if args.q:
        print(PASSWORD)
        return 0
    print(f"password : {PASSWORD}")
    print(f"immediate: 0x{IMM:08x}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
