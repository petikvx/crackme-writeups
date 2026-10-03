#!/usr/bin/env python3
"""Patch sentinel — kamil123 Mini LLM Sentinel (crackme03.exe)

Lit ``original/crackme03.exe`` (jamais modifié) et écrit
``analysis/crackme03.patched.exe``.

Le LLM embarqué n’est pas le prédicat password : il vote « hostile »
(x64dbg, titres, PEB, INT3, timing) puis ``ExitProcess(3)``. Le challenge
autorise de le vaincre. On force un vote propre :

  VA 0x140001490  sub_140001490  infer/sentinel  →  xor eax, eax ; ret
  VA 0x140002E50  sub_140002E50  shutdown         →  ret

Usage :
  python tools/mini-llm-sentinel-patch.py
  python tools/mini-llm-sentinel-patch.py --src original/crackme03.exe --dst analysis/crackme03.patched.exe
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SRC = ROOT / "original" / "crackme03.exe"
DEFAULT_DST = ROOT / "analysis" / "crackme03.patched.exe"

# Image base IDA / PE OptionalHeader
VA_INFER = 0x140001490
VA_SHUTDOWN = 0x140002E50

PATCHES = (
    # (va, expected original prefix, patch bytes, label)
    (VA_INFER, bytes.fromhex("41554154"), bytes.fromhex("31C0C3"), "infer xor eax,eax; ret"),
    (VA_SHUTDOWN, bytes.fromhex("56534883"), bytes.fromhex("C3"), "shutdown ret"),
)


def pe_map(data: bytes) -> tuple[int, list[tuple[int, int, int, int]]]:
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    if data[e_lfanew : e_lfanew + 4] != b"PE\x00\x00":
        raise SystemExit("pas un PE")
    coff = e_lfanew + 4
    nsec = struct.unpack_from("<H", data, coff + 2)[0]
    opt_size = struct.unpack_from("<H", data, coff + 16)[0]
    magic = struct.unpack_from("<H", data, coff + 20)[0]
    if magic != 0x20B:
        raise SystemExit(f"PE magic {magic:#x}, attendu PE32+")
    image_base = struct.unpack_from("<Q", data, coff + 20 + 24)[0]
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


def apply(src: Path, dst: Path) -> int:
    if not src.is_file():
        print(f"source introuvable: {src}", file=sys.stderr)
        return 2
    data = bytearray(src.read_bytes())
    image_base, secs = pe_map(data)
    for va, expect, patch, label in PATCHES:
        off = va_to_off(va, image_base, secs)
        have = bytes(data[off : off + len(expect)])
        already = bytes(data[off : off + len(patch)]) == patch
        print(
            f"{label}\n"
            f"  VA {va:#x}  RVA {va - image_base:#x}  file+{off:#x}\n"
            f"  avant {data[off:off + 8].hex()}"
        )
        if already:
            print("  déjà patché")
            continue
        if have != expect:
            print(
                f"  prologue inattendu {have.hex()} (attendu {expect.hex()})",
                file=sys.stderr,
            )
            return 1
        data[off : off + len(patch)] = patch
        print(f"  après {data[off:off + 8].hex()}")
    if dst.resolve() == src.resolve():
        print("refus: ne pas écraser original/", file=sys.stderr)
        return 2
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_bytes(data)
    print(f"écrit {dst} ({len(data)} octets)")
    return 0


def main() -> int:
    ap = argparse.ArgumentParser(description="patch sentinel Mini LLM Sentinel")
    ap.add_argument("--src", type=Path, default=DEFAULT_SRC)
    ap.add_argument("--dst", type=Path, default=DEFAULT_DST)
    args = ap.parse_args()
    return apply(args.src, args.dst)


if __name__ == "__main__":
    raise SystemExit(main())
