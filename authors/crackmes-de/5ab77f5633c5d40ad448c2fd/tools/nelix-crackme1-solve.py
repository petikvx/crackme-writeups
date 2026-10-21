#!/usr/bin/env python3
"""Keygen Nelix CrackMe #1 : serial = hex(MD5(name) XOR K), K = clé de 16 octets en dur."""
import argparse, hashlib, sys

K = bytes([15, 58, 143, 50, 67, 61, 164, 53, 35, 244, 178, 60, 88, 93, 77, 23])

def keygen(name: str) -> str:
    md5 = hashlib.md5(name.encode("utf-8")).digest()   # Encoding.Default (UTF-8 sous Wine/Mono)
    return bytes(a ^ b for a, b in zip(md5, K)).hex().upper()

def check(name: str, serial: str) -> bool:
    """Réplique exacte du check IL : serial en paires hex, S[i]^K[i] == md5[i]."""
    if len(serial) != 32:
        return False
    try:
        s = bytes.fromhex(serial)
    except ValueError:
        return False
    return bytes(a ^ b for a, b in zip(s, K)) == hashlib.md5(name.encode()).digest()

if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--name", default="petik")
    p.add_argument("-q", action="store_true")
    p.add_argument("--check", metavar="SERIAL")
    a = p.parse_args()
    if a.check:
        ok = check(a.name, a.check); print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    s = keygen(a.name)
    print(s if a.q else f"name={a.name}\nserial={s}")
