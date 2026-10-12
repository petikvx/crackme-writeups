#!/usr/bin/env python3
"""Keygen crackmes.de your_first_crack by korbut : serial ne dépend que du 1er caractère du nom."""
import sys
def keygen(name):
    s = 0
    for b in range(ord(name[0]), 256):          # le 1er octet est incrémenté jusqu'à revenir à 0
        v = ((b + 1) ^ 0x17) & 0xFF
        s += v - 256 if v > 127 else v          # movsx
    return s & 0xFFFFFFFF                        # GetDlgItemInt non signé
name = sys.argv[1] if len(sys.argv) > 1 else "petik"
print(name, keygen(name))
