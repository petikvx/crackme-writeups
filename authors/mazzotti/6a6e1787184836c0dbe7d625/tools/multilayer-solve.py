#!/usr/bin/env python3
"""Solveur — Mazzotti's Multi-layer password check (ELF64).

6 strings = « MAZZ » répété 3, 7, 12, 1, 15, 7 fois (sans espaces).
Anti-debug : ptrace(PTRACE_TRACEME).

Usage :
  python3 multilayer-solve.py -q
  python3 multilayer-solve.py --check
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

REPS = (3, 7, 12, 1, 15, 7)
UNIT = "MAZZ"
BIN = Path(__file__).resolve().parents[1] / "original" / "crackme"


def passwords() -> list[str]:
    return [UNIT * n for n in REPS]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="print the 6 lines only")
    ap.add_argument("--check", action="store_true", help="run binary live")
    args = ap.parse_args()

    pwds = passwords()
    blob = "\n".join(pwds) + "\n"

    if args.check:
        r = subprocess.run([str(BIN)], input=blob, capture_output=True, text=True, timeout=5)
        print(r.stdout)
        ok = "Good job" in r.stdout
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        sys.stdout.write(blob)
    else:
        for i, (n, p) in enumerate(zip(REPS, pwds)):
            print(f"[{i}] ×{n} len={len(p)} {p if len(p) <= 32 else p[:32] + '…'}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
