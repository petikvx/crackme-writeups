#!/usr/bin/env python3
"""Solveur — acheylate's Find the password (Rust Linux)

Password HVUHADN : len==7, puis 2× XOR u32 LE chevauchants
  password[0:4] ^ 0x48555648 == 0  ("HVUH")
  password[3:7] ^ 0x4E444148 == 0  ("HADN")

Usage:
  python3 tools/find-password-solve.py -q
  python3 tools/find-password-solve.py --check
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crackme-01"
PASSWORD = "HVUHADN"

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        r = subprocess.run([str(BIN)], input=PASSWORD+"\n", capture_output=True, text=True, timeout=5)
        out = r.stdout + r.stderr
        print(out.strip())
        ok = "Correct Password" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(PASSWORD if args.q else f"{PASSWORD}  # u32 LE immediates")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
