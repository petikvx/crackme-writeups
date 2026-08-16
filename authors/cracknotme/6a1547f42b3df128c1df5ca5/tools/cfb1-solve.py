#!/usr/bin/env python3
"""Keygen CFB1 (CrackNotMe — CrackmesForBeginners #1).

Pour chaque caractère username[i] (i = 0, 1, …) :
  b = ((i + 0x5A) XOR ord(username[i])) + 0x13
  serial += f\"{b & 0xFF:02X}\"   # hex majuscule, 2 chiffres

Contrainte UI : len(username) >= 4

Usage :
  python3 cfb1-solve.py petik
  python3 cfb1-solve.py --check petik 3D513B4748
  python3 cfb1-solve.py -q petik          # serial seul
"""

from __future__ import annotations

import sys


MIN_LEN = 4


def serial_for(username: str) -> str:
    raw = username.encode("latin-1", errors="replace")
    if len(raw) < MIN_LEN:
        raise ValueError(f"username trop court (min {MIN_LEN} caractères)")
    out = []
    for i, c in enumerate(raw):
        b = (((i + 0x5A) & 0xFF) ^ c) + 0x13
        out.append(f"{b & 0xFF:02X}")
    return "".join(out)


def check(username: str, serial: str) -> bool:
    try:
        return serial_for(username).upper() == serial.strip().upper()
    except ValueError:
        return False


def main() -> int:
    args = sys.argv[1:]
    if not args or args[0] in ("-h", "--help"):
        print(__doc__)
        return 0 if args else 1

    if args[0] == "--check":
        if len(args) < 3:
            print("usage: --check USERNAME SERIAL", file=sys.stderr)
            return 2
        user, ser = args[1], args[2]
        ok = check(user, ser)
        exp = serial_for(user) if len(user.encode("latin-1", errors="replace")) >= MIN_LEN else "?"
        print("OK" if ok else "FAIL", f"(expected {exp})")
        return 0 if ok else 1

    quiet = False
    if args[0] == "-q":
        quiet = True
        args = args[1:]
    if not args:
        print("usage: cfb1-solve.py [-q] USERNAME", file=sys.stderr)
        return 1

    user = args[0]
    try:
        ser = serial_for(user)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if quiet:
        print(ser)
        return 0

    print("=== cfb1-solve.py (CFB #1) ===")
    print(f"Username : {user}")
    print(f"Serial   : {ser}")
    print()
    print("trace :")
    for i, c in enumerate(user.encode("latin-1", errors="replace")):
        b = (((i + 0x5A) & 0xFF) ^ c) + 0x13
        print(
            f"  [{i}] {chr(c)!r}  "
            f"(i+0x5A)=0x{(i + 0x5A) & 0xFF:02X}  "
            f"xor=0x{((i + 0x5A) & 0xFF) ^ c:02X}  "
            f"+0x13 → 0x{b & 0xFF:02X}"
        )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
