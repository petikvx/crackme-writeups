#!/usr/bin/env python3
"""Solveur — vetementsvmnts's KeygenMe

serial = sum(ord(c) for c in name) * 7 + 0x7b

Usage:
  python3 tools/keygenme-solve.py -q
  python3 tools/keygenme-solve.py --name petik --check
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "keygen_crackme"

def serial_for(name: str) -> int:
    return sum(ord(c) for c in name) * 7 + 0x7B

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default="petik")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    s = serial_for(args.name)
    if args.check:
        r = subprocess.run([str(BIN)], input=f"{args.name}\n{s}\n", capture_output=True, text=True, timeout=5)
        out = r.stdout + r.stderr
        print(out.strip())
        ok = "Access Granted" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(s)
    else:
        print(f"{args.name} → {s}")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
