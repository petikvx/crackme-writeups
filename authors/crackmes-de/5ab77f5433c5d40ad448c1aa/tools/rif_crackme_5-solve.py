#!/usr/bin/env python3
"""rif_crackme_5 (fts II) — sum ((c+1) ^ i) * i with i = index+1."""
import sys

def serial_for(name: str) -> int:
    raw = name.encode("ascii")
    ebx = 0
    ecx = 0
    while ecx < len(raw):
        c = raw[ecx]
        eax = (c + 1) & 0xFFFFFFFF
        ecx += 1
        eax ^= ecx
        ebx = (ebx + (eax * ecx & 0xFFFFFFFF)) & 0xFFFFFFFF
    return ebx

def main():
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{name} {serial_for(name)}")

if __name__ == "__main__":
    main()
