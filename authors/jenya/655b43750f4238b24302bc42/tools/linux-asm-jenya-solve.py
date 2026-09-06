#!/usr/bin/env python3
"""Solveur — Jenya linux_asm_jenya

Password palindrome, longueur >= 3 (avant le \\n).

Usage:
  python3 linux-asm-jenya-solve.py -q
  python3 linux-asm-jenya-solve.py --check
  python3 linux-asm-jenya-solve.py --check aba
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "main"
DEFAULT = "aba"

def is_valid(pw: str) -> bool:
    s = pw.rstrip("\n")
    return len(s) >= 3 and s == s[::-1]

def check_live(pw: str) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr); return 1
    r = subprocess.run([str(BIN)], input=(pw if pw.endswith("\n") else pw+"\n").encode(), capture_output=True, timeout=5)
    out = (r.stdout+r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "Correct" in out
    print(f"{pw!r} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const=DEFAULT)
    ap.add_argument("password", nargs="?")
    args = ap.parse_args()
    if args.check is not None: return check_live(args.check)
    pw = args.password or DEFAULT
    ok = is_valid(pw)
    if args.q: print(pw if ok else "")
    else: print(f"{pw}  # palindrome len>=3 valid={ok}")
    return 0 if ok else 1
if __name__ == "__main__": sys.exit(main())
