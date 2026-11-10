#!/usr/bin/env python3
"""3OutOf6 (Eilay_Yosfan) : la clé est un entier décimal fixe (scanf "%d").

  python3 -I tools/3outof6-solve.py        # affiche la clé
  python3 -I tools/3outof6-solve.py -q     # clé seule
  python3 tools/3outof6-solve.py --check     # (unicorn requis) émule main() du PE avec Unicorn

original/download.bin est un ZIP (mot de passe crackmes.one) contenant 3outof6.exe.
"""
import argparse, io, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
BASE = 0x100000000
MAIN = 0x100401080


def load_exe():
    return zipfile.ZipFile(ZIP).read("3outof6.exe", pwd=b"crackmes.one")


def key_from_binary(pe):
    # main+0x0d : C7 45 FC imm32  (mov DWORD PTR [rbp-4], imm32)
    off = 0x600 + (MAIN - 0x100401000) + 0x0D
    assert pe[off:off + 3] == b"\xc7\x45\xfc"
    return struct.unpack_from("<I", pe, off + 3)[0]


def check(pe, key):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RDX, UC_X86_REG_RCX
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(0x100400000, 0x10000)
    mu.mem_write(0x100400000, pe[:0x400])
    for va, fo, sz in ((0x100401000, 0x600, 0x720), (0x100403000, 0x1000, 0x238)):
        mu.mem_write(va, pe[fo:fo + sz])
    mu.mem_map(0x7000000, 0x10000)
    sp = 0x7008000
    mu.mem_write(sp, struct.pack("<Q", 0xDEAD0000))  # adresse de retour
    mu.mem_map(0xDEAD0000 & ~0xFFF, 0x1000)
    mu.reg_write(UC_X86_REG_RSP, sp)
    out = []

    def cstr(a):
        s = b""
        while (c := mu.mem_read(a, 1)) != b"\0":
            s += bytes(c); a += 1
        return s.decode()

    def hook(uc, addr, size, _):
        if addr == 0x100401100:            # __main : stub
            ret()
        elif addr == 0x100401110:          # printf
            out.append(cstr(uc.reg_read(UC_X86_REG_RCX))); ret()
        elif addr == 0x100401120:          # scanf("%d", &x)
            assert cstr(uc.reg_read(UC_X86_REG_RCX)) == "%d"
            uc.mem_write(uc.reg_read(UC_X86_REG_RDX), struct.pack("<i", key)); ret()

    def ret():
        rsp = mu.reg_read(UC_X86_REG_RSP)
        mu.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", mu.mem_read(rsp, 8))[0])
        mu.reg_write(UC_X86_REG_RSP, rsp + 8)

    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(MAIN, 0xDEAD0000)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pe = load_exe()
    key = key_from_binary(pe)
    if a.check:
        for k in (key, key + 1):
            print(k, "->", check(pe, k)[-1])
        return
    print(key if a.q else f"clé = {key} (0x{key:x})")


main()
