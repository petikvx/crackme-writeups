#!/usr/bin/env python3
"""Keygen — crackme1 by adamziaja (crackmes.de, ELF64 C++).

Username 8..12. Exemple dérivé de petik : petikpet → 11269116.

  python3 tools/crackme1-solve.py petikpet
  python3 tools/crackme1-solve.py --check petikpet
"""
from __future__ import annotations

import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BIN = ROOT / "original" / "crackme1"


def keygen(name: str) -> str:
    if not (8 <= len(name) <= 12):
        raise SystemExit("username: longueur 8..12 (gate main)")
    digits = []
    for i, ch in enumerate(name):
        c = ord(ch.lower() if i % 2 == 0 else ch.upper())
        digits.append(str(c))  # ostream << int (ASCII)
    stream = "".join(digits)
    off = (len(name) - 8) * 2
    return stream[off : off + 8]


def check(name: str) -> None:
    serial = keygen(name)
    p = subprocess.run(
        [str(BIN)],
        input=f"{name}\n{serial}\n",
        capture_output=True,
        text=True,
        timeout=5,
    )
    out = p.stdout + p.stderr
    assert "s/n OK!" in out, out
    bad = subprocess.run(
        [str(BIN)],
        input=f"{name}\n0\n",
        capture_output=True,
        text=True,
        timeout=5,
    )
    assert "s/n WRONG!" in (bad.stdout + bad.stderr)
    print(f"OK  {name!r} → {serial}  (native)")


def main(argv: list[str]) -> None:
    args = argv[1:]
    do_check = False
    if args and args[0] == "--check":
        do_check = True
        args = args[1:]
    name = args[0] if args else "petikpet"
    if do_check:
        check(name)
        return
    print(keygen(name))


if __name__ == "__main__":
    main(sys.argv)
