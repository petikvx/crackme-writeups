#!/usr/bin/env python3
"""Solveur — Leotrungkien's Fugs (does_not_exist.py)

Packer Python « Fugs » (HARD). Après unwrap, le prédicat est :
  len(key) == 95
  transform(key) == expected   # affine bit-linear over GF(2)
  checksum(key) == 2114394975

La KEY est une constante UTF-8 de 95 octets. Ce solveur l'émet ;
option `--derive` recalcule via inversion GF(2) sur `analysis/real.marshal`
(nécessite Python 3.12 — 3.14 segfault sur le payload).

Usage:
  python3 tools/fugs-solve.py -q
  python3.12 tools/fugs-solve.py --check
  python3.12 tools/fugs-solve.py --derive
"""
from __future__ import annotations

import argparse
import builtins
import marshal
import subprocess
import sys
import types
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
ORIG = ROOT / "original" / "does_not_exist.py"
REAL = ROOT / "analysis" / "real.marshal"

# UTF-8, exactement 95 octets
KEY = (
    "My friend is really crazy haha_"
    "000XXX1101010999999998888999999"
    "__FUCKYOU____LOVEYOU_"
    "😁😁😁"
)
KEY_BYTES = KEY.encode("utf-8")
assert len(KEY_BYTES) == 95


def _load_predicate():
    """Charge transform / expected / checksum depuis real.marshal (Py 3.12)."""
    if sys.version_info[:2] != (3, 12):
        raise SystemExit(
            f"Python 3.12 requis pour --derive/--selfcheck (ici {sys.version.split()[0]})"
        )
    code = marshal.loads(REAL.read_bytes())

    def _noop():
        return None

    new_consts = list(code.co_consts)
    for i, c in enumerate(new_consts):
        if isinstance(c, types.CodeType) and c.co_name == "櫱誔鞨睦篣":
            new_consts[i] = _noop.__code__.replace(co_name="櫱誔鞨睦篣")
    g = {"__name__": "__not_main__", "__builtins__": builtins}
    exec(code.replace(co_consts=tuple(new_consts)), g, g)
    return (
        g["峗穜嬔鏠鈰姇厥厝"],  # transform
        g["漛蚟鞌桷軖謫蛹甒"],  # expected (95 B)
        g["_R1HmUul7IT"],  # checksum
        g["恼鯶風禯雭蠓炼實"],  # len gate
    )


def derive_key() -> bytes:
    """Inverse t(x)=L(x)⊕pad sur GF(2) (760×760, rang plein)."""
    T, expected, _chk, _lenchk = _load_predicate()
    n = 95
    nbits = n * 8
    pad = T(b"\x00" * n)

    def L(x: bytes) -> bytes:
        return bytes(a ^ b for a, b in zip(T(x), pad))

    cols = []
    for bit in range(nbits):
        e = bytearray(n)
        e[bit // 8] = 1 << (bit % 8)
        cols.append(L(bytes(e)))

    target = bytes(a ^ b for a, b in zip(expected, pad))
    mat = [0] * nbits
    for out_bit in range(nbits):
        oi, oj = out_bit // 8, out_bit % 8
        row = 0
        for in_bit in range(nbits):
            if cols[in_bit][oi] & (1 << oj):
                row |= 1 << in_bit
        if target[oi] & (1 << oj):
            row |= 1 << nbits
        mat[out_bit] = row

    where = [-1] * nbits
    row = 0
    for col in range(nbits):
        piv = None
        for r in range(row, nbits):
            if (mat[r] >> col) & 1:
                piv = r
                break
        if piv is None:
            continue
        mat[row], mat[piv] = mat[piv], mat[row]
        where[col] = row
        prow = mat[row]
        for r in range(nbits):
            if r != row and ((mat[r] >> col) & 1):
                mat[r] ^= prow
        row += 1

    sol = [0] * nbits
    for col in range(nbits - 1, -1, -1):
        r = where[col]
        if r == -1:
            continue
        val = (mat[r] >> nbits) & 1
        for c in range(col + 1, nbits):
            if (mat[r] >> c) & 1:
                val ^= sol[c]
        sol[col] = val

    key = bytearray(n)
    for bit in range(nbits):
        if sol[bit]:
            key[bit // 8] |= 1 << (bit % 8)
    return bytes(key)


def selfcheck() -> bool:
    T, expected, chk, lenchk = _load_predicate()
    return (
        lenchk(KEY_BYTES)
        and T(KEY_BYTES) == expected
        and chk(KEY_BYTES) == 2114394975
    )


def live_check() -> bool:
    py = "python3.12"
    try:
        subprocess.run([py, "-c", "pass"], check=True, capture_output=True)
    except (FileNotFoundError, subprocess.CalledProcessError):
        py = sys.executable
    r = subprocess.run(
        [py, str(ORIG)],
        input=KEY_BYTES + b"\n",
        capture_output=True,
        timeout=60,
    )
    out = (r.stdout + r.stderr).decode("utf-8", "replace")
    print(out.strip())
    return "KEY ACCEPTED" in out and "Challenge solved" in out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="KEY seule")
    ap.add_argument("--check", action="store_true", help="preuve live original/")
    ap.add_argument("--derive", action="store_true", help="recalcule via GF(2)")
    ap.add_argument("--selfcheck", action="store_true", help="gates sur real.marshal")
    args = ap.parse_args()

    if args.derive:
        k = derive_key()
        print(k.decode("utf-8"))
        print("OK" if k == KEY_BYTES else "MISMATCH", file=sys.stderr)
        return 0 if k == KEY_BYTES else 1

    if args.selfcheck:
        ok = selfcheck()
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.check:
        ok = live_check()
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    if args.q:
        print(KEY)
    else:
        print(KEY)
        print(f"# len={len(KEY_BYTES)} utf-8 ; python3.12 original/does_not_exist.py")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
