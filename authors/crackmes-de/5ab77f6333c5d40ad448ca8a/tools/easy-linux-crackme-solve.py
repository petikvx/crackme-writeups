#!/usr/bin/env python3
"""Solveur — crackmes.de easy_linux_crackme (lord)

ELF32 NASM : sys_getgid (int 0x80, eax=0x2f) doit renvoyer **0xdead** (57005).
Pas d’input. Succès → « Okej! ».

Vérif sans root : gdb casse après le syscall et force eax=0xdead.
En root : setpriv --regid=57005 … / sg.

Usage:
  python3 easy-linux-crackme-solve.py -q
  python3 easy-linux-crackme-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "blah"
GID = 0xDEAD


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    args = ap.parse_args()
    if args.check:
        if not BIN.is_file():
            print(f"missing {BIN}", file=sys.stderr)
            return 1
        cmd = [
            "gdb",
            "-batch",
            "-ex",
            "set pagination off",
            "-ex",
            "set confirm off",
            "-ex",
            "set debuginfod enabled off",
            "-ex",
            "break *0x0804809d",
            "-ex",
            "run",
            "-ex",
            "set $eax=0xdead",
            "-ex",
            "continue",
            str(BIN),
        ]
        out = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
        text = out.stdout + out.stderr
        ok = "Okej!" in text
        print("Okej!" if ok else text[-400:])
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(f"gid={GID} (0xdead)")
        return 0
    print("=== easy_linux_crackme ===")
    print(f"predicate : getgid() == {GID:#x} ({GID})")
    print("success   : Okej!")
    print("check     : gdb break after sys_getgid + set $eax=0xdead")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
