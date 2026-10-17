#!/usr/bin/env python3
"""destructeur — ShAPK1 (Android) : mot de passe = "Welcome_T0_4ndroid_World".

MainActivity.encrypt(byte[]) : XOR octet-a-octet avec la cle (resource string
R.string, "beginning"), cyclee sur sa longueur. Le OnClickListener compare
Base64.encode(encrypt(saisie)) a la resource string cible (meme XOR, donc
l'inversion est triviale : XOR est sa propre inverse).

Usage : shapk1-solve.py [-q]
"""
import argparse
import base64
import sys

KEY = b"beginning"
TARGET_B64 = "NQALCgEDDDEzUjpTBwocBgcDPTIIGwIK"


def xor(data: bytes, key: bytes) -> bytes:
    return bytes(data[i] ^ key[i % len(key)] for i in range(len(data)))


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    a = ap.parse_args()
    pw = xor(base64.b64decode(TARGET_B64), KEY).decode()
    if a.q:
        print(pw)
        return 0
    print(f"password = {pw}")
    # verification round-trip (encrypt(pw) -> meme base64 cible)
    rt = base64.b64encode(xor(pw.encode(), KEY)).decode()
    print("round-trip OK" if rt == TARGET_B64 else "round-trip KO")
    return 0 if rt == TARGET_B64 else 1


if __name__ == "__main__":
    sys.exit(main())
