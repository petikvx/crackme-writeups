#!/usr/bin/env python3
"""Solver / solveur — acheylate's Beat The Game (ELF64 Rust / macroquad)

Win if score (u32) >= 100. +1 point/s, death at t >= 10.0. Patching allowed.
Victoire si score (u32) >= 100. +1 point/s, mort à t >= 10.0. Patch autorisé.

Patches (PIE fileoff = VA − 0x1000):
  always-win  is_win imm  file 0x712e2 : 64 → 00
              cmp edi, 100 → cmp edi, 0  (unsigned: any score wins)
  wrap        inc edi     file 0x71e14 : FF C7 → FF CF
              score++ → score--  (0 wraps to 0xFFFFFFFF >= 100)

Usage:
  python3 beat-the-game-solve.py -q
  python3 beat-the-game-solve.py --check
  python3 beat-the-game-solve.py --patch always-win
  python3 beat-the-game-solve.py --patch wrap
"""
from __future__ import annotations

import argparse
import hashlib
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "game"
ANALYSIS = ROOT / "analysis"

SHA256 = "ec2b7da945bc097547b34fe0d61a89871fa045faefc5229feafd7162786f9e96"

# game::is_win : cmp edi, 0x64 ; setnb al ; ret
IS_WIN_OFF = 0x712E0
IS_WIN_ORIG = bytes.fromhex("83ff640f93c0c3")
IS_WIN_IMM_OFF = 0x712E2  # the 0x64

# game::is_dead : ucomiss xmm0, [rip+10.0] ; setnb al ; ret
IS_DEAD_OFF = 0x712F0
IS_DEAD_ORIG = bytes.fromhex("0f2e05fdd3faff0f93c0c3")

# Game::update score tick : inc edi
INC_OFF = 0x71E14
INC_ORIG = bytes.fromhex("ffc7")
DEC_EDI = bytes.fromhex("ffcf")

WIN_THRESHOLD = 100
DEATH_TIME = 10.0
WIN_MSG = "YOU WIN / Crackme solved!"
DEAD_MSG = "YOU DIED"


def is_win(score: int) -> bool:
    return (score & 0xFFFFFFFF) >= WIN_THRESHOLD


def is_dead(elapsed: float) -> bool:
    return elapsed >= DEATH_TIME


def simulate(seconds: int, wrap: bool = False) -> tuple[int, str]:
    """One tick = 1.0 s (the binary accumulates per-frame dt)."""
    score = 0
    elapsed = 0.0
    for _ in range(seconds):
        elapsed += 1.0
        if wrap:
            score = (score - 1) & 0xFFFFFFFF
        else:
            score = (score + 1) & 0xFFFFFFFF
        if is_win(score):
            return score, WIN_MSG
        if is_dead(elapsed):
            return score, DEAD_MSG
    return score, "playing"


def verify_original(blob: bytes) -> None:
    h = hashlib.sha256(blob).hexdigest()
    if h != SHA256:
        raise SystemExit(f"FAIL: sha256 {h} (expected {SHA256})")
    if blob[IS_WIN_OFF : IS_WIN_OFF + 7] != IS_WIN_ORIG:
        raise SystemExit("FAIL: is_win bytes")
    if blob[IS_DEAD_OFF : IS_DEAD_OFF + 11] != IS_DEAD_ORIG:
        raise SystemExit("FAIL: is_dead bytes")
    if blob[INC_OFF : INC_OFF + 2] != INC_ORIG:
        raise SystemExit("FAIL: inc edi")


def patch_always_win(blob: bytearray) -> None:
    blob[IS_WIN_IMM_OFF] = 0x00


def patch_wrap(blob: bytearray) -> None:
    blob[INC_OFF : INC_OFF + 2] = DEC_EDI


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument(
        "--patch",
        choices=("always-win", "wrap"),
        help="write analysis/game.<mode> (leaves original/ untouched)",
    )
    args = ap.parse_args()

    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        blob = BIN.read_bytes()
        verify_original(blob)
        score, msg = simulate(10, wrap=False)
        if msg != DEAD_MSG or score != 10:
            print(f"FAIL: vanilla {score=} {msg=}", file=sys.stderr)
            return 1
        score, msg = simulate(1, wrap=True)
        if msg != WIN_MSG or score != 0xFFFFFFFF:
            print(f"FAIL: wrap {score=:08x} {msg=}", file=sys.stderr)
            return 1
        if is_win(0) or not is_win(100) or not is_win(0xFFFFFFFF):
            print("FAIL: is_win", file=sys.stderr)
            return 1
        print("vanilla 10s → YOU DIED score=10")
        print("wrap 1s    → YOU WIN  score=0xffffffff")
        print("always-win : cmp edi, 0 (unsigned) on first frame")
        print("OK")
        return 0

    if args.patch:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        blob = bytearray(BIN.read_bytes())
        verify_original(bytes(blob))
        ANALYSIS.mkdir(exist_ok=True)
        if args.patch == "always-win":
            patch_always_win(blob)
            out = ANALYSIS / "game.always-win"
        else:
            patch_wrap(blob)
            out = ANALYSIS / "game.wrap"
        out.write_bytes(blob)
        print(out)
        return 0

    if args.q:
        print("always-win|wrap")
        return 0
    print("=== Beat The Game ===")
    print("win  : score u32 >= 100 (is_win)")
    print("lose : t >= 10.0 (is_dead)  — vanilla max 10 pts → YOU DIED")
    print("always-win : 1 byte 0x64→0x00 in is_win (file 0x712e2)")
    print("wrap       : inc edi → dec edi (file 0x71e14) → 0xffffffff on first tick")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
