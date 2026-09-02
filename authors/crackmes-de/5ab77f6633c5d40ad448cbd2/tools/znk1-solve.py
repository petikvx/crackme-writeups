#!/usr/bin/env python3
"""Keygen — znycuks_1_crackme / ZNKKeygenme#1 (znycuk, MASM32).

Challenge GUI : 4 caractères aléatoires (seed, RDTSC) affichés dans un Edit.
Serial : AAAA-BBBB-CCCC-DDDD (19 chars), chaque bloc dérivé de seed[i] + HWID.

HWID (ordre réel du binaire) :
  cl=0 ← GetUserNameA   → buffer 0x4032E8 (4 premiers octets en dword LE)
  cl=1 ← GetComputerNameA → buffer 0x4033E9

Table 8 dwords (chaîne xor / neg / shl3 / ror1, avec dl clobberé à 1
après chaque store — effet de bord de 401561).

Usage :
  python3 znk1-solve.py --seed Ab12
  python3 znk1-solve.py --user petik --computer PTK-LAB --seed Ab12 -q
  python3 znk1-solve.py --seed Ab12 --check 98BE-5573-73B5-4385
"""

from __future__ import annotations

import argparse
import struct
import sys


PAD = b"ZNY\x00Key"


def pad_name(name: str) -> bytes:
    """Comme GetUserNameA / GetComputerNameA + pad si len < 4 (rep movsb depuis 4030AA)."""
    raw = name.encode("ascii", "replace")
    buf = bytearray(raw + b"\0" * 16)
    if len(raw) < 4:
        n = 4 - len(raw)
        buf[len(raw) : len(raw) + n] = PAD[:n]
    return bytes(buf[:4])


def dword_from_name(name: str) -> int:
    return struct.unpack("<I", pad_name(name))[0]


def build_table(user: str, computer: str) -> list[int]:
    """cl=0 user, cl=1 computer — transforms chaînées + (edx & ~0xff)|1."""
    table = [0] * 8
    for cl, val0 in ((0, dword_from_name(user)), (1, dword_from_name(computer))):
        edx = val0
        for si in range(4):
            if si == 0:
                edx ^= 0xABDEADAB
            elif si == 1:
                edx = (-edx) & 0xFFFFFFFF
            elif si == 2:
                edx = (edx << 3) & 0xFFFFFFFF
            else:
                edx = ((edx >> 1) | ((edx & 1) << 31)) & 0xFFFFFFFF
            table[2 * si + cl] = edx
            edx = (edx & 0xFFFFFF00) | 1
    return table


def high_xform(ch: int) -> int:
    bl = (ch & 0xF0) >> 4
    if bl != 3:
        bl = (bl - 4) & 0xFF
    return bl


def low_xform(ch: int) -> int:
    return 0 if (ch & 0x0F) <= 7 else 1


def to_ascii_nibbles(ax: int) -> str:
    """4 nibbles low-first → ASCII hex majuscule (comme 40165b)."""
    bx = ax & 0xFFFF
    chars: list[str] = []
    for _ in range(4):
        al = bx & 0x0F
        if al > 9:
            al += 7
        al += 0x30
        chars.append(chr(al))
        bx >>= 4
    return "".join(chars)


def group_for_char(table: list[int], ch: int) -> str:
    idx = 2 * low_xform(ch) + high_xform(ch)
    val = table[idx]
    eax = ((val >> 8) | ((val & 0xFF) << 24)) & 0xFFFFFFFF  # ror 8
    al = (eax ^ ch) & 0xFF
    ah = (((eax >> 8) & 0xFF) ^ ch) & 0xFF
    return to_ascii_nibbles(al | (ah << 8))


def keygen(user: str, computer: str, seed: str) -> str:
    if len(seed) != 4:
        raise ValueError("seed must be exactly 4 characters")
    table = build_table(user, computer)
    return "-".join(group_for_char(table, ord(c)) for c in seed)


def main() -> int:
    ap = argparse.ArgumentParser(description="Keygen ZNKKeygenme#1 (znycuk)")
    ap.add_argument("--user", default="petik", help="GetUserNameA (défaut: petik)")
    ap.add_argument(
        "--computer",
        default="PTK-LAB",
        help="GetComputerNameA (défaut: PTK-LAB / Wine lab)",
    )
    ap.add_argument("--seed", required=True, help="4 chars affichés par le crackme")
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument("--check", metavar="SERIAL", help="vérifie un serial")
    args = ap.parse_args()

    try:
        serial = keygen(args.user, args.computer, args.seed)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if args.check is not None:
        ok = args.check.strip().upper() == serial.upper()
        if args.q:
            print("OK" if ok else "FAIL")
        else:
            print(f"user={args.user!r} computer={args.computer!r} seed={args.seed!r}")
            print(f"expected={serial}")
            print(f"got     ={args.check.strip()}")
            print(f"check: {'OK' if ok else 'FAIL'}")
        return 0 if ok else 2

    if args.q:
        print(serial)
    else:
        print(f"user={args.user!r} computer={args.computer!r} seed={args.seed!r}")
        print(f"serial={serial}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
