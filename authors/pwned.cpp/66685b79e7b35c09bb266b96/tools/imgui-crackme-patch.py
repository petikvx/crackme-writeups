#!/usr/bin/env python3
"""Patch anti-debug — Pwned.cpp ImGUI-CrackME (CrackME.exe PE32)

Lit ``original/CrackME.exe`` (jamais modifié) et écrit
``analysis/CrackME.patched.exe``.

WinMain arme trois drapeaux BSS puis lance un thread ``sub_403730``
(process / FindWindow / drivers). Sur cette machine un titre ``x32DBG``
fait ``exit(1)``. On force les drapeaux à 0 :

  VA 0x40396F  mov byte_4386B3, 1  → 0   scan Process32
  VA 0x403976  mov byte_4386B1, 1  → 0   scan FindWindowA
  VA 0x40397D  mov byte_4386B2, 1  → 0   CreateFile \\\\.\\KsDumper

``byte_4386B0`` (thread timing) est déjà 0.

Usage :
  python tools/imgui-crackme-patch.py
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SRC = ROOT / "original" / "CrackME.exe"
DEFAULT_DST = ROOT / "analysis" / "CrackME.patched.exe"

VA_FLAGS = 0x40396F
ORIG_FLAGS = bytes.fromhex("c605b386430001c605b186430001c605b286430001")
PATCH_FLAGS = bytes.fromhex("c605b386430000c605b186430000c605b286430000")


def pe_map(data: bytes) -> tuple[int, list[tuple[int, int, int, int]]]:
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    if data[e_lfanew : e_lfanew + 4] != b"PE\x00\x00":
        raise SystemExit("pas un PE")
    coff = e_lfanew + 4
    nsec = struct.unpack_from("<H", data, coff + 2)[0]
    opt_size = struct.unpack_from("<H", data, coff + 16)[0]
    magic = struct.unpack_from("<H", data, coff + 20)[0]
    if magic != 0x10B:
        raise SystemExit(f"PE magic {magic:#x}, attendu PE32")
    image_base = struct.unpack_from("<I", data, coff + 20 + 28)[0]
    sec_off = coff + 20 + opt_size
    secs = []
    for i in range(nsec):
        o = sec_off + i * 40
        vsz, va, rsz, raw = struct.unpack_from("<IIII", data, o + 8)
        secs.append((va, vsz, raw, rsz))
    return image_base, secs


def va_to_off(va: int, image_base: int, secs) -> int:
    rva = va - image_base
    for sva, vsz, raw, rsz in secs:
        if sva <= rva < sva + max(vsz, rsz):
            return raw + (rva - sva)
    raise SystemExit(f"VA non mappée: {va:#x}")


def patch(src: Path, dst: Path) -> Path:
    data = bytearray(src.read_bytes())
    image_base, secs = pe_map(bytes(data))
    off = va_to_off(VA_FLAGS, image_base, secs)
    got = bytes(data[off : off + len(ORIG_FLAGS)])
    if got != ORIG_FLAGS:
        raise SystemExit(f"octets inattendus @ {off:#x}: {got.hex()}")
    data[off : off + len(PATCH_FLAGS)] = PATCH_FLAGS
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    return dst


def main() -> int:
    ap = argparse.ArgumentParser(description="Patch anti-debug ImGUI-CrackME")
    ap.add_argument("--src", type=Path, default=DEFAULT_SRC)
    ap.add_argument("--dst", type=Path, default=DEFAULT_DST)
    args = ap.parse_args()
    out = patch(args.src, args.dst)
    print(f"patched {out} ({out.stat().st_size} bytes)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
