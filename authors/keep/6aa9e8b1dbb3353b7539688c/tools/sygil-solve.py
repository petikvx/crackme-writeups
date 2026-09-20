#!/usr/bin/env python3
"""Solveur — Keep's sygil.fun (console)

Même FNV-1a que la version GUI.

Usage:
  python3 tools/sygil-solve.py -q --name petik
  python3 tools/sygil-solve.py --check
"""
from __future__ import annotations
import argparse, subprocess, sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "sygil"

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
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    t = token(args.name)
    if args.check:
        r = subprocess.run([str(BIN)], input=f"{args.name}\n{t}\n", capture_output=True, text=True, timeout=5)
        out = r.stdout + r.stderr
        print(out.strip())
        ok = "pact is sealed" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(t if args.q else f"{args.name} → {t}")
    return 0
if __name__ == "__main__":
    raise SystemExit(main())
