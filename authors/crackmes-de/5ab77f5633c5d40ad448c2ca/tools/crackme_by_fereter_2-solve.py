#!/usr/bin/env python3
"""Keygen CrackMe by Fereter #2 (crackmes.one 5ab77f5633c5d40ad448c2ca).

Serial (11 car.) : S0 S1 x '-' x S5 S6 '-' x x x
  s  = somme(octets du nom) & 0xFF   -> S0 = s%9, S1 = (s//9)%9
  s' = somme(octets du serial) & 0xFF -> S5 = s'%9, S6 = (s'//9)%9
Usage : crackme_by_fereter_2-solve.py [nom]   (défaut : petik)
        --verify : rejoue la vraie routine x86 du binaire sous unicorn
"""
import itertools, string, sys

def digits(b):
    s = sum(b) & 0xFF
    return chr(0x30 + s % 9), chr(0x30 + (s // 9) % 9)

def keygen(name, fill=string.ascii_uppercase):
    a, b = digits(name.encode())
    for x in itertools.product(fill, repeat=5):
        for c5, c6 in itertools.product("012345678", repeat=2):
            ser = f"{a}{b}{x[0]}-{x[1]}{c5}{c6}-{x[2]}{x[3]}{x[4]}"
            if digits(ser.encode()) == (c5, c6):
                return ser

def verify(exe, name, serial):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_ESP, UC_X86_REG_EBP, UC_X86_REG_EBX
    raw = open(exe, "rb").read()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x10000)
    mu.mem_write(0x401000, raw[0x200:0x200 + 0x1b8])
    mu.mem_write(0x402000, raw[0x400:0x400 + 0x5af])
    mu.mem_map(0x100000, 0x10000)
    mu.reg_write(UC_X86_REG_ESP, 0x108000); mu.reg_write(UC_X86_REG_EBP, 0x108800)
    mu.mem_write(0x40108c, name.encode() + b"\0")
    mu.mem_write(0x4010f0, serial.encode() + b"\0")
    mu.reg_write(UC_X86_REG_EAX, len(serial))   # retour de WM_GETTEXT (serial)
    mu.reg_write(UC_X86_REG_EBX, 0x40108c)      # mov ebx,0x40108c (0x40242c)
    res = {}
    def hook(uc, addr, size, _):
        if addr in (0x4024f8, 0x40253a):
            res["ok"] = addr == 0x4024f8; uc.emu_stop()
    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(0x402455, 0x402600)            # juste après le 2e WM_GETTEXT
    return res.get("ok", False)

if __name__ == "__main__":
    args = [a for a in sys.argv[1:] if a != "--verify"]
    name = args[0] if args else "petik"
    ser = keygen(name)
    print(f"{name} : {ser}")
    if "--verify" in sys.argv:
        import os
        exe = os.path.join(os.path.dirname(__file__), "..", "analysis", "CrackMeByFereter#2.exe")
        print("unicorn :", "Registed" if verify(exe, name, ser) else "ÉCHEC")
