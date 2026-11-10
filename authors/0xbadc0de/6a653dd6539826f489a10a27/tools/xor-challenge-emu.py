#!/usr/bin/env python3
"""Vérifie un mot de passe en émulant (unicorn) la vraie fonction de check
du CrackMe.exe d'origine (0x1400173d0). Les helpers std::string (size, operator[])
et les stubs RTC/JMC sont hookés ; tout le reste est le code du binaire."""
import sys, struct
from unicorn import *
from unicorn.x86_const import *

EXE = sys.argv[1]
pw = sys.argv[2].encode()
data = open(EXE, "rb").read()
pe = struct.unpack_from("<I", data, 0x3c)[0]
nsec = struct.unpack_from("<H", data, pe + 6)[0]
optsz = struct.unpack_from("<H", data, pe + 20)[0]
base = struct.unpack_from("<Q", data, pe + 24 + 24)[0]
mu = Uc(UC_ARCH_X86, UC_MODE_64)
mu.mem_map(base, 0x40000)
sec = pe + 24 + optsz
for i in range(nsec):
    vs, va, rs, ro = struct.unpack_from("<IIII", data, sec + i * 40 + 8)
    mu.mem_write(base + va, data[ro:ro + min(rs, vs)])
STR, BUF, STK = 0x10000000, 0x10001000, 0x20000000
mu.mem_map(STR, 0x4000); mu.mem_map(STK, 0x100000)
mu.mem_write(BUF, pw + b"\0")

def ret(mu):
    rsp = mu.reg_read(UC_X86_REG_RSP)
    mu.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", mu.mem_read(rsp, 8))[0])
    mu.reg_write(UC_X86_REG_RSP, rsp + 8)
def h_size(mu, a, s, u): mu.reg_write(UC_X86_REG_RAX, len(pw)); ret(mu)
def h_idx(mu, a, s, u): mu.reg_write(UC_X86_REG_RAX, BUF + mu.reg_read(UC_X86_REG_RDX)); ret(mu)
def h_nop(mu, a, s, u): ret(mu)
for addr, h in ((0x140011604, h_size), (0x140011028, h_idx), (0x1400116d6, h_nop), (0x1400115be, h_nop)):
    mu.hook_add(UC_HOOK_CODE, h, begin=addr, end=addr)
rsp = STK + 0x80000
mu.mem_write(rsp, struct.pack("<Q", 0xdead0000))
mu.reg_write(UC_X86_REG_RSP, rsp)
mu.reg_write(UC_X86_REG_RCX, STR)
try:
    mu.emu_start(0x1400173d0, 0xdead0000)
except UcError as e:
    if mu.reg_read(UC_X86_REG_RIP) != 0xdead0000: raise
print("ACCESS GRANTED" if mu.reg_read(UC_X86_REG_RAX) & 0xff else "ACCESS DENIED")
