#!/usr/bin/env python3
"""Solveur svidnet ZEXOR (PE64, GUI) : la licence est une chaîne statique.

CheckLicense (0x140001450) = strcmp(input, *(char**)0x140003000) ;
le pointeur .data vise .rdata+0 = "AEXORRBSHA36325S33".

  python3 -I zexor-win-solve.py          # affiche la clé (lue dans le PE)
  python3 -I zexor-win-solve.py -q       # clé seule
  python3 zexor-win-solve.py --check     # émule CheckLicense avec unicorn
"""
import argparse, struct, sys, zipfile, io, pathlib

HERE = pathlib.Path(__file__).resolve().parent
BIN = HERE.parent / "original" / "download.bin"   # ZIP (pwd crackmes.one) -> ZEXOR-01.exe
BASE, LICENO, CHECK, IAT_STRCMP = 0x140000000, 0x140003000, 0x140001450, 0x140008498


def load_pe():
    z = zipfile.ZipFile(BIN)
    return z.read("ZEXOR-01.exe", pwd=b"crackmes.one")


def rva2off(pe, rva):
    e = struct.unpack_from("<I", pe, 0x3C)[0]
    ns = struct.unpack_from("<H", pe, e + 6)[0]
    so = struct.unpack_from("<H", pe, e + 20)[0]
    for i in range(ns):
        s = e + 24 + so + i * 40
        vs, va, rs, ro = struct.unpack_from("<IIII", pe, s + 8)
        if va <= rva < va + max(vs, rs):
            return rva - va + ro
    raise ValueError(rva)


def read_key(pe):
    ptr = struct.unpack_from("<Q", pe, rva2off(pe, LICENO - BASE))[0]
    o = rva2off(pe, ptr - BASE)
    return pe[o:pe.index(b"\0", o)].decode()


def check(pe, key):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX, UC_X86_REG_RSP, UC_X86_REG_RIP
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, 0x40000)
    e = struct.unpack_from("<I", pe, 0x3C)[0]
    mu.mem_write(BASE, pe[:struct.unpack_from("<I", pe, e + 84)[0]])
    ns = struct.unpack_from("<H", pe, e + 6)[0]
    so = struct.unpack_from("<H", pe, e + 20)[0]
    for i in range(ns):
        s = e + 24 + so + i * 40
        vs, va, rs, ro = struct.unpack_from("<IIII", pe, s + 8)
        if rs:
            mu.mem_write(BASE + va, pe[ro:ro + rs])
    STUB, STK, BUF, RET = 0x140030000, 0x140034000, 0x140036000, 0x140038000
    mu.mem_write(IAT_STRCMP, struct.pack("<Q", STUB))   # IAT strcmp -> stub hooké
    mu.mem_write(STUB, b"\xc3")
    mu.mem_write(RET, b"\xf4")
    mu.mem_write(BUF, key.encode() + b"\0")

    def strcmp_hook(uc, addr, size, _):
        if addr == STUB:
            def s(p):
                b = b""
                while (c := uc.mem_read(p, 1)) != b"\0":
                    b += bytes(c); p += 1
                return b
            a, b = s(uc.reg_read(UC_X86_REG_RCX)), s(uc.reg_read(UC_X86_REG_RDX))
            uc.reg_write(UC_X86_REG_RAX, (a > b) - (a < b) & 0xffffffff)
    mu.hook_add(UC_HOOK_CODE, strcmp_hook)
    mu.reg_write(UC_X86_REG_RSP, STK)
    mu.mem_write(STK, struct.pack("<Q", RET))
    mu.reg_write(UC_X86_REG_RCX, BUF)
    mu.emu_start(CHECK, RET)
    return mu.reg_read(UC_X86_REG_RAX) & 0xff


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pe = load_pe()
    key = read_key(pe)
    if a.q:
        print(key); return
    print("Licence :", key)
    if a.check:
        ok, ko = check(pe, key), check(pe, "petik")
        print(f"CheckLicense({key!r}) -> {ok}   CheckLicense('petik') -> {ko}")
        sys.exit(0 if ok == 1 and ko == 0 else 1)


main()
