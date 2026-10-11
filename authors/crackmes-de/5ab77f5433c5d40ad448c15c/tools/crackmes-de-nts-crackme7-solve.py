#!/usr/bin/env python3
"""Keygen NTS Crackme7 (Cyclops) : serial = A-B, A=%08X(CRC32(name)), B=%08X(CRC32(A))."""
import sys, zlib
name = sys.argv[1] if len(sys.argv) > 1 else "petik"
a = "%08X" % zlib.crc32(name.encode())
print(f"{a}-{zlib.crc32(a.encode()):08X}")
