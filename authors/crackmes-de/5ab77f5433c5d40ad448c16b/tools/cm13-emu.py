#!/usr/bin/env python3
"""Preuve sur le code réel : émule le handler du bouton (0x8048cad) du binaire
dépaqueté avec unicorn (PLT GTK « hookés »). Affiche 'cracked' / 'BAD KEY'.

  cm13-emu.py <name32hex> <serial>
"""
import struct, sys
from pathlib import Path
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *

BIN = Path(__file__).resolve().parent.parent / "analysis" / "cm2.unpacked"


def run(name, serial):
    d = BIN.read_bytes()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x8048000, 0x10000)           # image (les sections .data/.bss y tiennent)
    mu.mem_write(0x8048000, d[:0x1098])      # .text/.rodata à vaddr == offset
    mu.mem_write(0x804a000, d[0x2000:0x2248])  # .data
    mu.mem_map(0x7000000, 0x10000)           # pile + chaînes
    NAME, SER = 0x7001000, 0x7002000
    mu.mem_write(NAME, name.encode() + b"\0")
    mu.mem_write(SER, serial.encode() + b"\0")
    # widgets : [0x804a3c4]=entry name, [0x804a3c0]=entry serial
    mu.mem_write(0x804a3c4, struct.pack("<I", 0x7000100))
    mu.mem_write(0x804a3c0, struct.pack("<I", 0x7000200))
    result = {}
    GET = 0x80487f0

    def hook(uc, addr, size, _):
        if addr == GET:
            esp = uc.reg_read(UC_X86_REG_ESP)
            arg = struct.unpack("<I", uc.mem_read(esp + 4, 4))[0]
            uc.reg_write(UC_X86_REG_EAX, NAME if arg == 0x7000100 else SER)
            ret = struct.unpack("<I", uc.mem_read(esp, 4))[0]
            uc.reg_write(UC_X86_REG_ESP, esp + 4)
            uc.reg_write(UC_X86_REG_EIP, ret)
        elif addr == 0x8048df3:              # affichage du message : esi = chaîne
            esi = uc.reg_read(UC_X86_REG_ESI)
            result["msg"] = {0x804a071: "BAD KEY", 0x804a08f: "cracked"}.get(esi, hex(esi))
            uc.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x8048000, end=0x804a000)
    sp = 0x7008000
    mu.mem_write(sp, struct.pack("<I", 0xdeadbeef))
    mu.reg_write(UC_X86_REG_ESP, sp)
    mu.reg_write(UC_X86_REG_EBP, sp + 0x100)
    mu.emu_start(0x8048cad, 0xdeadbeef, count=2_000_000)
    return result.get("msg", "?")


if __name__ == "__main__":
    print(run(sys.argv[1], sys.argv[2]))
