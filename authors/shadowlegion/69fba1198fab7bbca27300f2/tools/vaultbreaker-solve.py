#!/usr/bin/env python3
"""VaultBreaker (ShadowLegion) -- keygen.

MainWindow::CheckPassword(const QString&) :
    accepte uniquement si len(password) == 10 et
    password_utf8 == bytes(kEncoded[i] ^ 0x5A for i in range(10))

kEncoded (.rodata, @0x5818 dans le binaire) = 15 2a 69 34 09 69 29 3b 37 3f
XOR 0x5A -> "Op3nS3same"

Usage : vaultbreaker-solve.py [-q]
"""
import argparse

K_ENCODED = bytes.fromhex("152a69340969293b373f")


def password() -> str:
    return bytes(b ^ 0x5A for b in K_ENCODED).decode()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    pw = password()
    print(pw if a.q else f"mot de passe = {pw}")


if __name__ == "__main__":
    main()
