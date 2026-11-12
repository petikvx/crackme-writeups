#!/usr/bin/env python3
"""DonCris's Existential Vending Machine — keygen (nom -> code d'accès).

  weight = 13 * sum(bytes(name)) + 7                (calculate_soul_weight, 0x1400017cd)
  code   = (weight ^ 0xface) - 0x7b  (int32, cdqe)  (main, 0x140001c29)

Usage:
  existential-vending-solve.py [--user petik] [-q] [--check]
--check : émule avec unicorn le VRAI code du PE (calculate_soul_weight + bloc
          xor/sub de main) et compare avec la formule Python.
"""
import argparse, os, struct

def weight(name: bytes) -> int:
    s = sum(b if b < 128 else b - 256 for b in name)   # movsx
    return (13 * s + 7) & 0xFFFFFFFF

def code(name: str) -> int:
    w = weight(name.encode("latin-1"))
    v = ((w ^ 0xFACE) - 0x7B) & 0xFFFFFFFF
    return v - (1 << 32) if v & 0x80000000 else v      # cdqe -> int64

def check(name: str, exe: str) -> bool:
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64
    from unicorn.x86_const import (UC_X86_REG_RCX, UC_X86_REG_RSP, UC_X86_REG_RBP,
                                   UC_X86_REG_RAX)
    data = open(exe, "rb").read()
    base = 0x140000000
    text_off, text_va, text_sz = 0x600, 0x140001000, 0x3cb0
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(text_va, 0x4000)
    mu.mem_write(text_va, data[text_off:text_off + text_sz])
    mu.mem_map(0x200000, 0x10000)             # pile + faux std::string
    sp = 0x200000 + 0x8000
    # std::string SSO : ptr, size, buf
    nb = name.encode("latin-1")
    sbase = 0x208000 + 0x1000
    mu.mem_write(sbase, struct.pack("<QQ", sbase + 16, len(nb)) + nb + b"\0")
    # 1) calculate_soul_weight jusqu'au ret (retour sur 0x140001000+... = sentinelle)
    sentinel = text_va + 0x3000
    mu.mem_write(sp, struct.pack("<Q", sentinel))
    mu.reg_write(UC_X86_REG_RSP, sp); mu.reg_write(UC_X86_REG_RCX, sbase)
    mu.emu_start(0x1400017cd, sentinel)
    w = mu.reg_read(UC_X86_REG_RAX) & 0xFFFFFFFF
    # 2) bloc de main : 0x140001c29..0x140001c58 (xor 0xface, sub 0x7b, cdqe)
    rbp = 0x200000 + 0x4000
    mu.reg_write(UC_X86_REG_RBP, rbp)
    mu.mem_write(rbp + 0x22c, struct.pack("<I", w))
    mu.emu_start(0x140001c29, 0x140001c58)
    exp = struct.unpack("<q", bytes(mu.mem_read(rbp + 0x218, 8)))[0]
    ok = (w == weight(nb)) and exp == code(name)
    print(f"[check] binaire: weight={w} code={exp} | python: weight={weight(nb)} code={code(name)} -> {'OK' if ok else 'KO'}")
    return ok

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", "--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=os.path.join(os.path.dirname(__file__), "..", "analysis", "x", "existential_vending.exe"))
    a = ap.parse_args()
    c = code(a.user)
    print(c if a.q else f"name={a.user!r} weight={weight(a.user.encode('latin-1'))} access_code={c}")
    if a.check:
        import sys
        for n in (a.user, "a", "Zz~é"):
            if not check(n, a.exe): sys.exit(1)

if __name__ == "__main__":
    main()
