#!/usr/bin/env python3
"""Keygen — keygenning4newbies_crackme_2 by analyst (crackmes.de, Borland C++).

Le sprintf inclut 3 champs dérivés du pointeur de frame (edi = ebp-0x474 après
les copies locales). Le solveur émule le vrai code avec EBP=0x108000.

  python3 tools/k4n2-solve.py petik
  python3 tools/k4n2-solve.py --check petik
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path

EXE = Path(__file__).resolve().parent.parent / "original" / "k4n2.EXE"
EBP = 0x108000
FMT = "%lX%lu-%lu%lX-%lu%lu-%lX%lX"


def _fmt_serial(args: list[int]) -> str:
    X = lambda v: f"{v:X}"
    u = lambda v: str(v)
    a = args
    return f"{X(a[0])}{u(a[1])}-{u(a[2])}{X(a[3])}-{u(a[4])}{u(a[5])}-{X(a[6])}{X(a[7])}"


def emulate(name: str, serial: str | None = None) -> dict:
    """Exécute 0x4010F7..0x40123C (calcul + sprintf + strcmp + SetWindowText)."""
    import pefile
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import (
        UC_X86_REG_EBP,
        UC_X86_REG_ESP,
        UC_X86_REG_EDI,
        UC_X86_REG_ESI,
        UC_X86_REG_EBX,
        UC_X86_REG_EAX,
        UC_X86_REG_ECX,
        UC_X86_REG_EDX,
        UC_X86_REG_EIP,
    )

    pe = pefile.PE(str(EXE))
    base = pe.OPTIONAL_HEADER.ImageBase
    img = pe.get_memory_mapped_image()
    size = (len(img) + 0xFFF) & ~0xFFF
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(base, size)
    mu.mem_write(base, img)
    mu.mem_map(0x100000, 0x40000)
    ebp = EBP
    nb = name.encode("latin-1")
    mu.mem_write(ebp - 0xBC, nb + b"\0" * 64)
    if serial is not None:
        mu.mem_write(ebp - 0x120, serial.encode("latin-1") + b"\0" * 32)
    else:
        mu.mem_write(ebp - 0x120, b"\0" * 64)
    mu.mem_write(ebp - 0x2C, struct.pack("<I", len(nb)))
    for off in (0x3C, 0x40, 0x44, 0x48, 0x4C, 0x50, 0x54, 0x58):
        mu.mem_write(ebp - off, b"\0\0\0\0")
    mu.mem_write(ebp - 4, struct.pack("<I", 0x12345678))
    edi = (ebp - 0x474) & 0xFFFFFFFF
    mu.reg_write(UC_X86_REG_EBP, ebp)
    mu.reg_write(UC_X86_REG_ESP, ebp - 0x800)
    mu.reg_write(UC_X86_REG_EDI, edi)
    for reg in (UC_X86_REG_ESI, UC_X86_REG_EBX, UC_X86_REG_EAX, UC_X86_REG_ECX, UC_X86_REG_EDX):
        mu.reg_write(reg, 0)
    out: dict = {}

    def rd32(a: int) -> int:
        return struct.unpack("<I", mu.mem_read(a, 4))[0]

    def hook(uc, addr, size, _):
        if addr == 0x404F84:  # sprintf
            esp = uc.reg_read(UC_X86_REG_ESP)
            buf = rd32(esp + 4)
            args = [rd32(esp + 12 + 4 * i) for i in range(8)]
            s = _fmt_serial(args)
            uc.mem_write(buf, s.encode() + b"\0")
            out["serial"] = s
            out["args"] = args
            ret = rd32(esp)
            uc.reg_write(UC_X86_REG_ESP, esp + 4)
            uc.reg_write(UC_X86_REG_EIP, ret)
            uc.reg_write(UC_X86_REG_EAX, buf)
        elif addr == 0x40AE46:  # strcmp
            esp = uc.reg_read(UC_X86_REG_ESP)
            a, b = rd32(esp + 4), rd32(esp + 8)
            sa = bytes(uc.mem_read(a, 80)).split(b"\0")[0]
            sb = bytes(uc.mem_read(b, 80)).split(b"\0")[0]
            ret = rd32(esp)
            uc.reg_write(UC_X86_REG_EAX, 0 if sa == sb else 1)
            uc.reg_write(UC_X86_REG_ESP, esp + 4)
            uc.reg_write(UC_X86_REG_EIP, ret)
        elif addr == 0x40AD4A:  # SetWindowTextA
            esp = uc.reg_read(UC_X86_REG_ESP)
            text = rd32(esp + 8)
            out["msg"] = bytes(uc.mem_read(text, 120)).split(b"\0")[0].decode()
            ret = rd32(esp)
            uc.reg_write(UC_X86_REG_EAX, 1)
            uc.reg_write(UC_X86_REG_ESP, esp + 12)
            uc.reg_write(UC_X86_REG_EIP, ret)

    mu.hook_add(UC_HOOK_CODE, hook)
    mu.emu_start(0x4010F7, 0x40123C, count=500000)
    return out


def keygen(name: str) -> str:
    if not (4 <= len(name.encode("latin-1"))):
        raise SystemExit("name: more than 3 chars (code: len > 3)")
    return emulate(name)["serial"]


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
        msg = emulate(name, serial).get("msg")
        print(f"--check name={name!r} serial={serial} -> {msg!r}")
        assert msg and "Congratulations" in msg, msg
        bad = emulate(name, "0").get("msg")
        print(f"--check bad -> {bad!r}")
        assert bad and "NOT" in bad, bad
        print("OK")


if __name__ == "__main__":
    main(sys.argv)
