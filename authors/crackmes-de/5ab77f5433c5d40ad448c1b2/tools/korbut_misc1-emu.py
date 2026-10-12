#!/usr/bin/env python3
"""Émule (Unicorn) la vraie routine 0x401000 de skor_misc1.exe avec des API simulées."""
import os, struct, sys, pefile
from unicorn import *; from unicorn.x86_const import *
EXE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'original', 'skor_misc1.exe')
def run(files, clip, compname):
    p = pefile.PE(EXE); mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x10000); mu.mem_map(0x100000, 0x10000); mu.mem_map(0x200000, 0x1000)
    for s in p.sections: mu.mem_write(0x400000 + s.VirtualAddress, s.get_data())
    mu.mem_write(0x200000, clip + b'\0')
    rs = lambda a: bytes(mu.mem_read(a, 256)).split(b'\0')[0]
    arg = lambda i: struct.unpack('<I', mu.mem_read(mu.reg_read(UC_X86_REG_ESP) + 4 + 4*i, 4))[0]
    res = {}
    def api(n, ret):
        esp = mu.reg_read(UC_X86_REG_ESP); ra = struct.unpack('<I', mu.mem_read(esp, 4))[0]
        mu.reg_write(UC_X86_REG_EAX, ret); mu.reg_write(UC_X86_REG_ESP, esp + 4 + 4*n); mu.reg_write(UC_X86_REG_EIP, ra)
    def hook(uc, addr, size, _):
        if addr == 0x4015ca: api(1, files.get(rs(arg(0)).decode('latin1'), 0xffffffff))
        elif addr == 0x40161e: api(1, 1)                       # OpenClipboard
        elif addr == 0x4015fa: api(1, 0x200000)                # GetClipboardData
        elif addr == 0x4015dc: d, s = arg(0), arg(1); mu.mem_write(d, rs(s) + b'\0'); api(2, d)
        elif addr == 0x4015e2: api(0, 1)                       # CloseClipboard
        elif addr == 0x401654: mu.mem_write(arg(4), b'\1\0\0\0'); api(5, 0)
        elif addr == 0x40165a: mu.mem_write(arg(4), compname + b'\0'); api(6, 0)
        elif addr == 0x40164e: api(1, 0)
        elif addr == 0x4015d6: api(2, 0)                       # lstrcmpA (résultat ignoré)
        elif addr == 0x401630: res['msg'] = rs(arg(2)); api(3, 1)
        elif addr in (0x401618, 0x4015c4): res['msg'] = b'EXIT/MessageBox'; uc.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook)
    mu.mem_write(0x107ff8, struct.pack('<II', 0xdead0000, 0)); mu.reg_write(UC_X86_REG_ESP, 0x107ff8)
    mu.mem_map(0xdead0000, 0x1000)
    mu.emu_start(0x401000, 0xdead0000)
    return res.get('msg')
if __name__ == '__main__':
    print(run({'_KESKYA': 0x20}, "²)='/+,:".encode('cp1252'), b'[ RIF 2k3 ]'))
    print(run({'_KESKYA': 0x20}, b'petik', b'[ RIF 2k3 ]'))
    print(run({'_KESKYA': 0x20}, "²)='/+,:".encode('cp1252'), b'PETIK-PC'))
    print(run({}, "²)='/+,:".encode('cp1252'), b'[ RIF 2k3 ]'))
