#!/usr/bin/env python3
"""patchme_1 (oxygen) — nag MessageBox + Good Boy [name].

ReadMe : ajouter un nag, puis afficher le nom dans la fenêtre principale.
Le binaire d’origine ne fait qu’un MessageBox « Add a nag screen… » / ExitProcess.
La string « Good Boy [XXXXXXXXXXXXXX]! » est déjà en .data (inutilisée).

Le solveur réécrit `.text` (cave) + `.data` → `analysis/InjectMe.patched.exe`.

Usage:
  python3 tools/oxygen-patchme1-solve.py -q
  python3 tools/oxygen-patchme1-solve.py --user petik --check
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "original" / "_u" / "InjectMe.exe"
OUT = ROOT / "analysis" / "InjectMe.patched.exe"

GOOD_TEMPLATE = b"Good Boy [XXXXXXXXXXXXXX]!"
NAG_OLD = b"Add a nag screen and patch this message by your name !\x00"


def toff(va: int) -> int:
    if 0x401000 <= va < 0x402000:
        return 0x400 + (va - 0x401000)
    if 0x403000 <= va < 0x404000:
        return 0x800 + (va - 0x403000)
    raise ValueError(hex(va))


def good_boy(name: str) -> bytes:
    raw = name.encode("ascii", errors="replace")[:14]
    inner = raw + b" " * (14 - len(raw))
    return b"Good Boy [" + inner + b"]!"


def patch(name: str = "petik", dst: Path = OUT) -> Path:
    data = bytearray(SRC.read_bytes())
    gb = good_boy(name)
    assert len(gb) == len(GOOD_TEMPLATE)
    o = toff(0x403041)
    if data[o : o + len(GOOD_TEMPLATE)] not in (GOOD_TEMPLATE, gb):
        # allow re-patch
        if not data[o : o + 10].startswith(b"Good Boy ["):
            raise SystemExit("Good Boy string missing")
    data[o : o + len(gb)] = gb

    nag = f"Nag: crackme patched by {name}\x00".encode("ascii")
    if len(nag) > len(NAG_OLD):
        raise SystemExit("nag text too long")
    buf = bytearray(len(NAG_OLD))
    buf[: len(nag)] = nag
    data[toff(0x403000) : toff(0x403000) + len(NAG_OLD)] = buf

    out = bytearray()
    base = 0x401000

    def here() -> int:
        return base + len(out)

    def emit(b: bytes) -> None:
        out.extend(b)

    MSG, EXT = 0x401050, 0x401056
    emit(b"\x6a\x00")
    emit(b"\x68" + struct.pack("<I", 0x403037))
    emit(b"\x68" + struct.pack("<I", 0x403000))
    emit(b"\x6a\x00")
    emit(b"\xe8" + struct.pack("<i", MSG - (here() + 5)))
    emit(b"\x6a\x00")
    emit(b"\x68" + struct.pack("<I", 0x403037))
    emit(b"\x68" + struct.pack("<I", 0x403041))
    emit(b"\x6a\x00")
    emit(b"\xe8" + struct.pack("<i", MSG - (here() + 5)))
    emit(b"\x6a\x00")
    emit(b"\xe8" + struct.pack("<i", EXT - (here() + 5)))
    while here() < MSG:
        emit(b"\x90")
    emit(b"\xff\x25" + struct.pack("<I", 0x402008))
    emit(b"\xff\x25" + struct.pack("<I", 0x402000))

    text = toff(0x401000)
    data[text : text + 0x80] = b"\x00" * 0x80
    data[text : text + len(out)] = out
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    return dst


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--user", "--name", default="petik", dest="user")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    out = patch(args.user)
    if args.q:
        print(out)
        return 0
    print(f"name    : {args.user}")
    print(f"main    : {good_boy(args.user)!r}")
    print(f"patched → {out}")
    if args.check:
        d = out.read_bytes()
        gb = good_boy(args.user)
        if d[toff(0x403041) : toff(0x403041) + len(gb)] != gb:
            print("Good Boy mismatch", file=sys.stderr)
            return 1
        if d[toff(0x401050) : toff(0x401050) + 6] != bytes.fromhex("ff2508204000"):
            print("MessageBox stub mismatch", file=sys.stderr)
            return 1
        print("data + stubs: OK")
        print("Wine: nag then Good Boy [petik…] (caption Patched ?)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
