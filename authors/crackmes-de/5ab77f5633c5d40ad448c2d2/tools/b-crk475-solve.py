#!/usr/bin/env python3
"""Solveur — BuLLeT CrackMe v4.75 (Delphi 4).

Button1Click lit Edit1.Text puis @LStrCmp contre le littéral AnsiString
embarqué juste après le handler : « This program must be run under Win32 »
(message stub PE Delphi recyclé en serial — blague pour newbies).

Succès → Panel3.Visible (« Unlock successfull...read rulez above ! »)
Échec  → Panel2.Visible (« Wrong serial.....try again ;) »)

usage : tools/b-crk475-solve.py
        tools/b-crk475-solve.py --check SERIAL
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "B-Crk475.exe"
PASSWORD = "This program must be run under Win32"
# VA du littéral dans Button1Click (mov edx, imm32)
LITERAL_VA = 0x44093C
IMAGE_BASE = 0x400000
CODE_VA = 0x1000
CODE_RAW = 0x400


def va_to_file(va: int) -> int:
    rva = va - IMAGE_BASE
    return rva - CODE_VA + CODE_RAW


def extract_from_binary() -> str:
    data = EXE.read_bytes()
    fo = va_to_file(LITERAL_VA)
    refcount = struct.unpack_from("<i", data, fo - 8)[0]
    length = struct.unpack_from("<i", data, fo - 4)[0]
    if refcount != -1 or length != len(PASSWORD):
        raise SystemExit(
            f"header AnsiString inattendu @ {LITERAL_VA:#x}: "
            f"refcount={refcount} length={length}"
        )
    s = data[fo : fo + length].decode("ascii")
    if s != PASSWORD:
        raise SystemExit(f"littéral inattendu: {s!r}")
    # Button1Click doit bien référencer cette VA
    needle = b"\xba" + struct.pack("<I", LITERAL_VA)  # mov edx, imm32
    if needle not in data:
        raise SystemExit("mov edx, littéral introuvable dans Button1Click")
    return s


def main() -> int:
    pwd = extract_from_binary()
    if len(sys.argv) == 3 and sys.argv[1] == "--check":
        ok = sys.argv[2] == pwd
        print(
            "Unlock successfull...read rulez above !"
            if ok
            else "Wrong serial.....try again ;)"
        )
        return 0 if ok else 1
    print(pwd)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
