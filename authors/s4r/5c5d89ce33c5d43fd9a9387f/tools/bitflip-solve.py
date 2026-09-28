#!/usr/bin/env python3
"""Mot de passe de bitflip (s4r).

La machine lit 64 dwords. Le test qui mène à « Well done » est inversible
à partir des mots stockés à l'adresse de bit 0x226fe0.
"""

from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "original" / "bitflip"
MEM_OFF = 0x1000 + (0x8049142 - 0x8049000)
DATA_END = 0x1000 + 0xB4F3A
BIT_BASE = 0x226FE0


def memory() -> bytes:
    blob = BIN.read_bytes()
    return blob[MEM_OFF:DATA_END]


def word_at(mem: bytes, bit: int) -> int:
    return struct.unpack_from("<i", mem, bit >> 3)[0]


def password() -> str:
    mem = memory()
    bit = BIT_BASE
    out = []
    i = 0
    while True:
        data_word = word_at(mem, bit)
        if data_word & 0x7FFFFFFF == 0:
            break
        value = data_word - (i + 1) * 0xCAFEBABE
        value += 0x17345168
        value ^= 0xAB4D1D34
        value >>= 17
        out.append(chr(value & 0xFF))
        bit += 0x20
        i += 1
        if i > 64:
            raise SystemExit("mot de passe trop long")
    return "".join(out)


def main() -> None:
    ap = argparse.ArgumentParser(description="bitflip password")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    pw = password()
    if len(pw) != 64:
        raise SystemExit(f"longueur {len(pw)}, attendu 64")
    if args.check:
        proc = subprocess.run(
            [str(BIN)],
            input=pw.encode(),
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if b"Well done." not in proc.stdout:
            sys.stdout.buffer.write(proc.stdout)
            raise SystemExit(1)
        bad = subprocess.run(
            [str(BIN)],
            input=b"A" * 64,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            check=False,
        )
        if b"Well done." in bad.stdout or b"out of the box" not in bad.stdout:
            raise SystemExit("le mot de passe faux n'est pas rejeté")
        print("ok")
        return
    if args.q:
        print(pw)
        return
    print(pw)


if __name__ == "__main__":
    main()
