#!/usr/bin/env python3
"""Monsignor's Monsignors Crackme — extrait le mot de passe de hello.exe (strcmp direct).

  python3 tools/monsignor-solve.py        # affiche le mot de passe
  python3 tools/monsignor-solve.py -q     # mot de passe seul
  python3 tools/monsignor-solve.py --check  # émule main() avec Unicorn (scanf/strcmp/printf hookés)

Pas d'utilisateur : le crackme ne demande qu'un mot de passe (pas de petik).
"""
import argparse, io, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
BASE, MAIN = 0x140000000, 0x140001528


def load_pe():
    z = zipfile.ZipFile(ZIP)
    return z.read("hello.exe", pwd=b"crackmes.one")


def rva2off(d, rva):
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    n, opt = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
    so = pe + 24 + opt
    for i in range(n):
        vs, va, rs, ro = struct.unpack_from("<IIII", d, so + i * 40 + 8)
        if va <= rva < va + max(vs, rs):
            return ro + rva - va
    raise ValueError(rva)


def cstr(d, rva):
    o = rva2off(d, rva)
    return d[o:d.index(b"\0", o)]


def extract(d):
    # main: lea rdx,[rip+0xeaaf] @0x14000155e (+7) -> 0x140010014 = référence du strcmp
    return cstr(d, 0x10014).decode()


def check(d, pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RIP, UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    mu.mem_map(BASE, 0x80000)
    mu.mem_write(BASE, d[:struct.unpack_from("<I", d, pe + 24 + 60)[0]])
    n, opt = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
    so = pe + 24 + opt
    for i in range(n):
        vs, va, rs, ro = struct.unpack_from("<IIII", d, so + i * 40 + 8)
        if va < 0x20000:
            mu.mem_write(BASE + va, d[ro:ro + rs])
    mu.mem_map(0x7F0000, 0x10000)
    mu.reg_write(UC_X86_REG_RSP, 0x7F8000)
    mu.mem_write(0x7F8000, struct.pack("<Q", 0x1))  # retour -> 1 (arrêt)
    out = []
    rd = lambda a: (lambda b: b[:b.index(0)])(bytes(mu.mem_read(a, 256)))

    def hook(uc, addr, size, _):
        r = lambda x: uc.reg_read(x)
        if addr in (0x140001670, 0x1400014d4, 0x140001480, 0x14000e710):
            ret = struct.unpack("<Q", bytes(uc.mem_read(r(UC_X86_REG_RSP), 8)))[0]
            rax = 0
            if addr == 0x1400014d4:
                out.append(rd(r(UC_X86_REG_RCX)).decode())
            elif addr == 0x140001480:  # scanf("%s", buf)
                uc.mem_write(r(UC_X86_REG_RDX), pw.encode() + b"\0")
            elif addr == 0x14000e710:  # strcmp : ici on lit les deux args réels
                a, b = rd(r(UC_X86_REG_RCX)), rd(r(UC_X86_REG_RDX))
                rax = 0 if a == b else 1
            uc.reg_write(UC_X86_REG_RAX, rax)
            uc.reg_write(UC_X86_REG_RSP, r(UC_X86_REG_RSP) + 8)
            uc.reg_write(UC_X86_REG_RIP, ret)

    mu.hook_add(UC_HOOK_CODE, hook)
    try:
        mu.emu_start(MAIN, 0x1)
    except Exception:
        pass
    return "".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = load_pe()
    pw = extract(d)
    if a.q:
        print(pw)
    else:
        print(f"password = {pw}")
    if a.check:
        for p in (pw, "petik"):
            o = check(d, p).replace("\n", " ")
            print(f"[check] {p!r:10} -> {o}")
        ok = "Access granted" in check(d, pw) and "denied" in check(d, "petik")
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
