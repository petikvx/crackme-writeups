#!/usr/bin/env python3
"""Keygen crackme_6 by fireworx (Delphi 4). Usage: solve.py [nom] [--verify Crackme6.exe]"""
import sys

def step(x):  # sar 1 + adc (division signée arrondie vers 0)
    x = x - (1 << 32) if x & 0x80000000 else x
    return int(x / 2) & 0xffffffff

def keygen(name):
    ebx, esi = 0x49390305, 0x48631220
    for c in name.encode('latin-1'):
        ebx ^= c
        esi ^= ebx
        if ebx & 1:
            ebx = step(ebx) ^ 0x1200311
        else:
            ebx = step(ebx)
    return '%.4x-%.4x-%.4x-%.4x' % (ebx & 0xffff, ebx >> 16, esi & 0xffff, esi >> 16)

def emulate(exe, name):
    """Émule la vraie boucle 0x441703..0x441746 du binaire avec Unicorn."""
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_EDI, UC_X86_REG_EBX, UC_X86_REG_ESI
    pe = pefile.PE(exe); code = pe.sections[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x100000)
    mu.mem_write(0x401000, code.get_data())
    mu.mem_write(0x480000, name.encode('latin-1'))
    mu.reg_write(UC_X86_REG_EDI, 0x480000)
    mu.emu_start(0x441703, 0x44170d)          # init ebx/esi
    mu.reg_write(UC_X86_REG_EAX, len(name))   # Length(name) (call 0x403a34 sauté)
    mu.emu_start(0x441714, 0x441746)
    b, s = mu.reg_read(UC_X86_REG_EBX), mu.reg_read(UC_X86_REG_ESI)
    return '%.4x-%.4x-%.4x-%.4x' % (b & 0xffff, b >> 16, s & 0xffff, s >> 16)

if __name__ == '__main__':
    a = [x for x in sys.argv[1:] if not x.startswith('--')]
    name = a[0] if a else 'petik'
    k = keygen(name); print(f'{name} -> {k}')
    if '--verify' in sys.argv:
        e = emulate(sys.argv[sys.argv.index('--verify') + 1], name)
        print('unicorn  ->', e, 'OK' if e == k else 'MISMATCH')
