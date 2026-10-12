#!/usr/bin/env python3
"""Preuve par émulation Unicorn du VRAI code de crackme_nop.exe (wine refuse l'exe : « Bad EXE format »,
NumberOfRvaAndSizes invalide, toléré par le loader XP). On charge les sections brutes à 0x400000, on stubbe
les imports (thunks 0x401310..0x401346) et on exécute depuis 0x401215 (VirtualAlloc x2, copie du stub 0x401027,
SetConsoleMode, ReadFile, déchiffrement XOR des 2 dwords, jmp dans le buffer) jusqu'au WriteFile du verdict.
usage : verify-unicorn.py CODE   (ReadFile renvoie CODE + "\\r\\n", comme la console)"""
import struct, sys
from unicorn import *
from unicorn.x86_const import *
code = sys.argv[1].encode() + b'\r\n'
d = open(__file__.rsplit('/tools/', 1)[0] + '/original/crackme_nop.exe', 'rb').read()
mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, 0x10000)
mu.mem_write(0x400000, d[:0x400]); mu.mem_write(0x401000, d[0x400:0x800]); mu.mem_write(0x402000, d[0x800:0xa00])
mu.mem_map(0x100000, 0x100000); mu.reg_write(UC_X86_REG_ESP, 0x1f0000)
heap = [0x500000]; mu.mem_map(0x500000, 0x10000)
out = []
STUBS = {0x401316: 'GetStdHandle', 0x40131c: 'ReadFile', 0x401322: 'SetConsoleMode',
         0x401334: 'VirtualAlloc', 0x40132e: 'Sleep', 0x401346: 'WriteFile'}
NARGS = {'GetStdHandle': 1, 'ReadFile': 5, 'SetConsoleMode': 2, 'VirtualAlloc': 4, 'Sleep': 1, 'WriteFile': 5}
def hook(mu, addr, size, _):
    if addr not in STUBS: return
    name = STUBS[addr]; esp = mu.reg_read(UC_X86_REG_ESP)
    ret, *a = struct.unpack('<%dI' % (1 + NARGS[name]), mu.mem_read(esp, 4 * (1 + NARGS[name])))
    eax = 1
    if name == 'GetStdHandle': eax = {0xfffffff6: 0x10, 0xfffffff5: 0x14}[a[0]]
    elif name == 'VirtualAlloc': eax = heap[0]; heap[0] += 0x1000
    elif name == 'ReadFile':
        data = code[:a[2]]; mu.mem_write(a[1], data); mu.mem_write(a[3], struct.pack('<I', len(data)))
    elif name == 'WriteFile':
        out.append(bytes(mu.mem_read(a[1], a[2])).rstrip(b' \0').decode('latin-1'))
    elif name == 'Sleep': mu.emu_stop(); return
    mu.reg_write(UC_X86_REG_EAX, eax); mu.reg_write(UC_X86_REG_ESP, esp + 4 + 4 * NARGS[name]); mu.reg_write(UC_X86_REG_EIP, ret)
mu.hook_add(UC_HOOK_CODE, hook)
mu.emu_start(0x401215, 0, count=100000)
print(' | '.join(out))
