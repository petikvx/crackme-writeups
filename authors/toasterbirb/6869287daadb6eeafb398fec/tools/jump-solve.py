#!/usr/bin/env python3
"""Solveur — toasterbirb jump

ELF64 NASM : pile factice dans .text, champ de ud2, saut calculé.

  read(9) → qword LE @ buf
  rax = (qword >> 24) & 0xff   # = input[3]
  jmp (0x40114c + rax)         # doit atterrir sur 0x4011c0
  ⇒ input[3] == 0x74 ('t')

Exemples : test, just, xxxt…

Usage:
  python3 jump-solve.py -q
  python3 jump-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "jump"
DEFAULT = "just"
TARGET_BYTE = 0x74  # 't'
LANDING = 0x4011C0
JUMP_BASE = 0x40114C


def is_valid(word: str | bytes) -> bool:
    raw = word.encode() if isinstance(word, str) else word
    return len(raw) >= 4 and raw[3] == TARGET_BYTE


def check_live(word: str) -> int:
    if not is_valid(word):
        print(f"need len>=4 and word[3]=='t', got {word!r}", file=sys.stderr)
        return 1
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    payload = word.encode() + b"\n"
    r = subprocess.run([str(BIN)], input=payload, capture_output=True, timeout=5)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "enjoy your stay" in out
    print(f"{word!r} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", nargs="?", const=DEFAULT, metavar="WORD")
    ap.add_argument("word", nargs="?")
    args = ap.parse_args()
    if args.check is not None:
        return check_live(args.check)
    if args.word is not None:
        ok = is_valid(args.word)
        if args.quiet:
            print(args.word if ok else "")
        else:
            print(f"{args.word!r} valid={ok} (need [3]=='t'/{TARGET_BYTE:#x})")
        return 0 if ok else 1
    if args.quiet:
        print(DEFAULT)
    else:
        print(f"{DEFAULT}  # [3]=='t' → jmp {JUMP_BASE:#x}+0x74 = {LANDING:#x}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
