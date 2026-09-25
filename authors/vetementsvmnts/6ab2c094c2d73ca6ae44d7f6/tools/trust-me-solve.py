#!/usr/bin/env python3
"""Solveur — vetementsvmnts's trust me this is really easy :)

main exige len == 13, puis pour chaque i :

    ((password[i] + i) ^ 0x5a) & 0xff == target[i]

target : 13 octets à l'offset fichier 0x3008 (VMA 0x3008, symbole target)
    37+#32"21.-*%

Inverse : password[i] = ((target[i] ^ 0x5a) - i) & 0xff
    → ilovecrackmes

Le message OK est CMO{ilovecrackmes}. ptrace(PTRACE_TRACEME) refuse un debugger.
Un mot de la bonne longueur mais faux sort quand même avec le code 0.

Usage:
  python3 tools/trust-me-solve.py -q
  python3 tools/trust-me-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crackme"
TARGET_OFF = 0x3008
TARGET_LEN = 13
XOR = 0x5A


def password() -> str:
    blob = BIN.read_bytes()
    target = blob[TARGET_OFF : TARGET_OFF + TARGET_LEN]
    if len(target) != TARGET_LEN:
        raise SystemExit(f"target tronqué à l'offset {TARGET_OFF:#x}")
    raw = bytes(((target[i] ^ XOR) - i) & 0xFF for i in range(TARGET_LEN))
    return raw.decode("ascii")


def _run(pw: str) -> subprocess.CompletedProcess[str]:
    return subprocess.run(
        [str(BIN)],
        input=pw + "\n",
        capture_output=True,
        text=True,
        timeout=5,
        check=False,
    )


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true", help="n'imprimer que le password")
    ap.add_argument(
        "--check",
        action="store_true",
        help="OK (message CMO), KO longueur (exit 1), KO même longueur (exit 0)",
    )
    args = ap.parse_args()
    pw = password()
    win = f"CMO{{{pw}}}"
    if args.check:
        good = _run(pw)
        short = _run("short")
        same = _run("petikpetikpet")
        print(good.stdout.strip())
        ok = (
            good.returncode == 0
            and win in good.stdout
            and "Access Denied" not in good.stdout
            and short.returncode == 1
            and "Access Denied" in short.stdout
            and same.returncode == 0
            and "Access Denied" in same.stdout
            and win not in same.stdout
        )
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(pw)
    else:
        print(f"{pw}  # (c+i)^0x5a == target ; OK {win}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
