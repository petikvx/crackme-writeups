#!/usr/bin/env python3
"""borismilner 4N006135 level-4 — password + argv count.

Password: THISWORLDISCRUEL
Must run with argc==7 (exe + 6 dummy args) for parity/overflow gate.
Trap: if any of the first 5 password chars equals the corresponding
letter of \"Mario\", immediate fail.

  ./level4-solve.py -q
  ./level4-solve.py --check
  ./level4-solve.py --run   # Wine live
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "_u" / "level-4.exe"
PASSWORD = "THISWORLDISCRUEL"
ARGV_PAD = ["1", "2", "3", "4", "5", "6"]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--run", action="store_true", help="Wine: exe + 6 args + password")
    args = ap.parse_args()

    if args.q:
        print(PASSWORD)
    else:
        print(f"password = {PASSWORD}")
        print(f"cmdline  = level-4.exe {' '.join(ARGV_PAD)}")
        print("note     = argc must be 7 (parity/overflow); avoid Mario letters in first 5")

    if args.run:
        cmd = ["wine", str(EXE), *ARGV_PAD]
        p = subprocess.run(
            cmd,
            input=PASSWORD + "\n",
            text=True,
            capture_output=True,
            env={**dict(**{k: v for k, v in __import__("os").environ.items()}), "WINEDEBUG": "-all"},
        )
        out = (p.stdout or "") + (p.stderr or "")
        print(out)
        if "GOOD JOB" not in out or "NOT A GOOD" in out:
            print("RUN FAIL", file=sys.stderr)
            return 1

    if args.check:
        # static constraints
        if PASSWORD[:5] == "Mario":
            print("CHECK FAIL", file=sys.stderr)
            return 1
        for i, ch in enumerate("Mario"):
            if PASSWORD[i] == ch:
                print("CHECK FAIL mario trap", file=sys.stderr)
                return 1
        if len(ARGV_PAD) != 6:
            print("CHECK FAIL argv", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
