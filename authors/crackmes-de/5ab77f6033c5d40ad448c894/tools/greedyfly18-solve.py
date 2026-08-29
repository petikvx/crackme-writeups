#!/usr/bin/env python3
"""greedy_fly KeygenMe v1.8 — name → serial (MASM32, ASPack).

Contraintes :
  - name longueur **6..12**
  - serial format **XX-XXXXXX** (8 hex + tiret en position 2)

Algo (comme le binaire) :

  b1[i] = (name[i] XOR 0x4E) << 1     # octet
  H     = Adler-32(b1)                # mod 65521
  b2[i] = (name[i] + 5) XOR 0x1D
  C     = CRC-32(b2)
  D     = (C - H) mod 2^32
  serial = \"%08X\" % D  avec tiret après 2 chiffres

« petik » (5) est refusé par le binaire → exemple **petikk**.

  ./greedyfly18-solve.py -q
  ./greedyfly18-solve.py --user petikk
  ./greedyfly18-solve.py --check
"""
from __future__ import annotations

import argparse
import sys
import zlib


def keygen(name: str) -> str:
    raw = name.encode("latin1")
    n = len(raw)
    if not (6 <= n <= 12):
        raise ValueError(f"name length must be 6..12 (got {n})")
    b1 = bytes([((c ^ 0x4E) << 1) & 0xFF for c in raw])
    H = zlib.adler32(b1) & 0xFFFFFFFF
    b2 = bytes([((c + 5) ^ 0x1D) & 0xFF for c in raw])
    C = zlib.crc32(b2) & 0xFFFFFFFF
    D = (C - H) & 0xFFFFFFFF
    hx = f"{D:08X}"
    return f"{hx[:2]}-{hx[2:]}"


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    ap.add_argument("-q", action="store_true", help="serial seul")
    ap.add_argument(
        "--user",
        "--name",
        default="petikk",
        help="name (default petikk ; petik trop court)",
    )
    ap.add_argument(
        "--check",
        action="store_true",
        help="vérifie petikk→17-00ABF0 et qwerty→07-D745B4",
    )
    args = ap.parse_args()

    if args.check:
        cases = [("petikk", "17-00ABF0"), ("qwerty", "07-D745B4")]
        ok = True
        for u, expect in cases:
            got = keygen(u)
            match = got == expect
            ok = ok and match
            print(f"{u} → {got} (expect {expect}) {'OK' if match else 'FAIL'}")
        return 0 if ok else 1

    try:
        serial = keygen(args.user)
    except ValueError as e:
        print(e, file=sys.stderr)
        return 1

    if args.q:
        print(serial)
    else:
        print(f"user={args.user!r} serial={serial}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
