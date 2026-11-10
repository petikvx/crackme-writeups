#!/usr/bin/env python3
"""Solveur MicrosoftStorage's ACrack (PE64 MinGW).

Nickname et password sont deux strcmp() contre des constantes de .rdata.
  --check : émule main() (unicorn) sur le binaire dépaqueté et vérifie
            les sorties avec la bonne réponse et une mauvaise.
Usage : acrack-solve.py [-q] [--check [chemin/acrack.exe]]
"""
import argparse, struct, sys, os

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_EXE = os.path.join(HERE, "..", "analysis", "acrack.exe")
ZIP = os.path.join(HERE, "..", "original", "download.bin")
MAIN, PRINTF, SCANF, STRCMP, RET = 0x1400014F8, 0x1400014A4, 0x140001450, 0x14000F0E0, 0x1400015D6
NICK_VA, PASS_VA = 0x140011042, 0x14001105F


def cstr(d, va):
    off = va - 0x140000000 - 0x11000 + 0xEA00  # .rdata : VA 0x11000 -> fichier 0xea00
    return d[off:d.index(b"\0", off)].decode()


def ensure_exe(path):
    if not os.path.exists(path):
        import zipfile
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with zipfile.ZipFile(ZIP) as z:
            z.extract("acrack.exe", os.path.dirname(path), pwd=b"crackmes.one")
    return open(path, "rb").read()


def solve(d):
    return cstr(d, NICK_VA), cstr(d, PASS_VA)


def run(d, nick, pw):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RIP, UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    base = 0x140000000
    mu.mem_map(base, 0x40000)
    mu.mem_write(base, d[:0x600])
    for va, fo, sz in ((0x1000, 0x600, 0xE1D8), (0x10000, 0xE800, 0x110), (0x11000, 0xEA00, 0x13D0)):
        mu.mem_write(base + va, d[fo:fo + sz])
    mu.mem_map(0x200000, 0x10000)
    stack = 0x200000 + 0xF000
    mu.mem_write(stack, struct.pack("<Q", RET + 0x1000))  # adresse de retour factice
    mu.mem_map(0x300000, 0x1000)
    mu.mem_write(0x300000, b"A" * 64)
    out, inputs = [], [nick, pw]
    bufs = {}

    def rs(a):
        s = b""
        while (c := mu.mem_read(a, 1)) != b"\0":
            s += bytes(c); a += 1
        return s

    def hook(uc, addr, size, _):
        if addr in (PRINTF, SCANF, STRCMP, 0x140001690):
            rsp = uc.reg_read(UC_X86_REG_RSP)
            ret = struct.unpack("<Q", uc.mem_read(rsp, 8))[0]
            rcx, rdx = uc.reg_read(UC_X86_REG_RCX), uc.reg_read(UC_X86_REG_RDX)
            rax = 0
            if addr == PRINTF:
                out.append(rs(rcx).decode())
            elif addr == SCANF:
                uc.mem_write(rdx, inputs.pop(0).encode() + b"\0")
            elif addr == STRCMP:
                a, b = rs(rcx), rs(rdx)
                rax = (a > b) - (a < b)
            uc.reg_write(UC_X86_REG_RAX, rax & 0xFFFFFFFFFFFFFFFF)
            uc.reg_write(UC_X86_REG_RSP, rsp + 8)
            uc.reg_write(UC_X86_REG_RIP, ret)

    mu.hook_add(UC_HOOK_CODE, hook)
    # rbp-0x8 / rbp-0x10 : pointeurs sur des buffers (variables locales non initialisées, on les fixe)
    mu.reg_write(UC_X86_REG_RSP, stack)
    # main fait mov rbp,rsp ; sub rsp,0x30 -> on pré-remplit [rsp-8-8] et [rsp-8-16]
    rbp = stack - 8
    mu.mem_write(rbp - 8, struct.pack("<Q", 0x300000))
    mu.mem_write(rbp - 0x10, struct.pack("<Q", 0x300100))
    # main ne réécrit pas ces slots avant les scanf : valeurs conservées
    try:
        mu.emu_start(MAIN, RET + 0x1000)
    except Exception:
        pass
    return "".join(out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const=DEFAULT_EXE)
    a = ap.parse_args()
    d = ensure_exe(a.check or DEFAULT_EXE)
    nick, pw = solve(d)
    if a.q:
        print(nick); print(pw)
    else:
        print(f"Nickname: {nick}\nPassword: {pw}")
    if a.check:
        ok = run(d, nick, pw)
        ko = run(d, nick, pw + "x")
        ko2 = run(d, nick + "x", pw)
        print("--- OK ---\n" + ok + "\n--- KO password ---\n" + ko + "\n--- KO nick ---\n" + ko2)
        sys.exit(0 if ok.rstrip().endswith("True!") and "Bad password" in ko and "bad nickname" in ko2 else 1)


main()
