#!/usr/bin/env python3
"""Solveur — fjlj_crackme_2 by fjlj (crackmes.de)

PE32 console MinGW : name (≤8) + serial.
Le binaire écrit un JMP self-modifiant à 0x43F200+sum8(name), puis
exige que le checksum du serial (après +0x4D6) égale cette adresse.

Usage :
  python3 fjlj-crackme2-solve.py -q
  python3 fjlj-crackme2-solve.py --name petik
  python3 fjlj-crackme2-solve.py --check petik UM
  python3 fjlj-crackme2-solve.py --run
"""

from __future__ import annotations

import argparse
import itertools
import string
import subprocess
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "FJLJ_crackme#2.exe"

SMC_BASE = 0x43F200
ADD_CONST = 0x4D6
ALPHABET = string.ascii_letters + string.digits


def name_sum8(name: bytes) -> int:
    s = 0
    for b in name + b"\0":
        s = (s + b) & 0xFF
    return s


def smc_addr(name: bytes) -> int:
    return SMC_BASE + name_sum8(name)


def serial_buf(name: bytes) -> int:
    ecx = smc_addr(name)
    return ecx + (ecx ^ SMC_BASE) + 0x10


def serial_checksum(serial: bytes, buf_addr: int) -> int:
    data = serial + b"\0" + b"\0" * 16
    ecx = 0
    ebx = buf_addr
    while True:
        dl = data[ecx]
        ebx = (ebx + dl) & 0xFFFFFFFF
        ecx += 1
        dl = data[ecx]
        ebx = (ebx + dl) & 0xFFFFFFFF
        ecx += 1
        if dl == 0:
            break
    while True:
        ecx -= 2
        dl = data[ecx]
        ebx = (ebx - dl) & 0xFFFFFFFF
        if ecx <= 0:
            break
    edx = data[0]
    while True:
        dl = data[ecx]
        edx = (edx & ~0xFF) | dl
        edx = (edx << 4) & 0xFFFFFFFF
        ebx = (ebx - edx) & 0xFFFFFFFF
        ecx += 4
        if ((edx >> 8) & 0xFF) == 0:
            break
        edx = 0
    return ebx


def check(name: str, serial: str) -> bool:
    n = name.encode("ascii", "replace")
    if len(n) + 1 > 9:  # strlen+1 <= 9
        return False
    s = serial.encode("ascii", "replace")
    ebx = serial_checksum(s, serial_buf(n))
    return ((ebx + ADD_CONST) & 0xFFFFFFFF) == smc_addr(n)


def keygen(name: str = "petik") -> str:
    n = name.encode("ascii", "replace")
    if len(n) + 1 > 9:
        raise ValueError("name too long (max 8 chars)")
    buf = serial_buf(n)
    target = smc_addr(n)
    for length in range(1, 12):
        for prod in itertools.product(ALPHABET, repeat=length):
            ser = "".join(prod)
            ebx = serial_checksum(ser.encode(), buf)
            if ((ebx + ADD_CONST) & 0xFFFFFFFF) == target:
                return ser
    raise RuntimeError("no serial found")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--name", "-n", default="petik")
    ap.add_argument("-q", action="store_true", help="print serial only")
    ap.add_argument("--check", nargs=2, metavar=("NAME", "SERIAL"))
    ap.add_argument("--run", action="store_true", help="verify under wine")
    args = ap.parse_args()

    if args.check:
        ok = check(args.check[0], args.check[1])
        print("check:", "OK" if ok else "FAIL")
        return 0 if ok else 1

    serial = keygen(args.name)
    if args.q:
        print(serial)
    else:
        print(f"{args.name} → {serial}")

    if args.run:
        if not _BIN.is_file():
            print("missing binary", _BIN, file=sys.stderr)
            return 1
        proc = subprocess.run(
            ["xvfb-run", "-a", "wine", str(_BIN)],
            input=f"{args.name}\n{serial}\n\n".encode(),
            capture_output=True,
            timeout=20,
        )
        out = (proc.stdout or b"") + (proc.stderr or b"")
        text = out.decode("latin-1", "replace")
        ok = "YAY!" in text
        print("wine:", "YAY!" if ok else "no YAY")
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
