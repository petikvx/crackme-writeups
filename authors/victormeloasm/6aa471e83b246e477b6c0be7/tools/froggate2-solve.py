#!/usr/bin/env python3
"""Froggate II — solveur WIP (pas encore de serial).

Prédicat (prouvé GDB) :
  transform(serial[128]) == mask_live[128]
  → hex(serial) est l'argument 256 chars du binaire.

Ce script :
  - charge / dump le mask live
  - rejoue stage1 (Python ≡ binaire)
  - option --oracle : appelle transform via gdb (forward only)
  - -q : refuse tant que le serial n'est pas connu

TODO keygen : inv_transform(mask) — stage1 inversible ; ~400 mixers MBA
              après stage1 (diffusion totale 1 octet → 128).

Usage :
  python3 tools/froggate2-solve.py
  python3 tools/froggate2-solve.py --mask
  python3 tools/froggate2-solve.py --stage1 0000...   # 256 hex
  python3 tools/froggate2-solve.py --oracle 0000...
  python3 tools/froggate2-solve.py --check <256hex>   # gdb : T(s)==mask ?
"""
from __future__ import annotations

import argparse
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "croackpocalypse"
MASK_PATH = ROOT / "analysis" / "verify_mask_live.bin"
BASE = 0x555555554000
TRANSFORM = 0x5555557029CE
AFTER_T = 0x555555639EA4  # ret to main after transform


def rol64(x: int, n: int) -> int:
    n &= 63
    x &= (1 << 64) - 1
    return ((x << n) | (x >> (64 - n))) & ((1 << 64) - 1)


def ror64(x: int, n: int) -> int:
    n &= 63
    x &= (1 << 64) - 1
    return ((x >> n) | (x << (64 - n))) & ((1 << 64) - 1)


def stage1(buf: bytes) -> bytes:
    """First ARX pass of transform (verified vs gdb on zeros)."""
    assert len(buf) == 128
    w = list(struct.unpack("<" + "Q" * 16, buf))
    rax = 0xC6E7AFC9646F7587
    rcx = w[0] ^ rax
    r9 = 0xA257330C17F6100E
    rcx = rol64(rcx + r9, 0x32)
    w[0] = rcx
    rcx = 0xDE64312DFA4298DE
    rdx = rol64((w[1] ^ rcx) + 0x664B199D40740F2C, 0x38)
    w[1] = rdx
    rdx = 0xF13E2DC7F0709D30
    rsi = rol64((w[2] ^ rdx) + 0x3E723E388C3203E5, 0x3D)
    w[2] = rsi
    rsi = 0x4F12709C25884516
    r8 = rol64((w[3] ^ rsi) + 0xB5A0761F1AE6948D, 0x14)
    w[3] = r8
    r8 = 0x21E1E27B226C4FA7
    r12 = rol64((w[4] ^ r8) + 0xFC34F0A3BEC1DEAF, 0x9)
    w[4] = r12
    r9 = rol64((0xA257330C17F6100E ^ w[5]) + 0x9064A4B5DA3EEBE3, 0x29)
    w[5] = r9
    r10 = rol64((0x664B199D40740F2C ^ w[6]) + 0xDE91CE39A978C776, 0x1A)
    w[6] = r10
    r11 = rol64((0x3E723E388C3203E5 ^ w[7]) + 0xCD77A0D4FD4C63CE, 0x10)
    w[7] = r11
    r14 = rol64((0xB5A0761F1AE6948D ^ w[8]) + 0xC86A36A834BE8E78, 0x2E)
    w[8] = r14
    r15 = rol64((0xFC34F0A3BEC1DEAF ^ w[9]) + 0x22BD2B54E3BE1821, 1)
    w[9] = r15
    r12 = rol64((0x9064A4B5DA3EEBE3 ^ w[10]) + 0xD3F74A263F77BB0C, 0x25)
    w[10] = r12
    r9 = rol64((0xDE91CE39A978C776 ^ w[11]) + rax, 0x38)
    w[11] = r9
    r10 = rol64((0xCD77A0D4FD4C63CE ^ w[12]) + 0xDE64312DFA4298DE, 0x34)
    w[12] = r10
    r11 = rol64((0xC86A36A834BE8E78 ^ w[13]) + 0xF13E2DC7F0709D30, 0x33)
    w[13] = r11
    r14 = rol64((0x22BD2B54E3BE1821 ^ w[14]) + 0x4F12709C25884516, 0x9)
    w[14] = r14
    r15 = rol64((0xD3F74A263F77BB0C ^ w[15]) + 0x21E1E27B226C4FA7, 0x35)
    w[15] = r15
    return struct.pack("<" + "Q" * 16, *w)


