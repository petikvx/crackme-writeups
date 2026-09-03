#!/usr/bin/env python3
"""mars1 (mars) — keygen name→serial (computed jump → MessageBox « yes »).

Prédicat (Generate, ID 402) :
  len(name) ≤ 8, len(serial) > 1
  GetTickCount delta ≤ 16 ms (les deux champs déjà remplis)
  diff = *(u32*)name - *(u32*)serial  ∈ (0x401248, 0x4012AF)
  push diff ; ret  → atterrir sur le gadget @0x40125E
  qui écrit eax dans .text puis XOR « NO! » → « yes »

Usage:
  python3 tools/mars1-solve.py -q
  python3 tools/mars1-solve.py --user petik -q
  python3 tools/mars1-solve.py --check
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "_u" / "mars1.exe"

# Atterrissage unique qui écrit en .text (W) puis produit « yes »
LAND = 0x40125E


def keygen(name: str) -> bytes:
    raw = name.encode("latin1", errors="replace")
    if not (1 <= len(raw) <= 8):
        raise ValueError("name length must be 1..8")
    # premier dword LE (padding NUL comme buffer .data)
    buf = (raw + b"\x00" * 4)[:4]
    nd = struct.unpack("<I", buf)[0]
    # diff signé doit être LAND (gadget) ; js échoue si négatif
    if nd <= LAND:
        raise ValueError("name dword too small for positive diff")
    sd = nd - LAND
    if not (0x401248 < LAND < 0x4012AF):
        raise ValueError("internal LAND out of window")
    return struct.pack("<I", sd)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument("-q", action="store_true", help="serial seul (latin1 / hex si -q)")
    ap.add_argument("--hex", action="store_true", help="afficher le serial en hex")
    ap.add_argument("--check", action="store_true", help="vérifie LAND dans le PE")
    args = ap.parse_args()

    try:
        serial = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1

    if args.q:
        if args.hex:
            print(serial.hex())
        else:
            # bytes bruts sur stdout
            sys.stdout.buffer.write(serial + (b"" if args.hex else b"\n"))
        return 0

    print(f"name   : {args.user!r}")
    print(f"serial : {serial!r}  (hex {serial.hex()})")
    print(f"diff   : {LAND:#x} (gadget → yes)")

    if args.check:
        data = BIN.read_bytes()
        # VA 0x40125E → file: section .text raw 0x400, VA 0x401000
        off = 0x400 + (LAND - 0x401000)
        gadget = data[off : off + 6]
        # a3 40 12 40 00 = mov [401240], eax
        if gadget[:5] != bytes.fromhex("a340124000"):
            print(f"gadget mismatch @file {off:#x}: {gadget.hex()}", file=sys.stderr)
            return 1
        print(f"PE gadget @0x40125E: OK ({gadget.hex()})")
        # XOR math
        old = int.from_bytes(b"NO!\x00", "little")
        new = ((LAND + 0x1217D9) ^ old) & 0xFFFFFFFF
        print(f"XOR NO! → {new.to_bytes(4, 'little')!r}")
        if new.to_bytes(4, "little")[:3] != b"yes":
            print("expected yes", file=sys.stderr)
            return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
