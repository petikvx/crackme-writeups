#!/usr/bin/env python3
"""Solveur CFB4 (CrackNotMe — custom rotors / activation password).

Le binaire applique une chaîne de rotors 8-bit sur chaque caractère du password
(13 octets exacts). État partagé entre positions :

  sum_state  (init 5)   — accumule les sorties chiffrées
  xor_state  (init 0x0d)— XOR des sorties chiffrées

Par caractère i (0..12) :

  t  = (sum_state + pwd[i]) & 0xff
  t ^= 0x3a
  t  = (t + 0x13) & 0xff
  t ^= 0x7f
  t  = (t - xor_state) & 0xff
  t ^= 0x5c
  t  = (t + rotor_add[i]) & 0xff   # 0x15 + i*(i-1)/2
  t ^= 0xa5
  # t doit valoir EXPECTED[i]
  sum_state = (sum_state + t) & 0xff
  xor_state ^= t

Message console : « Encrypting input through custom rotors… »
→ ce n’est *pas* un Enigma classique, juste cette chaîne ADD/XOR chaînée.

Inversion caractère par caractère → password fixe : rotors_spin_9

Usage :
  python3 cfb4-solve.py
  python3 cfb4-solve.py -q
  python3 cfb4-solve.py --check rotors_spin_9
  python3 cfb4-solve.py --trace
"""

from __future__ import annotations

import argparse
import sys

PASSWORD = "rotors_spin_9"

# Cibles 8-bit après la chaîne de rotors (extraites du main ~0x140006143..)
EXPECTED = bytes(
    [
        0xC6,
        0xB7,
        0x2B,
        0x6E,
        0x9E,
        0xB7,
        0xFA,
        0x54,
        0x52,
        0x3F,
        0x35,
        0x98,
        0xDF,
    ]
)

SUM_INIT = 5
XOR_INIT = 0x0D

# Constantes fixes de chaque « rotor » (ordre d’application)
K_XOR1 = 0x3A
K_ADD1 = 0x13
K_XOR2 = 0x7F
K_XOR3 = 0x5C
K_XOR4 = 0xA5


def rotor_add(i: int) -> int:
    """Offset variable par position : 0x15 + i*(i-1)/2 (mod 256)."""
    return (0x15 + i * (i - 1) // 2) & 0xFF


def encrypt_char(pwd_byte: int, sum_state: int, xor_state: int, i: int) -> int:
    t = (sum_state + pwd_byte) & 0xFF
    t ^= K_XOR1
    t = (t + K_ADD1) & 0xFF
    t ^= K_XOR2
    t = (t - xor_state) & 0xFF
    t ^= K_XOR3
    t = (t + rotor_add(i)) & 0xFF
    t ^= K_XOR4
    return t


def decrypt_char(e: int, sum_state: int, xor_state: int, i: int) -> int:
    t = e ^ K_XOR4
    t = (t - rotor_add(i)) & 0xFF
    t ^= K_XOR3
    t = (t + xor_state) & 0xFF
    t ^= K_XOR2
    t = (t - K_ADD1) & 0xFF
    t ^= K_XOR1
    return (t - sum_state) & 0xFF


def recover_password() -> str:
    sum_state = SUM_INIT
    xor_state = XOR_INIT
    out: list[int] = []
    for i, e in enumerate(EXPECTED):
        b = decrypt_char(e, sum_state, xor_state, i)
        if encrypt_char(b, sum_state, xor_state, i) != e:
            raise RuntimeError(f"inversion failed at index {i}")
        out.append(b)
        sum_state = (sum_state + e) & 0xFF
        xor_state ^= e
    return bytes(out).decode("ascii")


def check_password(pwd: str) -> bool:
    if len(pwd) != 13:
        return False
    sum_state = SUM_INIT
    xor_state = XOR_INIT
    for i, ch in enumerate(pwd.encode("latin1")):
        e = encrypt_char(ch, sum_state, xor_state, i)
        if e != EXPECTED[i]:
            return False
        sum_state = (sum_state + e) & 0xFF
        xor_state ^= e
    return True


def trace_password(pwd: str) -> None:
    data = pwd.encode("latin1")
    sum_state = SUM_INIT
    xor_state = XOR_INIT
    print(f"{'i':>2}  pwd  sum  xor  rotor  out  expect  ok")
    for i, ch in enumerate(data):
        e = encrypt_char(ch, sum_state, xor_state, i)
        exp = EXPECTED[i] if i < len(EXPECTED) else None
        ok = e == exp if exp is not None else False
        print(
            f"{i:2d}  {ch:02x}   {sum_state:02x}   {xor_state:02x}   "
            f"{rotor_add(i):02x}     {e:02x}  "
            f"{exp:02x}      {'Y' if ok else 'N'}"
            if exp is not None
            else f"{i:2d}  {ch:02x}   …"
        )
        sum_state = (sum_state + e) & 0xFF
        xor_state ^= e


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description="CFB4 custom-rotors solver")
    p.add_argument("-q", "--quiet", action="store_true", help="password only")
    p.add_argument("--check", metavar="PWD", help="verify a candidate password")
    p.add_argument("--trace", action="store_true", help="trace rotor states")
    args = p.parse_args(argv)

    pwd = recover_password()
    if pwd != PASSWORD:
        print(f"warning: recovered {pwd!r} != canned {PASSWORD!r}", file=sys.stderr)

    if args.check is not None:
        ok = check_password(args.check)
        if not args.quiet:
            print("OK" if ok else "FAIL", args.check)
        return 0 if ok else 1

    if args.trace:
        print(f"password: {pwd}")
        trace_password(pwd)
        return 0

    if args.quiet:
        print(pwd)
    else:
        print(f"password ({len(pwd)} chars): {pwd}")
        print(f"check: {'OK' if check_password(pwd) else 'FAIL'}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
