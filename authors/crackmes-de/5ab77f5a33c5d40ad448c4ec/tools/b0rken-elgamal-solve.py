#!/usr/bin/env python3
"""Keygen — SmilingWolf B0rken ElGamal KeygenMe.

ElGamal signature (SHA1(name) as message). Private key X recovered via
reused ephemeral k on the two blacklisted (name, serial) pairs
(LordCarder / ProThief) — see lifeinhex write-ups.

Serial = hex(R)||hex(S) (64+64 uppercase hex digits).

Exemple (AGENTS) :
  name=petik
  serial=65796CB3…662C  (k=1337)

Usage:
  python3 b0rken-elgamal-solve.py -q --name petik
  python3 b0rken-elgamal-solve.py --name petik --check
"""
from __future__ import annotations

import argparse
import hashlib
import sys

P = 0xFE6D5B4400B30374A403F88CFBA3642435FB269AEC2BE5C8C2F331545EF37AB3
G = 0x7FB7E340473674B34C7B9BDF338897277CB2A17E0296D5DD08C60D5B3D839219
Y = 0xCC945009A3E4215D042284F4FE567DFDAAEB906E8A620597FAF4953935F217EC
X = 0x7F4BEFC372EED0BA1D4A3543243EE574734C8347459FA21E5BCC5BCF0351812D

assert pow(G, X, P) == Y


def _egcd(a: int, b: int) -> tuple[int, int, int]:
    if b == 0:
        return a, 1, 0
    g, x, y = _egcd(b, a % b)
    return g, y, x - (a // b) * y


def _inv(a: int, m: int) -> int:
    g, x, _ = _egcd(a % m, m)
    if g != 1:
        raise ValueError("no inverse")
    return x % m


def sign(name: str, k: int = 1337) -> str:
    m = int(hashlib.sha1(name.encode("utf-8", errors="ignore")).hexdigest(), 16)
    pm1 = P - 1
    r = pow(G, k, P)
    s = ((m - X * r) % pm1) * _inv(k, pm1) % pm1
    return f"{r:064X}{s:064X}"


def verify(name: str, serial: str) -> bool:
    serial = serial.strip().replace(" ", "").upper()
    if len(serial) != 128:
        return False
    m = int(hashlib.sha1(name.encode("utf-8", errors="ignore")).hexdigest(), 16)
    r = int(serial[:64], 16)
    s = int(serial[64:], 16)
    v1 = pow(G, m, P)
    v2 = (pow(Y, r, P) * pow(r, s, P)) % P
    return v1 == v2


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--name", "--user", default="petik", dest="name")
    ap.add_argument("-k", type=int, default=1337, help="ephemeral k (default 1337)")
    ap.add_argument("-q", action="store_true", help="serial only")
    ap.add_argument("--check", action="store_true", help="verify V1==V2")
    args = ap.parse_args()

    if args.name in ("LordCarder", "ProThief"):
        print("blacklisted name", file=sys.stderr)
        return 2

    serial = sign(args.name, args.k)
    if args.q:
        print(serial)
    else:
        print(f"name:   {args.name}")
        print(f"serial: {serial}")

    if args.check:
        ok = verify(args.name, serial)
        print("verify:", "OK" if ok else "FAIL")
        return 0 if ok else 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
