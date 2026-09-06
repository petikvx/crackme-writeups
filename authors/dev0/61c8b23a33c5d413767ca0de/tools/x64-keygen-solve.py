#!/usr/bin/env python3
"""dev0 x64_crackme_keygen — name → serial (XOR key from /proc/self/maps prefix).

Maps first-line address digits ASCII sum → XOR key 0x185 ("401000").
Serial = Σ (ord(c) XOR key) over name bytes (edx low-byte style as in binary).
"""
from __future__ import annotations

import argparse
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BIN = ROOT / "original" / "crack"
XOR_KEY = 0x185  # sum(ord(c) for c in "401000")


def serial_for(name: str, xor_key: int = XOR_KEY) -> int:
    eax = 0
    edx = 0
    for c in name:
        edx = (edx & 0xFFFFFF00) + (ord(c) & 0xFF)
        edx ^= xor_key
        eax = (eax + edx) & 0xFFFFFFFF
    return eax


def live_check(name: str, serial: int, timeout: float = 2.0) -> str:
    """Two timed writes — a single pipe dump eats name+serial in one read."""
    p = subprocess.Popen(
        [str(BIN)],
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )
    assert p.stdin and p.stdout
    time.sleep(0.05)
    p.stdin.write(f"{name}\n".encode())
    p.stdin.flush()
    time.sleep(0.05)
    p.stdin.write(f"{serial}\n".encode())
    p.stdin.flush()
    out, _ = p.communicate(timeout=timeout)
    return out.decode(errors="replace")


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-u", "--user", "--name", default="petik", dest="name")
    ap.add_argument("-q", action="store_true", help="serial only")
    ap.add_argument("--check", action="store_true", help="run binary live")
    args = ap.parse_args()
    ser = serial_for(args.name)
    if args.check:
        out = live_check(args.name, ser)
        ok = "Correct!" in out
        print(out.strip())
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    if args.q:
        print(ser)
    else:
        print(f"{args.name} → {ser} (0x{ser:x})  # xor_key={XOR_KEY:#x}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
