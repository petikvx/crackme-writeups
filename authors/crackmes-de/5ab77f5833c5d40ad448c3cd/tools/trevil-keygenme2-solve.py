#!/usr/bin/env python3
"""Keygen trevil KeygenMe #2 (crackmes.de, PE32 GUI).

Serial (64 hex) = TEA(clé "Flying.....Horse", delta = B, sum0 = A) chiffré du nom
(complété par des \\0 jusqu'à 32 octets). Le binaire fait le déchiffrement et
compare avec lstrcmpA(nom).

  python3 trevil-keygenme2-solve.py            # nom petik
  python3 trevil-keygenme2-solve.py --user petik -q
  python3 trevil-keygenme2-solve.py --check    # auto-test (decrypt miroir du binaire)
"""
import argparse, struct

KEY = b"Flying.....Horse"
M = 0xFFFFFFFF
K = struct.unpack("<4I", KEY)


def f(v, s, ka, kb):
    return (((v << 4) + ka) ^ (v + s) ^ ((v >> 5) + kb)) & M


def enc_block(v0, v1, A, B):
    for i in range(31, -1, -1):          # inverse de la boucle 0x401753..0x40179a
        s = (A - i * B) & M
        v0 = (v0 + f(v1, s, K[0], K[1])) & M
        v1 = (v1 + f(v0, s, K[2], K[3])) & M
    return v0, v1


def dec_block(v0, v1, A, B):             # miroir de 0x401716
    s = A
    for _ in range(32):
        v1 = (v1 - f(v0, s, K[2], K[3])) & M
        v0 = (v0 - f(v1, s, K[0], K[1])) & M
        s = (s - B) & M
    return v0, v1


def keygen(user, A, B):
    assert 0 < len(user) <= 24 and "\0" not in user
    pt = user.encode().ljust(32, b"\0")
    out = ""
    for i in range(4):
        v0, v1 = struct.unpack_from("<2I", pt, 8 * i)
        v0, v1 = enc_block(v0, v1, A, B)
        out += "%08x%08x" % (v0, v1)     # chaque dword = 8 car. hex, MSB d'abord
    return out


def check(user, A, B, ser):
    pt = b""
    for i in range(4):
        v0 = int(ser[16 * i:16 * i + 8], 16)
        v1 = int(ser[16 * i + 8:16 * i + 16], 16)
        pt += struct.pack("<2I", *dec_block(v0, v1, A, B))
    return pt.split(b"\0")[0] == user.encode()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("--a", type=int, default=1234567890)
    ap.add_argument("--b", type=int, default=2654435769)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = keygen(a.user, a.a, a.b)
    if a.check:
        print("OK" if check(a.user, a.a, a.b, s) else "KO")
    elif a.q:
        print(s)
    else:
        print(f"Username: {a.user}\nField A : {a.a:010d}\nField B : {a.b:010d}\nSerial  : {s}")
