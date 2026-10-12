#!/usr/bin/env python3
"""Keygen szi_keygenme (revme / crackmes.de) — serial XXX-XXX-XXX indépendant du nom."""
from __future__ import annotations
import argparse
import sys

IBET = "ibetthatyoucantcrackthis"
DIGITS = "1234567890"


def charset() -> str:
    out = []
    for i, c in enumerate(IBET):
        out.append(c)
        if i < len(DIGITS):
            out.append(DIGITS[i])
    return "".join(out)


CS = charset()


def f(n: int) -> str:
    """Équivalent de sub_40154c : CS[n % len(CS)] (n unsigned 32-bit)."""
    return CS[(n & 0xFFFFFFFF) % len(CS)]


def keygen(free: str = "56824") -> str:
    """5 caractères libres → positions 1,4,6,9,10 ; positions 0,2,5,8 dérivées."""
    if len(free) != 5:
        raise ValueError("il faut exactement 5 caractères libres (pos 1,4,6,9,10)")
    a, b, c, d, e = free
    k = [""] * 11
    k[1], k[4], k[6], k[9], k[10] = a, b, c, d, e
    k[3] = k[7] = "-"
    k[0] = f(ord(a) + 0x1337)
    k[2] = f((ord(b) - 0x1337) & 0xFFFFFFFF)
    k[5] = f((4919 * ord(c)) & 0xFFFFFFFF)
    k[8] = f(ord(d) & 0xFFFFFFFF)
    return "".join(k)


def check(key: str) -> bool:
    if len(key) != 11 or key[3] != "-" or key[7] != "-":
        return False
    return (
        key[0] == f(ord(key[1]) + 0x1337)
        and key[2] == f((ord(key[4]) - 0x1337) & 0xFFFFFFFF)
        and key[5] == f((4919 * ord(key[6])) & 0xFFFFFFFF)
        and key[8] == f(ord(key[9]) & 0xFFFFFFFF)
    )


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("free", nargs="?", default="petik", help="5 chars libres (défaut: petik)")
    ap.add_argument("--check", metavar="KEY", help="vérifie une clé sans keygen")
    args = ap.parse_args()
    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "BAD", args.check)
        sys.exit(0 if ok else 1)
    free = args.free
    if len(free) < 5:
        free = (free + "xxxxx")[:5]
    elif len(free) > 5:
        free = free[:5]
    k = keygen(free)
    print(k)
    assert check(k)


if __name__ == "__main__":
    main()
