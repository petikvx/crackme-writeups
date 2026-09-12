#!/usr/bin/env python3
"""Solveur — ray33ee obscurio - 1 (password fixe).

  python3 tools/obscurio1-solve.py -q
  python3 tools/obscurio1-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

PASSWORD = "r4y_0b5Curi0_I729"
ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "crackus.exe"


def wine_check() -> bool:
    if not EXE.is_file():
        print("missing", EXE, file=sys.stderr)
        return False
    try:
        p = subprocess.run(
            ["env", "WINEDEBUG=-all", "wine", str(EXE.name)],
            input=PASSWORD + "\n",
            capture_output=True,
            text=True,
            timeout=20,
            cwd=str(EXE.parent),
        )
    except FileNotFoundError as e:
        print("wine missing:", e, file=sys.stderr)
        return False
    out = (p.stdout or "") + (p.stderr or "")
    ok = p.returncode == 0 and "well done" in out.lower()
    print(out.strip())
    print("OK" if ok else "FAIL", f"(exit={p.returncode})")
    return ok


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument("--check", action="store_true", help="preuve Wine")
    args = ap.parse_args()
    if args.check:
        return 0 if wine_check() else 1
    if args.q:
        print(PASSWORD)
        return 0
    print(f"password : {PASSWORD}")
    print(f"run      : cd original && printf '%s\\n' | wine crackus.exe" % PASSWORD)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
