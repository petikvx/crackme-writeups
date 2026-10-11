#!/usr/bin/env python3
"""Keygen Crackme12 (FireWorx) — serial = IntToStr(f(k)) pour k dans 1..len(serial).

f(k) = ((((123*k) // len(name+company)) << 5) - 0x2C115C + 0x872EB0) ^ 0x12
Vérif : émulation Unicorn des vrais octets du handler (0x455476..0x455490, dump Wine).
"""
import sys

CODE = bytes.fromhex("506bc77b5a8bca99f7f9c1e0052d5c112c0005b02e870083f012")

def f(k, L):
    return ((((123 * k) // L) << 5) - 0x2C115C + 0x872EB0) ^ 0x12

def emu(k, L):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_EDI, UC_X86_REG_ESP
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x455000, 0x1000); mu.mem_map(0x100000, 0x1000)
    mu.mem_write(0x455476, CODE)
    mu.reg_write(UC_X86_REG_ESP, 0x100800)
    mu.reg_write(UC_X86_REG_EAX, L); mu.reg_write(UC_X86_REG_EDI, k)
    mu.emu_start(0x455476, 0x455476 + len(CODE))
    v = mu.reg_read(UC_X86_REG_EAX)
    return v - (1 << 32) if v & 0x80000000 else v

def keygen(name, company):
    L = len(name + company)
    for k in range(1, 20):
        s = str(f(k, L))
        if k <= len(s):          # la boucle va de 1 à len(serial)
            yield k, s

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    comp = sys.argv[2] if len(sys.argv) > 2 else "petik"
    L = len(name + comp)
    for k, s in keygen(name, comp):
        try:
            ok = "emu OK" if str(emu(k, L)) == s else "emu MISMATCH"
        except ImportError:
            ok = "(unicorn absent)"
        print(f"k={k}: {s}  {ok}")
