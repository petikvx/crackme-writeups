#!/usr/bin/env python3
"""KRAKK v.10 SHA-1 edition (crackr, crackmes.de) — keygen : key = SHA-1(UTF-8(user)) en hex MAJUSCULES.

  krakk-sha1-solve.py [-q] [--check] [user]      (user par défaut : petik)
  --check : auto-test (vecteurs SHA-1 connus + format 40 hex majuscules)
"""
import argparse, hashlib, sys


def keygen(user: str) -> str:
    # Form1.Hash : SHA1Managed(Encoding.UTF8.GetBytes(user)), chaque octet formaté "X2"
    return hashlib.sha1(user.encode("utf-8")).hexdigest().upper()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        ok = (keygen("abc") == "A9993E364706816ABA3E25717850C26C9CD0D89D"
              and keygen("") == "DA39A3EE5E6B4B0D3255BFEF95601890AFD80709"
              and len(keygen(a.user)) == 40)
        print("check:", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    k = keygen(a.user)
    print(k if a.q else f"User : {a.user}\nKey  : {k}")


if __name__ == "__main__":
    main()
