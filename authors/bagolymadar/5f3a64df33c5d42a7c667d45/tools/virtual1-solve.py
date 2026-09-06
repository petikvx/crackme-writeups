#!/usr/bin/env python3
"""bagolymadar virtual.1 — username → serial (mini-VM bytecode).

Serial (21 chars): LLBB-HHHHHHHHHHHHHHHH
  LL = strlen(user) as 2 hex
  BB = (Σ popcount(user[i])) & 0xff as 2 hex
  H… = 16 hex of rolling hash (seed 0xb7e151628aed2a6a)
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "virtual.1"
SEED = 0xB7E151628AED2A6A


def popcount8(x: int) -> int:
    return bin(x & 0xFF).count("1")


def bitcount_sum(user: bytes) -> int:
    return sum(popcount8(c) for c in user) & 0xFF


def hash_user(user: bytes) -> int:
    state = SEED
    for c in user:
        pc = popcount8(c)
        if pc:
            state = ((state << pc) | (state >> (64 - pc))) & ((1 << 64) - 1)
        ch = (~c) & 0xFF if (pc & 1) else c
        state = (state & ~0xFF) | (((state & 0xFF) ^ ch) & 0xFF)
    return state


def serial_for(user: str) -> str:
    u = user.encode()
    return f"{len(u):02X}{bitcount_sum(u):02X}-{hash_user(u):016X}"


def live_check(user: str, serial: str) -> str:
    p = subprocess.run(
        [str(BIN)],
        input=f"{user}\n{serial}\n".encode(),
        capture_output=True,
        timeout=2,
    )
    return p.stdout.decode(errors="replace")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-u", "--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    ser = serial_for(args.user)
    assert len(ser) == 21
    if args.check:
        out = live_check(args.user, ser)
        ok = "Yep, you got it" in out
        print(out.rstrip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(ser)
    else:
        print(f"{args.user} → {ser}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
