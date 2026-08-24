#!/usr/bin/env python3
"""Solveur — fourexp's fourexps hard crackme

PE64 MSVC Debug : password construit sur la stack (mov BYTE), XOR 0x5A,
puis comparaison std::string (5 tentatives).

Usage :
  python3 fourexps-hard-solve.py -q
  python3 fourexps-hard-solve.py --check welldoneyoucrackedit
  python3 fourexps-hard-solve.py --decode
  python3 fourexps-hard-solve.py --from-pe
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

_DIR = Path(__file__).resolve().parents[1]
_PE = (
    _DIR
    / "analysis"
    / "extracted"
    / "hard crackme"
    / "fourexps hard crackme.exe"
)

# Blob stack @ main ~0x14001b30e (avant XOR), clé @ [rbp+0x34]
ENC = b"-?66>54?#5/9(;91?>3."
KEY = 0x5A


def decode(enc: bytes = ENC, key: int = KEY) -> str:
    return bytes(b ^ key for b in enc).decode("ascii")


def extract_enc_from_pe(path: Path | None = None) -> bytes:
    """Reconstruit le blob depuis les `mov BYTE PTR [rbp+disp8], imm8` contigus."""
    data = (path or _PE).read_bytes()
    # Pattern : C6 45 xx imm  répété, imm non nul, terminé par C6 45 xx 00
    best: bytes | None = None
    i = 0
    while i + 4 <= len(data):
        if data[i] == 0xC6 and data[i + 1] == 0x45:
            blob = bytearray()
            j = i
            while j + 4 <= len(data) and data[j] == 0xC6 and data[j + 1] == 0x45:
                imm = data[j + 3]
                j += 4
                if imm == 0:
                    break
                blob.append(imm)
            if len(blob) >= 8 and (best is None or len(blob) > len(best)):
                best = bytes(blob)
            i = j if j > i else i + 1
        else:
            i += 1
    if best is None:
        raise ValueError("no stack mov-BYTE password blob found in PE")
    return best


def check(s: str, enc: bytes = ENC, key: int = KEY) -> bool:
    return s == decode(enc, key)


def main(argv: list[str] | None = None) -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("-q", "--quiet", action="store_true", help="password only")
    p.add_argument("--check", metavar="PWD", help="verify a candidate")
    p.add_argument("--decode", action="store_true", help="show enc + XOR detail")
    p.add_argument(
        "--from-pe",
        action="store_true",
        help="recover enc blob from the extracted PE instead of the hardcoded table",
    )
    p.add_argument("--pe", type=Path, default=None, help="path to PE (with --from-pe)")
    args = p.parse_args(argv)

    enc = extract_enc_from_pe(args.pe) if args.from_pe else ENC
    pwd = decode(enc)

    if args.check is not None:
        ok = check(args.check, enc)
        if args.quiet:
            print("OK" if ok else "FAIL")
        else:
            print(f"check={args.check!r} expected={pwd!r} → {'OK' if ok else 'FAIL'}")
        return 0 if ok else 1

    if args.decode:
        print(f"enc = {enc!r}")
        print(f"key = {KEY:#04x}")
        print(f"pwd = {pwd!r}")
        if args.from_pe:
            print(f"pe  = {args.pe or _PE}")
        return 0

    if args.quiet:
        print(pwd)
    else:
        print(f"password = {pwd}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
