#!/usr/bin/env python3
"""Keygen Crackme15 (FireWorx) — serial = "MU" + IntToStr(v(k)) + " " pour k dans 2..len(nom).

Vérif : émulation Unicorn des vrais octets du handler Button1Click (0x441a83..0x441adf, dump Wine).
"""
import sys

CODE = bytes.fromhex(
    "8bf30faff385f6790383c603c1fe0281c6260900008bc6f7ee85c0790383c007c1f8032d80090000"
    "8945f88bc3f7eeb90c00000099f7f98bf881c73906000083ef198bc399f7ff8945f48d55f08b45f4"
    "03c70345f803c60345f803c7")

def tdiv(a, b):  # idiv x86 (troncature vers 0)
    q = abs(a) // abs(b)
    return q if (a >= 0) == (b > 0) else -q

def s32(x):
    x &= 0xFFFFFFFF
    return x - (1 << 32) if x & 0x80000000 else x

def v(k):
    esi = tdiv(k * k, 4) + 0x926
    a = tdiv(s32(esi * esi), 8) - 0x980
    edi = tdiv(k * esi, 12) + 0x639 - 0x19
    c = tdiv(k, edi)
    return s32(c + edi + a + esi + a + edi)

def emu(k):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_EBX, UC_X86_REG_EBP
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x441000, 0x1000); mu.mem_map(0x100000, 0x1000)
    mu.mem_write(0x441a83, CODE)
    mu.reg_write(UC_X86_REG_EBP, 0x100800); mu.reg_write(UC_X86_REG_EBX, k)
    mu.emu_start(0x441a83, 0x441a83 + len(CODE))
    return s32(mu.reg_read(UC_X86_REG_EAX))

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    if len(name) < 2:
        sys.exit("nom d'au moins 2 caractères")
    for k in range(2, len(name) + 1):
        s = f"MU{v(k)} "
        print(f"k={k}: {s!r}  {'emu OK' if emu(k) == v(k) else 'emu MISMATCH'}")
