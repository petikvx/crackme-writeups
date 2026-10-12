#!/usr/bin/env python3
"""Keygen damos_crackme_1_for_solaris (damo2k) + vérif par émulation Unicorn SPARC.

Même code C que la version Linux (cf. crkme1.txt) : serial de 10 caractères,
après upcase des a..z :
  s0 = s9 - 3   s1 = s8 + 14   s2 = s7 - 20   s3 = s6 + 6   s0 = (s4+s5)/2
usage : damo-crackme1-sparc-solve.py [-n N] [--check]
  --check : exécute le VRAI main() SPARC du binaire sous Unicorn (strlen/printf
            de la PLT simulés) et affiche le message que le binaire imprimerait.
"""
import os, random, string, struct, sys

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "crkme1-solaris")
OK = set(map(ord, string.ascii_uppercase + string.digits))

def valid(s):
    t = [ord(c) - 0x20 if 0x61 <= ord(c) <= 0x7A else ord(c) for c in s]
    return len(t) == 10 and t[0] == t[9] - 3 and t[1] == t[8] + 14 and \
        t[2] == t[7] - 20 and t[3] == t[6] + 6 and t[0] == int((t[4] + t[5]) / 2)

def gen(rng=random):
    while True:
        s = [0] * 10
        s[9] = rng.choice(sorted(c for c in OK if c - 3 in OK)); s[0] = s[9] - 3
        s[8] = rng.choice(sorted(c for c in OK if c + 14 in OK)); s[1] = s[8] + 14
        s[7] = rng.choice(sorted(c for c in OK if c - 20 in OK)); s[2] = s[7] - 20
        s[6] = rng.choice(sorted(c for c in OK if c + 6 in OK)); s[3] = s[6] + 6
        s[4] = rng.choice(sorted(OK)); s[5] = 2 * s[0] - s[4] + rng.choice([0, 1])
        if s[5] in OK:
            r = "".join(map(chr, s)); assert valid(r); return r

MAIN, MAIN_RET, STRLEN, PRINTF = 0x105F8, 0x109F0, 0x20B60, 0x20B6C

def emulate(serial: str) -> str:
    from elftools.elf.elffile import ELFFile
    from unicorn import Uc, UC_ARCH_SPARC, UC_MODE_SPARC32, UC_MODE_BIG_ENDIAN, UC_HOOK_CODE
    from unicorn.sparc_const import (UC_SPARC_REG_SP, UC_SPARC_REG_O0, UC_SPARC_REG_O1,
                                     UC_SPARC_REG_O7, UC_SPARC_REG_PC, UC_SPARC_REG_I0, UC_SPARC_REG_I1)
    elf = ELFFile(open(BIN, "rb"))
    mu = Uc(UC_ARCH_SPARC, UC_MODE_SPARC32 | UC_MODE_BIG_ENDIAN)
    mu.mem_map(0x10000, 0x20000)                       # segments texte + données (0x10000..0x2ffff)
    for seg in elf.iter_segments():
        if seg["p_type"] == "PT_LOAD":
            mu.mem_write(seg["p_vaddr"], seg.data())
    mu.mem_map(0x7F000000, 0x100000)
    argv0, argv1, argv = 0x7F0F0000, 0x7F0F0100, 0x7F0F0200
    mu.mem_write(argv0, b"crkme1-solaris\0"); mu.mem_write(argv1, serial.encode() + b"\0")
    mu.mem_write(argv, struct.pack(">III", argv0, argv1, 0))
    out = []
    def cstr(a):
        b = bytes(mu.mem_read(a, 256)); return b.split(b"\0")[0].decode("latin-1")
    def hook(uc, addr, size, _):
        if addr == STRLEN:
            uc.reg_write(UC_SPARC_REG_O0, len(cstr(uc.reg_read(UC_SPARC_REG_O0)).encode("latin-1")))
        elif addr == PRINTF:
            fmt = cstr(uc.reg_read(UC_SPARC_REG_O0))
            out.append(fmt.replace("%s", cstr(uc.reg_read(UC_SPARC_REG_O1)), 1).strip())
        else:
            return
        uc.reg_write(UC_SPARC_REG_PC, uc.reg_read(UC_SPARC_REG_O7) + 8)   # retour leaf
    mu.hook_add(UC_HOOK_CODE, hook, begin=STRLEN, end=PRINTF)
    mu.reg_write(UC_SPARC_REG_SP, 0x7F0E0000)
    mu.reg_write(UC_SPARC_REG_O0, 2); mu.reg_write(UC_SPARC_REG_O1, argv)  # argc, argv (deviennent %i0/%i1 après save)
    mu.reg_write(UC_SPARC_REG_O7, 0x7F0D0000 - 8)                         # adresse de retour bidon
    mu.emu_start(MAIN, MAIN_RET, count=20000)          # stop sur le ret de main
    return " | ".join(out)

if __name__ == "__main__":
    a = sys.argv[1:]
    n = int(a[a.index("-n") + 1]) if "-n" in a else 1
    for s in ["POFKPPEZAS"] + [gen() for _ in range(n - 1)] + (["POFKPPEZAX", "SHORT"] if "--check" in a else []):
        print(s, "->", emulate(s)) if "--check" in a else print(s)
