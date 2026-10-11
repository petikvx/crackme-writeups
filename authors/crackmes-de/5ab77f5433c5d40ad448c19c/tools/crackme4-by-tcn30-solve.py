#!/usr/bin/env python3
"""crackme4 by tcn30 (crackmes.de) — récupère user/pass.
Le binaire stocke 2 couples (clé 16 o, bloc chiffré 16 o) ; il les déchiffre
avec une variante XTEA (delta 0x9E3779B9, routine 0x455E98), puis TrimRight + UpperCase.
Ce solveur émule (Unicorn) la vraie routine de déchiffrement du binaire."""
import struct, sys, zipfile, io, pathlib
here = pathlib.Path(__file__).resolve().parent.parent
z = zipfile.ZipFile(here / "original/PasswordApp2.zip")
z.setpassword(b"crackmes.one")
d = z.read("PasswordApp2.exe")
o = lambda va: va - 0x401000 + 0x400

def emu_dec(block, key):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EAX, UC_X86_REG_EDX
    mu = Uc(UC_ARCH_X86, UC_MODE_32); mu.mem_map(0x400000, 0x60000)
    mu.mem_write(0x401000, d[0x400:0x400 + 0x55770]); mu.mem_map(0x100000, 0x10000)
    mu.mem_write(0x101000, block); mu.mem_write(0x102000, key)
    mu.mem_write(0x10F000, struct.pack("<I", 0x100000))
    mu.reg_write(UC_X86_REG_ESP, 0x10F000); mu.reg_write(UC_X86_REG_EAX, 0x101000)
    mu.reg_write(UC_X86_REG_EDX, 0x102000); mu.emu_start(0x455E98, 0x100000)
    return bytes(mu.mem_read(0x101000, 8))

out = []
for name, k, c in (("user", 0x456430, 0x45644C), ("pass", 0x456468, 0x456484)):
    K, C = d[o(k):o(k) + 16], d[o(c):o(c) + 16]
    P = b"".join(emu_dec(C[i:i + 8], K) for i in (0, 8))
    s = P.rstrip(b"\0").decode().rstrip().upper()
    out.append(s); print(f"{name}: {s}   (clair brut {P!r})")
