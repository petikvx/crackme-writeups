#!/usr/bin/env python3
"""Keyfile generator for Lightning's Crackme #2.1 (fichier `key` à côté de l'exe).

Format : name \0 s1||s2 (2*len(name) octets non nuls) \0 padding..., taille EXACTE 0x100,
         dernier octet = 0x90 (nop) : il écrase le `ret` en 0x401261, cible du
         `call 0x401261` -> sans ça la routine de check n'est jamais exécutée.
Check  : name[i] == ((rol8(s2[i], c) ^ ror8(s2[i+p], c)) + c) & 255, c = p - i
Usage  : lightning21-solve.py [--name petik] [-o key] [-q] [--check KEYFILE]
"""
import argparse, sys

rol = lambda v, c: ((v << (c & 7)) | (v >> (8 - (c & 7)))) & 255
ror = lambda v, c: rol(v, 8 - (c & 7))

def make(name: bytes) -> bytes:
    p = len(name)
    s1, s2 = bytearray(p), bytearray(p)
    for i in range(p):
        c = p - i
        for a in range(0x21, 0x7f):
            b = rol(((name[i] - c) & 255) ^ rol(a, c), c)
            if 0x21 <= b < 0x7f:
                s1[i], s2[i] = a, b
                break
        else:
            raise SystemExit("pas de paire imprimable")
    body = name + b"\0" + bytes(s1) + bytes(s2) + b"\0"
    return body + b"A" * (0xff - len(body)) + b"\x90"

def check(data: bytes) -> bool:
    """Réimplémentation de 0x401100."""
    if len(data) != 0x100 or data[-1] != 0x90: return False
    buf = data + b"\0" * (0x100 - len(data))
    p = buf.index(0)
    q = buf.index(0, p + 1)
    if q - p - 1 != 2 * p: return False
    s = buf[p + 1:]
    return all(buf[i] == ((rol(s[i], p - i) ^ ror(s[i + p], p - i)) + p - i) & 255 for i in range(p))

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-o", "--out")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    if a.check:
        ok = check(open(a.check, "rb").read()); print("OK" if ok else "KO"); sys.exit(not ok)
    k = make(a.name.encode())
    assert check(k)
    if a.out: open(a.out, "wb").write(k)
    print(k.split(b"\0")[1].decode() if a.q else k[:k.index(0, k.index(0)+1)+1])
