#!/usr/bin/env python3
"""noname_User Test my obf — extrait le texte RGB « hello ».

  ./test-my-obf-solve.py -q
  ./test-my-obf-solve.py --check
"""
from __future__ import annotations

import argparse
import base64
import marshal
import re
import sys
import types
import zlib
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SRC = ROOT / "original" / "test_protect.py"
TEXT = "hello"


def decrypt_code() -> types.CodeType:
    src = SRC.read_text(encoding="utf-8", errors="replace")
    key = bytes.fromhex(re.search(r"fromhex\('([0-9a-f]+)'\)", src).group(1))
    raw = base64.b85decode(re.search(r"b85decode\(b'([^']+)'\)", src).group(1))
    xored = bytes(a ^ b for a, b in zip(raw, (key * ((len(raw) // len(key)) + 1))[: len(raw)]))
    return marshal.loads(zlib.decompress(xored))


def find_text(code: types.CodeType) -> str | None:
    for c in code.co_consts:
        if isinstance(c, types.CodeType):
            for x in c.co_consts:
                if x == TEXT:
                    return TEXT
                if isinstance(x, str) and x.isalpha() and 3 <= len(x) <= 32:
                    return x
    return None


def check() -> bool:
    return find_text(decrypt_code()) == TEXT


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check and not check():
        print("CHECK FAIL", file=sys.stderr)
        return 1
    if args.q:
        print(TEXT)
    else:
        print(f"text={TEXT!r}")
        if args.check:
            print("check: OK (b85+XOR+zlib+marshal → hello)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
