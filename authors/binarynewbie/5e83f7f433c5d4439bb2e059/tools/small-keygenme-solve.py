#!/usr/bin/env python3
"""Solveur — BinaryNewbie Small Keygenme (little-crackme)

ELF64 NASM statique : serial = 16 hex digits.
Chaque nibble n doit satisfaire :

  si n pair :  ((n ^ 0xDEAD) + 0xBABE) >> 4 + n == 0x1998   → n == 2
  si n impair: ((n ^ 0x1A) | 0xA) ^ 0x1987 == 0x1998       → n in {5,7,0xD,0xF}

Charset valide : 2 5 7 D F (casse libre).

Usage:
  python3 small-keygenme-solve.py
  python3 small-keygenme-solve.py -q
  python3 small-keygenme-solve.py --serial 2557dff52557dff5
  python3 small-keygenme-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "small-crackme" / "little-crackme"

# Exemple canonique (16 × '2')
DEFAULT_SERIAL = "2222222222222222"
VALID_NIBBLES = frozenset({0x2, 0x5, 0x7, 0xD, 0xF})
HEX_CHARS = "0123456789abcdef"


def nibble_ok(n: int) -> bool:
    n &= 0xFF
    if n & 1:
        return ((n ^ 0x1A) | 0xA) ^ 0x1987 == 0x1998
    eax = ((n ^ 0xDEAD) + 0xBABE) & 0xFFFFFFFF
    eax >>= 4
    return (eax + n) & 0xFFFFFFFF == 0x1998


def is_valid_serial(serial: str) -> bool:
    s = serial.strip()
    if len(s) != 16:
        return False
    try:
        nibs = [int(c, 16) for c in s]
    except ValueError:
        return False
    return all(nibble_ok(n) for n in nibs)


def keygen(pattern: str | None = None) -> str:
    """Retourne un serial valide. pattern optionnel (chars dans 257DFdf)."""
    if pattern is None:
        return DEFAULT_SERIAL
    p = pattern.strip()
    if len(p) != 16:
        raise ValueError("serial: exactement 16 caractères hex")
    if not is_valid_serial(p):
        raise ValueError(f"serial invalide (charset {{2,5,7,D,F}}): {p}")
    return p


def check_live(serial: str) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    # 16 octets sans dépendre du newline (read maxlen=0x10)
    try:
        r = subprocess.run(
            [str(BIN)],
            input=serial.encode()[:16],
            capture_output=True,
            timeout=5,
        )
    except OSError as e:
        print(f"run failed: {e}", file=sys.stderr)
        return 1
    out = (r.stdout + r.stderr).decode(errors="replace")
    ok = "Valid !!!" in out and r.returncode == 0
    print(f"{serial} -> {out.strip()!r} (rc={r.returncode})")
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument(
        "--serial",
        default=None,
        help="serial à valider / utiliser (défaut: 16×2)",
    )
    ap.add_argument("--check", action="store_true", help="preuve live sur le ELF")
    args = ap.parse_args()

    try:
        serial = keygen(args.serial)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1

    if args.check:
        rc = check_live(serial)
        if rc != 0:
            return rc
        # second sample (mixed charset)
        other = "2557dff52557dff5"
        if serial.lower() != other:
            return check_live(other)
        return 0

    if args.q:
        print(serial)
        return 0

    print("=== BinaryNewbie Small Keygenme ===")
    print(f"serial : {serial}")
    print(f"valid  : {is_valid_serial(serial)}")
    print(f"charset: {{2,5,7,D,F}} × 16")
    print(f"cmd    : printf '%s' '{serial}' | ./original/small-crackme/little-crackme")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
