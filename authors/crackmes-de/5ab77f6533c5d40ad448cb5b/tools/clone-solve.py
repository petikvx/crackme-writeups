#!/usr/bin/env python3
"""haggar clone — name→serial (8 hex), len(name)≥5.

  ./clone-solve.py -q
  ./clone-solve.py --name petik --check
"""
from __future__ import annotations

import argparse
import struct
import sys


def bswap32(x: int) -> int:
    return struct.unpack(">I", struct.pack("<I", x & 0xFFFFFFFF))[0]


def forward_target(name: bytes) -> int:
    if len(name) < 5:
        raise ValueError("name length must be >= 5")
    dl = sum(name[4:]) & 0xFF
    ecx = 0
    ecx = (ecx & ~0xFF) | dl
    ecx = (ecx & ~0xFF00) | (dl << 8)
    ecx = bswap32(ecx)
    ecx = (ecx & ~0xFF) | dl
    ecx = (ecx & ~0xFF00) | (dl << 8)
    eax = struct.unpack("<I", name[:4])[0]
    ecx ^= eax
    ecx = bswap32(ecx)
    ecx = (ecx + 0x03022006) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    ecx = (ecx - 0xDEADC0DE) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    cl = ((ecx & 0xFF) + 1) & 0xFF
    ch = (((ecx >> 8) & 0xFF) + 1) & 0xFF
    ecx = (ecx & 0xFFFF0000) | (ch << 8) | cl
    ecx = bswap32(ecx)
    cl = ((ecx & 0xFF) - 1) & 0xFF
    ch = (((ecx >> 8) & 0xFF) - 1) & 0xFF
    ecx = (ecx & 0xFFFF0000) | (ch << 8) | cl
    ecx = bswap32(ecx)
    ecx ^= 0xEDB88320
    ecx = bswap32(ecx)
    ecx = (ecx + 0xD76AA478) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    ecx = (ecx - 0xB00BFACE) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    ecx = (ecx + 0x0BADBEEF) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    ecx = (ecx + 1) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    ecx = (ecx - 1) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    ecx = (ecx + eax) & 0xFFFFFFFF
    ecx = bswap32(ecx)
    ecx = (ecx & 0xFFFF0000) | (((ecx & 0xFFFF) + 1) & 0xFFFF)
    ecx = bswap32(ecx)
    ecx = (ecx & 0xFFFF0000) | (((ecx & 0xFFFF) + 1) & 0xFFFF)
    ecx = bswap32(ecx)
    return ecx


def decode_serial(serial: str) -> int:
    nib: list[int] = []
    for ch in serial.upper().encode("ascii"):
        if 0x30 <= ch <= 0x39:
            nib.append(ch - 0x30)
        elif 0x41 <= ch <= 0x46:
            nib.append(ch - 0x37)
        else:
            raise ValueError(f"bad serial char {ch!r}")
    if len(nib) != 8:
        raise ValueError("serial must be 8 hex digits")
    xors = [0x12, 0x56, 0x90, 0xCD]
    adds = [0x34, 0x78, 0xAB, 0xEF]
    eax = 0
    i = 0
    for k in range(4):
        bl = ((nib[i] << 4) + nib[i + 1]) & 0xFF
        i += 2
        bl = ((bl ^ xors[k]) + adds[k]) & 0xFF
        eax = (eax + bl) & 0xFFFFFFFF
        if k < 3:
            eax = (eax << 8) & 0xFFFFFFFF
    return bswap32(eax)


def keygen(name: str) -> str:
    target = forward_target(name.encode("ascii"))
    pre = bswap32(target)
    bytes_out = [
        (pre >> 24) & 0xFF,
        (pre >> 16) & 0xFF,
        (pre >> 8) & 0xFF,
        pre & 0xFF,
    ]
    xors = [0x12, 0x56, 0x90, 0xCD]
    adds = [0x34, 0x78, 0xAB, 0xEF]
    chars: list[str] = []
    for k, val in enumerate(bytes_out):
        raw = ((val - adds[k]) & 0xFF) ^ xors[k]
        chars.append(format((raw >> 4) & 0xF, "X"))
        chars.append(format(raw & 0xF, "X"))
    return "".join(chars)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--name", "--user", default="petik", dest="name")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    try:
        serial = keygen(args.name)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if args.q:
        print(serial)
    else:
        print(f"name   = {args.name!r}")
        print(f"serial = {serial}")

    if args.check:
        ok = decode_serial(serial) == forward_target(args.name.encode("ascii"))
        if not ok:
            print("CHECK FAIL", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
