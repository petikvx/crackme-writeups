#!/usr/bin/env python3
"""Keygen — keygenning4newbies_crackme_1 by analyst (crackmes.de, Borland C++).

  python3 tools/k4n-solve.py petik
  python3 tools/k4n-solve.py --check petik
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "k4n.EXE"


def keygen(name: str) -> str:
    b = name.encode("latin-1")
    if not (4 <= len(b) < 50):
        raise SystemExit("name: more than 4 and less than 50 chars (code: len>3 && len<0x32)")
    s = 0
    last = 0
    for i, ch in enumerate(b):
        v = (ch if ch < 128 else ch - 256) ^ (i + 1)
        v &= 0xFFFFFFFF
        s = (s + v) & 0xFFFFFFFF
        last = v
    res = ((last * 6) + ((s << 7) & 0xFFFFFFFF)) & 0xFFFFFFFF
    return f"{res:X}"


def emulate_check(name: str, serial: str) -> str | None:
    """Exécute 0x4010FA..0x40117C (boucle + sprintf + lstrcmp + SetWindowText)."""
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_EBP, UC_X86_REG_ESP, UC_X86_REG_ESI
    from unicorn.x86_const import UC_X86_REG_EAX, UC_X86_REG_EBX, UC_X86_REG_ECX, UC_X86_REG_EDX, UC_X86_REG_EIP

    pe = pefile.PE(str(EXE))
    base = pe.OPTIONAL_HEADER.ImageBase
    img = pe.get_memory_mapped_image()
    size = (len(img) + 0xFFF) & ~0xFFF
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, size)
    mu.mem_write(base, img)
    mu.mem_map(0x100000, 0x20000)
    ebp = 0x108000
    nb = name.encode("latin-1")
    mu.mem_write(ebp - 0xB8, nb + b"\0" * 64)
    mu.mem_write(ebp - 0x11C, serial.encode("latin-1") + b"\0" * 32)
    mu.mem_write(ebp - 0x28, struct.pack("<I", len(nb)))
    for reg, val in (
        (UC_X86_REG_EBP, ebp),
        (UC_X86_REG_ESP, 0x107000),
        (UC_X86_REG_ESI, 0x12345678),
        (UC_X86_REG_EAX, 0),
        (UC_X86_REG_EBX, 0),
        (UC_X86_REG_ECX, 0),
        (UC_X86_REG_EDX, 0),
    ):
        mu.reg_write(reg, val)
    out: dict[str, str] = {}

    def rd32(a: int) -> int:
        return struct.unpack("<I", mu.mem_read(a, 4))[0]

    def hook(uc, addr, size, _):
        if addr == 0x404EC4:  # sprintf(buf, "%lX", val)
            esp = uc.reg_read(UC_X86_REG_ESP)
            buf, _fmt, val = rd32(esp + 4), rd32(esp + 8), rd32(esp + 12)
            uc.mem_write(buf, f"{val:X}\0".encode())
            ret = rd32(esp)
            uc.reg_write(UC_X86_REG_ESP, esp + 4)
            uc.reg_write(UC_X86_REG_EIP, ret)
            uc.reg_write(UC_X86_REG_EAX, buf)
        elif addr == 0x40AD86:  # strcmp / lstrcmp wrapper
            esp = uc.reg_read(UC_X86_REG_ESP)
            a, b = rd32(esp + 4), rd32(esp + 8)
            sa = bytes(uc.mem_read(a, 64)).split(b"\0")[0]
            sb = bytes(uc.mem_read(b, 64)).split(b"\0")[0]
            ret = rd32(esp)
            uc.reg_write(UC_X86_REG_EAX, 0 if sa == sb else 1)
            uc.reg_write(UC_X86_REG_ESP, esp + 4)
            uc.reg_write(UC_X86_REG_EIP, ret)
        elif addr == 0x40AC8A:  # SetWindowTextA(hwnd, text)
            esp = uc.reg_read(UC_X86_REG_ESP)
            text = rd32(esp + 8)
            out["msg"] = bytes(uc.mem_read(text, 120)).split(b"\0")[0].decode()
            ret = rd32(esp)
            uc.reg_write(UC_X86_REG_EAX, 1)
            uc.reg_write(UC_X86_REG_ESP, esp + 12)
            uc.reg_write(UC_X86_REG_EIP, ret)

    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(0x4010FA, 0x40117C, count=100000)
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
        msg = emulate_check(name, serial)
        print(f"--check name={name!r} serial={serial} -> {msg!r}")
        assert msg and "Congratulations" in msg, msg
        bad = emulate_check(name, "0")
        print(f"--check bad -> {bad!r}")
        assert bad and "NOT" in bad, bad
        print("OK")


if __name__ == "__main__":
    main(sys.argv)
