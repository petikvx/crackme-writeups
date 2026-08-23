#!/usr/bin/env python3
"""Amnon Crackme_1 (HTB) — name + serial helper.

Name is fixed by MD5 gate:
  MD5("Amnon^HTB Team") == 6c7350098cb1b607bc170556e12b7991

Serial (≤32): must contain ASCII "BC17" at offset 16.
Further Tiger-192 / hex dword checks are documented in the write-up;
a clean keygen for those 4×32-bit constraints is impractical (~2^128).
NFO allows patching when needed (anti-debug + optional serial JNEs).

Examples use the fixed valid name (not petik — rejected by MD5 gate).
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import sys

NAME = b"Amnon^HTB Team"
NAME_MD5 = "6c7350098cb1b607bc170556e12b7991"
ESI = 0x042384E6  # bswap(CRC32(11 * 0x20))


def name_keys(name: bytes = NAME) -> list[int]:
    md = hashlib.md5(name).digest()
    return [((struct.unpack_from("<I", md, 4 * i)[0] ^ ESI) - 0x1E) & 0xFFFFFFFF for i in range(4)]


def default_serial(tag: bytes = b"PETIK") -> bytes:
    """Build a 32-byte serial with BC17 at offset 16."""
    prefix = (tag + b"-AMNON-KEY!!!!")[:16]
    suffix = b"-HTBTEAM!!!!!"[:12]
    s = prefix + b"BC17" + suffix
    assert len(s) == 32 and s[16:20] == b"BC17"
    return s


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="quiet: print name\\nserial only")
    ap.add_argument("--check", action="store_true", help="verify MD5 gate + BC17 layout")
    ap.add_argument("--tag", default="PETIK", help="prefix tag baked into example serial")
    args = ap.parse_args()

    name = NAME
    serial = default_serial(args.tag.encode())

    if hashlib.md5(name).hexdigest() != NAME_MD5:
        print("internal MD5 mismatch", file=sys.stderr)
        return 1
    if serial[16:20] != b"BC17" or not (1 <= len(serial) <= 32):
        print("bad serial layout", file=sys.stderr)
        return 1

    if args.check:
        keys = name_keys(name)
        print(f"name   : {name.decode()}")
        print(f"md5    : {NAME_MD5}")
        print(f"keys   : {[hex(k) for k in keys]}")
        print(f"serial : {serial.decode('ascii', 'replace')} (len={len(serial)})")
        print("BC17   : OK @ offset 16")
        print("note   : Tiger-192 dword checks need patch or full keygen (see README)")
        return 0

    if args.q:
        print(name.decode())
        print(serial.decode("ascii"))
        return 0

    print(f"name   = {name.decode()}")
    print(f"serial = {serial.decode('ascii')}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
