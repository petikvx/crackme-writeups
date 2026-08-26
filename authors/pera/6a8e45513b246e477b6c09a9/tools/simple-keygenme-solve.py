#!/usr/bin/env python3
"""Solveur — Pera Simple keygenme for beginners

PE64 console : crack.exe <text> <key>

  sum  = Σ movsx(name[i]) pour i in 0..len  (le NUL ajoute 0)
  v4   = argc//3 + 42*argc          # argc=3 → 127
  key  = movsx(name[0]) * (sum ^ 3) + (0x1D ^ v4) - 0x62
       = movsx(name[0]) * (sum ^ 3)     # car (0x1D^127)-98 = 0

Usage:
  python3 simple-keygenme-solve.py              # petik → clé
  python3 simple-keygenme-solve.py -q
  python3 simple-keygenme-solve.py --user ABC
  python3 simple-keygenme-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crack.exe"
DEFAULT_USER = "petik"


def sx8(b: int) -> int:
    b &= 0xFF
    return b - 0x100 if b >= 0x80 else b


def checksum(name: str) -> int:
    """Somme signée des octets + NUL (comme sub_140001020)."""
    data = name.encode("latin-1", errors="surrogateescape") + b"\x00"
    return sum(sx8(b) for b in data)


def keygen(name: str, argc: int = 3) -> int:
    if not name:
        raise ValueError("name vide")
    first = sx8(ord(name[0]))
    s = checksum(name)
    v4 = argc // 3 + 42 * argc
    # rester sur 32 bits comme imul/xor eax
    return int(first * ((s ^ 3) & 0xFFFFFFFF) + ((0x1D ^ v4) - 0x62)) & 0xFFFFFFFF


def keygen_signed(name: str, argc: int = 3) -> int:
    """Même formule, résultat interprété signed 32-bit si besoin d'affichage."""
    k = keygen(name, argc)
    return k - 0x100000000 if k >= 0x80000000 else k


def check_live(user: str) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    key = keygen_signed(user)
    try:
        r = subprocess.run(
            ["xvfb-run", "-a", "wine", str(BIN), user, str(key)],
            capture_output=True,
            timeout=15,
        )
    except FileNotFoundError:
        r = subprocess.run(
            ["wine", str(BIN), user, str(key)],
            capture_output=True,
            timeout=15,
        )
    out = (r.stdout + r.stderr).decode(errors="replace")
    # wine noise
    ok = "Good job" in out
    print(f"{user} {key} -> {out.strip()!r}")
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--user", "--name", default=DEFAULT_USER, dest="user")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    if args.check:
        rc = check_live(args.user)
        if rc == 0 and args.user != "ABC":
            # smoke second sample from site comment
            rc2 = check_live("ABC")
            return rc2
        return rc

    key = keygen_signed(args.user)
    if args.q:
        print(key)
        return 0

    s = checksum(args.user)
    print("=== Pera Simple keygenme ===")
    print(f"user : {args.user}")
    print(f"sum  : {s}  (sum^3 = {s ^ 3})")
    print(f"key  : {key}")
    print(f"cmd  : wine original/crack.exe {args.user} {key}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
