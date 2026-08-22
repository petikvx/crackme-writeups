#!/usr/bin/env python3
"""Solveur — ABOLHB MasonCrackmeV2

UPX PE32+ MinGW : MasonH777 assemble « ME|MS|EN|AL|F » → MEMSENALF, strcmp.

Usage:
  python3 mason-solve.py -q
  python3 mason-solve.py --check MEMSENALF
"""
from __future__ import annotations
import argparse
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_UNP = _DIR / "analysis" / "masoncrackmev2-unpacked.exe"
PASSWORD = "MEMSENALF"


def load_password() -> str:
    pe = _UNP if _UNP.exists() else _DIR / "original" / "masoncrackmev2.exe"
    data = pe.read_bytes()
    # pieces ME\0MS\0EN\0AL\0F\0
    i = data.find(b"ME\x00MS\x00EN\x00AL\x00F\x00")
    if i < 0:
        return PASSWORD
    parts = data[i : i + 15].split(b"\x00")
    return b"".join(p for p in parts if p).decode("ascii")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="P")
    args = ap.parse_args()
    pw = load_password()
    if args.check is not None:
        print("OK" if args.check == pw else "FAIL")
        return 0 if args.check == pw else 1
    if args.q:
        print(pw)
        return 0
    print("=== MasonCrackmeV2 ===")
    print(f"password : {pw}")
    print("note     : UPX ; Wine original MinGW may SEH — see analysis/mason-recon.exe")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
