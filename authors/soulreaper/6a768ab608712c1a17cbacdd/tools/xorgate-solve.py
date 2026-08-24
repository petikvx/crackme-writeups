#!/usr/bin/env python3
"""Keygen — soulreaper's XorGate (ELF64).

password = ''.join(f'{c^0x23:02x}' for c in username) + '@password'
FLAG imprimé par le binaire : FLAG{SoulReaper_XOR_Crackme}

Usage :
  python3 xorgate-solve.py              # défaut --user petik
  python3 xorgate-solve.py -q
  python3 xorgate-solve.py --check 5346574a48@password
"""

from __future__ import annotations

import argparse
import sys

XOR_KEY = 0x23
SUFFIX = "@password"
FLAG = "FLAG{SoulReaper_XOR_Crackme}"


def derive(user: str) -> str:
    return "".join(f"{ord(c) ^ XOR_KEY:02x}" for c in user) + SUFFIX


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--user", "--name", dest="user", default="petik")
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--flag", action="store_true", help="print FLAG string")
    ap.add_argument("--check", metavar="PASS", help="verify password for --user")
    args = ap.parse_args()

    if args.flag:
        print(FLAG)
        return 0

    pw = derive(args.user)
    if args.check is not None:
        ok = args.check == pw
        print("OK" if args.q else f"check={'OK' if ok else 'FAIL'} expected={pw!r}")
        return 0 if ok else 1

    if args.q:
        print(pw)
    else:
        print(f"user={args.user!r}")
        print(f"password={pw}")
        print(f"flag={FLAG}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
