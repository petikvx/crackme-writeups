#!/usr/bin/env python3
"""Keygen crackmekeygenme1_breaker (brk12345 / crackmes.de).
serial = str(85*len) + "-" + reverse(Mid(nom,2,3)) + "ata-" + str(100+80*len)"""
import sys
def keygen(name: str) -> str:
    n = len(name)
    return f"{85*n}-{name[1:4][::-1]}ata-{100+80*n}"
if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{name} -> {keygen(name)}")
