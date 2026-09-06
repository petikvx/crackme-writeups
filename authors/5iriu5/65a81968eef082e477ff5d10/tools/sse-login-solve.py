#!/usr/bin/env python3
"""Solveur — 5iriu5 SSE Login (ssepwd)

username(8) ‖ password(8) chargés en xmm0 ; paddb avec key ; pcmpeqb secret.

  userpass[i] = (secret[i] - key[i]) & 0xff
  → username « plague\\n\\0 » / password « god\\n\\0\\0\\0\\0 »

Usage:
  python3 sse-login-solve.py
  python3 sse-login-solve.py -q
  python3 sse-login-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "easy"
KEY = bytes.fromhex("d2092342a51079d5fbcf2a16c5fcf692")
SECRET = bytes.fromhex("427584a91a7583d5623e8e20c5fcf692")
USERPASS = bytes((s - k) & 0xFF for s, k in zip(SECRET, KEY))
USER = USERPASS[:8]  # b'plague\n\x00'
PASS = USERPASS[8:]  # b'god\n\x00\x00\x00\x00'


def keygen() -> tuple[bytes, bytes]:
    return USER, PASS


def check_live() -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    r = subprocess.run([str(BIN)], input=USER + PASS, capture_output=True, timeout=5)
    out = (r.stdout + r.stderr).decode(errors="replace")
    print(out.strip())
    ok = "hack the planet" in out
    print(f"user={USER!r} pass={PASS!r} -> {'OK' if ok else 'FAIL'}")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", "--quiet", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        return check_live()
    u, p = keygen()
    if args.quiet:
        print(f"{u.decode('latin1').rstrip(chr(0)).rstrip(chr(10))} {p.decode('latin1').rstrip(chr(0)).rstrip(chr(10))}")
    else:
        print(f"username={u!r}  # plague")
        print(f"password={p!r}  # god")
    return 0


if __name__ == "__main__":
    sys.exit(main())
