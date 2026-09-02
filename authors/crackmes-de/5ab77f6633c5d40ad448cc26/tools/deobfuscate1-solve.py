#!/usr/bin/env python3
"""shism deobfuscate_1 — strip short-jmp spaghetti, reorder to linear asm.

EP follows ``eb rel8`` chains; real ops sit between jmps; ``ret`` is at the
*start* of the file image (VA 0x401000) but last in execution order.

  ./deobfuscate1-solve.py -q
  ./deobfuscate1-solve.py --check
  ./deobfuscate1-solve.py --asm analysis/deobfuscated.asm
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

from capstone import CS_ARCH_X86, CS_MODE_32, Cs

ROOT = Path(__file__).resolve().parents[1]
ORIG = ROOT / "original" / "_u" / "Deobfuscate1.exe"


def pe_meta(data: bytes):
    pe = struct.unpack_from("<I", data, 0x3C)[0]
    ep_rva = struct.unpack_from("<I", data, pe + 40)[0]
    image_base = struct.unpack_from("<I", data, pe + 52)[0]
    num = struct.unpack_from("<H", data, pe + 6)[0]
    opt = struct.unpack_from("<H", data, pe + 20)[0]
    sec = pe + 24 + opt
    sections = []
    for i in range(num):
        off = sec + i * 40
        name = data[off : off + 8].split(b"\0", 1)[0].decode()
        vsz, va, rsz, raw = struct.unpack_from("<IIII", data, off + 8)
        sections.append((name, va, raw, rsz, vsz))
    return image_base, ep_rva, sections


def va_to_off(va: int, image_base: int, sections) -> int:
    rva = va - image_base
    for _name, sva, raw, rsz, vsz in sections:
        if sva <= rva < sva + max(rsz, vsz):
            return raw + (rva - sva)
    raise KeyError(hex(va))


def deobfuscate(data: bytes) -> list[str]:
    image_base, ep_rva, sections = pe_meta(data)
    md = Cs(CS_ARCH_X86, CS_MODE_32)
    pc = image_base + ep_rva
    seen: set[int] = set()
    linear: list[str] = []
    while pc not in seen and len(linear) < 10_000:
        seen.add(pc)
        off = va_to_off(pc, image_base, sections)
        insns = list(md.disasm(data[off : off + 16], pc, count=1))
        if not insns:
            raise RuntimeError(f"decode fail at {pc:#x}")
        insn = insns[0]
        if insn.mnemonic == "jmp" and insn.op_str.startswith("0x"):
            pc = int(insn.op_str, 16)
            continue
        linear.append(f"{insn.address:#010x}: {insn.mnemonic} {insn.op_str}".rstrip())
        if insn.mnemonic == "ret":
            break
        pc = insn.address + insn.size
    return linear


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--asm", type=Path, help="write linear listing")
    ap.add_argument("--file", type=Path, default=ORIG)
    args = ap.parse_args()

    lines = deobfuscate(args.file.read_bytes())
    if args.asm:
        args.asm.parent.mkdir(parents=True, exist_ok=True)
        args.asm.write_text("\n".join(lines) + "\n")

    last = lines[-1] if lines else ""
    ok = last.endswith("ret") or last.rstrip().endswith("ret")
    if args.q:
        print(f"{len(lines)} insns; last={last}")
    else:
        print(f"insns = {len(lines)}")
        print(f"first = {lines[0]}")
        print(f"last  = {last}")
        print("jmps stripped; ret at end of execution order")

    if args.check:
        if not ok or len(lines) < 100:
            print("CHECK FAIL", file=sys.stderr)
            return 1
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
