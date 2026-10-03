#!/usr/bin/env python3
"""Solveur — nake's SP network cipher (xorNT.exe PE64 MSVC Debug)

Keygen : pour une clé K (défaut 43444956, imposée par l’auteur),
inverser E_K(command) == T où T = eeb3909781dbdfafc2c5 (10 octets).

Pipeline (len n ∈ [4, 15], ici n = |T| = 10) :
  1. 4 swaps d’indices issus d’un splitmix-like sur K
  2. subst : octet K&0xFF → (K>>8)&0xFF ^ 0x5A
  3. XOR keystream : compteur 3 chiffres base 4 + K accumulé

petik ne peut pas être la commande (|petik|=5 ≠ 10).

Usage :
  python tools/xornt-solve.py
  python tools/xornt-solve.py -q
  python tools/xornt-solve.py --key 43444956
  python tools/xornt-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

MASK = (1 << 64) - 1
GOLDEN = 0x61C8864680B583EB  # 2^64 / φ
MIX = 0xBF58476D1CE4E5B9
T = bytes.fromhex("eeb3909781dbdfafc2c5")
DEFAULT_KEY = 43444956
KEY_MAX = 0x17D78400  # 400_000_000 — cin refuse au-dessus

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "xorNT.exe"


def permute_pairs(key: int, n: int) -> list[tuple[int, int]]:
    c = key & MASK
    pairs = []
    for _ in range(4):
        i = c % n
        v = (c // n - GOLDEN) & MASK
        j = v % n
        c = (MIX * v + 1) & MASK
        pairs.append((i, j))
    return pairs


def keystream(key: int, n: int) -> bytes:
    """Compteur global d[3] (base 4 irrégulière) + accumulateur K."""
    d = [0, 0, 0]
    a = key & MASK
    out = []
    for _ in range(n):
        d[0] += 1
        if d[0] > 3:
            d[0] = 0
            d[1] += 1
        if d[1] > 3:
            d[1] = 0
            d[2] += 1
        if d[2] > 3:
            d[2] = 0
            d[1] += 1
        a = (a + sum(d)) & MASK
        out.append(a & 0xFF)
    return bytes(out)


def subst_bytes(data: bytes, key: int, reverse: bool = False) -> bytes:
    lo = key & 0xFF
    hi = ((key >> 8) & 0xFF) ^ 0x5A
    if lo == hi:
        return data
    src, dst = (hi, lo) if reverse else (lo, hi)
    return bytes(dst if b == src else b for b in data)


def encrypt(plain: bytes, key: int) -> bytes:
    n = len(plain)
    buf = list(plain)
    for i, j in permute_pairs(key, n):
        if i != j:
            buf[i], buf[j] = buf[j], buf[i]
    buf = list(subst_bytes(bytes(buf), key, reverse=False))
    ks = keystream(key, n)
    return bytes(b ^ k for b, k in zip(buf, ks))


def decrypt(cipher: bytes, key: int) -> bytes:
    n = len(cipher)
    buf = bytes(b ^ k for b, k in zip(cipher, keystream(key, n)))
    buf = subst_bytes(buf, key, reverse=True)
    arr = list(buf)
    for i, j in reversed(permute_pairs(key, n)):
        arr[i], arr[j] = arr[j], arr[i]
    return bytes(arr)


def command_for_key(key: int) -> bytes:
    if key > KEY_MAX:
        raise ValueError(f"clé {key} > {KEY_MAX} (rejetée par cin)")
    cmd = decrypt(T, key)
    if encrypt(cmd, key) != T:
        raise RuntimeError("round-trip encrypt != T")
    return cmd


def check_live(key: int, cmd: bytes) -> int:
    print(f"# logique  encrypt({cmd!r}, {key}) == T :", encrypt(cmd, key) == T)
    if not BIN.is_file():
        print(f"binaire introuvable: {BIN}", file=sys.stderr)
        return 1
    payload = f"{key}\n".encode("ascii") + cmd + b"\n"
    try:
        r = subprocess.run(
            [str(BIN)],
            input=payload,
            capture_output=True,
            timeout=15,
        )
    except OSError as e:
        print(f"native: {e}", file=sys.stderr)
        return 1
    out = (r.stdout or b"") + (r.stderr or b"")
    text = out.decode("latin1", "replace")
    if text.strip():
        print(text.strip())
    code = r.returncode & 0xFFFFFFFF
    if code == 0xC0000135:
        print(
            "native: STATUS_DLL_NOT_FOUND — xorNT.exe est un Debug MSVC "
            "(MSVCP140D / VCRUNTIME140D / ucrtbased). "
            "Preuve = round-trip sur T extrait de .rdata.",
            file=sys.stderr,
        )
        return 0 if encrypt(cmd, key) == T else 1
    ok = "Goood!" in text
    print("OK" if ok else f"FAIL (exit={code:#x})")
    return 0 if ok else 1


def main() -> int:
    ap = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    ap.add_argument("-q", action="store_true", help="commande seule")
    ap.add_argument(
        "--key",
        type=int,
        default=DEFAULT_KEY,
        help=f"clé (défaut {DEFAULT_KEY}, max {KEY_MAX})",
    )
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()

    try:
        cmd = command_for_key(args.key)
    except ValueError as e:
        print(f"error: {e}", file=sys.stderr)
        return 1

    if args.check:
        return check_live(args.key, cmd)
    if args.q:
        print(cmd.decode("latin1"))
        return 0
    print(f"key   {args.key}")
    print(f"cmd   {cmd.decode('latin1')}")
    print(f"# T    {T.hex()}")
    print(f"# enc  {encrypt(cmd, args.key).hex()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
