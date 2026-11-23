#!/usr/bin/env python3
"""Émulation Unicorn du main de crackme_l6_hard.exe (PE64) : name + serial -> r12 / sortie VM.
usage: l6-emu.py <exe> <name> <serial>"""
import sys, struct, pefile
from unicorn import *
from unicorn.x86_const import *

def run(exe, name, serial, trace=False):
    pe = pefile.PE(exe)
    base = pe.OPTIONAL_HEADER.ImageBase
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0x20000)
    mu.mem_write(base, pe.header[:pe.OPTIONAL_HEADER.SizeOfHeaders])
    for s in pe.sections:
        mu.mem_write(base + s.VirtualAddress, s.get_data())
    STK = 0x7000000; mu.mem_map(STK, 0x100000)
    HEAP = 0x8000000; mu.mem_map(HEAP, 0x10000)
    STUB = 0x9000000; mu.mem_map(STUB, 0x1000)
    mu.mem_write(STUB, b'\xc3' * 0x1000)
    lines = [name.encode() + b'\n', serial.encode() + b'\n']
    st = {'n': 0, 'out': None, 'r12': None}
    # IAT -> stubs
    for e in pe.DIRECTORY_ENTRY_IMPORT:
        for i in e.imports:
            mu.mem_write(i.address, struct.pack('<Q', STUB + 0x10))
    mu.mem_write(base + 0xa0c0, struct.pack('<Q', STUB + 0x20))  # __acrt_iob_func
    def rd(a):
        b = b''
        while True:
            c = bytes(mu.mem_read(a, 1))
            if c == b'\0': return b
            b += c; a += 1
    def ret(v=0):
        mu.reg_write(UC_X86_REG_RAX, v)
        sp = mu.reg_read(UC_X86_REG_RSP)
        mu.reg_write(UC_X86_REG_RIP, struct.unpack('<Q', bytes(mu.mem_read(sp, 8)))[0])
        mu.reg_write(UC_X86_REG_RSP, sp + 8)
    R = lambda r: mu.reg_read(r)
    def fgets(uc):
        buf, n = R(UC_X86_REG_RCX), R(UC_X86_REG_RDX)
        l = lines[st['n']]; st['n'] += 1
        mu.mem_write(buf, l[:n-1] + b'\0'); ret(buf)
    def strcspn(uc):
        s, rej = rd(R(UC_X86_REG_RCX)), rd(R(UC_X86_REG_RDX))
        k = 0
        while k < len(s) and s[k] not in rej: k += 1
        ret(k)
    def strlen(uc): ret(len(rd(R(UC_X86_REG_RCX))))
    def strtoul(uc):
        s = rd(R(UC_X86_REG_RCX)); ret(int(s, R(UC_X86_REG_R8)))
    def memcpy(uc):
        d, s, n = R(UC_X86_REG_RCX), R(UC_X86_REG_RDX), R(UC_X86_REG_R8)
        mu.mem_write(d, bytes(mu.mem_read(s, n))); ret(d)
    hooks = {0x140007ff8: fgets, 0x140008050: strcspn, 0x140008060: strlen,
             0x140008070: strtoul, 0x140008038: memcpy,
             0x140008150: lambda u: ret(0), 0x140008020: lambda u: ret(0),
             0x140001b70: lambda u: ret(0), 0x1400014f0: lambda u: ret(0)}
    def code(uc, addr, size, ud):
        if addr in hooks: hooks[addr](uc)
        elif addr == 0x140008e1c:
            sp = R(UC_X86_REG_RSP)
            st['out'] = struct.unpack('<4I', bytes(mu.mem_read(sp + 0x150, 16)))
        elif addr == 0x140009237:
            st['r12'] = R(UC_X86_REG_R12)
        elif addr == 0x140008b83:
            st['h'] = R(UC_X86_REG_RBX)
    mu.hook_add(UC_HOOK_CODE, code)
    SENT = STUB + 0x800
    sp = STK + 0x80000
    mu.mem_write(sp, struct.pack('<Q', SENT))
    mu.reg_write(UC_X86_REG_RSP, sp)
    try:
        mu.emu_start(0x1400088f0, SENT, count=200_000_000)
    except UcError as e:
        st['err'] = str(e) + ' rip=%x' % R(UC_X86_REG_RIP)
    return st

if __name__ == '__main__':
    print(run(*sys.argv[1:4]))
