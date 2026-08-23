#!/usr/bin/env python3
"""TheFakeKing Basic Crackme ConsoleBased — password ErhwHwrhrwWhrwwHwhr.

  ./basic-console-solve.py -q
  ./basic-console-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

PASS = "ErhwHwrhrwWhrwwHwhr"
BIN = Path(__file__).resolve().parents[1] / "original" / "Main.exe"


def check() -> bool:
    proc = subprocess.run(
        ["timeout", "4", "xvfb-run", "-a", "wine", str(BIN)],
        input=f"{PASS}\n.\n",
        text=True,
        capture_output=True,
    )
    out = (proc.stdout or "") + (proc.stderr or "")
    # Succès = pas de « Invaild » juste après le premier prompt (bug auteur : « Vaild » mort).
    gt = out.find(">")
    if gt < 0:
        return False
    window = out[gt : gt + 80]
    return "Invaild" not in window and "Input a password" in out


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
            print("check: OK (Wine+xvfb — pas d'Invaild)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
