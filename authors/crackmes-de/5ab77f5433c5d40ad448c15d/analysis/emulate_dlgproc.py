#!/usr/bin/env python3
"""Exécute la vraie DialogProc (0x401028) de Crackme2.exe sous Unicorn pour WM_COMMAND/bouton 0x3EB.
GetDlgItemTextA / lstrcmpA / MessageBoxA sont émulés. Usage: emulate_dlgproc.py exe serial"""
import sys, struct, pefile
from unicorn import *
from unicorn.x86_const import *
pe = pefile.PE(sys.argv[1]); serial = sys.argv[2].encode()
mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, 0x10000)
mu.mem_write(0x400000, pe.get_memory_mapped_image()[:0x10000])
S, STK = 0x300000, 0x100000; mu.mem_map(S, 0x1000); mu.mem_map(STK, 0x10000)
api = {0x40201c: 'GetDlgItemTextA', 0x402008: 'lstrcmpA', 0x402018: 'MessageBoxA'}
stub = {}
for i, (iat, n) in enumerate(api.items()):
    a = S + 8*i; stub[a] = n; mu.mem_write(iat, struct.pack('<I', a))
    nargs = {'GetDlgItemTextA': 4, 'lstrcmpA': 2, 'MessageBoxA': 4}[n]
    mu.mem_write(a, b'\xc2' + struct.pack('<H', 4*nargs))   # ret N (stdcall)
END = S + 0x100; mu.mem_write(END, b'\xc3')
def cstr(a):
    s = b''
    while (c := mu.mem_read(a+len(s), 1)) != b'\0': s += c
    return s
def arg(i): return struct.unpack('<I', mu.mem_read(mu.reg_read(UC_X86_REG_ESP)+4+4*i, 4))[0]
shown = []
def hook(uc, addr, size, _):
    n = stub.get(addr)
    if n == 'GetDlgItemTextA':
        s = serial[:arg(3)-1]; uc.mem_write(arg(2), s+b'\0'); uc.reg_write(UC_X86_REG_EAX, len(s))
    elif n == 'lstrcmpA':
        a, b = cstr(arg(0)), cstr(arg(1)); uc.reg_write(UC_X86_REG_EAX, (a > b) - (a < b))
    elif n == 'MessageBoxA':
        shown.append(cstr(arg(1)).decode())
mu.hook_add(UC_HOOK_CODE, hook, begin=S, end=S+0x40)
sp = STK + 0x8000   # DialogProc(hwnd, WM_COMMAND, 0x3EB, 0)
mu.mem_write(sp, struct.pack('<IIIII', END, 0x1234, 0x111, 0x3eb, 0))
mu.reg_write(UC_X86_REG_ESP, sp); mu.emu_start(0x401028, END)
print('MessageBox :', shown or 'aucune'); sys.exit(0 if shown else 1)
