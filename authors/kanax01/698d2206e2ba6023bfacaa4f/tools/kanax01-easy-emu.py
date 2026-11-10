#!/usr/bin/env python3
"""Preuve par émulation unicorn (pas de Wine sur la machine) : rejoue la comparaison de main
(0x140001342 -> 0x140001369) avec une saisie donnée, dit si on arrive sur « Congrats » ou « Wrong »."""
import sys, struct, pathlib
from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
from unicorn.x86_const import *
exe = pathlib.Path(__file__).resolve().parent.parent / "analysis/extracted/CrackMeEasy.exe"
pe = exe.read_bytes(); BASE = 0x140000000
def run(pw: bytes):
    mu = Uc(UC_ARCH_X86, UC_MODE_64); mu.mem_map(BASE, 0x10000); mu.mem_map(0x10000, 0x10000)
    mu.mem_write(BASE, pe[:0x400])
    for off, va, n in ((0x400, 0x1000, 0x1a93), (0x2000, 0x3000, 0x1d1c), (0x3e00, 0x5000, 0x200)):
        mu.mem_write(BASE + va, pe[off:off + n])
    mu.mem_write(0x10000, pw + b"\0"); mu.mem_map(0x30000, 0x10000)
    mu.reg_write(UC_X86_REG_RSP, 0x38000)
    mu.reg_write(UC_X86_REG_RCX, 0x10000)           # buffer SSO de la saisie
    mu.reg_write(UC_X86_REG_R8, len(pw))            # taille saisie
    mu.reg_write(UC_X86_REG_RDX, BASE + 0x50b8)     # global std::string
    res = {}
    def hook(uc, addr, sz, _):
        if addr == 0x140002843:  # thunk memcmp (import) : émulé à la main
            a = bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RCX), uc.reg_read(UC_X86_REG_R8)))
            b = bytes(uc.mem_read(uc.reg_read(UC_X86_REG_RDX), uc.reg_read(UC_X86_REG_R8)))
            uc.reg_write(UC_X86_REG_RAX, 0 if a == b else 1)
            rsp = uc.reg_read(UC_X86_REG_RSP)
            uc.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", bytes(uc.mem_read(rsp, 8)))[0])
            uc.reg_write(UC_X86_REG_RSP, rsp + 8)
        if addr == 0x140001359: res["r"] = "OK (Congrats)"; uc.emu_stop()
        if addr == 0x140001362: res["r"] = "KO (Wrong)"; uc.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(0x140001342, 0x140001369)
    return res.get("r")
for p in sys.argv[1:] or ["EasyPassword", "easypassword", "EasyPasswor", "petik"]:
    print(f"{p!r:18} -> {run(p.encode())}")
