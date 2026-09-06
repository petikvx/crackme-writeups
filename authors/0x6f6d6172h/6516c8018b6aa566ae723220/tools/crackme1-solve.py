#!/usr/bin/env python3
"""Solveur — 0x6f6D6172h crackme1

Le binaire affiche directement le flag (puts en clair).

Usage:
  python3 crackme1-solve.py -q
  python3 crackme1-solve.py --check
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crackme1"
FLAG = "flag{not_that_kind_of_elf}"

def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        r = subprocess.run([str(BIN)], capture_output=True, timeout=5)
        out = (r.stdout+r.stderr).decode()
        print(out.strip())
        ok = FLAG in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(FLAG if args.q else f"{FLAG}  # printed by main/puts")
    return 0
if __name__ == "__main__": sys.exit(main())
