#!/usr/bin/env python3
"""Keygen — rdg_simple_crackme_.net by rdgmax (crackmes.de, VB.NET).

serial = Sth(Se(nom)) :
  Se  = DES-CBC/PKCS7, clé = SHA1(ascii("5167449") sur 8 octets)[:8], IV = 12 44 16 EE 88 15 DD 41, puis Base64
  Sth = hex majuscule (2 chiffres) de chaque caractère du Base64

  python3 tools/rdg-simple-crackme-net-solve.py petik      -> 38396666356E424C31576F3D
  python3 tools/rdg-simple-crackme-net-solve.py --check    # couple de référence de l'auteur + messages
"""
import base64, hashlib, sys, warnings
warnings.filterwarnings("ignore")
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding

IV = bytes([18, 68, 22, 238, 136, 21, 221, 65])            # clsx() : Vector


def xb():                                                   # Form1.xb() : dernière affectation
    v = 67.56756756756756 + 50 * 421 * 85 + 632.0 + 124.0 - 8552.0 + 1213.0 - 61451.0 + 1215.0
    return round(v)                                         # Math.Round (banker's) -> 1722499


def des_key(k: str) -> bytes:                               # clsx.K setter
    buf = (k.encode("ascii") + b"\0" * 8)[:8]
    return hashlib.sha1(buf).digest()[:8]


def _des(key, data, enc):
    c = Cipher(algorithms.TripleDES(key * 3), modes.CBC(IV))  # 3DES k1=k2=k3 == DES
    if enc:
        p = padding.PKCS7(64).padder(); data = p.update(data) + p.finalize()
        e = c.encryptor(); return e.update(data) + e.finalize()
    d = c.decryptor(); out = d.update(data) + d.finalize()
    u = padding.PKCS7(64).unpadder(); return u.update(out) + u.finalize()


# K = xa+xb-xb+xa+xa-xb-100+52+xb-xa+xb+xb-xa+xa-xa-xa+xb  ->  3*xb - 48
K_SERIAL = str(3 * xb() - 48)                               # "5167449"


def keygen(name: str) -> str:
    b64 = base64.b64encode(_des(des_key(K_SERIAL), name.encode("utf-8"), True)).decode()
    return "".join(f"{ord(c):02X}" for c in b64)


if __name__ == "__main__":
    a = sys.argv[1:]
    if a and a[0] == "--check":
        ref = keygen("RDGMax")
        print("K =", K_SERIAL)
        print("RDGMax ->", ref, "(Form2 de l'auteur : 456D455A6866384A304E343D)", "OK" if ref == "456D455A6866384A304E343D" else "KO")
        km = des_key("100")
        for tag, m in (("GB70 (bon)", "h168Gn2DyqdEffQYNIHJflNhOCMMxavc"), ("GB94 (mauvais)", "U4Nfnl06d3CZySuEFgcD+w==")):
            print(tag, "=", _des(km, base64.b64decode(m), False).decode())
        print("petik ->", keygen("petik"))
        sys.exit(0 if ref == "456D455A6866384A304E343D" else 1)
    print(keygen(a[0] if a else "petik"))
