#!/usr/bin/env python3
"""shism buggers_v.5 — patch anti-Olly TerminateProcess.

PE32 GUI ASM: FindWindow("OLLYDBG") + Toolhelp enum OLLYDBG.EXE/DAEMON
→ OpenProcess/TerminateProcess. No password; goal = keep Olly alive.

Official approach (crackmes.de write-up deibiz_xxl): NOP the TerminateProcess
call site VA 0x4011CB..0x4011D8.

  ./buggers-v5-solve.py -q
  ./buggers-v5-solve.py --check
  ./buggers-v5-solve.py --patch analysis/buggers.patched.exe
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ORIG = ROOT / "original" / "_u" / "buggers.exe"

# VA 4011CB: push 0; push handle; call [TerminateProcess]
PATCH_OFF = 0x5CB
PATCH_LEN = 0x4011D9 - 0x4011CB  # through call, leave ExitProcess
ORIG_BYTES = bytes.fromhex("6a00ff3564324000ff1520314000")  # len 14 = 0x0E
assert len(ORIG_BYTES) == PATCH_LEN == 14


def patch(data: bytes) -> bytes:
    b = bytearray(data)
    if b[PATCH_OFF : PATCH_OFF + PATCH_LEN] != ORIG_BYTES:
        raise ValueError(
            f"unexpected bytes at {PATCH_OFF:#x}: "
            f"{b[PATCH_OFF:PATCH_OFF+PATCH_LEN].hex()}"
        )
    b[PATCH_OFF : PATCH_OFF + PATCH_LEN] = b"\x90" * PATCH_LEN
    return bytes(b)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--patch", type=Path, help="write patched PE")
    ap.add_argument("--file", type=Path, default=ORIG)
    args = ap.parse_args()

    raw = args.file.read_bytes()
    if raw[PATCH_OFF : PATCH_OFF + PATCH_LEN] != ORIG_BYTES:
        print("CHECK FAIL: pattern mismatch", file=sys.stderr)
        return 1

    msg = (
        f"patch VA 0x4011CB..0x4011D8 (file {PATCH_OFF:#x}): "
        f"NOP×{PATCH_LEN} TerminateProcess (anti-Olly)"
    )
    if args.q:
        print(f"NOP@{PATCH_OFF:#x}x{PATCH_LEN}")
    else:
        print(msg)
        print("note: Wine crashes on kernel32 base walk (TEB); verify under Windows/Olly")

    if args.patch:
        args.patch.parent.mkdir(parents=True, exist_ok=True)
        args.patch.write_bytes(patch(raw))
        print(f"wrote {args.patch}")

    if args.check:
        patched = patch(raw)
        if patched[PATCH_OFF : PATCH_OFF + PATCH_LEN] != b"\x90" * PATCH_LEN:
            print("CHECK FAIL", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
