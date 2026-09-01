#!/usr/bin/env python3
"""Solveur WIP — CrackNotMe MCM 3.0 REWORK.

Établi (statique + x64dbg 2026-09-01) :
  - Parent sans args spawn child `--3a1f9b` (DEBUG_ONLY_THIS_PROCESS)
  - Honeypot password : S3rg0M_Admin_2024
  - Honeypot env : _HEAP_TRACE_FLAGS (16 hex) → INT3
  - Stub INT3 29o @ 0x14001A050 → FNV-1a seed matrice 0x412DF8B0 (idem MCM2)
  - Matrice LCG 0x19660D/0x3C6EF35F (asm 110F0 ; Hex-Rays mentait)
  - Blob VM 16o : 3fb80c3a0064877c32ba023f0e6a8478
  - Checksum 0x762 auto-OK si VM retourne 1

TODO : mask XOR parent (r13/r10 / DRx) + bytecode cible VM → password.
Voir analysis/NOTES-x64dbg-2026-09-01.md

Usage :
  python3 mcm3-solve.py -q
  python3 mcm3-solve.py --check S3rg0M_Admin_2024
  python3 mcm3-solve.py --seed
  python3 mcm3-solve.py --matrix Z1Y
  python3 mcm3-solve.py --wine test
  python3 mcm3-solve.py --unpack
"""

from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

PASSWORD_HONEYPOT = "S3rg0M_Admin_2024"
HONEYPOT_VA = 0x14000D838
SEED = 0x412DF8B0
BLOB = bytes.fromhex("3fb80c3a0064877c32ba023f0e6a8478")
STUB_VA = 0x14001A050
STUB_LEN = 29
TABLE_VA = 0x14003BC90

_DIR = Path(__file__).resolve().parents[1]
_PACKED = _DIR / "original" / "CrackMe_packed.exe"
_UNPACKED = _DIR / "analysis" / "CrackMe_unpacked.exe"


def va2off(va: int) -> int:
    if 0x140001000 <= va < 0x14003A200:
        return 0x400 + (va - 0x140001000)
    if 0x14003B000 <= va < 0x14003C400:
        return 0x39600 + (va - 0x14003B000)
    raise ValueError(hex(va))


def fnv1a32(buf: bytes, seed: int = 0x811C9DC5) -> int:
    h = seed
    for b in buf:
        h ^= b
        h = (h * 0x01000193) & 0xFFFFFFFF
    return h


def load_stub(pe: Path | None = None) -> bytes:
    data = (pe or _UNPACKED).read_bytes()
    return data[va2off(STUB_VA) : va2off(STUB_VA) + STUB_LEN]


def load_table(pe: Path | None = None) -> list[int]:
    data = (pe or _UNPACKED).read_bytes()
    raw = data[va2off(TABLE_VA) : va2off(TABLE_VA) + 256]
    return [raw[i] for i in range(0, 256, 4)]


def load_honeypot(pe: Path | None = None) -> str:
    pe = pe or (_UNPACKED if _UNPACKED.exists() else None)
    if pe is None:
        return PASSWORD_HONEYPOT
    data = pe.read_bytes()
    off = 0x400 + (HONEYPOT_VA - 0x140001000)
    return data[off:].split(b"\0", 1)[0].decode("ascii")


def build_matrix(seed: int = SEED) -> list[list[int]]:
    """LCG MCM2 / asm sub_1400110F0 (pas le 26125 Hex-Rays)."""
    mat = [[0] * 64 for _ in range(64)]
    u = seed & 0xFFFFFFFF
    for r in range(64):
        for c in range(64):
            u = (u * 0x19660D + 0x3C6EF35F) & 0xFFFFFFFF
            mat[r][c] = u & 0x3FF
    return mat


def residuals(password: bytes, pe: Path | None = None) -> bytes:
    stub = load_stub(pe)
    seed = fnv1a32(stub)
    assert seed == SEED, hex(seed)
    mat = build_matrix(seed)
    table = load_table(pe)
    vec = [0] * 64
    for i, b in enumerate(password[:64]):
        vec[i] = b
    out = bytearray()
    for i in range(64):
        dp = 0
        for j in range(64):
            dp = (dp + mat[i][j] * vec[j]) & 0xFFFFFFFF
        dp &= 0x3FF
        out.append((table[i] - (dp & 0xFF)) & 0xFF)
    return bytes(out)


def wine_probe(password: str, timeout: int = 8) -> str:
    pe = _PACKED if _PACKED.exists() else _UNPACKED
    try:
        proc = subprocess.run(
            ["timeout", str(timeout), "wine", str(pe)],
            input=(password + "\n\n").encode(),
            capture_output=True,
        )
    except FileNotFoundError:
        return "no-wine"
    text = (proc.stdout + proc.stderr).decode("latin-1", errors="replace")
    if "SUCCESS" in text and "GRANTED" in text:
        return "success"
    if "honeypot" in text.lower() or "Nice try" in text:
        return "honeypot-msg"
    if "DENIED" in text or "FAILED" in text:
        return "denied"
    return "silent-or-hang"


def check(password: str, pe: Path | None = None) -> bool:
    return password == load_honeypot(pe)


def main() -> int:
    ap = argparse.ArgumentParser(description="MCM 3.0 REWORK solver (WIP)")
    ap.add_argument("-q", action="store_true", help="password honeypot")
    ap.add_argument("--check", metavar="P")
    ap.add_argument("--wine", metavar="P", help="sonder Wine")
    ap.add_argument("--seed", action="store_true")
    ap.add_argument("--matrix", metavar="P", help="residuals hex pour un password")
    ap.add_argument("--unpack", action="store_true")
    args = ap.parse_args()

    if args.unpack:
        unpack = Path(__file__).with_name("mcm3-unpack.py")
        return subprocess.call([sys.executable, str(unpack)])

    if args.seed:
        stub = load_stub()
        print(f"stub : {stub.hex()}")
        print(f"fnv  : {fnv1a32(stub):#x}")
        return 0

    if args.matrix is not None:
        print(residuals(args.matrix.encode("latin-1")).hex())
        return 0

    if args.wine is not None:
        print(wine_probe(args.wine))
        return 0

    if args.check is not None:
        ok = check(args.check)
        print("OK" if ok else "FAIL")
        if ok:
            print("(honeypot — pas le gate d'intégrité/VM)")
        else:
            print("note: vrai password TBD (VM + mask parent)")
        return 0 if ok else 1

    hp = load_honeypot()
    if args.q:
        print(hp)
        return 0

    print("=== MCM 3.0 REWORK (WIP) ===")
    print(f"honeypot : {hp}  (len {len(hp)}, VA {HONEYPOT_VA:#x})")
    print(f"seed FNV : {SEED:#x}")
    print(f"blob VM  : {BLOB.hex()}")
    print("msg      : [!] Nice try, cracker. That was a honeypot. ;)")
    print("packer   : python3 tools/mcm3-unpack.py")
    print("status   : parked — mask parent / VM target à finaliser")
    print("notes    : analysis/NOTES-x64dbg-2026-09-01.md")
    return 0


if __name__ == "__main__":
    sys.exit(main())
