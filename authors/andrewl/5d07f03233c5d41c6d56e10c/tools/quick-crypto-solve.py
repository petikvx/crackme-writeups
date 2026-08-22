#!/usr/bin/env python3
"""Solveur — andrewl's Quick Crypto, 18k

ELF32 asm (non strippé). Input « AAAAAAAA-BBBBBBBB » (2×uint32 hex).
`decipher` (TEA-like unrolled, 742 half-rounds, constantes précalculées)
doit produire le plaintext LE « CSAWHAHA ».

Le solveur lit les XOR immédiats via objdump et inverse le déchiffrement.

Usage:
  python3 quick-crypto-solve.py -q
  python3 quick-crypto-solve.py --check
  printf '%s\\n' \"$(python3 quick-crypto-solve.py -q)\" | ./original/chall
"""
from __future__ import annotations

import argparse
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "chall"
PLAIN_V0 = 0x57415343  # "CSAW"
PLAIN_V1 = 0x41484148  # "HAHA"
MASK = 0xFFFFFFFF


def f(x: int) -> int:
    x &= MASK
    return ((((x << 4) & MASK) ^ (x >> 5)) + x) & MASK


def extract_ops(binary: Path) -> list[tuple[int, str]]:
    """Séquence (const, 'v0'|'v1') des half-rounds de decipher."""
    dump = subprocess.check_output(
        [
            "objdump",
            "-d",
            "-M",
            "intel",
            str(binary),
            "--start-address=0x08048214",
            "--stop-address=0x0804c1ed",
        ],
        text=True,
    )
    lines = dump.splitlines()
    ops: list[tuple[int, str]] = []
    for i, line in enumerate(lines):
        m = re.search(r"xor\s+(e[abcd]x|esi),0x([0-9a-f]+)", line)
        if not m:
            continue
        imm = int(m.group(2), 16)
        sub = None
        for j in range(i + 1, min(i + 5, len(lines))):
            ms = re.search(r"sub\s+(e[abcd]x|esi),", lines[j])
            if ms:
                sub = ms.group(1)
                break
        if sub is None:
            raise RuntimeError(f"pas de sub après {line!r}")
        # edx = v0 ; esi (1er round) puis eax = v1
        tgt = "v0" if sub == "edx" else "v1"
        ops.append((imm, tgt))
    if len(ops) < 64:
        raise RuntimeError(f"trop peu d'ops TEA: {len(ops)}")
    return ops


def encipher(ops: list[tuple[int, str]], v0: int, v1: int) -> tuple[int, int]:
    for imm, tgt in reversed(ops):
        if tgt == "v1":
            v1 = (v1 + (f(v0) ^ imm)) & MASK
        else:
            v0 = (v0 + (f(v1) ^ imm)) & MASK
    return v0, v1


def decipher(ops: list[tuple[int, str]], v0: int, v1: int) -> tuple[int, int]:
    for imm, tgt in ops:
        if tgt == "v1":
            v1 = (v1 - (f(v0) ^ imm)) & MASK
        else:
            v0 = (v0 - (f(v1) ^ imm)) & MASK
    return v0, v1


def solve_key(binary: Path = BIN) -> str:
    ops = extract_ops(binary)
    ct0, ct1 = encipher(ops, PLAIN_V0, PLAIN_V1)
    back = decipher(ops, ct0, ct1)
    if back != (PLAIN_V0, PLAIN_V1):
        raise RuntimeError(f"roundtrip fail: {back!r}")
    return f"{ct0:08X}-{ct1:08X}"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="clé seule")
    ap.add_argument(
        "--check",
        action="store_true",
        help="relance ./original/chall avec la clé",
    )
    args = ap.parse_args()
    if not BIN.is_file():
        print(f"missing {BIN}", file=sys.stderr)
        return 1
    key = solve_key()
    if args.check:
        import os

        r, w = os.pipe()
        os.write(w, (key + "\n").encode())
        os.close(w)
        out = subprocess.check_output([str(BIN)], stdin=os.fdopen(r, "rb"))
        text = out.decode(errors="replace")
        ok = "pass" in text
        print(text.strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(key)
        return 0
    print("=== andrewl Quick Crypto ===")
    print(f"key      : {key}")
    print("plain    : CSAWHAHA  (après decipher TEA-like unrolled)")
    print(f"verify   : printf '%s\\n' '{key}' | ./original/chall")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
