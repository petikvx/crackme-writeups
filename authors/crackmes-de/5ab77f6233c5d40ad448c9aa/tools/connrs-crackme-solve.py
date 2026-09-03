#!/usr/bin/env python3
"""connrs_crackme (connr) — code d'enregistrement DOS (MZ + UPX).

Après unpack UPX, le programme lit 4 caractères (echo `*`), attend Enter,
puis compare via la pile (LIFO) à `3`,`1`,`8`,`2` → saisie **`2813`**.

Usage:
  python3 tools/connrs-crackme-solve.py -q
  python3 tools/connrs-crackme-solve.py --check
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PACKED = ROOT / "original" / "_u" / "Crackme.exe"
UNPACKED = ROOT / "analysis" / "Crackme.unpacked.exe"

# Ordre de saisie (push) ; les cmp popent en reverse : 3, 1, 8, 2
CODE = "2813"
EXPECT_POP = b"3182"


def check_unpacked_predicate(path: Path = UNPACKED) -> bool:
    """Vérifie statiquement les 4 `cmp al, imm8` du binaire unpacké."""
    data = path.read_bytes()
    header = struct.unpack_from("<H", data, 8)[0] * 16
    code = data[header:]
    # cmp al, imm8 = 3C xx — ordre après les 4 pop
    needles = [bytes([0x3C, c]) for c in EXPECT_POP]
    # dans le listing : 3C 33, 3C 31, 3C 38, 3C 32
    pos = 0
    for n in needles:
        i = code.find(n, pos)
        if i < 0:
            return False
        pos = i + 2
    return True


def emu_check(code: str, unpacked: Path = UNPACKED) -> str | None:
    """Unicorn 16-bit + int 21h minimal → message Good/Sorry."""
    try:
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_INTR
        from unicorn.x86_const import (
            UC_X86_REG_AX,
            UC_X86_REG_CS,
            UC_X86_REG_DS,
            UC_X86_REG_DX,
            UC_X86_REG_IP,
            UC_X86_REG_SP,
            UC_X86_REG_SS,
        )
    except ImportError:
        return None

    data = unpacked.read_bytes()
    header = struct.unpack_from("<H", data, 8)[0] * 16
    img = data[header:]
    mu = Uc(UC_ARCH_X86, UC_MODE_16)
    mu.mem_map(0, 0x20000)
    mu.mem_write(0, img + b"\x00" * (0x10000 - len(img)))
    inputs = iter(list(code.encode("latin1") + b"\r\r"))
    outs: list[str] = []

    def hook_intr(uc, intno, _data):
        if intno != 0x21:
            uc.emu_stop()
            return
        ax = uc.reg_read(UC_X86_REG_AX)
        ah = (ax >> 8) & 0xFF
        if ah == 9:
            ds = uc.reg_read(UC_X86_REG_DS)
            dx = uc.reg_read(UC_X86_REG_DX)
            addr = ds * 16 + dx
            buf = bytearray()
            while True:
                c = uc.mem_read(addr, 1)[0]
                if c == ord("$"):
                    break
                buf.append(c)
                addr += 1
            outs.append(buf.decode("latin1"))
        elif ah == 8:
            ch = next(inputs)
            uc.reg_write(UC_X86_REG_AX, (ah << 8) | ch)
        elif ah in (2, 0x4C):
            if ah == 0x4C:
                uc.emu_stop()
        else:
            uc.emu_stop()

    mu.hook_add(UC_HOOK_INTR, hook_intr)
    mu.reg_write(UC_X86_REG_CS, 0)
    mu.reg_write(UC_X86_REG_IP, 0)
    mu.reg_write(UC_X86_REG_SS, 0)
    mu.reg_write(UC_X86_REG_SP, 0xFF00)
    mu.emu_start(0, 0x6D, timeout=5_000_000)
    for m in outs:
        if "Good job" in m:
            return "good"
        if "Sorry" in m:
            return "sorry"
    return "unknown"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="code seul")
    ap.add_argument("--check", action="store_true", help="prédicat + Unicorn si dispo")
    args = ap.parse_args()

    if args.q:
        print(CODE)
        return 0

    print(f"registration code: {CODE}")
    if args.check:
        if not UNPACKED.is_file():
            print(f"missing {UNPACKED} — upx -d analysis/…", file=sys.stderr)
            return 1
        ok = check_unpacked_predicate()
        print(f"static cmp sequence 3C 33/31/38/32: {'OK' if ok else 'FAIL'}")
        emu = emu_check(CODE)
        if emu is None:
            print("unicorn: not installed (skip live emu)")
        else:
            print(f"unicorn({CODE!r}): {emu}")
            wrong = emu_check("0000")
            print(f"unicorn('0000'): {wrong}")
            if emu != "good" or wrong != "sorry" or not ok:
                return 1
        print(f"packed: {PACKED} ({'ok' if PACKED.is_file() else 'missing'})")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
