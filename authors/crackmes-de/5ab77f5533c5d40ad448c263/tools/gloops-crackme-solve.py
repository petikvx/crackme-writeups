#!/usr/bin/env python3
"""Solveur — gloops_crackme by haiklr (crackmes.de / crackmes.one).

Le PE ouvre `gl00ps.nas` (construit en mémoire) et lit 12 octets.
Contraintes (sans bruteforce) :
  - octets 0..8 < 0x32 ; trois triplets (a,b,c) : a+b+c==49 et 10a+5b+2c==200
  - octet 9 == 0 ; DWORD LE @10 (BSS zéro au-delà) = nombre parfait 8128
  - 8128 XOR DWORD@6 == 0x190dc6 ; buf[5]+DWORD@6 == 0x191229
  - produit buf[0]*buf[1]*buf[2] == 0

Usage:
  python3 gloops-crackme-solve.py           # écrit gl00ps.nas (cwd ou --out)
  python3 gloops-crackme-solve.py -q        # hex des 12 octets
  python3 gloops-crackme-solve.py --check   # vérifie les prédicats
"""
from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

# Solution unique (triplet #1 avec produit nul + DWORD parfait)
BUF = bytes([0, 34, 15, 12, 2, 35, 6, 18, 25, 0, 0xC0, 0x1F])
PERFECT = 8128


def check(buf: bytes) -> bool:
    if len(buf) < 12:
        return False
    if any(b >= 0x32 for b in buf[:9]):
        return False
    for i in (0, 3, 6):
        a, b, c = buf[i], buf[i + 1], buf[i + 2]
        if a + b + c != 49 or 10 * a + 5 * b + 2 * c != 200:
            return False
    if buf[9] != 0:
        return False
    esi = struct.unpack_from("<I", buf + b"\x00\x00", 10)[0]
    if not (0x200 <= esi <= 0x2000) or esi != PERFECT:
        return False
    s = 1 + sum(i for i in range(2, esi) if esi % i == 0)
    if s != esi:
        return False
    d = struct.unpack_from("<I", buf, 6)[0]
    if (esi ^ d) != 0x190DC6:
        return False
    if buf[0] * buf[1] * buf[2] != 0:
        return False
    if buf[5] + d != 0x191229:
        return False
    return True


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("-q", action="store_true", help="imprime seulement le hex")
    ap.add_argument("--check", action="store_true", help="vérifie les prédicats")
    ap.add_argument("--out", type=Path, default=None, help="chemin de sortie gl00ps.nas")
    args = ap.parse_args()

    if args.check:
        ok = check(BUF)
        print("OK" if ok else "FAIL", list(BUF))
        return 0 if ok else 1
    if args.q:
        print(BUF.hex())
        return 0

    out = args.out or Path("gl00ps.nas")
    out.write_bytes(BUF)
    print(f"wrote {out} ({len(BUF)} bytes) hex={BUF.hex()}")
    print("Place next to 'gloops crkme.exe' then: xvfb-run -a wine 'gloops crkme.exe'")
    print("Expected MessageBox caption: GLOOPS CRACKME - GOOD BOY")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
