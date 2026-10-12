#!/usr/bin/env python3
"""Keygen keygenme_2 (korbut, MASM) : ebx += sx(c) puis bl += 0x30 (sans retenue), serial = ebx en décimal."""
import sys
def keygen(name):
    ebx = 0
    for c in name.encode('latin-1'):
        sc = c - 256 if c > 127 else c
        ebx = (ebx + sc) & 0xffffffff
        ebx = (ebx & 0xffffff00) | ((ebx + 0x30) & 0xff)
    return ebx
if __name__ == '__main__':
    n = sys.argv[1] if len(sys.argv) > 1 else 'petik'
    print(n, '->', keygen(n))
