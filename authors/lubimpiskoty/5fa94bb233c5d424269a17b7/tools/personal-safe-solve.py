#!/usr/bin/env python3
"""LubimPiskoty Personal Safe — 16-byte password, four 4-byte sum groups.

A = sum[0:4] = sum[8:12]
B = sum[4:8] = sum[12:16]
2(A+B) = 0x42e → A+B = 535
A+11 = B → A=262, B=273
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "safe"
EXAMPLE = "ABABDDDEABABDDDE"
A_SUM, B_SUM = 262, 273


def group(target: int) -> bytes:
    for a in range(0x20, 0x7F):
        for b in range(0x20, 0x7F):
            for c in range(0x20, 0x7F):
                d = target - a - b - c
                if 0x20 <= d <= 0x7E:
                    return bytes([a, b, c, d])
    raise RuntimeError(f"no printable group for {target}")


def password() -> str:
    a, b = group(A_SUM), group(B_SUM)
    # Prefer the documented example when it matches constraints
    ex = EXAMPLE.encode()
    if (
        sum(ex[0:4]) == A_SUM
        and sum(ex[4:8]) == B_SUM
        and ex[0:4] == ex[8:12]
        and ex[4:8] == ex[12:16]
    ):
        return EXAMPLE
    return (a + b + a + b).decode("ascii")


def live_check(pw: str) -> bytes:
    return subprocess.run(
        [str(BIN)],
        input=pw.encode(),
        capture_output=True,
        timeout=2,
    ).stdout


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    pw = password()
    assert len(pw) == 16
    assert sum(map(ord, pw[0:4])) == A_SUM
    assert sum(map(ord, pw[4:8])) == B_SUM
    if args.check:
        out = live_check(pw)
        ok = b"Access granted" in out
        print(out.decode(errors="replace").rstrip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(pw if args.q else f"{pw}  # A={A_SUM} B={B_SUM} mirrored")
    return 0


if __name__ == "__main__":
    sys.exit(main())
