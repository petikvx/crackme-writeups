#!/usr/bin/env python3
"""qfqe crackme_0x01 (py2exe) — serial XOR 0x90 → qeavG1ZX.

  ./qfqe-0x01-solve.py -q
  ./qfqe-0x01-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

XOR = 0x90
ENCODED = (0xE1, 0xF5, 0xF1, 0xE6, 0xD7, 0xA1, 0xCA, 0xC8)
SERIAL = "".join(chr(x ^ XOR) for x in ENCODED)
BIN = Path(__file__).resolve().parents[1] / "original" / "crkm0x1.exe"


def check() -> bool:
    proc = subprocess.run(
        ["xvfb-run", "-a", "wine", str(BIN)],
        input=f"{SERIAL}\n\n",
        text=True,
        capture_output=True,
        timeout=60,
    )
    out = (proc.stdout or "") + (proc.stderr or "")
    return "Good!" in out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check and not check():
        print("CHECK FAIL", file=sys.stderr)
        return 1
    if args.q:
        print(SERIAL)
    else:
        print(f"serial={SERIAL!r}  # chr(x^{XOR:#x}) for x in {[hex(x) for x in ENCODED]}")
        if args.check:
            print("check: OK (Wine+xvfb → Good!)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
