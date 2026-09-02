#!/usr/bin/env python3
"""alessiosca python - decryptme — peel pyencrypt layers.

Encryptor: https://github.com/alessio-ds/python-code-encryptor
Each recursion wraps: b64 → b32 → b16 inside
  import base64;exec(base64.b64decode((base64.b32decode((base64.b16decode('…'))))))
and appends '#'*1000 once before the first wrap.

  ./python-decryptme-solve.py -q
  ./python-decryptme-solve.py --check
  ./python-decryptme-solve.py --dump analysis/out.py
"""
from __future__ import annotations

import argparse
import base64
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ENC = ROOT / "original" / "helloworld_encrypted.py"
FLAG = "# I'm the flag. Hello!"
LAYER = re.compile(
    r"^import base64;exec\(base64\.b64decode\(\(base64\.b32decode\(\(base64\.b16decode\('([A-F0-9]+)'\)\)\)\)\)\)$"
)


def peel(src: str) -> tuple[str, int, int]:
    """Return (plaintext without trailing # pad, layers, pad_len)."""
    cur = src
    layers = 0
    while True:
        m = LAYER.match(cur)
        if not m:
            break
        cur = base64.b64decode(
            base64.b32decode(base64.b16decode(m.group(1)))
        ).decode("utf-8")
        layers += 1
    stripped = cur.rstrip("#")
    return stripped, layers, len(cur) - len(stripped)


def extract_flag(plain: str) -> str:
    for line in plain.splitlines():
        s = line.strip()
        if s.startswith("#") and "flag" in s.lower():
            return s
    raise ValueError("no flag comment in decrypted source")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="flag only")
    ap.add_argument("--check", action="store_true", help="assert known flag")
    ap.add_argument("--file", type=Path, default=ENC)
    ap.add_argument("--dump", type=Path, help="write decrypted source")
    ap.add_argument("-v", action="store_true", help="layers / pad info")
    args = ap.parse_args()

    plain, layers, pad = peel(args.file.read_text(encoding="utf-8"))
    flag = extract_flag(plain)

    if args.dump:
        args.dump.parent.mkdir(parents=True, exist_ok=True)
        args.dump.write_text(plain if plain.endswith("\n") else plain + "\n")

    if args.check and flag != FLAG:
        print("CHECK FAIL", repr(flag), file=sys.stderr)
        return 1

    if args.q:
        print(flag)
    else:
        print(f"flag   = {flag}")
        if args.v or not args.q:
            print(f"layers = {layers}  pad_hashes = {pad}")
            print("--- decrypted ---")
            print(plain.rstrip("\n"))

    if args.check:
        print("check: OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
