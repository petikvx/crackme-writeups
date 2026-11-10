#!/usr/bin/env python3
"""Solveur gustavsofa « password esasy » (senha.exe, PE64 C++).

Le mot de passe est une chaîne littérale comparée avec operator== : on la lit
dans .rdata (VA 0x1400d6011) du binaire extrait du ZIP.

  python3 -I tools/senha-solve.py [-q] [--check]

--check : exécute sous Unicorn le vrai operator==(string, const char*) du
binaire (0x1400ccb40) avec la réponse et avec une mauvaise entrée.
(Pas de Wine sur la machine d'analyse.)
"""
import argparse, os, struct, sys, zipfile, io

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
BASE, PW_VA, EQ_VA = 0x140000000, 0x1400D6011, 0x1400CCB40


def load_exe():
    with zipfile.ZipFile(ZIP) as z:
        return z.read("senha.exe", pwd=b"crackmes.one")


def rva2off(pe, rva):
    nsec = struct.unpack_from("<H", pe, struct.unpack_from("<I", pe, 0x3C)[0] + 6)[0]
    e = struct.unpack_from("<I", pe, 0x3C)[0]
    opt = struct.unpack_from("<H", pe, e + 20)[0]
    s = e + 24 + opt
    for i in range(nsec):
        vs, va, rs, ro = struct.unpack_from("<IIII", pe, s + 40 * i + 8)
        if va <= rva < va + max(vs, rs):
            return rva - va + ro
    raise ValueError


def get_password(pe):
    o = rva2off(pe, PW_VA - BASE)
    return pe[o:pe.index(b"\0", o)].decode()


def emu_eq(pe, text):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSP, UC_X86_REG_RAX, UC_X86_REG_RIP, UC_X86_REG_R8
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, 0x200000 + 0x10000)
    e = struct.unpack_from("<I", pe, 0x3C)[0]
    mu.mem_write(BASE, pe[:struct.unpack_from("<I", pe, e + 24 + 60)[0]])
    nsec = struct.unpack_from("<H", pe, e + 6)[0]
    opt = struct.unpack_from("<H", pe, e + 20)[0]
    for i in range(nsec):
        n, vs, va, rs, ro = struct.unpack_from("<8sIIII", pe, e + 24 + opt + 40 * i)
        if va < 0x200000 and rs:
            mu.mem_write(BASE + va, pe[ro:ro + min(rs, vs)])
    mu.mem_map(0x10000000, 0x100000)
    s = 0x10000100
    data = text.encode()
    # std::string SSO : ptr, size, buf[16]
    mu.mem_write(s, struct.pack("<QQ", s + 16, len(data)) + data + b"\0")
    stack = 0x10080000
    mu.mem_write(stack, struct.pack("<Q", 0x10000F00))  # retour
    mu.mem_write(0x10000F00, b"\xf4")  # hlt
    mu.reg_write(UC_X86_REG_RCX, s)
    mu.reg_write(UC_X86_REG_RDX, PW_VA)
    mu.reg_write(UC_X86_REG_RSP, stack)

    def ret(mu_):
        sp = mu_.reg_read(UC_X86_REG_RSP)
        mu_.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", bytes(mu_.mem_read(sp, 8)))[0])
        mu_.reg_write(UC_X86_REG_RSP, sp + 8)

    def hook(mu_, addr, size, _):
        # strlen / memcmp = thunks vers msvcrt (IAT non résolue ici) : émulés à la main
        rcx, rdx, r8 = (mu_.reg_read(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8))
        if addr == 0x14001A5F8:
            n = 0
            while mu_.mem_read(rcx + n, 1)[0]:
                n += 1
            mu_.reg_write(UC_X86_REG_RAX, n)
        else:
            a_, b_ = bytes(mu_.mem_read(rcx, r8)), bytes(mu_.mem_read(rdx, r8))
            mu_.reg_write(UC_X86_REG_RAX, (a_ > b_) - (a_ < b_) & 0xFFFFFFFF)
        ret(mu_)

    for va in (0x14001A5F8, 0x14001A7C0):
        mu.hook_add(UC_HOOK_CODE, hook, None, va, va)
    mu.emu_start(EQ_VA, 0x10000F00, count=100000)
    return bool(mu.reg_read(UC_X86_REG_RAX) & 0xFF)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pe = load_exe()
    pw = get_password(pe)
    print(pw if a.q else f"Mot de passe : {pw}")
    if a.check:
        ok, ko = emu_eq(pe, pw), emu_eq(pe, "petik")
        print(f"operator==({pw!r}) -> {ok} ; operator==('petik') -> {ko}")
        sys.exit(0 if ok and not ko else 1)


main()
