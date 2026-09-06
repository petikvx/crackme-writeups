#!/usr/bin/env python3
"""Solveur — crackme_1_by_huskyhusky (mini-VM ELF64).

Password : 22 octets (ex. lowercase) tels que
  sum(ord(c_i) * w_i) - 15000 == 60238
avec w_i = suite « next-odd-almost-prime » de la VM
(isqrt buggé : diviseurs testés dans [2, isqrt) seulement).

Usage:
  python3 huskyhusky-solve.py -q
  python3 huskyhusky-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

BIN = Path(__file__).resolve().parents[1] / "original" / "crackme"
TARGET_SUM = 75238  # 15000 + 60238
PASSWORD = b"uoiaefdcgkbhqrywsvtxpz"


def isqrt_vm(n: int, iters: int = 20) -> int:
    if n <= 1:
        return n
    x = n >> 1
    for _ in range(iters):
        x = (x + n // x) >> 1
    return x


def is_weight(n: int) -> bool:
    """True ssi la VM accepte n comme prochain multiplicateur."""
    lim = isqrt_vm(n)
    d = 2
    prod = 1
    while True:
        prod = (prod * (n % d)) & 0xFFFFFFFF
        if prod == 0:
            return False
        d += 1
        if not (lim > d):
            break
    return True


def weights(n: int) -> list[int]:
    out: list[int] = []
    cur = 1
    while len(out) < n:
        cur += 1
        if is_weight(cur):
            out.append(cur)
    return out


def checksum(pw: bytes) -> int:
    ws = weights(len(pw))
    return sum(c * w for c, w in zip(pw, ws))


def find_password(charset: bytes | None = None, length: int = 22) -> bytes:
    """DP : un password de `length` octets dans charset (défaut a-z)."""
    if charset is None:
        charset = bytes(range(ord("a"), ord("z") + 1))
    ws = weights(length)
    rem_set = {TARGET_SUM}
    parents: list[dict[int, tuple[int, int]] | None] = [None]
    for p in ws:
        par: dict[int, tuple[int, int]] = {}
        nxt: set[int] = set()
        for rem in rem_set:
            for c in charset:
                nrem = rem - c * p
                if nrem < 0:
                    continue
                if nrem not in par:
                    par[nrem] = (rem, c)
                nxt.add(nrem)
        parents.append(par)
        rem_set = nxt
        if 0 in rem_set and len(parents) - 1 == length:
            break
    if 0 not in rem_set:
        raise RuntimeError(f"no password of length {length}")
    path: list[int] = []
    cur = 0
    for layer in range(length, 0, -1):
        rem, c = parents[layer][cur]
        path.append(c)
        cur = rem
    path.reverse()
    return bytes(path)


def live_check(password: bytes) -> bytes:
    r = subprocess.run(
        [str(BIN)],
        input=password + b"\n",
        capture_output=True,
        timeout=60,
        check=False,
    )
    return r.stdout + r.stderr


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="password only")
    ap.add_argument("--check", action="store_true", help="run binary")
    ap.add_argument(
        "--gen",
        action="store_true",
        help="recompute a lowercase password via DP (ignore canned)",
    )
    args = ap.parse_args()

    pw = find_password() if args.gen else PASSWORD
    assert checksum(pw) == TARGET_SUM, (checksum(pw), pw)

    if args.q:
        print(pw.decode("ascii"))
        return 0
    if args.check:
        out = live_check(pw)
        text = out.decode("latin1", "replace").replace("\x00", "")
        ok = "Correct" in text
        print(text.strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1

    print("password :", pw.decode("ascii"))
    print("length   :", len(pw))
    print("checksum :", checksum(pw), "(need", TARGET_SUM, ")")
    print("weights  :", weights(len(pw)))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
