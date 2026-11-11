#!/usr/bin/env python3
"""Lacks's Level 1 (level1easy.exe) : le mot de passe est statique.

  python3 tools/lacks-level1-solve.py          # affiche le mot de passe (extrait du .rdata)
  python3 tools/lacks-level1-solve.py -q       # mot de passe seul
  python3 tools/lacks-level1-solve.py --check  # émule main() (unicorn) : OK + un KO

Le binaire d'origine est original/download.bin = ZIP (mdp crackmes.one) contenant level1easy.exe.
"""
import argparse, io, struct, sys, zipfile
from pathlib import Path

HERE = Path(__file__).resolve().parent.parent
BASE = 0x140000000
EXPECTED_VA = 0x1400033C8   # std::string de référence (8 octets, SSO) copié sur la pile par main
MAIN = 0x140001290


def load_exe():
    z = zipfile.ZipFile(HERE / "original" / "download.bin")
    return z.read("level1easy.exe", pwd=b"crackmes.one")


def sections(exe):
    pe = struct.unpack_from("<I", exe, 0x3C)[0]
    nsec = struct.unpack_from("<H", exe, pe + 6)[0]
    opt = struct.unpack_from("<H", exe, pe + 20)[0]
    soff = pe + 24 + opt
    out = []
    for i in range(nsec):
        n, vsz, va, rsz, raw = struct.unpack_from("<8sIIII", exe, soff + 40 * i)
        out.append((va, vsz, exe[raw:raw + rsz]))
    return out


def va_read(exe, va, n):
    for sva, vsz, data in sections(exe):
        if sva <= va - BASE < sva + vsz:
            o = va - BASE - sva
            return data[o:o + n]


def password(exe):
    return va_read(exe, EXPECTED_VA, 8).decode()


def run(exe, pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_RCX,
                                   UC_X86_REG_RDX, UC_X86_REG_R8, UC_X86_REG_RAX)
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, 0x10000)
    mu.mem_write(BASE, exe[:0x400])
    for va, vsz, data in sections(exe):
        mu.mem_write(BASE + va, data)
    STACK = 0x7000000
    mu.mem_map(STACK, 0x10000)
    mu.mem_map(0x1000, 0x1000)  # trampoline pour l'adresse de retour
    mu.mem_write(0x1000, b"\xf4")
    rsp = STACK + 0x8000
    mu.mem_write(rsp, struct.pack("<Q", 0x1000))
    mu.reg_write(UC_X86_REG_RSP, rsp)
    out = []

    def ret():
        r = struct.unpack("<Q", mu.mem_read(mu.reg_read(UC_X86_REG_RSP), 8))[0]
        mu.reg_write(UC_X86_REG_RSP, mu.reg_read(UC_X86_REG_RSP) + 8)
        mu.reg_write(UC_X86_REG_RIP, r)

    def cstr(a):
        s = b""
        while (c := bytes(mu.mem_read(a, 1))) != b"\0":
            s += c; a += 1
        return s.decode()

    def hook(uc, addr, size, _):
        if addr == 0x140001550:          # operator<<(cout, const char*)
            out.append(cstr(uc.reg_read(UC_X86_REG_RDX))); ret()
        elif addr == 0x140001720:        # getline(cin, std::string&) -> notre entrée
            d = uc.reg_read(UC_X86_REG_RDX)
            b = pw.encode()
            assert len(b) <= 15
            uc.mem_write(d, b + b"\0" + struct.pack("<QQ", 0, 0)[:0])
            uc.mem_write(d + 0x10, struct.pack("<QQ", len(b), 15)); ret()
        elif addr == 0x140002b18:        # memcmp (jmp vers l'IAT)
            a, b_, n = (uc.reg_read(r) for r in (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_R8))
            x, y = bytes(uc.mem_read(a, n)), bytes(uc.mem_read(b_, n))
            uc.reg_write(UC_X86_REG_RAX, (x > y) - (x < y)); ret()
        elif addr in (0x1400013ba, 0x1400013c0):  # cin.ignore / cin.get (IAT) : sautés
            uc.reg_write(UC_X86_REG_RIP, addr + 6)
        elif addr == 0x1400013cd:
            uc.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(MAIN, 0x1000)
    return "".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe = load_exe()
    pw = password(exe)
    if a.q:
        print(pw); return
    print(f"Password : {pw}")
    if a.check:
        ok = run(exe, pw); ko = run(exe, "petik")
        print("OK ->", "Access Granted" in ok)
        print("KO ->", "Access Denied" in ko)
        sys.exit(0 if "Access Granted" in ok and "Access Denied" in ko else 1)


if __name__ == "__main__":
    main()