def stage1_inv(buf: bytes) -> bytes:
    """Inverse of stage1 (for when mixer chain is inverted too)."""
    assert len(buf) == 128
    w = list(struct.unpack("<" + "Q" * 16, buf))
    rax = 0xC6E7AFC9646F7587
    # reverse q15..q0
    r8c = 0x21E1E27B226C4FA7
    w[15] = (ror64(w[15], 0x35) - r8c) ^ 0xD3F74A263F77BB0C
    w[15] &= (1 << 64) - 1
    sic = 0x4F12709C25884516
    w[14] = (ror64(w[14], 0x9) - sic) ^ 0x22BD2B54E3BE1821
    w[14] &= (1 << 64) - 1
    dxc = 0xF13E2DC7F0709D30
    w[13] = (ror64(w[13], 0x33) - dxc) ^ 0xC86A36A834BE8E78
    w[13] &= (1 << 64) - 1
    cxc = 0xDE64312DFA4298DE
    w[12] = (ror64(w[12], 0x34) - cxc) ^ 0xCD77A0D4FD4C63CE
    w[12] &= (1 << 64) - 1
    w[11] = (ror64(w[11], 0x38) - rax) ^ 0xDE91CE39A978C776
    w[11] &= (1 << 64) - 1
    w[10] = (ror64(w[10], 0x25) - 0xD3F74A263F77BB0C) ^ 0x9064A4B5DA3EEBE3
    w[10] &= (1 << 64) - 1
    w[9] = (ror64(w[9], 1) - 0x22BD2B54E3BE1821) ^ 0xFC34F0A3BEC1DEAF
    w[9] &= (1 << 64) - 1
    w[8] = (ror64(w[8], 0x2E) - 0xC86A36A834BE8E78) ^ 0xB5A0761F1AE6948D
    w[8] &= (1 << 64) - 1
    w[7] = (ror64(w[7], 0x10) - 0xCD77A0D4FD4C63CE) ^ 0x3E723E388C3203E5
    w[7] &= (1 << 64) - 1
    w[6] = (ror64(w[6], 0x1A) - 0xDE91CE39A978C776) ^ 0x664B199D40740F2C
    w[6] &= (1 << 64) - 1
    w[5] = (ror64(w[5], 0x29) - 0x9064A4B5DA3EEBE3) ^ 0xA257330C17F6100E
    w[5] &= (1 << 64) - 1
    w[4] = (ror64(w[4], 0x9) - 0xFC34F0A3BEC1DEAF) ^ 0x21E1E27B226C4FA7
    w[4] &= (1 << 64) - 1
    w[3] = (ror64(w[3], 0x14) - 0xB5A0761F1AE6948D) ^ 0x4F12709C25884516
    w[3] &= (1 << 64) - 1
    w[2] = (ror64(w[2], 0x3D) - 0x3E723E388C3203E5) ^ 0xF13E2DC7F0709D30
    w[2] &= (1 << 64) - 1
    w[1] = (ror64(w[1], 0x38) - 0x664B199D40740F2C) ^ 0xDE64312DFA4298DE
    w[1] &= (1 << 64) - 1
    w[0] = (ror64(w[0], 0x32) - 0xA257330C17F6100E) ^ rax
    w[0] &= (1 << 64) - 1
    return struct.pack("<" + "Q" * 16, *w)


def load_mask() -> bytes:
    if MASK_PATH.is_file():
        m = MASK_PATH.read_bytes()
        if len(m) == 128:
            return m
    raise SystemExit(f"missing mask {MASK_PATH} — run once under gdb (see NOTES)")


def gdb_transform(serial: bytes) -> bytes:
    """Forward transform via gdb (ASLR off)."""
    assert len(serial) == 128
    if not EXE.is_file():
        raise SystemExit(f"missing {EXE}")
    hx = serial.hex()
    script = f"""
set disable-randomization on
set pagination off
file {EXE}
break *{AFTER_T:#x}
run {hx}
dump binary memory /tmp/froggate2_tout.bin $r15 $r15+0x80
quit
"""
    Path("/tmp/froggate2.gdb").write_text(script)
    subprocess.run(
        ["gdb", "-q", "-batch", "-x", "/tmp/froggate2.gdb"],
        capture_output=True,
        timeout=120,
        cwd=str(ROOT),
    )
    out = Path("/tmp/froggate2_tout.bin").read_bytes()
    if len(out) != 128:
        raise SystemExit("gdb transform dump failed")
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="serial (indisponible tant que WIP)")
    ap.add_argument("--mask", action="store_true", help="imprimer mask live (hex)")
    ap.add_argument("--stage1", metavar="HEX256", help="applique stage1 Python")
    ap.add_argument("--stage1-inv", metavar="HEX256", help="inverse stage1")
    ap.add_argument("--oracle", metavar="HEX256", help="transform complet via gdb")
    ap.add_argument("--check", metavar="HEX256", help="T(serial)==mask ? (gdb)")
    args = ap.parse_args()

    mask = load_mask()

    if args.mask or (not any([args.q, args.stage1, args.stage1_inv, args.oracle, args.check])):
        print(f"mask ({MASK_PATH.name}):")
        print(mask.hex())
        if not any([args.q, args.stage1, args.stage1_inv, args.oracle, args.check]):
            print()
            print("status : WIP — pas de serial ; prédicat transform(s)==mask")
            print("next   : inverser mixers post-stage1 (voir analysis/NOTES.md)")
            print(f"run    : ./original/croackpocalypse <256-hex>")
            return 0

    if args.q:
        print("serial inconnu (keygen incomplet)", file=sys.stderr)
        return 2

    def parse256(h: str) -> bytes:
        h = h.strip().replace(" ", "")
        if len(h) != 256:
            raise SystemExit("need 256 hex chars (128 bytes)")
        return bytes.fromhex(h)

    if args.stage1:
        print(stage1(parse256(args.stage1)).hex())
        return 0
    if args.stage1_inv:
        s = parse256(args.stage1_inv)
        inv = stage1_inv(s)
        assert stage1(inv) == s
        print(inv.hex())
        return 0
    if args.oracle:
        print(gdb_transform(parse256(args.oracle)).hex())
        return 0
    if args.check:
        out = gdb_transform(parse256(args.check))
        ok = out == mask
        print("OK" if ok else "NO")
        if not ok:
            print("T(s) ", out.hex())
            print("mask ", mask.hex())
        return 0 if ok else 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
