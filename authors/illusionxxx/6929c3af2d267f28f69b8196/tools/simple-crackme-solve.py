#!/usr/bin/env python3
"""illusionxxx's simple crackme — solveur (mot de passe fixe, XOR avec la longueur).

original/download.bin est un ZIP (mdp crackmes.one) contenant a.exe (PE64 MinGW).
Le binaire compare  (saisie[i] ^ len(saisie))  à la chaîne globale 'l?xo`0re' (8 octets,
imm64 0x653072606f783f6c écrit par le ctor statique @0x140002d30).

Usage : simple-crackme-solve.py [-q] [--check]
  --check : émule avec unicorn la vraie routine XOR (0x140001470) du PE + la boucle de cmp.
"""
import argparse, io, struct, sys, zipfile
from pathlib import Path

ZIP = Path(__file__).resolve().parent.parent / "original" / "download.bin"
IMM_VA = 0x140002d4c + 2          # movabs rax, imm64 -> imm après l'opcode REX.W B8


def load_pe():
    z = zipfile.ZipFile(ZIP)
    return z.read("a.exe", pwd=b"crackmes.one")


def va2off(pe, va):
    nsec = struct.unpack_from("<H", pe, struct.unpack_from("<I", pe, 0x3c)[0] + 6)[0]
    e = struct.unpack_from("<I", pe, 0x3c)[0]
    base = struct.unpack_from("<Q", pe, e + 0x30)[0]
    opt = struct.unpack_from("<H", pe, e + 20)[0]
    s = e + 24 + opt
    for i in range(nsec):
        vs, vaddr, rs, ro = struct.unpack_from("<IIII", pe, s + i * 40 + 8)
        if vaddr <= va - base < vaddr + max(vs, rs):
            return va - base - vaddr + ro
    raise ValueError(hex(va))


def target(pe):
    return pe[va2off(pe, IMM_VA):][:8]


def solve(pe):
    t = target(pe)
    n = len(t)
    return bytes(b ^ n for b in t).decode()


def check(pe, pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn.x86_const import UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RSP
    e = struct.unpack_from("<I", pe, 0x3c)[0]
    base = struct.unpack_from("<Q", pe, e + 0x30)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0x10000)
    mu.mem_write(base, pe[:0x400])
    mu.mem_write(base + 0x1000, pe[0x400:0x400 + 0x1d90])      # .text
    mu.mem_map(0x20000000, 0x10000)
    S_IN, S_OUT, STK, RET = 0x20000100, 0x20000200, 0x20008000, 0x20009000
    data = pw.encode()
    # std::string {ptr, size, buf[16]} : même layout que dans main (rsp+0x70 / +0x90)
    mu.mem_write(S_IN, struct.pack("<QQ", S_IN + 16, len(data)) + data + b"\0")
    mu.mem_write(S_OUT, struct.pack("<QQ", S_OUT + 16, len(data)) + data + b"\0")
    mu.mem_write(STK, struct.pack("<Q", RET)); mu.mem_write(RET, b"\x90")
    mu.reg_write(UC_X86_REG_RCX, S_OUT)   # std::string copie (xorée en place)
    mu.reg_write(UC_X86_REG_RDX, S_IN)    # r9=rcx ; rcx=rdx : fonction lit rdx+8 = taille
    mu.reg_write(UC_X86_REG_RSP, STK)
    mu.emu_start(0x140001470, RET)
    # la routine xore le buffer de S_IN puis le « move » vers S_OUT (SSO : copie inline)
    ptr = struct.unpack("<Q", bytes(mu.mem_read(S_OUT, 8)))[0]
    res = bytes(mu.mem_read(ptr, len(data)))
    return len(data) == 8 and res == target(pe)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pe = load_pe()
    pw = solve(pe)
    if a.check:
        ok = check(pe, pw)
        ko = check(pe, "AAAAAAAA")
        print(f"unicorn: '{pw}' -> {'OK' if ok else 'KO'} ; 'AAAAAAAA' -> {'OK' if ko else 'KO'}", file=sys.stderr)
        sys.exit(0 if ok and not ko else 1)
    print(pw if a.q else f"password = {pw}")


main()
