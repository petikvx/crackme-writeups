#!/usr/bin/env python3
"""Solveur — darius949 crackme1

serial = sum(name[i]+name[i+1] for i in range(len(name)))  (name[len]=0)

Usage:
  python3 crackme1-solve.py -q --name test
  python3 crackme1-solve.py --check --name test
"""
from __future__ import annotations
import argparse, subprocess
from pathlib import Path
BIN = Path(__file__).resolve().parents[1] / "original" / "crackme1"

def serial_for(name: str) -> int:
    b = name.encode() + b"\x00"
    c = 0
    for i in range(len(name)):
        c += b[i] + b[i + 1]
    return c

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default="test")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = serial_for(a.name)
    if a.q:
        print(f"{a.name}:{s}"); return 0
    if a.check:
        out = subprocess.run([str(BIN)], input=f"{a.name}\n{s}\n".encode(), capture_output=True, timeout=2).stdout
        ok = b"craque" in out
        print(out.decode(errors="replace").strip()); print("OK" if ok else "FAIL"); return 0 if ok else 1
    print(f"name   : {a.name}"); print(f"serial : {s}"); return 0
if __name__ == "__main__":
    raise SystemExit(main())
