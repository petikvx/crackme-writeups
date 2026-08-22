#!/usr/bin/env python3
"""Keygen — D4ph1 Epicurus.

UI : cliquer l’icône (hotzone), Name, Serial, Check Me.

Exemple AGENTS :
  name=petik  click≈(170,110)  →  EE0E-8AFF8715-EB04

Apopthegm (name len=1) :
  Nothing isn`t created by nothing.Epicurus,341-270 BCE

Usage:
  python3 epicurus-solve.py -q --name petik
  python3 epicurus-solve.py --name petik --check
"""
from __future__ import annotations

import argparse
import struct
from pathlib import Path

from unicorn import Uc, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
from unicorn.x86_const import *

EXE = Path(__file__).resolve().parents[1] / "original" / "D4ph1-Epicurus.exe"
DEFAULT_NAME = "petik"
DEFAULT_CLICK = (170, 110)  # inside icon hotzone (154..184)×(94..128)
APOPTHEGM = "Nothing isn`t created by nothing.Epicurus,341-270 BCE"


def _mu():
    raw = EXE.read_bytes()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x20000)
    stack = 0x120000
    mu.mem_map(stack - 0x8000, 0x10000)
    e = struct.unpack_from("<I", raw, 0x3C)[0]
    num = struct.unpack_from("<H", raw, e + 6)[0]
    opt = struct.unpack_from("<H", raw, e + 20)[0]
    sec = e + 24 + opt
    for i in range(num):
        off = sec + i * 40
        vsz, va, rsz, rraw = struct.unpack_from("<IIII", raw, off + 8)
        chunk = raw[rraw : rraw + rsz]
        mu.mem_write(0x400000 + va, chunk + bytes(max(0, max(vsz, 0x1000) - len(chunk))))
    return mu, stack


def _call(mu, stack, start: int) -> None:
    ret = 0x40F000
    try:
        mu.mem_write(ret, b"\x90")
    except Exception:
        mu.mem_map(0x40F000, 0x1000)
        mu.mem_write(ret, b"\x90")

    def hook(uc, address, size, user):
        if address == ret:
            uc.emu_stop()

    h = mu.hook_add(UC_HOOK_CODE, hook, begin=ret, end=ret + 1)
    mu.mem_write(stack - 4, struct.pack("<I", ret))
    mu.reg_write(UC_X86_REG_ESP, stack - 4)
    for r in (
        UC_X86_REG_EAX,
        UC_X86_REG_EBX,
        UC_X86_REG_ECX,
        UC_X86_REG_EDX,
        UC_X86_REG_ESI,
        UC_X86_REG_EDI,
        UC_X86_REG_EBP,
    ):
        mu.reg_write(r, 0)
    mu.emu_start(start, 0, timeout=8_000_000, count=800_000)
    mu.hook_del(h)


def serial_for(name: str, click: tuple[int, int] = DEFAULT_CLICK) -> str:
    x, y = click
    mu, stack = _mu()
    mu.mem_write(0x40321C, struct.pack("<HH", x, y))
    mu.mem_write(0x403220, b"\x00")
    mu.mem_write(0x403256, b"\x00")
    mu.mem_write(0x40322E, name.encode() + b"\x00" * 40)
    for addr, n in (
        (0x40336C, 128),
        (0x403289, 80),
        (0x4032EB, 80),
        (0x40327F, 32),
        (0x403402, 80),
    ):
        mu.mem_write(addr, b"\x00" * n)

    L = len(name)
    mu.mem_write(0x403221, bytes([L]))

    # apopthegm decrypt (same loop as binary)
    out = bytearray()
    ecx = 1
    while True:
        dword = int.from_bytes(bytes(mu.mem_read(0x40316F + ecx - 1, 4)), "little")
        if dword == 0:
            break
        bl = mu.mem_read(0x40316F + ecx - 1, 1)[0]
        bl_s = bl - 256 if bl >= 128 else bl
        out.append((bl_s - (ecx ^ L)) & 0xFF)
        ecx += 1
    mu.mem_write(0x403289, bytes(out) + b"\x00")

    _call(mu, stack, 0x4013B1)
    _call(mu, stack, 0x4013E8)

    s = sum(name.encode())
    mu.mem_write(0x4032D2, struct.pack("<I", s))
    a, b = 2, 1
    while a <= s:
        a, b = a + b, a
    mu.mem_write(0x4032D6, struct.pack("<I", a))
    diff = (a - s) & 0xFFFFFFFF
    ecx = diff
    v = diff
    v ^= 0x44
    v = (v + 0x34) & 0xFFFFFFFF
    v = (v << 16) & 0xFFFFFFFF
    v = (v * 0x68) & 0xFFFFFFFF
    v = (v - 0x31) & 0xFFFFFFFF
    v = (v - ecx) & 0xFFFFFFFF
    mu.mem_write(0x4032DF, struct.pack("<I", v))

    _call(mu, stack, 0x401225)
    _call(mu, stack, 0x4014F9)
    _call(mu, stack, 0x40170E)
    return bytes(mu.mem_read(0x40336C, 64)).split(b"\x00")[0].decode()


