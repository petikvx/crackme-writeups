#!/usr/bin/env python3
"""yowmo KeyGenMe1 — Level I (combo index 0): XOR glissant + %X."""
import sys

def level1_serial(name: str) -> str:
    raw = name.encode("ascii", "strict") + b"\0\0\0\0"
    n = len(name)
    if n < 5 or n > 25:
        raise SystemExit("name length must be 5..25")
    edi = 0xDEADBEEF
    for ebx in range(n - 2):
        dword = int.from_bytes(raw[ebx : ebx + 4], "little")
        edi = (edi ^ dword) & 0xFFFFFFFF
    return f"{edi:X}"

def main():
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{name} {level1_serial(name)}")

if __name__ == "__main__":
    main()
