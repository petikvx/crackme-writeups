#!/usr/bin/env python3
"""1337_arm (gtksor) — id 5ab77f5733c5d40ad448c380. ELF32 ARM EABI statique (non strippé).

main @0x8290 : argc > 1 sinon -1 ; construit t[3] = "ABC…" : octets 0x41,0x42,… (31 caractères,
boucle i = 0..0x1e, valeur 0x41+i) puis compare argv[1] à t[3] octet par octet jusqu'au NUL de argv[1].
Succès (retour = constante 0x8458) si argv[1] est un préfixe de t[3] ; sinon -1.
Clé « complète » : les 31 octets 0x41..0x5f.

Pas de qemu-user ici : --check émule main avec unicorn (malloc/memset hookés).

  1337arm-solve.py [-q] [--check]
"""
import argparse, struct, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "1337ARM.bin"
KEY = bytes(range(0x41, 0x41 + 31)).decode()


def emu(argv1: bytes):
    from unicorn import Uc, UC_ARCH_ARM, UC_MODE_ARM, UC_HOOK_CODE
    from unicorn.arm_const import (UC_ARM_REG_R0, UC_ARM_REG_R1, UC_ARM_REG_SP, UC_ARM_REG_LR,
                                   UC_ARM_REG_PC)
    d = BIN.read_bytes()
    mu = Uc(UC_ARCH_ARM, UC_MODE_ARM)
    mu.mem_map(0x8000, 0x80000); mu.mem_write(0x8000, d[:0x73000])
    mu.mem_map(0x7000000, 0x100000)
    heap = [0x7080000]
    ARGV, STR, SP, END = 0x7001000, 0x7002000, 0x7070000, 0x7200000
    mu.mem_map(END, 0x1000)
    mu.mem_write(STR, argv1 + b"\0")
    mu.mem_write(ARGV, struct.pack("<III", 0x7003000, STR, 0))
    mu.mem_write(0x7003000, b"prog\0")

    def hook(uc, addr, size, _):
        if addr == 0x8248:                       # malloc
            uc.reg_write(UC_ARM_REG_R0, heap[0]); heap[0] += 0x40
            uc.reg_write(UC_ARM_REG_PC, uc.reg_read(UC_ARM_REG_LR) & ~1)
        elif addr == 0x11FE0:                    # memset(p, c, n)
            uc.reg_write(UC_ARM_REG_PC, uc.reg_read(UC_ARM_REG_LR) & ~1)
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x8248, end=0x8249)
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x11FE0, end=0x11FE1)
    mu.reg_write(UC_ARM_REG_R0, 2); mu.reg_write(UC_ARM_REG_R1, ARGV)
    mu.reg_write(UC_ARM_REG_SP, SP); mu.reg_write(UC_ARM_REG_LR, END)
    mu.emu_start(0x8290, END, count=200000)
    return struct.unpack("<i", struct.pack("<I", mu.reg_read(UC_ARM_REG_R0)))[0]


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    print(KEY if a.q else f"argv[1] : {KEY}\n(préfixe quelconque de cette chaîne accepté)")
    if a.check:
        ok = emu(KEY.encode())
        pre = emu(KEY[:5].encode())
        bad = emu(b"petik")
        good = ok != -1 and pre == ok and bad == -1
        print("check:", "OK" if good else "KO", f"(clé={ok:#x}, préfixe={pre:#x}, 'petik'={bad})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
