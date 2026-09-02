#!/usr/bin/env python3
"""savage Slayer KeyMe #1 — clipboard + reg.key keygen.

Step 1: clipboard CF_TEXT must equal GetComputerNameA (same length).
Step 2: file ``reg.key`` (8 bytes): dword0 ^ dword1 == sum(computer_name + NUL).

  ./slayer-keyme1-solve.py -q
  ./slayer-keyme1-solve.py --computer PTK-LAB --check
  ./slayer-keyme1-solve.py --write-key analysis/reg.key
"""
from __future__ import annotations

import argparse
import platform
import struct
import sys
from pathlib import Path

# Template first dword used by public keygens (any works if XOR matches)
TEMPLATE_D0 = 0x7C7A71C0  # '|qz|' LE from .data leftovers — optional; 0 is fine


def checksum(computer: str) -> int:
    raw = computer.encode("ascii", "replace") + b"\0"
    return sum(raw) & 0xFFFFFFFF


def make_reg_key(computer: str, d0: int = 0) -> bytes:
    s = checksum(computer)
    d1 = (d0 ^ s) & 0xFFFFFFFF
    return struct.pack("<II", d0 & 0xFFFFFFFF, d1)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument(
        "--computer",
        default=platform.node().split(".")[0] or "PTK-LAB",
        help="GetComputerNameA value (défaut: hostname court)",
    )
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--write-key", type=Path, help="écrit reg.key 8 octets")
    ap.add_argument("--d0", type=lambda x: int(x, 0), default=0, help="premier dword")
    args = ap.parse_args()

    name = args.computer
    s = checksum(name)
    key = make_reg_key(name, args.d0)
    d0, d1 = struct.unpack("<II", key)

    if args.q:
        print(f"{d0:08X}-{d1:08X}")
    else:
        print(f"computer = {name!r}")
        print(f"checksum = {s} ({s:#x})  # sum(bytes)+NUL")
        print(f"clipboard: paste exactly {name!r} then Step1")
        print(f"reg.key  = {key.hex()}  (dword0^dword1 == checksum)")

    if args.write_key:
        args.write_key.parent.mkdir(parents=True, exist_ok=True)
        args.write_key.write_bytes(key)
        print(f"wrote {args.write_key}")

    if args.check:
        ok = (d0 ^ d1) == s and len(key) == 8
        if not ok:
            print("CHECK FAIL", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
