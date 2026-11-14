#!/usr/bin/env python3
"""Keygen s4r's zouave : name -> serial (MD5 + clé 16 octets masquée).

Usage : zouave-solve.py [--name petik] [-q]
"""
import argparse, hashlib, struct

C = [0xBAADF00D, 0xB16B00B5, 0xCAFEBABE, 0xDEADBEEF]  # xmm1, adresse croissante
ror16 = lambda x: ((x >> 16) | (x << 16)) & 0xFFFFFFFF


def serial(name: str) -> str:
    if not 3 <= len(name) <= 15:
        raise SystemExit("name : 3 à 15 caractères")
    d = hashlib.md5(name.encode()).digest()
    h = d.hex().upper()
    D = struct.unpack("<4I", d)
    # D[i] = ror16(~(k[3-i] ^ C[i]))  =>  k[3-i] = ~ror16(D[i]) ^ C[i]
    k = [0] * 4
    for i in range(4):
        k[3 - i] = (~ror16(D[i]) & 0xFFFFFFFF) ^ C[i]
    key = struct.pack("<4I", *k).hex().upper()
    return f"{h[:16]}-{key}-{h[16:][::-1]}"


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    s = serial(a.name)
    print(s if a.q else f"name   = {a.name}\nserial = {s}")
