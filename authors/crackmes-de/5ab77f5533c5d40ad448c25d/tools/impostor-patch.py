#!/usr/bin/env python3
"""Patch IMPosTOR Crack Me 0.5 : pointeur Unregistered -> Registered (VA 0x404229)."""
from __future__ import annotations
import argparse, hashlib, sys
from pathlib import Path

FILE_OFF = 0x3629
OLD = bytes.fromhex("b86c444000")  # mov eax, 0x40446c
NEW = bytes.fromhex("b890424000")  # mov eax, 0x404290

def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("-i", "--input", type=Path, required=True)
    ap.add_argument("-o", "--output", type=Path)
    ap.add_argument("--check", action="store_true", help="vérifie que INPUT est déjà patché")
    a = ap.parse_args()
    data = bytearray(a.input.read_bytes())
    cur = bytes(data[FILE_OFF:FILE_OFF + 5])
    if a.check:
        ok = cur == NEW
        print("OK" if ok else "FAIL", cur.hex())
        sys.exit(0 if ok else 1)
    if a.output is None:
        ap.error("-o/--output requis sauf avec --check")
    if cur == NEW:
        a.output.write_bytes(data)
        print("déjà patché", a.output)
        return
    if cur != OLD:
        raise SystemExit(f"octet inattendu @ {FILE_OFF:#x}: {cur.hex()}")
    data[FILE_OFF:FILE_OFF + 5] = NEW
    a.output.write_bytes(data)
    print(f"écrit {a.output} sha256={hashlib.sha256(data).hexdigest()}")

if __name__ == "__main__":
    main()
