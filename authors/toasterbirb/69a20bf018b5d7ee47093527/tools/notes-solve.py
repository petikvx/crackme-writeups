#!/usr/bin/env python3
"""toasterbirb's notes — déchiffre un .note (sans mot de passe) et/ou trouve un mot de passe valide.

Format : [adler32(pass+"\n") u32 LE][données ^ ((i + key[i&3]) & 0xff)], key = les 4 octets d'en-tête.
Usage : notes-solve.py <fichier.note> [-q] [--pass]   (--pass : cherche un mot de passe collisionnant)
"""
import sys, struct, zlib
from functools import lru_cache

def decrypt(d):
    k = d[:4]
    return bytes(b ^ ((i + k[i & 3]) & 255) for i, b in enumerate(d[4:]))

def find_password(target, charset=b"abcdefghijklmnopqrstuvwxyz0123456789"):
    """Adler-32 du buffer fgets (mot de passe + '\\n'). Retourne un mot de passe (sans \\n)."""
    A, B = target & 0xFFFF, target >> 16
    for n in range(2, 31):                      # n = longueur du mot de passe, +1 pour '\n'
        L = n + 1
        sys.setrecursionlimit(10000)
        @lru_cache(None)
        def go(i, a, b):                         # a = 1+somme, b = somme des a successifs
            if i == n:
                a2 = a + 10; b2 = b + a2
                return b'' if (a2 % 65521 == A and b2 % 65521 == B) else None
            for c in charset:
                a2 = a + c; b2 = b + a2
                if a2 > A + 65521 or a2 > 65520 and False: continue
                if a2 + 10 + (n - i - 1) * 32 > 65520 + A: continue
                r = go(i + 1, a2, b2)
                if r is not None: return bytes([c]) + r
            return None
        r = go(0, 1, 0)
        if r is not None:
            assert zlib.adler32(r + b"\n") == target
            return r.decode()
    return None

def main():
    args = [a for a in sys.argv[1:] if not a.startswith("-")]
    q = "-q" in sys.argv
    d = open(args[0] if args else "notes/flag.note", "rb").read()
    out = decrypt(d)
    print(out.decode(errors="replace").rstrip("\n") if q else f"adler32 en-tête = {struct.unpack('<I', d[:4])[0]:#010x}\n{out.decode(errors='replace')}")
    if "--pass" in sys.argv:
        print(find_password(struct.unpack("<I", d[:4])[0]))

if __name__ == "__main__":
    main()
