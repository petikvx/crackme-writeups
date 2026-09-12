#!/usr/bin/env python3
"""Solveur — bang1338 Oops! All sarr (code fixe + flag).

Usage:
  ./tools/oops-sarr-solve.py
  ./tools/oops-sarr-solve.py -q
  ./tools/oops-sarr-solve.py --check   # Wine relay (Xvfb) si dispo

Decrypt runtime (indépendant du code) :
  seed eax = 0x73617272 ("sarr")
  edx = eax; edx = SAR32(edx, 3); eax = (eax<<5) ^ edx; eax ^= 0x9D
  buf[i] ^= al   sur RVA 0x50EB0 size 0x7110
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

CODE = "sarr_pls_obfuscate_saarrr_123"
FLAG = "FLAG{sarr_this_thing_is_2_insane_}"
TITLE_OK = "SAAAR DO NOT REDEEM WHY DID YOU REDEEM IT"

ROOT = Path(__file__).resolve().parents[1]
EXE = ROOT / "original" / "sar.exe"
BLOB = ROOT / "analysis" / "encrypted_50eb0.bin"


def sar32(x: int, n: int) -> int:
    x &= 0xFFFFFFFF
    if x & 0x80000000:
        return ((x >> n) | (0xFFFFFFFF << (32 - n))) & 0xFFFFFFFF
    return (x >> n) & 0xFFFFFFFF


def decrypt_blob(data: bytes, seed: int = 0x73617272) -> bytes:
    buf = bytearray(data)
    eax = seed & 0xFFFFFFFF
    for i in range(len(buf)):
        edx = sar32(eax, 3)
        eax = ((eax << 5) ^ edx) & 0xFFFFFFFF
        eax ^= 0x9D
        buf[i] ^= eax & 0xFF
    return bytes(buf)


def wine_check() -> bool:
    if not EXE.is_file():
        print("missing", EXE, file=sys.stderr)
        return False
    cmd = [
        "xvfb-run",
        "-a",
        "timeout",
        "8",
        "env",
        "WINEDEBUG=+relay",
        "wine",
        str(EXE),
        CODE,
    ]
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
    except FileNotFoundError as e:
        print("check skipped:", e, file=sys.stderr)
        return False
    log = (p.stdout or "") + (p.stderr or "")
    ok = FLAG in log and TITLE_OK in log
    if ok:
        print("Wine OK: title + DrawText flag vus dans le relay")
    else:
        print("Wine check FAILED (titre/flag absents du relay)", file=sys.stderr)
        for line in log.splitlines():
            if "OopsAllSARsClass" in line or "FLAG{" in line or "DrawTextW" in line:
                print(" ", line[:200], file=sys.stderr)
    return ok


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="code seul")
    ap.add_argument("--flag", action="store_true", help="flag seul")
    ap.add_argument("--decrypt", action="store_true", help="déchiffre analysis/encrypted_50eb0.bin → stdout path")
    ap.add_argument("--check", action="store_true", help="preuve Wine+Xvfb")
    args = ap.parse_args()

    if args.decrypt:
        raw = BLOB.read_bytes()
        out = ROOT / "analysis" / "decrypted_50eb0.bin"
        out.write_bytes(decrypt_blob(raw))
        print(out)
        return 0

    if args.check:
        return 0 if wine_check() else 1

    if args.q:
        print(CODE)
        return 0
    if args.flag:
        print(FLAG)
        return 0

    print(f"code  {CODE}")
    print(f"flag  {FLAG}")
    print(f"title {TITLE_OK}")
    print(f"run   wine original/sar.exe '{CODE}'")
    return 0


if __name__ == "__main__":
    sys.exit(main())
