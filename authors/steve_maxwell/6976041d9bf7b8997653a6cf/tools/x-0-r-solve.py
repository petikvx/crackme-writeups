#!/usr/bin/env python3
"""steve_maxwell X-0-R — XOR 7 on flag.txt.enc.

  ./x-0-r-solve.py -q
  ./x-0-r-solve.py --check
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

KEY = 7
FLAG = "CTFLearn{y0u_x0r3d_th3_c0d3}"
ENC = Path(__file__).resolve().parents[1] / "original" / "flag.txt.enc"


def decrypt(path: Path = ENC) -> str:
    data = path.read_bytes().rstrip(b"\r\n")
    return bytes(b ^ KEY for b in data).decode("ascii")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--file", type=Path, default=ENC)
    args = ap.parse_args()
    plain = decrypt(args.file)
    if args.check and plain != FLAG:
        print("CHECK FAIL", repr(plain), file=sys.stderr)
        return 1
    print(plain if args.q else f"flag = {plain}  (xor key={KEY})")
    if args.check:
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
