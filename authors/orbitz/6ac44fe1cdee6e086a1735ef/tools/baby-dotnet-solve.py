#!/usr/bin/env python3
"""Solveur — ORBITZ's BabyDotNet

Prédicat = original/BabyDotNet/Form1.cs (NameEnc / PassEnc / button1_Click_1).

username = UTF-8(Base64("JEsxTEw="))           → $K1LL
password = XOR 0x13 de '"@@F ' (5 chars)       → 1SSU3
flag     = CMO{<user>_<pass>}

Usage:
  python3 tools/baby-dotnet-solve.py -q
  python3 tools/baby-dotnet-solve.py --check
"""
from __future__ import annotations

import argparse
import base64
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DLL = ROOT / "original" / "BabyDotNet.dll"
EXE = ROOT / "original" / "BabyDotNet.exe"

NAME_B64 = "JEsxTEw="
# #US[1] UTF-16LE : quote, '@', '@', 'F', space
PASS_CIPHER = '"@@F '
XOR_KEY = 19


def name_enc(b64: str) -> str:
    return base64.b64decode(b64).decode("utf-8")


def pass_enc(cipher: str, key: int = XOR_KEY) -> str:
    return "".join(chr(ord(c) ^ key) for c in cipher)


def credentials() -> tuple[str, str, str]:
    user = name_enc(NAME_B64)
    pw = pass_enc(PASS_CIPHER)
    flag = f"CMO{{{user}_{pw}}}"
    return user, pw, flag


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    user, pw, flag = credentials()
    if args.check:
        blob = DLL.read_bytes()
        if NAME_B64.encode("utf-16le") not in blob:
            print("FAIL: Base64 username introuvable dans le DLL", file=sys.stderr)
            return 1
        if PASS_CIPHER.encode("utf-16le") not in blob:
            print("FAIL: cipher password introuvable dans le DLL", file=sys.stderr)
            return 1
        if user != "$K1LL" or pw != "1SSU3" or flag != "CMO{$K1LL_1SSU3}":
            print("FAIL: decode inattendu", user, pw, flag, file=sys.stderr)
            return 1
        print(f"{user} / {pw}")
        print(flag)
        print("OK")
        return 0
    if args.q:
        print(flag)
    else:
        print(f"username {user}")
        print(f"password {pw}")
        print(f"flag     {flag}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
