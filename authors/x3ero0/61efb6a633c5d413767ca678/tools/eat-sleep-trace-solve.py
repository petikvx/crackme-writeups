#!/usr/bin/env python3
"""X3eRo0 Eat Sleep Trace Repeat — recover password from instruction-only trace.

No binary: only `original/trace.txt`. Rebuild xorshift64* table (seed 0x41424344),
then count LookupFromInput scan loops to index into that table.
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TRACE = ROOT / "original" / "trace.txt"
FLAG = "zh3r0{d1d_y0u_enjoyed_r3v3rs1ng_w1th0ut_b1n4ry_?}"

CALL_LOOKUP = "0x4010bd : call 0x401106"
SCAN_BYTE = "0x401110 : mov al, byte ptr [rdx+0x402008]"
MUL = 0x2545F4914F6CDD1D
SEED = 0x41424344
TABLE_LEN = 0x800


def xorshift64star_table(seed: int = SEED, n: int = TABLE_LEN) -> list[int]:
    """Match shellcode: update state, then (state * MUL) & 0xff."""
    state = seed & 0xFFFFFFFFFFFFFFFF
    out: list[int] = []
    for _ in range(n):
        x = state
        x ^= x >> 12
        x &= 0xFFFFFFFFFFFFFFFF
        x ^= (x << 25) & 0xFFFFFFFFFFFFFFFF
        x &= 0xFFFFFFFFFFFFFFFF
        x ^= x >> 27
        x &= 0xFFFFFFFFFFFFFFFF
        state = x
        out.append((x * MUL) & 0xFF)
    return out


def recover(trace_path: Path = TRACE) -> str:
    table = xorshift64star_table()
    counts: list[int] = []
    cnt = 0
    for line in trace_path.read_text(encoding="utf-8", errors="replace").splitlines():
        if line == CALL_LOOKUP:
            counts.append(cnt)
            cnt = 0
            continue
        if line == SCAN_BYTE:
            cnt += 1
    counts.append(cnt)
    # First count is before any input char (prologue); then one count per byte.
    chars: list[str] = []
    for c in counts[1:]:
        if c <= 0:
            break
        b = table[c - 1]
        if b == 0:
            break
        chars.append(chr(b))
    return "".join(chars).rstrip("\r\n")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="flag only")
    ap.add_argument("--check", action="store_true", help="assert known flag")
    ap.add_argument("--trace", type=Path, default=TRACE)
    args = ap.parse_args()
    flag = recover(args.trace)
    if args.check:
        assert flag == FLAG, repr(flag)
        print("OK", flag)
        return 0
    print(flag if args.q else f"{flag}  # from trace LookupFromInput counts")
    return 0


if __name__ == "__main__":
    sys.exit(main())
