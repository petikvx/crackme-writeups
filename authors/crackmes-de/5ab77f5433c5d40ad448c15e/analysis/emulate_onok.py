#!/usr/bin/env python3
"""Exécute le vrai handler du bouton (0x4013d0) de Crackme3.exe sous Unicorn.
Les thunks MFC CWnd::GetDlgItemText (0x40165c) et CWnd::MessageBox (0x401656), thiscall à 3 args,
sont émulés. Usage: emulate_onok.py exe serial"""
import sys, struct, pefile
from unicorn import *
from unicorn.x86_const import *
pe = pefile.PE(sys.argv[1]); serial = sys.argv[2].encode()
mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, 0x10000)
mu.mem_write(0x400000, pe.get_memory_mapped_image()[:0x10000])
STK, END = 0x100000, 0x300000; mu.mem_map(STK, 0x10000); mu.mem_map(END, 0x1000); mu.mem_write(END, b'\xc3')
def cstr(a):
    s = b''
    while (c := mu.mem_read(a+len(s), 1)) != b'\0': s += c
    return s
def u32(a): return struct.unpack('<I', mu.mem_read(a, 4))[0]
shown = []
def thunk(uc, addr, size, _):
    if addr not in (0x40165c, 0x401656): return
    sp = uc.reg_read(UC_X86_REG_ESP); ret = u32(sp); a = [u32(sp+4+4*i) for i in range(3)]
    if addr == 0x40165c:   # GetDlgItemText(id, buf, max) -> longueur
        s = serial[:a[2]-1]; uc.mem_write(a[1], s+b'\0'); uc.reg_write(UC_X86_REG_EAX, len(s))
    else:                  # MessageBox(text, caption, type)
        shown.append(cstr(a[0]).decode())
    uc.reg_write(UC_X86_REG_ESP, sp+16); uc.reg_write(UC_X86_REG_EIP, ret)
mu.hook_add(UC_HOOK_CODE, thunk, begin=0x401656, end=0x40165c)
sp = STK + 0x8000; mu.mem_write(sp, struct.pack('<I', END))
mu.reg_write(UC_X86_REG_ESP, sp); mu.reg_write(UC_X86_REG_ECX, STK)
mu.emu_start(0x4013d0, END)
print('MessageBox :', shown or 'aucune'); sys.exit(0 if shown else 1)
