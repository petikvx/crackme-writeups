#!/usr/bin/env python3
"""Solveur — ttlhacker's hell86 (ELF64 SIGILL mini-VM).

Flag 36 chars ``FLAG{…}``. Corps (30 octets) mappé via charset custom →
indices int64 ; ``indices[0]`` doit être 22 (``'x'``). Ensuite
``differences_xored`` : pour k = 29..1,
``a[i] = ((a[i+1] - a[i]) ^ k) ** 3``, puis memcmp des 29 qwords
avec la table ``.rodata`` @ ``0x1fa0``.

Inversion : racines cubiques entières + ``a[0]=22`` → corps unique.

Usage:
  python3 hell86-solve.py
  python3 hell86-solve.py -q
  python3 hell86-solve.py --check
"""
from __future__ import annotations

import argparse
import hashlib
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "hell86"

CHARSET = b"abdfgehikmanoqrstucvwlxyz-01h23p456u78j9-_.+"
FIRST = 22
EXPECTED_OFF = 0x1FA0
N_DIFFS = 29
FLAG_SHA256 = "8fbc397464bcf802e4091e42aff95ded2999e7041b187058cbe2b8818edad777"


def icbrt(n: int) -> int:
    """Racine cubique entière exacte (signée)."""
    if n == 0:
        return 0
    neg = n < 0
    n = abs(n)
    lo, hi = 0, 1
    while hi**3 < n:
        hi *= 2
    while lo < hi:
        mid = (lo + hi) // 2
        if mid**3 < n:
            lo = mid + 1
        else:
            hi = mid
    if lo**3 != n:
        raise ValueError(f"pas de cube entier pour {n if not neg else -n}")
    return -lo if neg else lo


def load_expected(blob: bytes | None = None) -> list[int]:
    if blob is None:
        blob = BIN.read_bytes()
    return list(struct.unpack_from(f"<{N_DIFFS}q", blob, EXPECTED_OFF))


def recover_indices(expected: list[int] | None = None) -> list[int]:
    if expected is None:
        expected = load_expected()
    a = [0] * (N_DIFFS + 1)
    a[0] = FIRST
    for i, e in enumerate(expected):
        k = N_DIFFS - i
        d = icbrt(e)
        a[i + 1] = a[i] + (d ^ k)
    for i, x in enumerate(a):
        if not (0 <= x < len(CHARSET)):
            raise ValueError(f"index hors charset a[{i}]={x}")
    return a


def flag_from_indices(indices: list[int]) -> str:
    body = bytes(CHARSET[x] for x in indices)
    return "FLAG{" + body.decode("ascii") + "}"


def solve() -> str:
    return flag_from_indices(recover_indices())


def forward_check(flag: str, expected: list[int] | None = None) -> bool:
    """Rejoue le prédicat offline (sans VM)."""
    if expected is None:
        expected = load_expected()
    if len(flag) != 36 or not flag.startswith("FLAG{") or flag[-1] != "}":
        return False
    body = flag[5:-1].encode("ascii")
    try:
        a = [CHARSET.index(c) for c in body]
    except ValueError:
        return False
    if a[0] != FIRST:
        return False
    work = list(a)
    k = len(work) - 1
    i = 0
    while k > 0:
        diff = (work[i + 1] - work[i]) ^ k
        work[i] = diff * diff * diff
        i += 1
        k -= 1
    return work[:N_DIFFS] == expected


def check_live(flag: str) -> int:
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    r = subprocess.run([str(BIN), flag], capture_output=True, text=True, timeout=5)
    out = (r.stdout or "") + (r.stderr or "")
    ok = "OK!" in out
    print(f"{flag!r} -> {out.strip()!r} (rc={r.returncode})")
    print("OK" if ok else "FAIL")
    return 0 if ok else 1


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description="hell86 flag solver")
    p.add_argument("-q", "--quiet", action="store_true", help="flag seul")
    p.add_argument(
        "--check",
        action="store_true",
        help="vérifie sha256 + prédicat offline + binaire live",
    )
    args = p.parse_args(argv)

    flag = solve()
    print(flag)
    if args.quiet and not args.check:
        return 0

    if not args.quiet:
        print(f"sha256={hashlib.sha256(flag.encode()).hexdigest()}")

    if args.check:
        h = hashlib.sha256(flag.encode()).hexdigest()
        if h != FLAG_SHA256:
            print(f"sha256 mismatch: {h}", file=sys.stderr)
            return 1
        if not forward_check(flag):
            print("offline predicate FAIL", file=sys.stderr)
            return 1
        print("offline: OK")
        return check_live(flag)

    return 0


if __name__ == "__main__":
    sys.exit(main())
