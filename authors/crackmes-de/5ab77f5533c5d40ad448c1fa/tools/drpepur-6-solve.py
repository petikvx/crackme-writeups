#!/usr/bin/env python3
"""Keygen DrPepUr #6 (crackmes.one 5ab77f5533c5d40ad448c1fa).

Serial-only (pas de nom) : 10 caractères.
X = s[0]-0x40, A = s[1]-0x40 ; pour k=1..8 :
  expect = round(sin(A*(k*X+1)) * mul) + add
avec (mul,add,base) alternant (2,+4,digit '1') et (10,+12,lettre 'A').

Vérifié par émulation Unicorn de 0x4012c2 (edi → scratch 0x4035ec).
"""
from __future__ import annotations
import argparse, math, struct, sys
from pathlib import Path

SPECS = [
    (0x31, 1, 2.0, 4, False),
    (0x41, 2, 10.0, 12, True),
    (0x41, 3, 10.0, 12, True),
    (0x31, 4, 2.0, 4, False),
    (0x41, 5, 10.0, 12, True),
    (0x41, 6, 10.0, 12, True),
    (0x31, 7, 2.0, 4, False),
    (0x41, 8, 10.0, 12, True),
]


def fistp(x: float) -> int:
    return int(round(x))


def keygen(X: int = 1, A: int = 1) -> str:
    out = [X + 0x40, A + 0x40]
    for base, k, mul, add, letter in SPECS:
        arg = float(A * (k * X + 1))
        v = fistp(math.sin(arg) * mul) + add
        if letter and not (0 <= v <= 25):
            raise ValueError(f"letter out of range k={k} v={v}")
        if not letter and not (0 <= v <= 9):
            raise ValueError(f"digit out of range k={k} v={v}")
        out.append(v + base)
    return bytes(out).decode("latin1")


def check_static(serial: str) -> bool:
    s = serial.encode("latin1")
    if len(s) < 10:
        return False
    X, A = s[0] - 0x40, s[1] - 0x40
    for i, (base, k, mul, add, _) in enumerate(SPECS):
        expect = s[2 + i] - base
        got = fistp(math.sin(float(A * (k * X + 1))) * mul) + add
        if got != expect:
            return False
    return True


def check_unicorn(serial: str, exe: Path) -> bool:
    from unicorn import Uc, UcError, UC_ARCH_X86, UC_MODE_32, UC_HOOK_CODE
    from unicorn.x86_const import (
        UC_X86_REG_ESP, UC_X86_REG_EDI, UC_X86_REG_EIP, UC_X86_REG_EAX,
    )
    data = exe.read_bytes()
    mu = Uc(UC_ARCH_X86, UC_MODE_32)
    mu.mem_map(0x400000, 0x100000)
    mu.mem_map(0x700000, 0x10000)
    mu.mem_write(0x401000, data[0x400 : 0x400 + 0xC0C])
    mu.mem_write(0x402000, data[0x1200 : 0x1200 + 0x3BE])
    mu.mem_write(0x403000, data[0x1600 : 0x1600 + 0x600])
    sb = serial.encode("latin1")
    mu.mem_write(0x403588, sb + b"\0" * (0x64 - len(sb)))
    stack = 0x70F000
    mu.mem_write(stack, struct.pack("<II", 0xDEAD0000, len(sb)))
    mu.reg_write(UC_X86_REG_ESP, stack)
    mu.reg_write(UC_X86_REG_EDI, 0x4035EC)
    ok = [False]

    def hook(uc, addr, size, _):
        if addr != 0x4017DC:
            return
        esp = uc.reg_read(UC_X86_REG_ESP)
        cap = struct.unpack("<I", uc.mem_read(esp + 12, 4))[0]
        c = uc.mem_read(cap, 16).split(b"\0")[0]
        if c == b"Success":
            ok[0] = True
        ret = struct.unpack("<I", uc.mem_read(esp, 4))[0]
        uc.reg_write(UC_X86_REG_ESP, esp + 20)
        uc.reg_write(UC_X86_REG_EAX, 1)
        uc.reg_write(UC_X86_REG_EIP, ret)

    mu.hook_add(UC_HOOK_CODE, hook, begin=0x4017DC, end=0x4017DD)
    try:
        mu.emu_start(0x4012C2, 0xDEAD0000, timeout=2_000_000, count=500_000)
    except UcError:
        pass
    return ok[0]


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-X", type=int, default=1, help="s[0]-0x40 (défaut 1 → 'A')")
    ap.add_argument("-A", type=int, default=1, help="s[1]-0x40 (défaut 1 → 'A')")
    ap.add_argument("--check", action="store_true", help="Unicorn sur original/DrPepUr_6.exe")
    ap.add_argument("serial", nargs="?", help="si fourni : vérifier seulement")
    args = ap.parse_args()
    if args.serial:
        s = args.serial
    else:
        s = keygen(args.X, args.A)
        print(s)
    print("static", check_static(s))
    if args.check:
        exe = Path(__file__).resolve().parents[1] / "original" / "DrPepUr_6.exe"
        print("unicorn", check_unicorn(s, exe))
    return 0


if __name__ == "__main__":
    sys.exit(main())
