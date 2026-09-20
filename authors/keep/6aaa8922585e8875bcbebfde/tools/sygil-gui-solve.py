#!/usr/bin/env python3
"""Solveur — Keep's sygil (gui version for linux)

token = FNV-1a(alias) formaté syg-%08x-%04x-%08x (sans debugger).

Usage:
  python3 tools/sygil-gui-solve.py -q --name petik
"""
from __future__ import annotations
import argparse, sys

def token(name: str, debug: bool = False) -> str:
    h = 0x811C9DC5
    for c in name.encode():
        if c in (10, 13):
            break
        h = (16777619 * ((c ^ h) & 0xFFFFFFFF)) & 0xFFFFFFFF
    if debug:
        h ^= 0xDEADBEEF
    a = (h ^ 0x5947494C) & 0xFFFFFFFF
    fold = ((h & 0xFFFF) ^ (h >> 16)) & 0xFFFF
    c = (fold ^ a ^ 0x535947) & 0xFFFFFFFF
    return f"syg-{a:08x}-{fold:04x}-{c:08x}"

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default="petik")
    ap.add_argument("--debug-seed", action="store_true", help="XOR DEADBEEF (TracerPid≠0)")
    args = ap.parse_args()
    if len(args.name) <= 3:
        print("name length must be > 3", file=sys.stderr)
        return 1
    t = token(args.name, args.debug_seed)
    if args.q:
        print(t)
    else:
        print(f"alias={args.name!r}  token={t}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
