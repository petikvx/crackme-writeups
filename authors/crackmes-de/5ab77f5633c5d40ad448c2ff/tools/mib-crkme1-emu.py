#!/usr/bin/env python3
"""Exécute le VRAI handler OK (0x401ca0) du binaire dépacké sous Unicorn.
MFC42D.DLL (debug) est absente de wine -> on simule seulement GetDlgItemText,
SetDlgItemText, GetVolumeInformationA, wsprintfA, strcat, strcmp, _chkesp.
usage : emu.py <unpacked.exe> NOM SERIAL [--volser HEX] [--label TXT] [--desktop HEX]"""
import sys, struct, argparse
from unicorn import *
from unicorn.x86_const import *

ap = argparse.ArgumentParser()
ap.add_argument("exe"); ap.add_argument("name"); ap.add_argument("serial")
ap.add_argument("--volser", type=lambda x: int(x, 16), default=0x1234abcd)
ap.add_argument("--label", default="PETIK")
ap.add_argument("--desktop", type=lambda x: int(x, 16), default=0x00a1b2c4)
a = ap.parse_args()

d = open(a.exe, 'rb').read()
u = Uc(UC_ARCH_X86, UC_MODE_32)
u.mem_map(0x400000, 0x36000)
for va, off, sz in [(0x401000, 0x1000, 0x14000), (0x415000, 0x15000, 0xae0),
                    (0x416000, 0x16000, 0xa4c), (0x417000, 0x17000, 0x9df)]:
    u.mem_write(va, d[off:off+sz])
u.mem_map(0x100000, 0x100000); ESP = 0x1f0000
u.mem_map(0x500000, 0x1000); u.mem_write(0x500000, b'\xc3'*0x100)
STUB = {0x4176b4: 0x500000, 0x4173a8: 0x500010, 0x417660: 0x500020,
        0x417664: 0x500030, 0x417668: 0x500040}
for iat, stub in STUB.items(): u.mem_write(iat, struct.pack('<I', stub))
u.mem_write(0x4169f0, struct.pack('<I', (a.desktop >> 1) & 0xffffffff))  # posé par OnInitDialog
fields = {0x3e8: a.name.encode(), 0x3e9: a.serial.encode()}
out = []
def rs(p):
    b = b''
    while True:
        c = bytes(u.mem_read(p, 1))
        if c == b'\0': return b
        b += c; p += 1
def arg(n): return struct.unpack('<I', u.mem_read(u.reg_read(UC_X86_REG_ESP)+4+4*n, 4))[0]
def ret(v, pop=0):
    sp = u.reg_read(UC_X86_REG_ESP); ra = struct.unpack('<I', u.mem_read(sp, 4))[0]
    u.reg_write(UC_X86_REG_EAX, v & 0xffffffff)
    u.reg_write(UC_X86_REG_ESP, sp+4+pop); u.reg_write(UC_X86_REG_EIP, ra)
def hk(uc, ad, s, _):
    if ad == 0x4022d8:   i, b, n = arg(0), arg(1), arg(2); v = fields[i][:n-1]; uc.mem_write(b, v+b'\0'); ret(len(v), 12)
    elif ad == 0x4022d2: out.append((arg(0), rs(arg(1)))); ret(0, 8)
    elif ad == 0x500000:  # wsprintfA(buf, fmt, v)
        f = rs(arg(1)); v = arg(2)
        r = {b'%d': str(v-(1 << 32) if v & 0x80000000 else v), b'%x': '%x' % v}[f]
        uc.mem_write(arg(0), r.encode()+b'\0'); ret(len(r))
    elif ad == 0x500010:  # GetVolumeInformationA(root,name,nsz,&serial,...)
        assert arg(0) == 0 and arg(2) == 0x14
        uc.mem_write(arg(1), a.label.encode()[:19]+b'\0'); uc.mem_write(arg(3), struct.pack('<I', a.volser)); ret(1)
    elif ad == 0x500020: x = rs(arg(0)); uc.mem_write(arg(0)+len(x), rs(arg(1))+b'\0'); ret(arg(0))
    elif ad == 0x500030: x, y = rs(arg(0)), rs(arg(1)); ret((x > y)-(x < y))
    elif ad == 0x500040: ret(0)
u.hook_add(UC_HOOK_CODE, hk)
u.mem_map(0xdead0000, 0x1000)
u.mem_write(ESP, struct.pack('<I', 0xdead0000)); u.reg_write(UC_X86_REG_ESP, ESP)
u.reg_write(UC_X86_REG_ECX, 0x300000); u.mem_map(0x300000, 0x1000)
try: u.emu_start(0x401ca0, 0xdead0000)
except UcError as e: print('err', e, hex(u.reg_read(UC_X86_REG_EIP)))
print([m for m in out if m[0] == 0x3ec])
