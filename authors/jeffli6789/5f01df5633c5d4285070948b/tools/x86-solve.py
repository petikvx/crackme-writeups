#!/usr/bin/env python3
"""jeffli6789 x86 — int key patches shellcode add/sub slots → cmp eax, target.

32 bits: bit=1 → add imm, bit=0 → sub imm (opcodes 0x05 / 0x2d).
Start eax=0x3df2f794, need eax==0x7a612770 then sete/ret.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "x86"

IMM = [
    0x52AE22F2, 0xBF409BCC, 0x46417DC1, 0x25F7D9A1, 0xEF83A7CE, 0x2DD63E8E, 0x584A1EC5, 0x8E58E1DF,
    0xF2705F70, 0x2E94EF1E, 0x3CA9E080, 0xA617B5DF, 0x29AE9C3D, 0x7461ED52, 0x7125FAAC, 0x65DFFFD6,
    0x97F1F41C, 0x6F4E0648, 0xD803E5D0, 0xF358F0EB, 0xBC3B30C7, 0x585685F8, 0x2A9CC47C, 0x7F03D175,
    0xC1D942AE, 0x174C7D4F, 0xB7D004F0, 0xBEC8B077, 0x8CE8EAA2, 0x2510E330, 0x4AED0EEE, 0x4043CD91,
]
START = 0x3DF2F794
TARGET = 0x7A612770
KEY = 0x164EF9D6  # meet-in-the-middle


def solve() -> int:
    need = (TARGET - START) & 0xFFFFFFFF
    half = 16
    table: dict[int, int] = {}
    for m in range(1 << half):
        s = 0
        for i in range(half):
            s = (s + IMM[i]) & 0xFFFFFFFF if (m >> i) & 1 else (s - IMM[i]) & 0xFFFFFFFF
        table[s] = m
    for m in range(1 << half):
        s = 0
        for i in range(half):
            s = (s + IMM[half + i]) & 0xFFFFFFFF if (m >> i) & 1 else (s - IMM[half + i]) & 0xFFFFFFFF
        want = (need - s) & 0xFFFFFFFF
        if want in table:
            return table[want] | (m << half)
    raise RuntimeError("unsat")


def live_check(key: int) -> str:
    return subprocess.run(
        [str(BIN)],
        input=f"{key}\n".encode(),
        capture_output=True,
        timeout=2,
    ).stdout.decode(errors="replace")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    key = solve()
    assert key == KEY
    if args.check:
        out = live_check(key)
        ok = "Well done" in out
        print(out.rstrip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(key if args.q else f"{key}  ({key:#x})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
