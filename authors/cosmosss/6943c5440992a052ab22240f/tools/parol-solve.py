#!/usr/bin/env python3
"""Solveur — CosmoSSS Password (Very Easy) / parol.exe

MASM GUI : GetDlgItemTextA + lstrcmpA vs « SuperPass ».

Usage:
  python3 parol-solve.py -q
  python3 parol-solve.py --check SuperPass
"""
from __future__ import annotations
import argparse
from pathlib import Path

_PE = Path(__file__).resolve().parents[1] / "original" / "parol.exe"
PASSWORD = "SuperPass"


def load_password(pe: Path | None = None) -> str:
    data = (pe or _PE).read_bytes()
    i = data.find(b"SuperPass\x00")
    if i < 0:
        return PASSWORD
    return data[i:].split(b"\0", 1)[0].decode("ascii")


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
    print("=== CosmoSSS Password ===")
    print(f"password : {pw}")
    print("UI       : Password Good: / Password Trash:")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
