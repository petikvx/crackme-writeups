#!/usr/bin/env python3
"""Solveur — fon37's Secret Menu (PyInstaller)

Menu secret = XOR 171 sur la liste `p` → `justasimplexor`.

Usage:
  python3 tools/secret-menu-solve.py -q
  python3 tools/secret-menu-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "chall"

P = [193, 222, 216, 223, 202, 216, 194, 198, 219, 199, 206, 211, 196, 217]
XOR_KEY = 171
SECRET = "".join(chr(i ^ XOR_KEY) for i in P)
assert SECRET == "justasimplexor"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    if args.check:
        r = subprocess.run(
            [str(BIN)],
            input=SECRET + "\n",
            capture_output=True,
            text=True,
            timeout=10,
        )
        out = r.stdout + r.stderr
        print(out.strip())
        ok = "Congratulations, you win!" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(SECRET)
    else:
        print(SECRET)
        print(f"# XOR {XOR_KEY} on p[] → secret menu choice")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
