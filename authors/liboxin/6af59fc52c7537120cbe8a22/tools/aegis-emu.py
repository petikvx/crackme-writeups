#!/usr/bin/env python3
"""Emulation unicorn de main() du dump déchiffré (analysis/dump.bin) — recon."""
import struct, sys
from unicorn import *
from unicorn.x86_const import *
D = sys.argv[1]
SERIAL = sys.argv[2].encode() if len(sys.argv) > 2 else b'AAAA-BBBB-CCCC-DDDD'
BASE = 0x140000000
img = open(D, 'rb').read()
mu = Uc(UC_ARCH_X86, UC_MODE_64)
mu.mem_map(BASE, 0x40000)
mu.mem_write(BASE, img)
STACK = 0x7ff000000
mu.mem_map(STACK - 0x200000, 0x300000)
TEB = 0x600000000
mu.mem_map(TEB, 0x10000)
mu.mem_write(TEB + 0x30, struct.pack('<Q', TEB))
mu.mem_write(TEB + 0x8, struct.pack('<Q', STACK))
mu.mem_write(TEB + 0x10, struct.pack('<Q', STACK - 0x100000))
mu.mem_map(0x500000000, 0x100000)  # heap
mu.mem_map(0x700000000, 0x10000)   # stubs
mu.msr_write(0xC0000101, TEB)
# stub IAT
iat = {}
import re
names = {}
for l in open('analysis/iat.txt'):
    a, n = l.split(); names[int(a, 16)] = n
for a, n in names.items():
    stub = 0x700000000 + (a - 0x14002b000)
    mu.mem_write(BASE + (a - BASE if a > BASE else a), struct.pack('<Q', stub))
    iat[stub] = n
FUNCS = {0x1400130d0: 'f0', 0x1400131f0: 'f1', 0x140012e70: 'f2', 0x140012f90: 'f3',
         0x1400169c0: 'f4', 0x140016e38: 'f5', 0x140017014: 'f6', 0x140017104: 'f7',
         0x140017360: 'f8', 0x14000cc10: 'f9', 0x140013410: 'f10', 0x140013400: 'f11',
         0x14001a1f0: 'f12', 0x14001a0cc: 'f13'}
heap = [0x500000000]
inbuf = [SERIAL + b'\n']
def rd(a, n=64):
    return bytes(mu.mem_read(a, n))
def cstr(a):
    s = b''
    while True:
        c = rd(a, 1)
        if c == b'\0' or len(s) > 200: break
        s += c; a += 1
    return s
def ret(v=0):
    rsp = mu.reg_read(UC_X86_REG_RSP)
    ra = struct.unpack('<Q', rd(rsp, 8))[0]
    mu.reg_write(UC_X86_REG_RAX, v)
    mu.reg_write(UC_X86_REG_RSP, rsp + 8)
    mu.reg_write(UC_X86_REG_RIP, ra)
count = [0]
last=[]
def hook(uc, addr, size, ud):
    count[0] += 1
    if 0x140001000<=addr<0x140012e00: open('/tmp/trace.txt','a').write('%x\n'%addr)
    last.append(addr); del last[:-12]
    if addr in iat:
        n = iat[addr]
        rcx = uc.reg_read(UC_X86_REG_RCX); rdx = uc.reg_read(UC_X86_REG_RDX); r8 = uc.reg_read(UC_X86_REG_R8)
        print('IAT', n, hex(rcx), hex(rdx), hex(r8))
        v = 0
        if n == 'GetStdHandle': v = rcx & 0xff or 1
        elif n == 'WriteFile':
            print('  OUT>', rd(rdx, r8)); uc.mem_write(uc.reg_read(UC_X86_REG_R9), struct.pack('<I', r8)); v = 1
        elif n == 'ReadFile':
            data = inbuf[0][:r8]; inbuf[0] = inbuf[0][r8:]
            uc.mem_write(rdx, data); uc.mem_write(uc.reg_read(UC_X86_REG_R9), struct.pack('<I', len(data))); v = 1
        elif n == 'GetFileType': v = 2
        elif n in ('HeapAlloc',):
            v = heap[0]; heap[0] += (r8 + 31) & ~15
        elif n == 'GetProcessHeap': v = 0x5ffff0000
        elif n in ('ExitProcess','TerminateProcess'):
            print('EXIT', rcx); uc.emu_stop(); return
        elif n in ('QueryPerformanceCounter',): uc.mem_write(rcx, struct.pack('<Q', 12345)); v = 1
        elif n == 'GetConsoleMode': v = 0
        elif n == 'ReadConsoleW': v = 0
        ret(v); return
    if addr in FUNCS:
        rsp = uc.reg_read(UC_X86_REG_RSP)
        ra = struct.unpack('<Q', rd(rsp, 8))[0]
        if 0x140001000 <= ra < 0x140012e00 and FUNCS[addr] != 'f9':
            a = [uc.reg_read(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_R9)]
            print('MAINCALL', FUNCS[addr], [hex(x) for x in a], 'from', hex(ra), 'n=%d' % count[0])
            for r in a:
                if BASE+0x36000 <= r < BASE+0x37000 or STACK-0x200000<=r<STACK+0x100000:
                    print('   mem', hex(r), rd(r, 48))
            nm = FUNCS[addr]; v = 0
            if nm in ('f3','f7','f0','f1','f2'): print('   PRINT', cstr(a[0]))
            if nm == 'f6':
                uc.mem_write(a[0], SERIAL + b'\n\0'); v = a[0]
            if nm == 'f8':
                st = cstr(a[0]); sep = cstr(a[1]); v = len(st)
                for i, ch in enumerate(st):
                    if ch in sep: v = i; break
            ret(v)
mu.hook_add(UC_HOOK_CODE, hook)
def bad(uc, access, addr, size, val, ud):
    print('MEMERR', access, hex(addr), 'rip', hex(uc.reg_read(UC_X86_REG_RIP)))
    return False
mu.hook_add(UC_HOOK_MEM_UNMAPPED, bad)
R0 = STACK-0x1000-0x2b8
log=[]
def memwr(uc, access, addr, size, val, ud):
    off = addr-R0
    if off in (0x17b,0x17c,0x247,0x230,0x26c):
        log.append((off, val & ((1<<(8*size))-1)))
mu.hook_add(UC_HOOK_MEM_WRITE, memwr)
rsp = STACK - 0x1000
mu.reg_write(UC_X86_REG_RSP, rsp)
mu.mem_write(rsp, struct.pack('<Q', 0x7ffff0000)); mu.mem_map(0x7ffff0000, 0x1000)
mu.mem_write(0x7ffff0000, b'\xf4')
def end(uc, a, s, ud):
    print('RETURNED rax=', hex(uc.reg_read(UC_X86_REG_RAX)), 'insns', count[0]); uc.emu_stop()
mu.hook_add(UC_HOOK_CODE, end, begin=0x7ffff0000, end=0x7ffff0001)
try:
    mu.emu_start(BASE + 0x1000, 0, count=30000000)
except UcError as e:
    print([hex(x) for x in last]);print('ERR', e, hex(mu.reg_read(UC_X86_REG_RIP)), 'insns', count[0])

print('LOG',log)
S=rd(0x140036022,256); E=rd(0x140036122,16)
print('S',S.hex()); print('E',E.hex())