def verify(name: str, serial: str, click: tuple[int, int] = DEFAULT_CLICK) -> bool:
    x, y = click
    mu, stack = _mu()
    mu.mem_write(0x40321C, struct.pack("<HH", x, y))
    mu.mem_write(0x403220, b"\x00")
    mu.mem_write(0x403256, b"\x00")
    mu.mem_write(0x40322E, name.encode() + b"\x00" * 40)
    for addr, n in (
        (0x40336C, 128),
        (0x403289, 80),
        (0x4032EB, 80),
        (0x40327F, 32),
    ):
        mu.mem_write(addr, b"\x00" * n)
    mu.mem_write(0x403402, serial.encode() + b"\x00" * 16)
    mu.mem_write(0x403498, bytes([len(serial)]))
    L = len(name)
    mu.mem_write(0x403221, bytes([L]))
    out = bytearray()
    ecx = 1
    while True:
        dword = int.from_bytes(bytes(mu.mem_read(0x40316F + ecx - 1, 4)), "little")
        if dword == 0:
            break
        bl = mu.mem_read(0x40316F + ecx - 1, 1)[0]
        bl_s = bl - 256 if bl >= 128 else bl
        out.append((bl_s - (ecx ^ L)) & 0xFF)
        ecx += 1
    mu.mem_write(0x403289, bytes(out) + b"\x00")
    _call(mu, stack, 0x4013B1)
    _call(mu, stack, 0x4013E8)
    s = sum(name.encode())
    mu.mem_write(0x4032D2, struct.pack("<I", s))
    a, b = 2, 1
    while a <= s:
        a, b = a + b, a
    mu.mem_write(0x4032D6, struct.pack("<I", a))
    diff = (a - s) & 0xFFFFFFFF
    ecx = diff
    v = diff
    v ^= 0x44
    v = (v + 0x34) & 0xFFFFFFFF
    v = (v << 16) & 0xFFFFFFFF
    v = (v * 0x68) & 0xFFFFFFFF
    v = (v - 0x31) & 0xFFFFFFFF
    v = (v - ecx) & 0xFFFFFFFF
    mu.mem_write(0x4032DF, struct.pack("<I", v))
    _call(mu, stack, 0x401225)
    _call(mu, stack, 0x4014F9)
    _call(mu, stack, 0x40170E)
    return (mu.reg_read(UC_X86_REG_EAX) & 0xFFFFFFFF) == 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--name", default=DEFAULT_NAME)
    ap.add_argument("--x", type=int, default=DEFAULT_CLICK[0])
    ap.add_argument("--y", type=int, default=DEFAULT_CLICK[1])
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    click = (a.x, a.y)
    ser = serial_for(a.name, click)
    if a.q:
        print(f"{a.name}:{ser}")
        return 0
    print("name   :", a.name)
    print("click  :", click, "(icon hotzone)")
    print("serial :", ser)
    print("apopthegm (len=1 names):", APOPTHEGM)
    if a.check:
        ok = verify(a.name, ser, click)
        print("verify :", "OK" if ok else "FAIL")
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
