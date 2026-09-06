#!/usr/bin/env python3
"""Solveur — toasterbirb branchless branching

username (8) → password (16) via S-box 32 chars, CFG 100 % cmov/jmp (branchless).

  table = "!@$defghijklmn9pqrstuvwxyz012345"
  for i in 0..7:
      a = (i*7 + user[i]) & 0x1f
      out[i]   = table[a]
      b = (user[i] * out[i]) & 0x1f
      out[8+i] = table[b]
  password[i] = out[i] + 1

Usage:
  python3 branchless-branching-solve.py
  python3 branchless-branching-solve.py -q
  python3 branchless-branching-solve.py --user toasterb
  python3 branchless-branching-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "branchless"
TABLE = b"!@$defghijklmn9pqrstuvwxyz012345"
DEFAULT_USER = "petik"


def derive(user: bytes) -> bytes:
    u = user[:8].ljust(8, b"\x00")
    out = bytearray(16)
    for i in range(8):
        a = (i * 7 + u[i]) & 0x1F
        out[i] = TABLE[a]
        b = (u[i] * out[i]) & 0x1F
        out[8 + i] = TABLE[b]
    return bytes(out)


def keygen(user: str) -> bytes:
    return bytes((c + 1) & 0xFF for c in derive(user.encode()))


def check_live(user: str) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    u = user.encode()[:8].ljust(8, b"\x00")
    pw = keygen(user)
    # reads: 8 then 17
    payload = u + pw + b"\n"
    r = subprocess.run([str(BIN)], input=payload, capture_output=True, timeout=5)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "Logged in as" in out and "Wrong" not in out
    print(f"{user!r} / {pw!r} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--user", "--name", default=DEFAULT_USER, dest="user")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        return check_live(args.user)
    pw = keygen(args.user)
    if args.quiet:
        sys.stdout.buffer.write(pw + b"\n")
    else:
        print(f"user={args.user!r} (pad 8)")
        print(f"pass={pw!r}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
