#!/usr/bin/env python3
"""Solveur — acheylate's Find the password Windows ver

Même prédicat que le twin Linux : HVUHADN
  len==7 ; [0:4]^0x48555648 ; [3:7]^0x4E444148 (u32 LE).

Usage:
  python3 tools/find-password-win-solve.py -q
  python3 tools/find-password-win-solve.py --check
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crackme-01.exe"
PASSWORD = "HVUHADN"

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        r = subprocess.run(["wine", str(BIN)], input=PASSWORD+"\n", capture_output=True, text=True, timeout=30)
        out = r.stdout + r.stderr
        print(out.strip()[-500:])
        ok = "Correct Password" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(PASSWORD if args.q else f"{PASSWORD}  # same as Linux twin")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
