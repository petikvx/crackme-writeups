#!/usr/bin/env python3
"""razkom_v1.1 : keygen / solveur (pas de user : clé unique, 'petik' sans objet).

Validateur (0x1400010e0) : 6 groupes XXX-, avec c3 = (c1+c2)%26+'A' et c3 imposé (R,A,Z,K,O,M).
Le 1er char de chaque groupe est libre pour le validateur ; le message (XOR clé[i%23]) ne
devient lisible que pour une seule clé. On la retrouve par plaintext connu.

  python3 razkom-solve.py [-q] [--check [razkom_v1.1.exe]]
"""
import sys, argparse

FIXED = "RAZKOM"
TABLE_OFF, TABLE_LEN = 0x1930, 0x7f  # VMA 0x140003330
KNOWN = b"Congratulations!\nYou solved"  # 27 octets >= 23 : fixe toute la clé


def valid(k: str) -> bool:
    if len(k) != 23 or any(k[i] != '-' for i in (3, 7, 11, 15, 19)):
        return False
    for g in range(6):
        a, b, c = (ord(x) for x in k[4*g:4*g+3])
        if (a + b) % 26 + 65 != c or c != ord(FIXED[g]):
            return False
    return True


def keygen(table: bytes) -> str:
    kb = bytes(table[i] ^ KNOWN[i] for i in range(23))
    return kb.decode()


def decrypt(table: bytes, k: str) -> str:
    return bytes(table[i] ^ ord(k[i % 23]) for i in range(TABLE_LEN)).decode()


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="original/razkom_v1.1.exe")
    a = ap.parse_args()
    # table : extraite de l'exe si fourni (zip -> exe dézippé), sinon constante embarquée
    TABLE = bytes.fromhex(
        "112e3c4a3320355836202e44242f380c451820586d32223e373749612c380d3c28285e3f61285f2e222440286f47"
        "022d374c322461413f357a402e61204320366f5a25203972383d58613529422f2632596b2e2d0d26356f442361"
        "393a24724e2e2c2c483435290341122e4e3d243b0d3a2e3f367b720a03001b62150a1b0a")
    if a.check:
        TABLE = open(a.check, "rb").read()[TABLE_OFF:TABLE_OFF+TABLE_LEN]
    key = keygen(TABLE)
    assert valid(key), "clé rejetée par le modèle du validateur"
    assert not valid("AAA-AAA-AAA-AAA-AAA-AAA")
    msg = decrypt(TABLE, key)
    assert "BAZOOKA" in msg
    print(key)
    if not a.q:
        print(msg)
