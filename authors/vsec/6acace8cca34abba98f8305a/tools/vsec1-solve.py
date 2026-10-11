#!/usr/bin/env python3
"""VSEC Challenger No.1 — keygen (username -> serial 64 hex).

Algorithme reconstruit à partir de la trace dynamique du mini-interpréteur
(appels reflect sur math/big : Mul, Mod, Add, Exp, ModInverse, Xor, SetBytes)
+ 3 SHA-256 :

    p  = 2^256 - 2^32 - 977          (corps secp256k1)
    n  = ordre secp256k1
    q  = 2^255 - 19                  (corps Curve25519)
    S1 || S2 || S3 = 9a3f7c12e85b9144 2d6af10873be19c5 4e872bd9610fa35c   (24 octets décryptés)

    H   = int(SHA256(user || S1))
    F   = sum_{i=0..5} c_i * H^i  mod p        c = 1337c0de deadbeef cafebabe 8badf00d feedface dead10cc
    y   = (int(S2) + 435*len(user)) mod n
    T   = F^y mod p
    m   = int(S3 || user) mod q ;  W = T * m^-1 mod q
    e   = int((S1||S2)[4:12]) ^ 0x5a5a5a5a5a5a5a5a
    X   = W^e mod q
    V   = X * 0x133713371337 mod p
    R   = (V ^ int(S1||S2)) mod p              -> 32 octets big-endian
    R[0:8] ^= SHA256(user || "NIGHTMARE")[0:8]
    serial = hex(R)

Usage :
    python vsec1-solve.py [--user petik] [-q] [--check]
"""
from __future__ import annotations

import argparse
import hashlib
import subprocess
import sys
from pathlib import Path

P = 2**256 - 2**32 - 977
N = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141
Q = 2**255 - 19
S1 = bytes.fromhex("9a3f7c12e85b9144")
S2 = bytes.fromhex("2d6af10873be19c5")
S3 = bytes.fromhex("4e872bd9610fa35c")
SALT16 = S1 + S2
COEF = [0x1337C0DE, 0xDEADBEEF, 0xCAFEBABE, 0x8BADF00D, 0xFEEDFACE, 0xDEAD10CC]
TAG = b"NIGHTMARE"
EXE = Path(__file__).resolve().parents[1] / "original" / "VSEC_Challenger_No.1.exe"


def serial(user: str) -> str:
    u = user.encode()
    h = int.from_bytes(hashlib.sha256(u + S1).digest(), "big")
    f = sum(c * pow(h, i, P) for i, c in enumerate(COEF)) % P
    y = (int.from_bytes(S2, "big") + 435 * len(u)) % N
    t = pow(f, y, P)
    m = int.from_bytes(S3 + u, "big") % Q
    w = (t * pow(m, -1, Q)) % Q
    e = int.from_bytes(SALT16[4:12], "big") ^ 0x5A5A5A5A5A5A5A5A
    x = pow(w, e, Q)
    v = (x * 0x133713371337) % P
    r = ((v ^ int.from_bytes(SALT16, "big")) % P).to_bytes(32, "big")
    b = hashlib.sha256(u + TAG).digest()
    out = bytes(r[i] ^ b[i] if i < 8 else r[i] for i in range(32))
    return out.hex()


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true", help="n'affiche que le serial")
    ap.add_argument("--check", action="store_true", help="lance le binaire d'origine et vérifie [+] / [-]")
    a = ap.parse_args()
    if not 4 <= len(a.user) <= 32:
        print("username : 4..32 caractères attendus", file=sys.stderr)
        return 2
    s = serial(a.user)
    if a.q:
        print(s)
    else:
        print(f"user   : {a.user}\nserial : {s}")
    if a.check:
        out = subprocess.run([str(EXE), a.user, s], capture_output=True, timeout=60)
        # le « flag » imprimé après [+] est binaire : on ne montre que la 1re ligne
        first = (out.stdout or b"").split(b"\n")[0].decode("latin1", "replace").strip()
        print("exe    :", first, f"(exit {out.returncode})")
        return 0 if out.returncode == 0 else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
