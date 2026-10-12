#!/usr/bin/env python3
"""Patch — pushpushme by synfo (crackmes.de).

Construit analysis/PushPushMe.patched.exe pour que MessageBox affiche « Well d0ne! ».

  python3 tools/pushpushme-solve.py
  python3 tools/pushpushme-solve.py --check
"""
from __future__ import annotations

import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "original" / "PushPushMe.exe"
DST = ROOT / "analysis" / "PushPushMe.patched.exe"


def patch(data: bytes) -> bytes:
    buf = bytearray(data)
    # Chaîne ret → MessageBoxA(0, "Well d0ne!", NULL, 0) ; ret → ExitProcess
    buf[0x205:0x20a] = bytes([0x68, 0x68, 0x34, 0x10, 0x40])  # push 0x40103468
    buf[0x20a:0x20f] = bytes([0x68, 0x3a, 0x10, 0x40, 0x00])  # push ExitProcess thunk
    buf[0x214:0x219] = bytes([0x68, 0x68, 0x0B, 0x30, 0x40])  # push 0x40300B68
    buf[0x219:0x21E] = bytes([0x68, 0x6A, 0x00, 0x6A, 0x00])  # push 0x006A006A
    return bytes(buf)


def check() -> None:
    from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UcError, UC_HOOK_CODE
    from unicorn.x86_const import UC_X86_REG_ESP

    pe = patch(SRC.read_bytes())
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x10000)
    mu.mem_write(0x400000, pe[:0x200])
    mu.mem_write(0x401000, pe[0x200:0x240])
    mu.mem_write(0x402000, pe[0x400:0x500])
    mu.mem_write(0x403000, pe[0x600:0x620])
    mu.mem_map(0x100000, 0x40000)
    mu.reg_write(UC_X86_REG_ESP, 0x120000)
    MSGBOX, EXITP = 0x7E0000, 0x7E0100
    mu.mem_map(0x7E0000, 0x2000)
    mu.mem_write(0x402000, struct.pack("<I", MSGBOX))
    mu.mem_write(0x402008, struct.pack("<I", EXITP))
    mu.mem_write(MSGBOX, bytes([0xC2, 0x10, 0x00]))
    mu.mem_write(EXITP, bytes([0xF4]))
    seen: list = []

    def hook(uc, addr, size, _):
        if addr == MSGBOX:
            esp = uc.reg_read(UC_X86_REG_ESP)
            hwnd, text, cap, typ = struct.unpack("<IIII", uc.mem_read(esp + 4, 16))
            rs = lambda a: None if a == 0 else bytes(uc.mem_read(a, 64)).split(b"\0")[0]
            seen.append((hwnd, rs(text), rs(cap), typ))
        if addr == EXITP:
            uc.emu_stop()

    mu.hook_add(UC_HOOK_CODE, hook)
    try:
        mu.emu_start(0x401000, 0, count=200)
    except UcError:
        pass
    assert seen and seen[0][1] == b"Well d0ne!", seen
    print(f"OK  MessageBoxA{seen[0]}")


def main(argv: list[str]) -> None:
    if "--check" in argv:
        check()
        return
    DST.parent.mkdir(parents=True, exist_ok=True)
    DST.write_bytes(patch(SRC.read_bytes()))
    print(f"wrote {DST}")
    check()


if __name__ == "__main__":
    main(sys.argv)
