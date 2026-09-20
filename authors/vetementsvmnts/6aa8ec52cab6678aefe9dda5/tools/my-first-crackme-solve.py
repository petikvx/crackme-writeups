#!/usr/bin/env python3
"""Solveur — vetementsvmnts's My First crackme

Password en clair dans .rodata (strcmp).

Usage:
  python3 tools/my-first-crackme-solve.py -q
  python3 tools/my-first-crackme-solve.py --check
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "my_crackme"
PASSWORD = "my_first_crackme"

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        r = subprocess.run([str(BIN)], input=PASSWORD + "\n", capture_output=True, text=True, timeout=5)
        out = r.stdout + r.stderr
        print(out.strip())
        ok = "Access Granted" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(PASSWORD if args.q else f"{PASSWORD}  # strcmp .rodata")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
