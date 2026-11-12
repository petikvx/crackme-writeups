#!/usr/bin/env python3
"""SimbaHDD's CRACKME — keygen (la clé est constante, pas de user).

Check à 0x140007b58 : ((c ^ 0x55) + 7) ^ 0x33 == target[i], target = "CR4CKM3_1234".
Inverse : c = (((t ^ 0x33) - 7) & 0xff) ^ 0x55.

Usage : simbahdd-crackme-solve.py [-q] [--check analysis/extracted/crackme.exe]
"""
import argparse, struct, sys

TARGET = b"CR4CKM3_" + (0x34333231).to_bytes(4, "little")  # qword @0x140009038 + dword imm


def fwd(c):
    return (((c ^ 0x55) + 7) ^ 0x33) & 0xFF


def solve():
    return bytes((((t ^ 0x33) - 7) & 0xFF) ^ 0x55 for t in TARGET).decode("latin1")


def emulate(exe, key):
    """Émule main (0x140007b10) sous unicorn : wine/gdb indisponibles ici.
    Stubs : 0x1400015a0 (__main) -> ret, strlen / puts-printf (0x140001480) interceptés."""
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_64, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_RSP, UC_X86_REG_RCX, UC_X86_REG_RDX, UC_X86_REG_RAX, UC_X86_REG_RIP, UC_X86_REG_RSI
    d = open(exe, "rb").read()
    base = 0x140000000
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    optsz = struct.unpack_from("<H", d, pe + 20)[0]
    mu = Uc(UC_ARCH_X86, UC_MODE_64)
    mu.mem_map(base, 0x20000)
    mu.mem_write(base, d[:0x400])
    for i in range(nsec):
        o = pe + 24 + optsz + 40 * i
        vsz, va, rsz, ro = struct.unpack_from("<IIII", d, o + 8)
        mu.mem_write(base + va, d[ro:ro + min(rsz, vsz)])
    mu.mem_map(0x7000000, 0x10000)
    mu.mem_write(0x7008000, b"crackme.exe\0")
    mu.mem_write(0x7009000, key + b"\0")
    mu.mem_write(0x7007000, struct.pack("<QQ", 0x7008000, 0x7009000))  # argv
    res = {}

    def hook(uc, addr, size, _):
        if addr == 0x1400015A0 or addr == 0x140007A78 or addr == 0x140001480:
            rsp = uc.reg_read(UC_X86_REG_RSP)
            ret = struct.unpack("<Q", uc.mem_read(rsp, 8))[0]
            if addr == 0x140007A78:  # strlen
                p = uc.reg_read(UC_X86_REG_RCX)
                n = 0
                while uc.mem_read(p + n, 1)[0]:
                    n += 1
                uc.reg_write(UC_X86_REG_RAX, n)
            elif addr == 0x140001480:  # printf/puts
                p = uc.reg_read(UC_X86_REG_RCX)
                res["out"] = bytes(uc.mem_read(p, 24)).split(b"\0")[0].decode()
            uc.reg_write(UC_X86_REG_RSP, rsp + 8)
            uc.reg_write(UC_X86_REG_RIP, ret)
        elif addr == 0x7000000:
            uc.emu_stop()

    mu.hook_add(UC_HOOK_CODE, hook)
    mu.mem_write(0x7000000, b"\x90")
    rsp = 0x700F000
    mu.mem_write(rsp, struct.pack("<Q", 0x7000000))
    mu.reg_write(UC_X86_REG_RSP, rsp)
    mu.reg_write(UC_X86_REG_RCX, 2)
    mu.reg_write(UC_X86_REG_RDX, 0x7007000)
    mu.emu_start(0x140007B10, 0x7000000)
    o = res.get("out", "")
    return "correct" if o.startswith("correct") else o or "?"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE")
    a = ap.parse_args()
    key = solve()
    assert bytes(fwd(ord(c)) for c in key) == TARGET
    # clé non imprimable : on l'affiche en hex (+ forme pour argv)
    print(key.encode("latin1").hex() if a.q else f"key (hex) = {key.encode('latin1').hex()}  repr = {key!r}")
    if a.check:
        out = emulate(a.check, key.encode("latin1"))
        print(out)
        sys.exit(0 if out == "correct" else 1)


if __name__ == "__main__":
    main()
