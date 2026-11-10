#!/usr/bin/env python3
"""SimbaHDD's first golang crackme — solveur.

Le mot de passe est un littéral comparé en un seul qword (movabs) dans main.main.
  python3 tools/simbahdd-golang-solve.py          # affiche le mot de passe
  python3 tools/simbahdd-golang-solve.py -q       # mot de passe seul
  python3 tools/simbahdd-golang-solve.py --check  # émule main.main (unicorn) sur le vrai .exe
"""
import argparse, os, struct, sys, zipfile, io

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, "..", "original", "download.bin")
BASE = 0x140000000
MAIN, CALL_SCAN1, CALL_SCAN2 = 0x1400B0780, 0x1400B0807, 0x1400B08B4
CMP_IMM = 0x33323161626D6973  # movabs r8 @ 0x1400b081b


def password() -> str:
    return struct.pack("<Q", CMP_IMM).decode()


def load_exe() -> bytes:
    z = zipfile.ZipFile(ORIG)
    return z.read("veryeasycrackme.exe", pwd=b"crackmes.one")


def check(pw: str) -> bool:
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RSP, UC_X86_REG_RIP, UC_X86_REG_R14, UC_X86_REG_RCX,
                                   UC_X86_REG_RAX, UC_X86_REG_RDX)
    d = load_exe()
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    ns, = struct.unpack_from("<H", d, pe + 6)
    so, = struct.unpack_from("<H", d, pe + 20)
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(BASE, 0x300000)
    for i in range(ns):
        vs, va, rs, ro = struct.unpack_from("<IIII", d, pe + 24 + so + i * 40 + 8)
        mu.mem_write(BASE + va, d[ro:ro + min(rs, vs)])
    mu.mem_map(0x10000, 0x100000)           # pile + g + tas
    g, heap = 0x10000, 0x80000
    mu.mem_write(g + 0x10, struct.pack("<Q", 0x20000))  # stackguard
    mu.reg_write(UC_X86_REG_R14, g)
    mu.reg_write(UC_X86_REG_RSP, 0x100000)
    mu.mem_write(0x100000, struct.pack("<Q", 0xDEAD0000))  # ret addr factice
    out = []

    def rd(a, n): return bytes(mu.mem_read(a, n))
    def rq(a): return struct.unpack("<Q", rd(a, 8))[0]

    # appels runtime/fmt neutralisés (adresse du `call` -> comportement)
    def hook(mu, addr, size, _):
        rsp = mu.reg_read(UC_X86_REG_RSP)
        if addr == 0x1400B07C5:    # fmt.Fprint(Stdout, "Enter password: ")
            mu.reg_write(UC_X86_REG_RIP, addr + 5)
        elif addr == 0x1400B07D1:  # runtime.newobject(string) -> 16 octets
            mu.mem_write(heap + 0x1000, b"\0" * 16)
            mu.reg_write(UC_X86_REG_RAX, heap + 0x1000)
            mu.reg_write(UC_X86_REG_RIP, addr + 5)
        elif addr == CALL_SCAN1:   # fmt.Fscanln(Stdin, &s) : on injecte la saisie
            mu.mem_write(heap, pw.encode())
            mu.mem_write(heap + 0x1000, struct.pack("<QQ", heap, len(pw)))
            mu.reg_write(UC_X86_REG_RIP, addr + 5)
        elif addr in (0x1400B0860, 0x1400B089A):  # fmt.Fprintln(Stdout, msg)
            hdr = rq(mu.reg_read(UC_X86_REG_RCX) + 8)
            p, n = struct.unpack("<QQ", rd(hdr, 16))
            out.append(rd(p, n).decode())
            mu.reg_write(UC_X86_REG_RIP, addr + 5)
        elif addr == CALL_SCAN2:   # pause finale : fin de main
            mu.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook, begin=0x1400B0780, end=0x1400B08C0)
    try:
        mu.emu_start(MAIN, 0xDEAD0000, count=2000)
    except Exception as e:
        print("emu:", e, file=sys.stderr)
    return out == ["CORRECT!"]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = password()
    if a.check:
        ok, ko = check(pw), check("petik")
        print(f"{pw!r}: {'CORRECT!' if ok else 'WRONG!'} ; 'petik': {'CORRECT!' if ko else 'WRONG!'}")
        sys.exit(0 if ok and not ko else 1)
    print(pw if a.q else f"password = {pw}")


if __name__ == "__main__":
    main()
