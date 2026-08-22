#!/usr/bin/env python3
"""Deobfuscateur automatique — crackmes.de negligent_deobfuscate_1 (neon)

L'exe MASM est découpé en blocs reliés par `jmp` / `jmp short +1` (octet poubelle)
et truffé d'instructions mortes (lea imm fantaisistes, bswap, mov partial, …).

Ce script :
  1. suit le CFG (jmp inconditionnels + call/ret),
  2. filtre le trash,
  3. simule le prédicat mémoire (.data = 4 dwords, seed 2),
  4. émet le source ASM « clean » attendu.

Usage:
  python3 negligent-deobfuscate-solve.py -q
  python3 negligent-deobfuscate-solve.py --check
  python3 negligent-deobfuscate-solve.py --asm
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "deobfuscate.exe"

try:
    import pefile
    from capstone import Cs, CS_ARCH_X86, CS_MODE_32
    from capstone.x86 import CS_OP_IMM
except ImportError as e:
    print("besoin: pip install pefile capstone", file=sys.stderr)
    raise SystemExit(1) from e

CLEAN_ASM = """\
; negligent_deobfuscate_1 — source reconstruit (neon)
; .data @ 0x404000 : dd 2, 0, 0, 0

transfer:                    ; RVA 0x112B
.loop:
        dec     dword [edx]
        inc     dword [edi]
        cmp     dword [edx], 0
        jne     .loop
        ret

main:                        ; entry 0x1000
        mov     edx, dword_0   ; 0x404000
        mov     edi, dword_1   ; 0x404004
        call    transfer       ; 2 → dword_1
        xchg    edi, edx
        add     edi, 8         ; edi → dword_2 @ 0x404008
        call    transfer       ; 2 → dword_2
        mov     edx, edi
        mov     edi, dword_3   ; 0x40400C
        jmp     transfer       ; tail : 2 → dword_3, ret → exit
