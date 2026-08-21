#!/usr/bin/env python3
"""Unpack CrackNotMe MCM 3.0 custom packer → PE.

Stub (entry ~0x140001000) :
  VirtualAlloc(0, 0x3e800, MEM_COMMIT|RESERVE, PAGE_READWRITE)
  for i in 0..0x3e800:
      out[i] = key[i & 0x1f] ^ payload[i]
  write GetTempPathA()+wsprintfA("%swct%08X.tmp", GetCurrentProcessId()^0x4a3b2c1d)
  CreateProcessA(temp) ; wait ; DeleteFileA

Key    @ VA 0x14004db60
Payload@ VA 0x14000f360  (size 0x3e800)

Usage :
  python3 mcm3-unpack.py [-o analysis/CrackMe_unpacked.exe]
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

KEY_VA = 0x14004DB60
PAYLOAD_VA = 0x14000F360
PAYLOAD_SIZE = 0x3E800
IMAGE_BASE = 0x140000000

_PE = Path(__file__).resolve().parents[1] / "original" / "CrackMe_packed.exe"


def va2off(va: int) -> int:
    # packed layout: .text 0x140001000→0x400 ; .rdata 0x14000f000→0xe200
    if 0x140001000 <= va < 0x14000F000:
        return 0x400 + (va - 0x140001000)
    if 0x14000F000 <= va < 0x140058000:
        return 0xE200 + (va - 0x14000F000)
    raise ValueError(hex(va))


def unpack(pe: Path) -> bytes:
    data = pe.read_bytes()
    key = data[va2off(KEY_VA) : va2off(KEY_VA) + 32]
    payload = data[va2off(PAYLOAD_VA) : va2off(PAYLOAD_VA) + PAYLOAD_SIZE]
    if len(payload) < PAYLOAD_SIZE:
        raise RuntimeError("payload truncated")
    out = bytearray(PAYLOAD_SIZE)
    for i in range(PAYLOAD_SIZE):
        out[i] = key[i & 0x1F] ^ payload[i]
    if out[:2] != b"MZ":
        raise RuntimeError("unpack did not yield MZ")
    return bytes(out)


def main() -> int:
    ap = argparse.ArgumentParser(description="MCM 3.0 packer unpacker")
    ap.add_argument("--pe", type=Path, default=_PE)
    ap.add_argument(
        "-o",
        type=Path,
        default=None,
        help="output PE (défaut: analysis/CrackMe_unpacked.exe)",
    )
    args = ap.parse_args()
    out = unpack(args.pe)
    dest = args.o or (args.pe.resolve().parents[1] / "analysis" / "CrackMe_unpacked.exe")
    dest.parent.mkdir(parents=True, exist_ok=True)
    dest.write_bytes(out)
    key = args.pe.read_bytes()[va2off(KEY_VA) : va2off(KEY_VA) + 32]
    print(f"wrote {dest} ({len(out)} bytes, MZ OK)")
    print(f"key   {key.hex()}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
