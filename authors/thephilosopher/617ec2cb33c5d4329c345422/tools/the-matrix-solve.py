#!/usr/bin/env python3
"""ThePhilosopher The Matrix — multi-stage answers + live check.

Stages:
  1. credentials admin / password
  2. key1: sum(first 10 chars) == 0x46d  → }}}}}}}iQH
  3. key2 vs key1: Σ(((k1+k2)>>3)*4) == 0x3d8 → EEEEEEcgox
  4. cubic roots 2022, 2021, 2020 (order as prompted)
"""
from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "thematrix"

USER = "admin"
PASSWORD = "password"
KEY1 = "}}}}}}}iQH"
KEY2 = "EEEEEEcgox"
ENDGAME = ("2022", "2021", "2020")


def sum10(s: str) -> int:
    return sum(ord(c) for c in s[:10])


def middlegame_sum(k1: str, k2: str) -> int:
    total = 0
    for a, b in zip(k1, k2):
        total += (((ord(a) + ord(b)) >> 3) * 4)
    return total


def answers() -> list[str]:
    return [USER, PASSWORD, KEY1, KEY2, *ENDGAME]


def live_check(timeout: float = 3.0) -> str:
    """Sequential timed lines — dumping all stdin at once fails credential reads."""
    p = subprocess.Popen(
        [str(BIN)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    assert p.stdin
    for line in answers():
        time.sleep(0.08)
        p.stdin.write(f"{line}\n".encode())
        p.stdin.flush()
    out, _ = p.communicate(timeout=timeout)
    return out.decode(errors="replace")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="one answer per line")
    ap.add_argument("--check", action="store_true", help="run binary live")
    args = ap.parse_args()
    assert sum10(KEY1) == 0x46D
    assert middlegame_sum(KEY1, KEY2) == 0x3D8
    if args.check:
        out = live_check()
        ok = "Congradulations" in out or "Congratulations" in out
        print(out.rstrip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print("\n".join(answers()))
    else:
        print(f"user={USER} pass={PASSWORD}")
        print(f"key1={KEY1}  # sum10={sum10(KEY1):#x}")
        print(f"key2={KEY2}  # mid={middlegame_sum(KEY1, KEY2):#x}")
        print(f"endgame={' '.join(ENDGAME)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
