#!/usr/bin/env python3
"""Solveur — fjlj_crackme_3 by fjlj (crackmes.de)

PE32 console MinGW. Alphabet embarqué « 43A0F9D7B8E1C625 ».
serial = hex_bizarre(0x401404+Σname) ‖ scramble(hex_bizarre)
où hex_bizarre réordonne les nibbles HH|HL|LL|LH, et scramble mappe
chaque chiffre via son index dans l'alphabet (ré-encodé en hex).

Usage :
  python3 fjlj-crackme3-solve.py -q
  python3 fjlj-crackme3-solve.py --name petik
  python3 fjlj-crackme3-solve.py --check petik 1612BDBE
  python3 fjlj-crackme3-solve.py --run
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_BIN = _DIR / "original" / "New_crackme3.exe"

ALPH = b"43A0F9D7B8E1C625"
BASE = 0x401404


def _nibble_ascii(n: int) -> int:
    return n + 0x30 if n <= 9 else n + 0x37


def weird_hex(val16: int) -> bytes:
    hh = (val16 >> 12) & 0xF
    hl = (val16 >> 8) & 0xF
    ll = val16 & 0xF
    lh = (val16 >> 4) & 0xF
    return bytes(_nibble_ascii(n) for n in (hh, hl, ll, lh))


def scramble(hex4: bytes) -> bytes:
    out = bytearray()
    for ch in hex4:
        idx = ALPH.index(ch)
        out.append(_nibble_ascii(idx))
    return bytes(out)


def keygen(name: str = "petik") -> str:
    n = name.encode("ascii", "replace")
    val = (BASE + sum(n)) & 0xFFFF
    w = weird_hex(val)
    return (w + scramble(w)).decode("ascii")


def check(name: str, serial: str) -> bool:
    return serial == keygen(name)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--name", "-n", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=2, metavar=("NAME", "SERIAL"))
    ap.add_argument("--run", action="store_true")
    args = ap.parse_args()

    if args.check:
        ok = check(args.check[0], args.check[1])
        print("check:", "OK" if ok else "FAIL")
        return 0 if ok else 1

    serial = keygen(args.name)
    if args.q:
        print(serial)
    else:
        print(f"{args.name} → {serial}")

    if args.run:
        if not _BIN.is_file():
            print("missing binary", _BIN, file=sys.stderr)
            return 1
        proc = subprocess.run(
            ["xvfb-run", "-a", "wine", str(_BIN)],
            input=f"{args.name}\n{serial}\n\n".encode(),
            capture_output=True,
            timeout=20,
        )
        out = (proc.stdout or b"") + (proc.stderr or b"")
        text = out.decode("latin-1", "replace")
        ok = "YES" in text
        print("wine:", "YES" if ok else "no YES")
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
