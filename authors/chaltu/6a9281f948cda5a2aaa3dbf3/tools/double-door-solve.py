#!/usr/bin/env python3
"""chaltu's Double Door — password = base64_decode(embedded) ; backdoor « hack ».

  ./double-door-solve.py -q
  ./double-door-solve.py --check
"""
from __future__ import annotations

import argparse
import base64
import os
import subprocess
import sys
from pathlib import Path

EMBEDDED_B64 = "Y3JhY2ttZTIwMjQ="
PASSWORD = base64.b64decode(EMBEDDED_B64).decode("ascii")
BACKDOOR_SUBSTR = "hack"

BIN = Path(__file__).resolve().parents[1] / "original" / "main.exe"


def check_password(candidate: str) -> bool:
    """Mirror check_password() from the PE (strcmp OR strstr « hack »)."""
    return candidate == PASSWORD or BACKDOOR_SUBSTR in candidate


def check_live() -> bool:
    env = os.environ.copy()
    env["WINEDEBUG"] = "-all"
    try:
        out = subprocess.check_output(
            ["wine", str(BIN)],
            input=f"{PASSWORD}\n\n",
            text=True,
            timeout=25,
            env=env,
        )
    except (subprocess.CalledProcessError, FileNotFoundError, subprocess.TimeoutExpired) as e:
        print(f"wine check failed: {e}", file=sys.stderr)
        return False
    return "ACCESS GRANTED" in out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", action="store_true", help="logic + Wine live")
    ap.add_argument(
        "--via",
        choices=("primary", "backdoor"),
        default="primary",
        help="which door to print (default: primary)",
    )
    args = ap.parse_args()

    answer = PASSWORD if args.via == "primary" else BACKDOOR_SUBSTR
    if not check_password(answer):
        print("internal predicate fail", file=sys.stderr)
        return 1

    if args.check:
        if not check_password(PASSWORD) or not check_password("xhacky"):
            print("CHECK FAIL (logic)", file=sys.stderr)
            return 1
        if check_password("nope"):
            print("CHECK FAIL (false positive)", file=sys.stderr)
            return 1
        if not check_live():
            print("CHECK FAIL (wine)", file=sys.stderr)
            return 1

    if args.q:
        print(answer)
    else:
        print(f"password = {PASSWORD}")
        print(f"backdoor = any input containing {BACKDOOR_SUBSTR!r}")
        print(f"embedded b64 = {EMBEDDED_B64}")
        if args.check:
            print("check: OK (logic + wine ACCESS GRANTED)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
