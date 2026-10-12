#!/usr/bin/env python3
"""Keygen crackme_2 by The FoX (crackmes.de, MASM win32).

usage : crackme2-thefox-solve.py [--check] NAME...
  --check : émule sous Unicorn le VRAI code du binaire (handler EN_CHANGE
            0x4010bc + routine de vérif 0x40113a, code auto-modifiant inclus)
            et affiche WELL DONE / OH SHIT.
"""
import os, sys, struct

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "crackme2.exe")

IMM0 = [0x49, 0x99, 0x32, 0x04, 0x03, 0xF0]          # copie @0x403202
TABLE = bytes.fromhex(                                # @0x4031da, 40 octets (= car - 0x55)
    "f2f6fbfafef6f8e0fafbdfe3e0e4dbe4e3f2f803eefbf501e3deddef00f1f8e3e4edeef70505e4e3")

def rol8(x, n): n &= 7; return ((x << n) | (x >> (8 - n))) & 0xFF if n else x
def ror8(x, n): n &= 7; return ((x >> n) | (x << (8 - n))) & 0xFF if n else x

def keygen(name: str) -> str:
    nb = name.encode("latin-1")[:29]
    if len(nb) < 3:
        raise ValueError("nom >= 3 caractères")
    M = 0xFFFFFFFF
    edx = h0 = h1 = 0
    for c in nb:
        ebx = (c * 0x24) & M
        edx ^= ebx; h0 = (h0 + edx) & M
        edx = (edx + ebx) & M
        ebx ^= edx; h1 = (h1 + ebx) & M
    buf = struct.pack("<II", h0, h1)
    imm = IMM0[:]
    cl = 0x69                                   # flag(0) ^ 0x69
    out = []
    for b in buf:
        cl = rol8(cl, 7)
        k = b % 6
        imm[k] ^= cl                            # xor byte [0x401000+4k+2], cl
        i = imm[k]
        al = [lambda a: (a + i) & 0xFF, lambda a: (a - i) & 0xFF, lambda a: a ^ i,
              lambda a: ror8(a, i & 0x1F), lambda a: rol8(a, i & 0x1F), lambda a: a & i][k](b)
        out.append((TABLE[al % 40] + 0x55) & 0xFF)
    s = bytes(out).decode("latin-1")
    return s[:4] + "-" + s[4:]

def emulate(name: str, serial: str) -> str:
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_ESP, UC_X86_REG_EIP
    pe = pefile.PE(EXE)
    base = pe.OPTIONAL_HEADER.ImageBase
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, 0x10000)
    mu.mem_write(base, pe.header)
    for s in pe.sections:
        mu.mem_write(base + s.VirtualAddress, s.get_data()[: s.Misc_VirtualSize])
    mu.mem_map(0x100000, 0x10000); sp = 0x10F000
    # 1) EN_CHANGE serial : flag=1 puis WM_GETTEXT(10) -> 0x4031d0 (9 car + NUL max)
    mu.mem_write(0x4031D9, b"\x01")
    sb = serial.encode("latin-1")[:9] + b"\x00"
    mu.mem_write(0x4031D0, sb)
    mu.reg_write(UC_X86_REG_ESP, sp)
    mu.emu_start(0x4010BC, 0x4010DA)            # transfo -'-' / -0x55 du vrai code
    # 2) bouton Check -> 0x40113a ; GetDlgItemTextA (0x401226) simulé
    nb = name.encode("latin-1")[:29]
    def hook(uc, addr, size, _):
        if addr == 0x401226:
            esp = uc.reg_read(UC_X86_REG_ESP)
            ret, _h, _id, buf, mx = struct.unpack("<5I", uc.mem_read(esp, 20))
            uc.mem_write(buf, nb + b"\x00")
            uc.reg_write(UC_X86_REG_EAX, len(nb))
            uc.reg_write(UC_X86_REG_ESP, esp + 20)   # stdcall 4 args
            uc.reg_write(UC_X86_REG_EIP, ret)
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x401226, end=0x401226)
    sp -= 4; mu.mem_write(sp, struct.pack("<I", 0xDEAD0000))
    mu.mem_map(0xDEAD0000, 0x1000); mu.mem_write(0xDEAD0000, b"\xf4")
    mu.reg_write(UC_X86_REG_ESP, sp); mu.reg_write(UC_X86_REG_EAX, 0x1234)
    mu.emu_start(0x40113A, 0xDEAD0000)
    msg = mu.mem_read(mu.reg_read(UC_X86_REG_EAX), 12).split(b"\r")[0]
    return msg.decode()

if __name__ == "__main__":
    args = sys.argv[1:]
    check = "--check" in args
    names = [a for a in args if a != "--check"] or ["petik"]
    for n in names:
        s = keygen(n)
        if check:
            ok = emulate(n, s); bad = emulate(n, "AAAA-AAAA")
            print(f"{n!r} -> {s}   [emu: {ok} | AAAA-AAAA: {bad}]")
        else:
            print(f"{n} -> {s}")
