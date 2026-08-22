#!/usr/bin/env python3
"""Solveur — neoncarrot's Find the correct key!

ZIP : get-keys.exe (génère des clés) + check-keys.exe (UPX, valide).

1) get-keys : mot de passe dialog « providechaos » → génère des clés 75 chiffres.
2) check-keys : length == 0x4b (75), hash custom 6×uint32, MessageBox « Well done !!! ».

Usage :
  python3 find-key-solve.py -q
  python3 find-key-solve.py --check <key>
"""

from __future__ import annotations

import argparse
import sys

GENERATOR_PASSWORD = "providechaos"
# Une clé acceptée par check-keys (75 digits)
CORRECT_KEY = (
    "439272362961741018146349942923915526002573998999491954071123154782706705610"
)
KEY_LEN = 0x4B  # 75


def check(key: str) -> bool:
    if len(key) != KEY_LEN:
        return False
    if not key.isdigit():
        return False
    return key == CORRECT_KEY


def main() -> int:
    ap = argparse.ArgumentParser(description="Find the correct key! solver")
    ap.add_argument("-q", action="store_true", help="clé correcte")
    ap.add_argument("--check", metavar="K")
    ap.add_argument("--gen-pass", action="store_true", help="password get-keys.exe")
    args = ap.parse_args()

    if args.gen_pass:
        print(GENERATOR_PASSWORD)
        return 0

    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(CORRECT_KEY)
        return 0

    print("=== Find the correct key! ===")
    print(f"get-keys password : {GENERATOR_PASSWORD}")
    print(f"correct key       : {CORRECT_KEY}")
    print(f"length            : {len(CORRECT_KEY)} (must be {KEY_LEN})")
    print("check-keys.exe    : UPX → « Well done !!! » si OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
