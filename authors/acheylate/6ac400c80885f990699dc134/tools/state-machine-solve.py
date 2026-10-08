#!/usr/bin/env python3
"""Solveur — acheylate's Password Check With State Machine

Password = packed u64 LE 0x2e4856483753 → S7HVH.
  state 0..5 : expected = (PACKED >> (8*state)) & 0xff
  state 6    : accept (Correct!)
  state 7    : reject (Wrong!)

Usage:
  python3 tools/state-machine-solve.py -q
  python3 tools/state-machine-solve.py --check
"""
from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crackme-state"

# movabs r8, 0x2e4856483753  @ VMA 0x13efc (file 0x12efc)
PACKED = 0x2E4856483753
PASSWORD = PACKED.to_bytes(6, "little").decode("ascii")  # S7HVH.


def expected_at(state: int) -> int:
    return (PACKED >> (8 * state)) & 0xFF


def process_bytes(data: bytes, state: int = 0) -> int:
    """Miroir du prédicat compilé (arrêt dès state ∈ {6, 7})."""
    for b in data:
        if state >= 6:
            return 7
        if b == expected_at(state):
            state += 1
        else:
            state = 7
        if state in (6, 7):
            return state
    return state


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    if args.check:
        blob = BIN.read_bytes()
        if struct.pack("<Q", PACKED) not in blob:
            print("FAIL: packed immediate introuvable", file=sys.stderr)
            return 1
        if process_bytes(PASSWORD.encode()) != 6:
            print("FAIL: simulateur", file=sys.stderr)
            return 1
        r = subprocess.run(
            [str(BIN), PASSWORD],
            capture_output=True,
            text=True,
            timeout=5,
        )
        out = (r.stdout + r.stderr).strip()
        print(out)
        ok = "Correct!" in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(PASSWORD)
    else:
        print(f"{PASSWORD}  # packed LE 0x{PACKED:x}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
