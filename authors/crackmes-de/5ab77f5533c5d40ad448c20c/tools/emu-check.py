#!/usr/bin/env python3
"""Exécute le VRAI code de KeygenMe 0.68 (dump FSG analysis/KeygenMe068-unfsg.bin) sous Unicorn :
  1. init WM_INITDIALOG 0x401394..0x4013bc (remplit la table 0x4032a3..+0x4000) ;
  2. check du bouton Register 0x40158f..0x401648 avec name / key posés dans 0x40322a / 0x40323b
     (comme GetDlgItemTextA, 16 car. max, zéro-complétés).
Renvoie ZF après `repne cmpsw` (1 = bitmap 501 « smiley » = enregistré).
  python3 tools/emu-check.py NAME KEY
"""
import sys
from pathlib import Path
from unicorn import *
from unicorn.x86_const import *
DUMP = Path(__file__).resolve().parent.parent / 'analysis' / 'KeygenMe068-unfsg.bin'
img = DUMP.read_bytes(); BASE = 0x400000
def run(name: bytes, key: bytes):
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(BASE, (len(img) + 0xfff) & ~0xfff); mu.mem_write(BASE, img)
    mu.mem_map(0x100000, 0x10000); mu.reg_write(UC_X86_REG_ESP, 0x108000)
    mu.emu_start(0x401394, 0x4013bd)
    mu.mem_write(0x40322a, (name[:16] + b'\0' * 17)[:17])
    mu.mem_write(0x40323b, (key[:16] + b'\0' * 17)[:17])
    mu.emu_start(0x40158f, 0x401648)
    zf = (mu.reg_read(UC_X86_REG_EFLAGS) >> 6) & 1
    return zf, bytes(mu.mem_read(0x40327f, 16)), bytes(mu.mem_read(0x40322a, 16))
if __name__ == '__main__':
    zf, t, n = run(sys.argv[1].encode('latin-1'), sys.argv[2].encode('latin-1'))
    print('T    =', t.hex(' ')); print("name'=", n.hex(' ')); print('GOOD' if zf else 'BAD')
