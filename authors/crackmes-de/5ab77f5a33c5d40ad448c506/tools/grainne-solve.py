#!/usr/bin/env python3
"""Solveur — grainne: password in ELF e_ident padding: stefu!u|"""
import argparse
from pathlib import Path
PASSWORD = "stefu!u|"
BIN = Path(__file__).resolve().parents[1] / "original" / "grainne"

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    raw = BIN.read_bytes()[8:8+len(PASSWORD)]
    ok = raw == PASSWORD.encode()
    if a.q:
        print(PASSWORD); return 0
    if a.check:
        print(f"EI_PAD={raw!r}"); print("OK" if ok else "FAIL"); return 0 if ok else 1
    print("password:", PASSWORD)
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
