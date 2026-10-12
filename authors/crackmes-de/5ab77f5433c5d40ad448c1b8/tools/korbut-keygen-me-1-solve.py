#!/usr/bin/env python3
"""Keygen korbut_keygen_me_1 (crackmes.de, RIF 2k3) — serial lié au nom ET au nom d'ordinateur."""
import sys, struct

def ror(x, n): n %= 32; return ((x >> n) | (x << (32 - n))) & 0xffffffff

def serial(name: str, computer: str) -> str:
    n = name.encode()[:49]
    if not n:
        raise ValueError("nom vide")
    comp = computer.upper().encode()[:31].ljust(32, b"\0")   # buffer GetComputerNameA (32 octets)
    first = struct.unpack("<I", n[:4].ljust(4, b"\0"))[0]   # mov ebx, dword [nom]
    esi = 0
    for i in range(len(n)):
        c = comp[len(n) + i] if len(n) + i < 32 else 0       # movsx edx, byte [eax+comp], eax = len+i
        if c >= 0x80: c -= 0x100
        ebx = ror((first + c) & 0xffffffff, 5) ^ 0x20
        esi = ror(struct.unpack(">I", struct.pack("<I", ebx))[0], 0xeb)  # bswap ; ror 0xeb
    return ".(%u)." % esi

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    comp = sys.argv[2] if len(sys.argv) > 2 else "PETIK-PC"
    print(serial(name, comp))
