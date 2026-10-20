#!/usr/bin/env python3
"""Keygen — crackmes.de keygenme#2 by saytos (crackmes.one 5ab77f5633c5d40ad448c2ef).

serial = MD5hex(nom) + "-" + hex(TEA_crackmes(nom[:8]) inversé), puis
s[6]='C', s[20]='x', MAJUSCULES, s[31]='$'   (49 caractères)
"""
import hashlib, struct, sys

KEY = struct.unpack(">4I", b"crackmes\x00Hmm,but")   # 0x4081af, lu en big-endian (bswap)
DELTA, M = 0x9E3779B9, 0xFFFFFFFF

def tea_encrypt(block8):
    v0, v1 = struct.unpack(">2I", block8)
    s = 0
    for _ in range(32):
        s = (s + DELTA) & M
        v0 = (v0 + ((((v1 << 4) + KEY[0]) & M) ^ ((v1 + s) & M) ^ (((v1 >> 5) + KEY[1]) & M))) & M
        v1 = (v1 + ((((v0 << 4) + KEY[2]) & M) ^ ((v0 + s) & M) ^ (((v0 >> 5) + KEY[3]) & M))) & M
    return struct.pack(">2I", v0, v1)

def serial(name: str) -> str:
    raw = name.encode("latin-1")
    if not 1 <= len(raw) <= 19:
        raise ValueError("nom : 1 à 19 caractères (GetDlgItemTextA max 0x14)")
    md5 = hashlib.md5(raw).hexdigest()                       # 0x403e14 + "%.8x"x4
    c = tea_encrypt(raw[:8].ljust(8, b"\0"))                 # 0x406878 sur le buffer nom
    lo, hi = struct.unpack("<2I", c)
    s = list(md5 + "-" + "%.8x%.8x" % (hi, lo))              # wsprintf(edx=[nom+4], eax=[nom])
    s[6] = "C"; s[20] = "x"
    s = list("".join(s).upper())
    s[31] = "$"
    return "".join(s)

if __name__ == "__main__":
    for n in (sys.argv[1:] or ["petik"]):
        print(n, serial(n))
