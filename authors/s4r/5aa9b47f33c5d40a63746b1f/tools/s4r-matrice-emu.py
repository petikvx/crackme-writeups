#!/usr/bin/env python3
"""Preuve sur le code réel : émule (unicorn) la boucle d'init WM_INITDIALOG 0x401146..0x401174
puis la routine de check 0x401197 du binaire original, lstrlenA simulé."""
import sys, pathlib
from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_ESP, UC_X86_REG_EIP

EXE = pathlib.Path(__file__).resolve().parent.parent / "original" / "matrice.exe"
d = EXE.read_bytes()

def run(s):
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x50000)
    mu.mem_write(0x401000, d[0x400:0x400 + 0x260])
    mu.mem_write(0x403000, d[0xa00:0xa00 + 0x40714])
    mu.mem_map(0x100000, 0x10000)
    mu.mem_write(0x443054, s.encode()[:0x3f] + b"\0")
    # init
    mu.emu_start(0x401146, 0x401174)
    # check : pile avec adresse de retour sentinelle
    esp = 0x10f000
    mu.mem_write(esp, (0x10dead).to_bytes(4, "little"))
    mu.reg_write(UC_X86_REG_ESP, esp)
    def hook(uc, addr, size, _):
        if addr == 0x40125a:  # thunk lstrlenA(arg)
            sp = uc.reg_read(UC_X86_REG_ESP)
            ret = int.from_bytes(uc.mem_read(sp, 4), "little")
            arg = int.from_bytes(uc.mem_read(sp + 4, 4), "little")
            n = 0
            while uc.mem_read(arg + n, 1)[0]: n += 1
            uc.reg_write(UC_X86_REG_EAX, n)
            uc.reg_write(UC_X86_REG_ESP, sp + 8)  # stdcall
            uc.reg_write(UC_X86_REG_EIP, ret)
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x40125a, end=0x40125a)
    mu.emu_start(0x401197, 0x10dead)
    return mu.reg_read(UC_X86_REG_EAX)

if __name__ == "__main__":
    for s in sys.argv[1:] or ["/!?\\I_hope_you_liked_win32_Dis4$sembly/*$\\", "petik"]:
        print(repr(s), "->", run(s), "(1 = well done!)")
