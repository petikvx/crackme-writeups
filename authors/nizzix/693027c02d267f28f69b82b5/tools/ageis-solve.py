#!/usr/bin/env python3
"""Nizzix Ageis — password OsBuiltinsPass (CPython 3.13 .pyc).

  ./ageis-solve.py -q
  ./ageis-solve.py --check   # needs: uv python install 3.13
"""
from __future__ import annotations

import argparse
import shutil
import subprocess
import sys
from pathlib import Path

PASS = "OsBuiltinsPass"
BIN = Path(__file__).resolve().parents[1] / "original" / "x.pyc"


def check() -> bool:
    uv = shutil.which("uv")
    if not uv:
        print("uv not found (install astral uv for Python 3.13)", file=sys.stderr)
        return False
    proc = subprocess.run(
        [uv, "run", "--python", "3.13", "python", str(BIN)],
        input=f"{PASS}\n",
        text=True,
        capture_output=True,
        timeout=30,
    )
    out = (proc.stdout or "") + (proc.stderr or "")
    return "Access granted" in out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check and not check():
        print("CHECK FAIL", file=sys.stderr)
        return 1
    if args.q:
        print(PASS)
    else:
        print(f"password={PASS!r}")
        if args.check:
            print("check: OK (uv python 3.13 → Access granted)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
