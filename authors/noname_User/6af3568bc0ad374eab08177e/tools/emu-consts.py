#!/usr/bin/env python3
"""Recon : émule avec unicorn la fonction 0x44ca70 (hash) et 0x415410 (chaîne de 4 ops)
sur l'ELF extrait du ZIP (arg 1) pour obtenir les constantes A, B et valider le solveur."""
import sys
from unicorn import *
from unicorn.x86_const import *
M = (1 << 64) - 1
elf = open(sys.argv[1], 'rb').read()
mu = Uc(UC_ARCH_X86, UC_MODE_64)
mu.mem_map(0x400000, 0x200000); mu.mem_map(0x7ff00000, 0x100000)
# PT_LOAD : tous les segments chargés à vaddr = offset + 0x400000 sauf RW (vaddr 0x501xxx, off 0x100xxx)
mu.mem_write(0x400000, elf[:0x101000])           # RX / RO (offset == vaddr-0x400000)
mu.mem_write(0x501620, elf[0x100620:0x106ac0 ]) # data (off = vaddr - 0x401000)
def call(fn, *args, ret=0x4018f0):
    sp = 0x7ff80000
    mu.mem_write(sp, ret.to_bytes(8, 'little'))
    for r, v in zip((UC_X86_REG_RDI, UC_X86_REG_RSI, UC_X86_REG_RDX, UC_X86_REG_RCX), args):
        mu.reg_write(r, v)
    mu.reg_write(UC_X86_REG_RSP, sp)
    mu.emu_start(fn, ret, count=5_000_000)
    return mu.reg_read(UC_X86_REG_RAX)
if __name__ == '__main__':
    A = call(0x44ca70, 0xc3c3f00d5ec1a11e)
    B = call(0x44ca70, 0xdeadb00dcafe1234)
    print('A = 0x%016x\nB = 0x%016x' % (A, B))
    x = 0x1122334455667788
    print('g1(x) = 0x%016x' % call(0x415410, x, 0x501660, 0x4d642c, 0x4d6428))
    print('g2(x) = 0x%016x' % call(0x415410, x, 0x501640, 0x4d6424, 0x4d6420))