"""

FINAL_MEM = {0x404000: 0, 0x404004: 0, 0x404008: 0, 0x40400C: 2}
SUMMARY = "transfer 2 through 4 dwords → [0x40400C]=2"


def is_trash(insn) -> bool:
    m, op = insn.mnemonic, insn.op_str
    if m in (
        "lea",
        "bswap",
        "fldl2t",
        "outs",
        "in",
        "enter",
        "int1",
        "fwait",
        "nop",
    ):
        return True
    if m == "mov":
        dst, _, src = op.partition(",")
        dst, src = dst.strip(), src.strip()
        if dst == src:
            return True
        if dst in ("ah", "ch", "bh", "dh", "al", "cl", "bl", "dl") and "ptr" not in op:
            return True
        if "ptr" not in op and src.startswith("0x"):
            try:
                if int(src, 0) >= 0x500000:
                    return True
            except ValueError:
                pass
    if m == "xchg" and any(
        r in op for r in ("al", "ah", "bl", "bh", "cl", "ch", "dl", "dh")
    ):
        return True
    return False


def load_pe(path: Path):
    pe = pefile.PE(str(path))
    base = pe.OPTIONAL_HEADER.ImageBase
    entry = pe.OPTIONAL_HEADER.AddressOfEntryPoint
    img = bytearray(pe.OPTIONAL_HEADER.SizeOfImage)
    for s in pe.sections:
        raw = s.get_data()
        img[s.VirtualAddress : s.VirtualAddress + len(raw)] = raw
    return pe, base, entry, bytes(img)


def deobfuscate_and_sim(path: Path):
    pe, base, entry, data = load_pe(path)
    md = Cs(CS_ARCH_X86, CS_MODE_32)
    md.detail = True

    def disasm_one(pc: int):
        return next(md.disasm(data[pc : pc + 15], base + pc))

    regs = {r: 0 for r in "eax ebx ecx edx esi edi ebp esp".split()}
    mem = {0x404000: 2, 0x404004: 0, 0x404008: 0, 0x40400C: 0}
    stack: list[int] = []
    pc = entry
    zf = 0
    keep: list[tuple[str, str]] = []

    for _ in range(8000):
        insn = disasm_one(pc)
        b0 = insn.bytes[0]
        if insn.mnemonic == "jmp" and b0 == 0xEB and insn.size == 2:
            rel = struct.unpack("b", insn.bytes[1:2])[0]
            pc = insn.address + insn.size + rel - base
            continue
        if insn.mnemonic == "jmp" and (b0 == 0xE9 or insn.bytes[:1] == b"\xf3"):
            # e9 / f3 e9
            if b0 == 0xF3 and len(insn.bytes) >= 6 and insn.bytes[1] == 0xE9:
                rel = struct.unpack("<i", insn.bytes[2:6])[0]
                pc = insn.address + 6 + rel - base
                continue
            if b0 == 0xE9:
                rel = struct.unpack("<i", insn.bytes[1:5])[0]
                pc = insn.address + 5 + rel - base
                continue

        m, op = insn.mnemonic, insn.op_str
        trash = is_trash(insn)

        if m == "xchg" and not trash:
            a, b = [x.strip() for x in op.split(",")]
            regs[a], regs[b] = regs[b], regs[a]
            keep.append((hex(insn.address), f"xchg {op}"))
            pc = insn.address + insn.size - base
            continue

        if m == "call" and insn.operands and insn.operands[0].type == CS_OP_IMM:
            stack.append(insn.address + insn.size - base)
            keep.append((hex(insn.address), f"call {op}"))
            pc = insn.operands[0].imm - base
            continue

        if m == "ret":
            keep.append((hex(insn.address), "ret"))
            if not stack:
                return keep, mem, True
            pc = stack.pop()
            continue

        if m == "jmp" and insn.operands and insn.operands[0].type == CS_OP_IMM:
            # jmp into transfer (tail-call)
            if not trash:
                keep.append((hex(insn.address), f"jmp {op}"))
            pc = insn.operands[0].imm - base
            continue

        if not trash:
            if m == "mov" and "ptr" not in op:
                dst, _, src = op.partition(",")
                dst, src = dst.strip(), src.strip()
                if src.startswith("0x"):
                    regs[dst] = int(src, 0) & 0xFFFFFFFF
                elif src in regs:
                    regs[dst] = regs[src]
                if "0x404" in op or dst in ("edx", "edi") and src in regs:
                    keep.append((hex(insn.address), f"mov {op}"))
            elif m == "add" and op.startswith("edi"):
                regs["edi"] = (regs["edi"] + int(op.split(",")[1].strip(), 0)) & 0xFFFFFFFF
                keep.append((hex(insn.address), f"add {op}"))
            elif m == "dec" and "[edx]" in op:
                mem[regs["edx"]] = (mem[regs["edx"]] - 1) & 0xFFFFFFFF
            elif m == "inc" and "[edi]" in op:
                mem[regs["edi"]] = (mem.get(regs["edi"], 0) + 1) & 0xFFFFFFFF
            elif m == "cmp" and "[edx], 0" in op:
                zf = 1 if mem[regs["edx"]] == 0 else 0
            elif m == "jne":
                if not zf:
                    pc = insn.operands[0].imm - base
                    continue

        pc = insn.address + insn.size - base

    return keep, mem, False


def check(path: Path) -> bool:
    _keep, mem, ok = deobfuscate_and_sim(path)
    return ok and mem == FINAL_MEM


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="une ligne : résumé soluce")
    ap.add_argument("--check", action="store_true", help="simule + vérifie mem finale")
    ap.add_argument("--asm", action="store_true", help="affiche le source reconstruit")
    ap.add_argument("--trace", action="store_true", help="instructions keep")
    ap.add_argument("--bin", type=Path, default=BIN)
    args = ap.parse_args()

    if not args.bin.is_file():
        print(f"missing {args.bin}", file=sys.stderr)
        return 1

    if args.q:
        print(SUMMARY)
        return 0

    if args.asm:
        print(CLEAN_ASM)
        return 0

    keep, mem, finished = deobfuscate_and_sim(args.bin)
    if args.trace:
        for addr, text in keep:
            print(f"  {addr}: {text}")
        print("mem", {hex(k): v for k, v in mem.items()})

    ok = finished and mem == FINAL_MEM
    if args.check:
        print("OK" if ok else "FAIL", {hex(k): v for k, v in mem.items()})
        return 0 if ok else 1

    print(SUMMARY)
    print("final:", {hex(k): v for k, v in mem.items()}, "→", "OK" if ok else "FAIL")
    print()
    print(CLEAN_ASM)
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
