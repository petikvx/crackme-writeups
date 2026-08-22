#!/usr/bin/env python3
"""Solveur / keygen — crackmes.de yyyyyyy1

ELF32 NASM obfusqué. Password **16** octets (ascii `!`..`z`), `\n` final.
Hash sur key[1..15] :

  ebx=0
  for al in key[1:]:
      ebx = (~((ebx ^ al) + 0x2a) - 1) & 0xffffffff
  key[0] == ebx & 0xff

Usage:
  python3 yyyyyyy1-solve.py -q
  python3 yyyyyyy1-solve.py --check
"""
from __future__ import annotations

import argparse
import random
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "yyyyyyy1"
ALPHA = list(range(0x21, 0x7B))


def step(ebx: int, al: int) -> int:
    ebx ^= al
    ebx = (ebx + 0x2A) & 0xFFFFFFFF
    ebx = (~ebx) & 0xFFFFFFFF
    ebx = (ebx - 1) & 0xFFFFFFFF
    return ebx


def keygen(seed: int = 2) -> str:
    rng = random.Random(seed)
    while True:
        body = bytes(rng.choice(ALPHA) for _ in range(15))
        h = 0
        for al in body:
            h = step(h, al)
        k0 = h & 0xFF
        if 0x21 <= k0 <= 0x7A:
            return (bytes([k0]) + body).decode("latin1")


DEFAULT = keygen(2)  # 8bwh8ZVdOlNOZ5T\


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--seed", type=int, default=2)
    args = ap.parse_args()
    pw = keygen(args.seed) if args.seed != 2 else DEFAULT
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        out = subprocess.run(
            [str(BIN)], input=(pw + "\n").encode("latin1"), capture_output=True, timeout=2
        ).stdout.decode(errors="replace")
        ok = "win!" in out
        print(out.strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
        return 0
    print("=== yyyyyyy1 ===")
    print(f"key : {pw!r}  (len 16)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
