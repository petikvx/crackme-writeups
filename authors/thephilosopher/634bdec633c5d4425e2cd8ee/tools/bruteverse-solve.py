#!/usr/bin/env python3
"""ThePhilosopher Bruteverse — bruteforce XOR .data → 0xf3."""
from __future__ import annotations
import argparse, sys
from pathlib import Path

CT = bytes.fromhex(
    "bb968196d39a80d38a9c8681d3959f9294d3c9d3"
    "a1c1a5c1a1c6babdc6acc7a0aca1c7c1bfbfc4acb5c1bd"
)
FLAG = "R2V2R5IN5_4S_R42LL7_F2N"


def recover() -> tuple[int, str]:
    for k in range(256):
        pt = bytes(b ^ k for b in CT)
        if b"Here is your flag" in pt:
            return k, pt.decode("ascii")
    raise RuntimeError("not found")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    k, pt = recover()
    assert k == 0xF3 and FLAG in pt
    if args.check:
        print(f"xor key={k:#x}")
        print(pt)
        print("OK")
        return 0
    print(FLAG if args.q else f"{FLAG}  # .data xor 0xf3")
    return 0


if __name__ == "__main__":
    sys.exit(main())
