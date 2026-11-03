#!/usr/bin/env python3
"""Solveur crackme1.exe (m477hi45, COM 16 bits) : serial de 4 touches.

Usage : m477hi45-first-crackme-solve.py [-q] [--check] [chemin/crackme1.exe]
  --check : émule le COM sous Unicorn (int 21h simulé) et vérifie OK/KO.
"""
import argparse, os, sys, zipfile, io

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "crackme1_1.zip")


def load(path):
    if path:
        return open(path, "rb").read()
    with zipfile.ZipFile(ZIP) as z:
        return z.read("crackme1.exe")


def solve():
    # push 3030/3830/3230/3530 ; pop cx ; pop cx -> ch = 0x32
    c1 = 0x32
    c2 = 0x61                              # cmp ch,'a'
    c3 = 0x38 - 1 - 1                      # bh = 8 - 2
    c4 = 0x36 + 1 + 1 + 1 - 1 + 1          # inc x3, dec, inc
    return "".join(map(chr, (c1, c2, c3, c4)))


def run(code, keys):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_INTR
    from unicorn.x86_const import (UC_X86_REG_AH, UC_X86_REG_AL, UC_X86_REG_DX,
                                   UC_X86_REG_IP, UC_X86_REG_CS, UC_X86_REG_DS,
                                   UC_X86_REG_SS, UC_X86_REG_SP, UC_X86_REG_ES)
    mu = Uc(UC_ARCH_X86, UC_MODE_16)
    base = 0x10000                         # segment 0x1000, org 0x100
    mu.mem_map(0x10000, 0x10000)
    mu.mem_write(base + 0x100, code)
    for r in (UC_X86_REG_CS, UC_X86_REG_DS, UC_X86_REG_SS, UC_X86_REG_ES):
        mu.reg_write(r, 0x1000)
    mu.reg_write(UC_X86_REG_SP, 0xFFFE)
    out, keys, done = [], list(keys), [False]

    def intr(uc, n, _):
        if n != 0x21:
            return
        ah = uc.reg_read(UC_X86_REG_AH)
        if ah == 1:
            uc.reg_write(UC_X86_REG_AL, ord(keys.pop(0)) if keys else 0x0d)
        elif ah == 9:
            a = base + uc.reg_read(UC_X86_REG_DX)
            s = b""
            while True:
                b = bytes(uc.mem_read(a, 1))
                if b == b"$":
                    break
                s += b; a += 1
            out.append(s.decode())
        if len(out) and ("right" in out[-1] or "Wrong Serial" in out[-1]):
            done[0] = True; uc.emu_stop()

    mu.hook_add(UC_HOOK_INTR, intr)
    try:
        mu.emu_start(base + 0x100, base + 0x100 + len(code), count=5000)
    except Exception:
        pass
    return "".join(out)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("exe", nargs="?")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = solve()
    print(s if a.q else f"Serial : {s}")
    if a.check:
        code = load(a.exe)
        ok = run(code, s)
        ko = run(code, "2a6x")
        print("OK  :", "right serial" in ok, "|", ok.strip().splitlines()[-1])
        print("KO  :", "Wrong Serial Code" in ko and "right" not in ko)
        sys.exit(0 if "right" in ok and "right" not in ko else 1)
