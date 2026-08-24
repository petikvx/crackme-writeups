#!/usr/bin/env python3
"""Solveur — Jasper676767's I forgot my password!!!! (ELF64).

Activation number = generate_reference() = 6968271
(pipeline depuis le littéral « Awp2AmL3 » → transforms → stoll → useless_math≈id)

Flag imprimé par process_target() après validation.

Usage :
  python3 forgot-password-solve.py -q
  python3 forgot-password-solve.py --check
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ACTIVATION = 6968271
FLAG = (
    "FLAG{Yeah_You_Should_Start_Forgetting_Your_Password_"
    "But_St1ll_3nj0y_t0uching_t1ings_that_@re_nice_to_touch}"
)
BIN = Path(__file__).resolve().parents[1] / "original" / "myFirstCrackme"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="activation number only")
    ap.add_argument("--flag", action="store_true", help="flag only")
    ap.add_argument("--check", action="store_true", help="run binary live")
    args = ap.parse_args()

    if args.flag:
        print(FLAG)
        return 0

    if args.check:
        r = subprocess.run(
            [str(BIN)],
            input=f"{ACTIVATION}\n",
            capture_output=True,
            text=True,
            timeout=5,
        )
        out = r.stdout
        print(out)
        ok = FLAG in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(ACTIVATION)
    else:
        print(f"activation={ACTIVATION}")
        print(f"flag={FLAG}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
