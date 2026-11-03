#!/usr/bin/env python3
"""Keygen KeyWizard 2 (Disasm Disease) : name -> serial.

Usage: keywizard2-solve.py [-q] [--check SERIAL] [NAME]   (défaut NAME = petik1 : "petik" fait 5 car., minimum 6)
serial = Base64( AES-256-CBC/PKCS7( name ) ), clé+IV = PBKDF2-HMAC-SHA1(name, Salt, 1000)[0:48]
(Rfc2898DeriveBytes .NET ; password = name, data = name). Nécessite `cryptography`.
"""
import argparse, base64, hashlib, sys
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

SALT = bytes([100, 86, 34, 53, 11, 224, 145, 123, 237, 213, 12, 124, 45, 65, 71, 127,
              135, 165, 234, 164, 127, 234, 231, 211, 10, 9, 114, 234, 44, 63, 75, 12])

def keygen(name: str) -> str:
    if len(name) < 6:
        raise ValueError("nom trop court (>= 6 caractères)")
    pw = name.encode("cp1252")          # Encoding.Default (ANSI) ; ASCII garanti
    kiv = hashlib.pbkdf2_hmac("sha1", pw, SALT, 1000, 48)   # GetBytes(32) puis GetBytes(16)
    p = padding.PKCS7(128).padder()
    data = p.update(pw) + p.finalize()
    enc = Cipher(algorithms.AES(kiv[:32]), modes.CBC(kiv[32:])).encryptor()
    return base64.b64encode(enc.update(data) + enc.finalize()).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik1")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="SERIAL")
    a = ap.parse_args()
    s = keygen(a.name)
    if a.check is not None:
        ok = s == a.check
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    print(s if a.q else f"name={a.name!r} serial={s!r}")

if __name__ == "__main__":
    main()
