#!/usr/bin/env python3
"""NTS Crackme2 (Cyclops) : le serial est la chaîne en clair de .data:0x403000, comparée par lstrcmpA."""
import sys, pefile
pe = pefile.PE(sys.argv[1] if len(sys.argv) > 1 else "Crackme2.exe")
print(pe.get_data(0x3000, 16).split(b"\0")[0].decode())
