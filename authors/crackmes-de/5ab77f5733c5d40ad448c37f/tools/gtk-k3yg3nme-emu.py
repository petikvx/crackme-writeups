#!/usr/bin/env python3
"""Émule la fonction de hachage du nom @0x8048f50 du binaire d'origine (unicorn).
Renvoie edx:eax (64 bits) ; le serial attendu est ce nombre en décimal (strtoull base 10)."""
import struct, sys
from pathlib import Path
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
from unicorn.x86_const import *

BIN = Path(__file__).resolve().parent.parent / "analysis" / "GTK_K3YG3NME"


def h(name: bytes) -> int:
    d = BIN.read_bytes().replace(b"\x3d\x00\x30\x00\x00", b"\x3d\xff\xff\xff\x7f")  # rdtsc anti-debug : cmp eax,0x3000
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x8048000, 0x10000)
    mu.mem_write(0x8048000, d[:0x1c00])
    mu.mem_map(0x7000000, 0x10000)
    NAME, SP = 0x7001000, 0x7008000
    mu.mem_write(NAME, name + b"\0")
    mu.mem_write(SP, struct.pack("<II", 0xDEADBEEF, NAME))
    mu.reg_write(UC_X86_REG_ESP, SP)
    mu.reg_write(UC_X86_REG_EBP, SP + 0x100)
    mu.emu_start(0x8048F50, 0xDEADBEEF, count=5_000_000)
    return (mu.reg_read(UC_X86_REG_EDX) << 32) | mu.reg_read(UC_X86_REG_EAX)


if __name__ == "__main__":
    for n in sys.argv[1:] or ["petik"]:
        print(n, h(n.encode()))
