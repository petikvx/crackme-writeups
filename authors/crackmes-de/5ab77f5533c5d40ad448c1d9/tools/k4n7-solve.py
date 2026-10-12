#!/usr/bin/env python3
"""Keygen — keygenning4newbies_crackme_7 by analyst (crackmes.de, PE32 UPX / MSVC).

  python3 tools/k4n7-solve.py petik
  python3 tools/k4n7-solve.py --check petik
"""
from __future__ import annotations

import hashlib
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
UNPACKED = ROOT / "analysis" / "KeygenMe.unpacked.exe"
PACKED = ROOT / "original" / "KeygenMe.exe"

PLAIN_Y = 0x6779656B  # "keyg"
PLAIN_Z = 0x656D6E65  # "enme"


def keygen(name: str) -> str:
    dig = hashlib.md5(name.encode("latin-1")).digest()
    k0, k1, k2, k3 = struct.unpack("<4I", dig)
    s = (k0 ^ k2) & 0xFFFFFFFF
    y, z = PLAIN_Y, PLAIN_Z
    # 1 round TEA-like encrypt (inverse of the decrypt in 0x401c70)
    y = (y + ((((z << 4) + k0) ^ (z + s) ^ ((z >> 5) + k1)) & 0xFFFFFFFF)) & 0xFFFFFFFF
    z = (z + ((((y << 4) + k2) ^ (y + s) ^ ((y >> 5) + k3)) & 0xFFFFFFFF)) & 0xFFFFFFFF
    # serial hex: first 8 = z @0x4060a4, last 8 = y @0x4060a0 (uppercase)
    return f"{z:08X}{y:08X}"


def check_python(name: str, serial: str) -> bool:
    if len(serial) != 16:
        return False
    z = int(serial[:8], 16)
    y = int(serial[8:], 16)
    dig = hashlib.md5(name.encode("latin-1")).digest()
    k0, k1, k2, k3 = struct.unpack("<4I", dig)
    s = (k0 ^ k2) & 0xFFFFFFFF
    z = (z - ((((y << 4) + k2) ^ (y + s) ^ ((y >> 5) + k3)) & 0xFFFFFFFF)) & 0xFFFFFFFF
    y = (y - ((((z << 4) + k0) ^ (z + s) ^ ((z >> 5) + k1)) & 0xFFFFFFFF)) & 0xFFFFFFFF
    return y == PLAIN_Y and z == PLAIN_Z


def emulate_check(name: str, serial: str) -> str | None:
    """Run real 0x401c70 (MD5 name + 1-round TEA decrypt + MessageBox)."""
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import (
        UC_X86_REG_ESP,
        UC_X86_REG_EBP,
        UC_X86_REG_EIP,
        UC_X86_REG_EAX,
    )

    pe = pefile.PE(str(UNPACKED))
    base = pe.OPTIONAL_HEADER.ImageBase
    img = pe.get_memory_mapped_image()
    size = (len(img) + 0xFFF) & ~0xFFF
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, size)
    mu.mem_write(base, img)
    mu.mem_map(0x100000, 0x20000)
    mu.mem_map(0xDEAD0000, 0x2000)

    # name at 0x40603c (GetDlgItemText target), serial dwords at 0x4060a0 / 0x4060a4
    nb = name.encode("latin-1") + b"\0"
    mu.mem_write(0x40603C, nb + b"\0" * max(0, 64 - len(nb)))
    z = int(serial[:8], 16)
    y = int(serial[8:], 16)
    mu.mem_write(0x4060A0, struct.pack("<II", y, z))

    out: dict[str, str] = {}

    def rd32(a: int) -> int:
        return struct.unpack("<I", mu.mem_read(a, 4))[0]

    def hook(uc, addr, sz, _):
        if addr == 0xDEAD1000:
            esp = uc.reg_read(UC_X86_REG_ESP)
            text_ptr = rd32(esp + 8)
            raw = bytes(uc.mem_read(text_ptr, 80)).split(b"\0")[0]
            out["msg"] = raw.decode("latin-1", errors="replace")
            uc.reg_write(UC_X86_REG_EAX, 1)
            ret = rd32(esp)
            uc.reg_write(UC_X86_REG_ESP, esp + 20)  # 4 args stdcall + ret
            uc.reg_write(UC_X86_REG_EIP, ret)

    mu.mem_write(0x4050AC, struct.pack("<I", 0xDEAD1000))
    mu.mem_write(0xDEAD1000, b"\x90" * 16)
    mu.hook_add(UC_HOOK_CODE, hook)

    esp = 0x110000
    mu.mem_write(esp, struct.pack("<I", 0xDEAD0000))
    mu.reg_write(UC_X86_REG_ESP, esp)
    mu.reg_write(UC_X86_REG_EBP, 0x111000)
    mu.emu_start(0x401C70, 0xDEAD0000, count=500000)
    return out.get("msg")


def main(argv: list[str]) -> None:
    args = argv[1:]
    do_check = False
    if args and args[0] == "--check":
        do_check = True
        args = args[1:]
    name = args[0] if args else "petik"
    serial = keygen(name)
    print(serial)
    if do_check:
        assert check_python(name, serial), "python check failed"
        msg = emulate_check(name, serial)
        print(f"--check name={name!r} serial={serial} -> {msg!r}")
        assert msg and "Congrats" in msg, f"unexpected message: {msg!r}"
        bad = emulate_check(name, "0000000000000000")
        print(f"--check bad serial -> {bad!r}")
        assert bad and "Invalid" in bad, f"bad serial should be Invalid, got {bad!r}"
        print("OK")


if __name__ == "__main__":
    main(sys.argv)
