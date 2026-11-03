#!/usr/bin/env python3
"""De-KryptZo [1nd2] (starzboy / iCU) — keygen des deux crackmes.

  kryptzo-solve.py 1 [-q] [--check SERIAL]
  kryptzo-solve.py 2 [-q] [--check S1 S2]

#2 : champs « Name » (serial1) et « Key » (serial2) ; aucun nom fixe imposé.
Le « bon » serial est celui qui donne la clé d'un déchiffrement 1 octet
(le code déchiffré doit être un MessageBox « Decryption Successfull »).
"""
import argparse, itertools, string

M = 0xFFFFFFFF
# 20 octets chiffrés (VA 0x401030 pour #1, 0x4013ac pour #2)
BLOB1 = bytes.fromhex("b44ab2a07a8a4ab2797a8a4a49bf5232cf4a4a4a")
BLOB2 = bytes.fromhex("8d238ba45363238b7d5363232298 2b0b8b232323".replace(" ", ""))
# code attendu une fois déchiffré (octet 16 = rel32 patché après coup, ignoré)
PLAIN1 = bytes.fromhex("6a006856304000682f304000ff7508e8") + b"\x59\0\0\0"
PLAIN2 = bytes.fromhex("6a006881304000685a304000ff7508e8") + b"\x54\0\0\0"
BUF2 = 0x40308C  # adresse du buffer serial de #2 (entre dans le hash via edx)


def b(x):
    return x & 0xFF


# ---------------------------------------------------------------- #1
def serial_byte1(s: bytes) -> int:
    dl, bl = 0x94, 0x64
    for al in s:
        cl = al
        bl ^= al
        al = b(al + bl)
        al = b(al + cl)
        al = b(al + 0x32)
        al ^= 0x35
        dl = b(dl + al)
        al = b(al - 0xF6)
        dl = b(dl + al)
    return dl


def key1_from_serial(s: bytes) -> int:
    h = b"%x" % serial_byte1(s)
    return b(h[0] + (h[1] if len(h) > 1 else 0))


C1 = b(-0x71 + 1 + 0x51 + 0x34 + 0x46 + 0x53 + 0x54 + 0x20 - 0x97 - 0x71)


def decrypt1(key):
    return bytes(b(x + C1 + key) for x in BLOB1)


def need_key1():
    return b(PLAIN1[0] - BLOB1[0] - C1)


# ---------------------------------------------------------------- #2
def hash2(s: bytes, off: int, c0: int, sub: bool, orv: bool, ebx_inc2: int):
    """une des deux boucles de hash (off=1/c0=0x3265 ; off=5/c0=0xff85)."""
    buf = s + b"\0" * 16
    edx = BUF2
    ecx = b32(c0 + 1)
    edx = b32(edx + ecx)
    ecx = b32(edx + ecx)
    ebx = 0
    for eax in range(len(s)):
        c = buf[eax + off]
        ebx = b32((c - 256 if c > 127 else c) + edx)
        ecx = b32(ecx + ebx)
        ecx = b32(ecx + ebx)
        ecx = b32(ecx * ebx)
        ecx = b32(ecx - eax) if sub else b32(ecx + eax)
        ecx = b32(ecx * eax)
        ebx = b32(ebx + ebx_inc2)
        ebx ^= 0x41256
        ecx = b32(ecx << 1)
        ecx = (ecx | 0x56C) if orv else (ecx ^ 0x56C)
        ebx &= 0x800000F
        ecx = b32(ecx + ebx)
    return ecx


def b32(x):
    return x & M


def combine2(s1: bytes, s2: bytes) -> bytes:
    edx = hash2(s1, 1, 0x3265, False, False, 1)
    ecx = hash2(s2, 5, 0xFF85, True, True, 2)
    r = b32(edx + ecx)
    p = b32(ecx * edx)
    r = b32(r + (edx ^ 0x25F65))
    r = b32(r + p)
    return b"%x" % r


C2 = b(0x32 + 1 + 0x71 - 0x65 + 0x95 + 0x9C)  # partie constante, 1ère boucle


def key2_from_text(t: bytes) -> int:
    n = len(t)
    bl = n & 0xFF
    key = 0
    for ch in t:
        al = ch
        al = b(al + 0x32)
        al = b(al + 1)
        al ^= 0x56
        al = b(al + 0x71)
        al = b(al - 0x65)
        al = b(al + 0x95)
        al = b(al + 0x9C)
        bl = b(bl << 5)
        al = b(al + bl)
        key = b(key + al)
        key = b(key + 0x91)
    return key


def decrypt2(key):
    # cl = key, puis [ebp-9] = key : +2*key
    c = b(-0x71 + 1 + 0x51 + 0x34 + 0x46 + 0x09 + 0x53 + 0x54 + 0x20 - 0x97 - 0x71)
    return bytes(b(x + c + 2 * key) for x in BLOB2)


def need_key2():
    """2*key doit valoir une constante mod 256 -> deux clés possibles (k, k^0x80)."""
    return [k for k in range(256) if decrypt2(k)[:16] == PLAIN2[:16]]


def ok1(s: bytes) -> bool:
    return decrypt1(key1_from_serial(s))[:16] == PLAIN1[:16]


def ok2(s1: bytes, s2: bytes) -> bool:
    t = combine2(s1, s2)
    return len(s1) > 3 and len(s2) > 3 and decrypt2(key2_from_text(t))[:16] == PLAIN2[:16]


def gen1():
    k = need_key1()
    alpha = string.ascii_letters + string.digits
    for n in range(1, 4):
        for tup in itertools.product(alpha, repeat=n):
            s = "".join(tup).encode()
            if key1_from_serial(s) == k:
                return s.decode()


def gen2(s1="petik-1"):
    """serial2 = 5 caractères libres (jamais hashés) + queue qui fixe la clé."""
    alpha = string.ascii_letters + string.digits
    for n in range(1, 4):
        for tup in itertools.product(alpha, repeat=n):
            s2 = "petik" + "".join(tup)
            if ok2(s1.encode(), s2.encode()):
                return s1, s2


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("which", choices=["1", "2"])
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="+")
    a = ap.parse_args()
    if a.which == "1":
        if a.check:
            r = ok1(a.check[0].encode())
            print("OK" if r else "KO")
            raise SystemExit(0 if r else 1)
        s = gen1()
        if a.q:
            print(s)
        else:
            print(f"clé attendue = {need_key1():#x}")
            print(f"serial #1 = {s}  (hex(dl)={serial_byte1(s.encode()):x})")
    else:
        if a.check:
            r = ok2(a.check[0].encode(), a.check[1].encode())
            print("OK" if r else "KO")
            raise SystemExit(0 if r else 1)
        s1, s2 = gen2()
        if a.q:
            print(s1, s2)
        else:
            print(f"clé attendue = {[hex(k) for k in need_key2()]}")
            print(f"serial1 = {s1}\nserial2 = {s2}\nhex = {combine2(s1.encode(), s2.encode()).decode()}")
