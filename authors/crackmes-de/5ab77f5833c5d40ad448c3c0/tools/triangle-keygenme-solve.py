#!/usr/bin/env python3
"""Keygen Triangle KeyGenMe (iSSoGoo) : name -> serial 16 hex.

Usage : triangle-keygenme-solve.py [-q] [--name petik] [--check]
  --check : exécute la vraie routine 0x4013eb du PE sous Unicorn (x87) et
            compare avec l'implémentation Python (nécessite unicorn + zip original).
"""
import argparse, struct, sys, zipfile, io, os
import numpy as np

LD = np.longdouble


def name_buffer(name: bytes) -> bytes:
    """Reproduit 0x4013eb : padding (n, n+1, ...) à partir de name[n+1] jusqu'à 99 octets."""
    n = len(name)
    b = bytearray(name) + bytearray(120 - n)
    for k in range(0x63 - n):
        b[n + 1 + k] = (n + k) & 0xFF
    return bytes(b)


def area(name: bytes) -> bytes:
    s = name_buffer(name)
    L = LD(len(name))
    d = lambda x: LD(float(x))            # fstp qword -> arrondi double
    half = LD(2.0)
    R = 0.0
    for i in range(0x63):
        sa = d(np.sqrt(LD(s[i])))
        sb = d(np.sqrt(LD(s[i + 1])))
        T1 = d((sa + L) * (sb - sa) / half)
        T2 = (sa + sb) * (L - sb) / half
        T = d(T1 + T2)
        U = (sb + L) * (L - sa) / half
        diff = LD(T) - U
        if diff < 0:
            diff = -diff
        R = float(LD(R) + diff)
    return struct.pack("<d", R)


def serial(name: str) -> str:
    h = area(name.encode()).hex().upper()
    # 0x401378 : serial[i] = hex[i]+1 sauf '9' et 'F' (inchangés)
    return "".join(c if c in "9F" else chr(ord(c) + 1) for c in h)


def check(name: str):
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP, UC_X86_REG_EIP, UC_X86_REG_EBP
    here = os.path.dirname(os.path.abspath(__file__))
    z = zipfile.ZipFile(os.path.join(here, "..", "original", "trianglekeygenme_issogoo.zip"))
    pe = z.read("KeyGenMe.exe")
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x10000)
    mu.mem_write(0x401000, pe[0x400:0x400 + 0x5a4])
    mu.mem_write(0x402000, pe[0xa00:0xa00 + 0x1ae])
    mu.mem_map(0x500000, 0x10000)
    mu.mem_write(0x403000, pe[0xc00:0xe00])
    nm = name.encode()
    mu.mem_write(0x40315c, nm)
    sp = 0x50f000
    mu.mem_write(sp, struct.pack("<II", 0xdead0000, 0x40315c))  # ret, arg
    mu.reg_write(UC_X86_REG_ESP, sp)
    mu.mem_map(0xdead0000, 0x1000)
    mu.emu_start(0x4013eb, 0xdead0000)
    hexs = bytes(mu.mem_read(0x40324f, 8)).hex().upper()
    return hexs


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if not 3 <= len(a.name) <= 49:
        sys.exit("nom : 3..49 caractères")
    s = serial(a.name)
    if a.check:
        emu = check(a.name)
        ok = emu == area(a.name.encode()).hex().upper()
        print("unicorn:", emu, "python:", area(a.name.encode()).hex().upper(), "OK" if ok else "DIFF")
        if not ok:
            sys.exit(1)
    print(s if a.q else f"name={a.name}  serial={s}")


main()
