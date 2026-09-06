#!/usr/bin/env python3
"""S01den 0verney — password = any string whose byte-sum == 0x3de (990).

Hidden PT_LOAD @ 0xc003ef8: anti-ptrace ctor, XOR-0x60 shellcode, then
(0xaf75 XOR sum(chars)) == 0xacab  →  sum == 0x3de. Success prints G00d.
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "0verney"
TARGET = 0xAF75 ^ 0xACAB  # 0x3de = 990
# example with login petik (AGENTS.md)
EXAMPLE = "petikpppq"


def make_password(prefix: str = "petik", length: int | None = None) -> str:
    """Build printable password starting with prefix, sum == TARGET."""
    if length is None:
        length = max(len(prefix) + 1, 8)
        while length < 13:
            try:
                return make_password(prefix, length)
            except ValueError:
                length += 1
        raise ValueError("no length")
    rem = length - len(prefix)
    if rem <= 0:
        raise ValueError("prefix too long")
    need = TARGET - sum(map(ord, prefix))
    avg, rest = divmod(need, rem)
    if not (0x20 <= avg <= 0x7E) or not (0x20 <= avg + rest <= 0x7E):
        raise ValueError("not printable")
    body = [avg] * rem
    body[-1] += rest
    return prefix + "".join(map(chr, body))


def live_check(pw: str) -> bytes:
    p = subprocess.run(
        [str(BIN)],
        input=(pw + "\n").encode(),
        capture_output=True,
        timeout=2,
    )
    return p.stdout


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-u", "--user", "--prefix", default="petik", dest="prefix")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    pw = make_password(args.prefix)
    assert sum(map(ord, pw)) == TARGET
    if args.prefix == "petik":
        assert pw == EXAMPLE
    if args.check:
        out = live_check(pw)
        ok = b"G00d" in out
        print(out.decode(errors="replace").rstrip("\0\n"))
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print(pw if args.q else f"{pw}  # sum={TARGET:#x} ({TARGET})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
