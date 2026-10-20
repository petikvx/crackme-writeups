#!/usr/bin/env python3
"""Keygen LaFarge's crackme 0.2 (ICU) : name -> serial XXXX-XXXX-XXXX-XXXX.

Usage: lafarge-crackme02-solve.py [name] [-q] [--check exe]
  défaut name = petik ; --check émule la routine réelle (0x40116e..0x40125c) sous unicorn.
"""
import sys, argparse

KEY = b"_r <()<1-Z2[l5,^"          # .data 0x406ba4 (16 octets)

def keygen(name: str) -> str:
    n = name.encode('latin-1')
    if len(n) < 4:
        raise ValueError("nom >= 4 caractères")
    buf = bytearray(KEY)
    for i in range(max(len(KEY), len(n))):
        j = i % len(KEY)
        buf[j] = ((n[i % len(n)] ^ buf[j]) % 25) + 0x41
    s = buf[:16].decode()
    return "-".join(s[k:k+4] for k in range(0, 16, 4))

def check_unicorn(exe: str, name: str) -> str:
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EIP
    d = open(exe, 'rb').read()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x20000)
    mu.mem_write(0x401000, d[0x400:0x400+0x312a])
    mu.mem_write(0x406000, d[0x3a00:0x3a00+0xe00])
    mu.mem_map(0x100000, 0x10000)
    n = name.encode() + b"\0"
    mu.mem_write(0x406384, n)                       # nom (GetDlgItemText)
    # lstrlenA / lstrcpyA : thunks 0x40137e / 0x401378 émulés
    def hook(uc, addr, size, _):
        esp = uc.reg_read(UC_X86_REG_ESP)
        ret = int.from_bytes(uc.mem_read(esp, 4), 'little')
        a1 = int.from_bytes(uc.mem_read(esp+4, 4), 'little')
        a2 = int.from_bytes(uc.mem_read(esp+8, 4), 'little')
        def cs(p):
            s = b""
            while True:
                c = bytes(uc.mem_read(p, 1))
                if c == b"\0": return s
                s += c; p += 1
        if addr == 0x40137e:
            uc.reg_write(19, len(cs(a1)))               # 19 = UC_X86_REG_EAX
            uc.reg_write(UC_X86_REG_ESP, esp+4); uc.reg_write(UC_X86_REG_EIP, ret)
        elif addr == 0x401378:
            uc.mem_write(a1, cs(a2)+b"\0")
            uc.reg_write(19, a1)
            uc.reg_write(UC_X86_REG_ESP, esp+8); uc.reg_write(UC_X86_REG_EIP, ret)
    mu.hook_add(UC_HOOK_CODE, hook, None, 0x401378, 0x401380)
    mu.reg_write(UC_X86_REG_ESP, 0x108000)
    mu.emu_start(0x40116e, 0x401248)
    return bytes(mu.mem_read(0x406b84, 19)).decode()

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE")
    a = ap.parse_args()
    s = keygen(a.name)
    if a.check:
        r = check_unicorn(a.check, a.name)
        assert r == s, (r, s)
        print("[check] binaire (unicorn) == keygen", file=sys.stderr)
    print(s if a.q else f"name={a.name}  serial={s}")
