#!/usr/bin/env python3
"""Keygen — ray33ee's x or and add (PE64).

Prédicat :
  h = sum(ord(c) for c in name) % 400
  k0,k1,k2 = table[3*h : 3*h+3]   # low bytes of dword table @ 0x140013040
  for i in 0..11:
      Cr4ckM35D0t1[i] == ((password[i] ^ k0) + k1) ^ k2
  ⇒ password[i] = ((Cr4ckM35D0t1[i] ^ k2) - k1) ^ k0   (sur 32-bit signed char)

Usage :
  python3 xor-and-add-solve.py              # défaut --user petik
  python3 xor-and-add-solve.py -q
  python3 xor-and-add-solve.py --user test
  python3 xor-and-add-solve.py --check 'Vg)vnP&(Y%i$' --user petik
"""

from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

TARGET = b"Cr4ckM35D0t1"
TABLE_PATH = Path(__file__).with_name("keytable.bin")


def load_table() -> list[int]:
    raw = TABLE_PATH.read_bytes()
    if len(raw) == 1200:
        return list(raw)
    # fallback: re-extract from sibling original/xor_crackme.exe
    exe = Path(__file__).resolve().parents[1] / "original" / "xor_crackme.exe"
    data = exe.read_bytes()
    # VA 0x140013040 → .rdata va=0x13000 ro=0x11200
    off = 0x11200 + (0x3040 - 0x3000)
    return [struct.unpack_from("<I", data, off + i * 4)[0] & 0xFF for i in range(1200)]


def name_hash(name: str) -> int:
    s = 0
    for c in name.encode("latin1", errors="replace"):
        s = (s + c) % 400
    return s


def key_bytes(table: list[int], h: int) -> tuple[int, int, int]:
    return table[3 * h], table[3 * h + 1], table[3 * h + 2]


def sx(b: int) -> int:
    return b - 256 if b >= 128 else b


def derive_password(name: str, table: list[int] | None = None) -> str:
    table = table or load_table()
    h = name_hash(name)
    k0, k1, k2 = key_bytes(table, h)
    out = bytearray()
    for t in TARGET:
        st = sx(t)
        found = None
        for p in range(256):
            r = ((sx(p) ^ k0) + k1) ^ k2
            if r == st:
                found = p
                break
        if found is None:
            raise RuntimeError(f"no password byte for target {t!r} (name={name!r})")
        out.append(found)
    return out.decode("latin1")


def check_password(name: str, password: str, table: list[int] | None = None) -> bool:
    table = table or load_table()
    if len(password) != 12:
        return False
    h = name_hash(name)
    k0, k1, k2 = key_bytes(table, h)
    pb = password.encode("latin1", errors="replace")
    for i, t in enumerate(TARGET):
        r = ((sx(pb[i]) ^ k0) + k1) ^ k2
        if r != sx(t):
            return False
    return True


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--user", "--name", dest="user", default="petik", help="username (default: petik)")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", metavar="PASS", help="verify password for --user")
    args = ap.parse_args()

    table = load_table()
    h = name_hash(args.user)
    k = key_bytes(table, h)

    if args.check is not None:
        ok = check_password(args.user, args.check, table)
        if args.q:
            print("OK" if ok else "FAIL")
        else:
            print(f"user={args.user!r} hash={h} key={k} check={'OK' if ok else 'FAIL'}")
        return 0 if ok else 1

    pw = derive_password(args.user, table)
    if args.q:
        print(pw)
    else:
        print(f"user={args.user!r}  hash={h}  key={k}")
        print(f"password={pw}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
