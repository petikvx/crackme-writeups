#!/usr/bin/env python3
"""Solveur — R3tr0BS EZ crackme (run.exe)

ELF32 NASM : password en clair « P455w0rd » (argv[1]).

Usage:
  python3 ez-crackme-solve.py -q
  ./original/run.exe P455w0rd
"""
from __future__ import annotations
import argparse
from pathlib import Path

_PE = Path(__file__).resolve().parents[1] / "original" / "run.exe"
PASSWORD = "P455w0rd"


def load() -> str:
    d = _PE.read_bytes()
    i = d.find(b"P455w0rd")
    return d[i : i + 8].decode() if i >= 0 else PASSWORD


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="P")
    args = ap.parse_args()
    pw = load()
    if args.check is not None:
        print("OK" if args.check == pw else "FAIL")
        return 0 if args.check == pw else 1
    if args.q:
        print(pw)
        return 0
    print(f"password : {pw}")
    print("run      : ./original/run.exe", pw)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
