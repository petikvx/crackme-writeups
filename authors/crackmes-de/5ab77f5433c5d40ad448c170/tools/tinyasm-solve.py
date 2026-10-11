#!/usr/bin/env python3
"""TinyAsm (promix17) : pass[i] = ((enc[i]+1) ^ 0x2F) ^ 0x1A, enc = b'zFE[E^M' (0x403023)."""
enc = b"zFE[E^M"
print("".join(chr(((c + 1) ^ 0x2F) ^ 0x1A) for c in enc))
