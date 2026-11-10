#!/usr/bin/env python3
"""Solveur SolitikBurmaldatik's FirstCrackMe : le mot de passe est une chaîne en clair.

  solitikburmaldatik-firstcrackme-solve.py [-q]
  solitikburmaldatik-firstcrackme-solve.py --check [crackme.exe]

--check : extrait le PE de original/download.bin (ZIP, mdp crackmes.one) si besoin,
puis émule main() (0x140001490) sous Unicorn avec printf/scanf/strcmp/getchar
hookés (pas de Wine requis) et vérifie CORRECT! / WRONG!.
"""
import argparse, io, struct, sys, zipfile
from pathlib import Path

PASSWORD = "simba123"
HERE = Path(__file__).resolve().parent.parent


def load_pe():
    z = zipfile.ZipFile(HERE / "original" / "download.bin")
    return z.read("crackme.exe", pwd=b"crackmes.one")


def run(pe, pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import (UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSP,
                                   UC_X86_REG_RAX, UC_X86_REG_RIP)
    base = 0x140000000
    e = struct.unpack_from("<I", pe, 0x3C)[0]
    nsec = struct.unpack_from("<H", pe, e + 6)[0]
    opt = struct.unpack_from("<H", pe, e + 20)[0]
    size_img = struct.unpack_from("<I", pe, e + 24 + 56)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, (size_img + 0xFFF) & ~0xFFF)
    mu.mem_write(base, pe[:0x400])
    for i in range(nsec):
        o = e + 24 + opt + 40 * i
        vs, va, rs, ro = struct.unpack_from("<IIII", pe, o + 8)
        mu.mem_write(base + va, pe[ro:ro + rs])
    STACK = 0x10000
    mu.mem_map(STACK, 0x10000)
    out = []
    rd = lambda a: bytes(mu.mem_read(a, 1)) 
    def cstr(a):
        s = b""
        while True:
            c = rd(a); a += 1
            if c == b"\0": return s
            s += c
    def ret():
        sp = mu.reg_read(UC_X86_REG_RSP)
        mu.reg_write(UC_X86_REG_RIP, struct.unpack("<Q", mu.mem_read(sp, 8))[0])
        mu.reg_write(UC_X86_REG_RSP, sp + 8)
    def hook(mu, addr, size, _):
        if addr == 0x140002920:    # printf
            out.append(cstr(mu.reg_read(UC_X86_REG_RCX)).decode()); ret()
        elif addr == 0x140002928:  # scanf("%99s", buf)
            mu.mem_write(mu.reg_read(UC_X86_REG_RDX), pw.split()[0].encode() + b"\0"); ret()
        elif addr == 0x140002940:  # strcmp
            a, b = cstr(mu.reg_read(UC_X86_REG_RCX)), cstr(mu.reg_read(UC_X86_REG_RDX))
            mu.reg_write(UC_X86_REG_RAX, (a > b) - (a < b) & 0xFFFFFFFF); ret()
        elif addr == 0x140002908:  # getchar
            mu.reg_write(UC_X86_REG_RAX, 10); ret()
        elif addr == 0xDEAD0000:
            mu.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook)
    sp = STACK + 0x8000
    mu.mem_map(0xDEAD0000, 0x1000)
    mu.mem_write(sp, struct.pack("<Q", 0xDEAD0000))
    mu.reg_write(UC_X86_REG_RSP, sp)
    mu.emu_start(0x140001490, 0xDEAD0000)
    return "".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD); return
    print(f"Mot de passe : {PASSWORD}")
    if a.check:
        pe = load_pe()
        for pw, want in ((PASSWORD, "CORRECT!"), ("petik", "WRONG!")):
            o = run(pe, pw)
            ok = want in o
            print(f"  {pw!r:12} -> {o!r} {'OK' if ok else 'KO'}")
            if not ok: sys.exit(1)

if __name__ == "__main__":
    main()
