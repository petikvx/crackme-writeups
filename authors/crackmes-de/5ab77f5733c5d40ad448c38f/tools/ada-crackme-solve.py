#!/usr/bin/env python3
"""Keygen for DarKPhoeniX ada_crackme_1 (crackmes.de 5ab77f5733c5d40ad448c38f).

The serial is 30 printable bytes. For each position i (1..30) the byte is
xored with a fixed table (the bytes of ``__gnat_install_handler``), then

    acc = 1
    acc = (acc * factor) mod 0x7FFFFFFF

A 0xFF xor collapses to factor 0 and kills the product. The check accepts
the serial when acc == 0xABCDEF and both the username and the serial are
longer than 4 characters. The username itself is not mixed in.

The serial below is one solution (most factors are 1). ``--check`` recomputes
the product.
"""

from __future__ import annotations

import argparse
import sys

MOD = 0x7FFFFFFF
TARGET = 0xABCDEF
# bytes at 0x804D060, i = 1..30
TABLE = bytes([
    95, 95, 103, 110, 97, 116, 95, 105, 110, 115,
    116, 97, 108, 108, 95, 104, 97, 110, 100, 108,
    101, 114, 0, 95, 103, 110, 97, 116, 95, 97,
])
SERIAL = ">^f=`u^Roru`Qm^i`o&mds6^f0`u8`"


def factor(serial_byte: int, table_byte: int) -> int:
    mixed = serial_byte ^ table_byte
    if mixed == 0xFF:
        return 0
    return mixed


def hash_serial(serial: str) -> int:
    raw = serial.encode("latin1")
    if len(raw) > 30:
        raise ValueError("serial longer than 30")
    buf = raw + bytes(30 - len(raw))
    acc = 1
    for i in range(30):
        acc = (acc * factor(buf[i], TABLE[i])) % MOD
    return acc


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--user", default="petik", help="username (length > 4; default petik)")
    parser.add_argument("-q", action="store_true", help="print only the serial")
    parser.add_argument("--check", action="store_true", help="recompute acc and require 0xABCDEF")
    args = parser.parse_args()
    if not 5 <= len(args.user) <= 30:
        print("username length must be 5..30", file=sys.stderr)
        return 2
    if args.q:
        print(SERIAL)
    else:
        print(f"user:   {args.user}")
        print(f"serial: {SERIAL}")
    if args.check:
        got = hash_serial(SERIAL)
        if got != TARGET:
            print(f"check failed {got:#x}", file=sys.stderr)
            return 1
        if not args.q:
            print(f"check: acc == {TARGET:#x}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
