#!/usr/bin/env python3
"""Keygen mayhem's CrackMe #3 (.NET) — crackmes.one 5ab77f5633c5d40ad448c272.

serial = str(ord(name[-1])) + str(9*len(name) + 63) + "63" + str(somme des
codes ASCII de SHA512(name) en hexa MAJUSCULE)
"""
import hashlib, sys

def serial(name: str) -> str:
    if len(name) < 2:
        raise SystemExit("nom trop court (>= 2 caractères)")
    h = hashlib.sha512(name.encode("ascii")).hexdigest().upper()
    n = len(name)
    return f"{ord(name[-1])}{n * 8 + n + 63}63{sum(map(ord, h))}"

if __name__ == "__main__":
    name = sys.argv[1] if len(sys.argv) > 1 else "petik"
    print(f"{name} / {serial(name)}")
