#!/usr/bin/env python3
"""Keygen « KeyGenMe #1 By Enforcer/ARTeam » (crackmes.one 5ab77f5533c5d40ad448c1fd)

Chemin réel (pas de débogueur + CRC32 du code 0x401199..+0x155 == 0x98DD61F6) :
    edx = 0 ; pour i, c in enumerate(nom): edx = rol32(edx + c, i)
    serial = "%X" % edx
Leurre (IsDebuggerPresent ou CRC du code modifié, ex. int3) : serial = "%X" % sum(c + 0x10).
"""
import sys

def rol(x, n):
    n &= 31
    return ((x << n) | (x >> (32 - n))) & 0xFFFFFFFF if n else x

def serial(name: str) -> str:
    edx = 0
    for i, c in enumerate(name.encode("latin-1")):
        edx = rol((edx + c) & 0xFFFFFFFF, i)
    return "%X" % edx

def decoy(name: str) -> str:
    return "%X" % sum(c + 0x10 for c in name.encode("latin-1"))

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(serial(name))
    if "--decoy" in sys.argv:
        print("leurre:", decoy(name))
