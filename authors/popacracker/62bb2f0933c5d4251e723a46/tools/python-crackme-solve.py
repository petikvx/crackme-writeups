#!/usr/bin/env python3
"""PopaCracker Python CrackMe — password YouSuccCracked (user d'ex. petik).

  ./python-crackme-solve.py -q
  ./python-crackme-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

PASS = "YouSuccCracked"
USER = "petik"
BIN = Path(__file__).resolve().parents[1] / "original" / "CrackTool.exe"


def check() -> bool:
    proc = subprocess.run(
        ["xvfb-run", "-a", "wine", str(BIN)],
        input=f"1\n{USER}\n{PASS}\n",
        text=True,
        capture_output=True,
        timeout=60,
    )
    out = (proc.stdout or "") + (proc.stderr or "")
    return "Correct! You Successfuly Registered as" in out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--user", default=USER)
    args = ap.parse_args()
    if args.check and not check():
        print("CHECK FAIL", file=sys.stderr)
        return 1
    if args.q:
        print(PASS)
    else:
        print(f"user={args.user!r} password={PASS!r}")
        if args.check:
            print("check: OK (Wine+xvfb)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
