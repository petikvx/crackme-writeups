#!/usr/bin/env python3
"""Keygen keygenme_1 (korbut) : serial[i] = nom[i] + 1."""
import sys
def keygen(n): return "".join(chr((ord(c)+1)&0xff) for c in n)
if __name__ == "__main__":
    n = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(n, "->", keygen(n))
