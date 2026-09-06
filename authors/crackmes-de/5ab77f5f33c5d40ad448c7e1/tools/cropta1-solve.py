#!/usr/bin/env python3
"""Solveur — cropta_1 (cropta) : Crack-Me MBR sous Bochs.

Le stage 2 (secteur CHS 3 → 0x0600) XOR-déchiffre 11 octets @0x0650
(clé 0x77), puis compare 10 caractères :

  expected[i] == (password[i] + 3) ^ 0x4A

avec expected = `?"9%&,.;=<` → password **`replicants`**.

Usage:
  python3 tools/cropta1-solve.py -q
  python3 tools/cropta1-solve.py --check
"""
from __future__ import annotations

import argparse
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
IMG = ROOT / "original" / "_u" / "bochs.img"
PASSWORD = "replicants"
XOR_KEY = 0x77
ENC_OFF = 0x450  # file offset = sector2@0x400 + 0x50
EXPECT_OFF = 0x421
EXPECT_LEN = 10
STAGE2_FILE = 0x400


def load_img(path: Path = IMG) -> bytes:
    data = path.read_bytes()
    if len(data) < 0x600:
        raise SystemExit(f"image trop courte: {path}")
    return data


def expected_cipher(data: bytes) -> bytes:
    return data[EXPECT_OFF : EXPECT_OFF + EXPECT_LEN]


def decrypt_checker(data: bytes) -> bytes:
    enc = bytearray(data[ENC_OFF : ENC_OFF + 11])
    return bytes(b ^ XOR_KEY for b in enc)


def derive_password(cipher: bytes) -> str:
    return "".join(chr(((c ^ 0x4A) - 3) & 0xFF) for c in cipher)


def check_password(pw: str, cipher: bytes) -> bool:
    if len(pw) != len(cipher):
        return False
    for i, ch in enumerate(pw.encode("latin1")):
        if ((ch + 3) ^ 0x4A) & 0xFF != cipher[i]:
            return False
    return True


def emu_check(pw: str, data: bytes) -> bool:
    """Unicorn 16-bit : déchiffre @0x650, injecte le password, exécute le cmp."""
    try:
        from unicorn import Uc, UC_ARCH_X86, UC_MODE_16, UC_HOOK_CODE, UC_HOOK_INTR
        from unicorn.x86_const import (
            UC_X86_REG_BX,
            UC_X86_REG_CS,
            UC_X86_REG_DI,
            UC_X86_REG_DS,
            UC_X86_REG_ES,
            UC_X86_REG_IP,
            UC_X86_REG_SI,
            UC_X86_REG_SP,
            UC_X86_REG_SS,
        )
    except ImportError:
        return check_password(pw, expected_cipher(data))

    mem = bytearray(0x10000)
    stage = bytearray(data[STAGE2_FILE : STAGE2_FILE + 0x200])
    for i in range(11):
        stage[0x50 + i] ^= XOR_KEY
    mem[0x600 : 0x800] = stage
    buf = pw.encode("latin1")[:16].ljust(16, b"\x00")
    mem[0x700 : 0x710] = buf

    mu = Uc(UC_ARCH_X86, UC_MODE_16)
    mu.mem_map(0, 0x10000)
    mu.mem_write(0, bytes(mem))
    mu.reg_write(UC_X86_REG_CS, 0)
    mu.reg_write(UC_X86_REG_DS, 0)
    mu.reg_write(UC_X86_REG_ES, 0)
    mu.reg_write(UC_X86_REG_SS, 0)
    mu.reg_write(UC_X86_REG_SP, 0x7C00)
    mu.reg_write(UC_X86_REG_SI, 0x621)
    mu.reg_write(UC_X86_REG_BX, 0x700)
    mu.reg_write(UC_X86_REG_DI, 0)
    mu.reg_write(UC_X86_REG_IP, 0x650)

    hit_success = {"ok": False}

    def on_code(uc, address, size, _user):
        if address == 0x6CA:
            hit_success["ok"] = True
            uc.emu_stop()
        elif address == 0x62E:
            uc.emu_stop()

    def on_intr(uc, intno, _user):
        # BIOS stubs : ignore teletype / disk
        if intno in (0x10, 0x13, 0x16):
            return
        uc.emu_stop()

    mu.hook_add(UC_HOOK_CODE, on_code)
    mu.hook_add(UC_HOOK_INTR, on_intr)
    try:
        mu.emu_start(0x650, 0x700, timeout=2_000_000, count=5000)
    except Exception:
        pass
    return hit_success["ok"]


def main() -> int:
    ap = argparse.ArgumentParser(description="cropta_1 MBR password solver")
    ap.add_argument("-q", action="store_true", help="password seul")
    ap.add_argument("--check", action="store_true", help="vérifie image + ému")
    ap.add_argument("--img", type=Path, default=IMG)
    args = ap.parse_args()

    if args.q:
        print(PASSWORD)
        return 0

    data = load_img(args.img)
    cipher = expected_cipher(data)
    derived = derive_password(cipher)

    if args.check:
        blob_ok = data[ENC_OFF] == 0xDB
        dec = decrypt_checker(data)
        # decrypted checker starts with lodsb (0xAC)
        dec_ok = dec[0] == 0xAC and b"Crack-Me MBR" in data[STAGE2_FILE:]
        pred_ok = check_password(PASSWORD, cipher) and derived == PASSWORD
        bad_ok = not check_password("wrongpass!", cipher)
        emu_ok = emu_check(PASSWORD, data)
        emu_bad = not emu_check("abcdefghij", data)
        ok = blob_ok and dec_ok and pred_ok and bad_ok and emu_ok and emu_bad
        print(f"cipher   : {cipher!r}")
        print(f"derived  : {derived}")
        print(f"password : {PASSWORD}")
        print(f"blob@450 : 0x{data[ENC_OFF]:02x} (want 0xdb) → {'OK' if blob_ok else 'FAIL'}")
        print(f"dec[0]   : 0x{dec[0]:02x} (want 0xac) → {'OK' if dec_ok else 'FAIL'}")
        print(f"pred     : {'OK' if pred_ok else 'FAIL'}")
        print(f"neg      : {'OK' if bad_ok else 'FAIL'}")
        print(f"emu ok   : {'OK' if emu_ok else 'FAIL'}")
        print(f"emu bad  : {'OK' if emu_bad else 'FAIL'}")
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    print("password :", PASSWORD)
    print("cipher   :", cipher.decode("latin1"))
    print("formula  : expected[i] == (pw[i] + 3) ^ 0x4A")
    print(f"image    : {args.img}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
