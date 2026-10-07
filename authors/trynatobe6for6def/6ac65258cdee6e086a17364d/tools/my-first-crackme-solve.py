#!/usr/bin/env python3
"""Solveur — TrynaToBe6for6Def's My First Crackme (Very Easy)

13 octets à VA 0x1400030E4 (.rdata) XOR 0x2A → password.
Le flag affiché est CMO{<password>}.

Usage:
  python3 tools/my-first-crackme-solve.py -q
  python3 tools/my-first-crackme-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "My_First_Crackme.exe"

# byte_1400030E4 — 13 octets, XOR immédiat 0x2A (sub_140001560)
ENC = bytes([0x62, 0x19, 0x46, 0x46, 0x45, 0x75, 0x69, 0x58, 0x4B, 0x49, 0x41, 0x47, 0x4F])
XOR_KEY = 0x2A


def password() -> str:
    return bytes(b ^ XOR_KEY for b in ENC).decode("ascii")


def flag_for(pw: str) -> str:
    return f"CMO{{{pw}}}"


def run_bin(pw: str) -> subprocess.CompletedProcess[str]:
    cmd = [str(BIN)]
    if sys.platform != "win32":
        cmd = ["wine", str(BIN)]
    # fgets consomme la 1re ligne ; getchar() après le message
    return subprocess.run(
        cmd,
        input=pw + "\n\n",
        capture_output=True,
        text=True,
        timeout=20,
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    pw = password()
    fl = flag_for(pw)
    if args.check:
        if ENC not in BIN.read_bytes():
            print("FAIL: blob XOR introuvable dans le PE", file=sys.stderr)
            return 1
        r = run_bin(pw)
        out = (r.stdout or "") + (r.stderr or "")
        print(out.strip())
        ok = "Yeaaaaa" in out and fl in out
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
    else:
        print(f"{pw}  # flag {fl}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
