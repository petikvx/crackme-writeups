#!/usr/bin/env python3
"""Keygen Obnoxious's KGM#2 (.NET).

Le serial dépend de SystemInformation.UserName + DoubleClickTime (ms),
PAS du champ Name. Exemple : python3 obnoxious-skgm2-solve.py --user petik
"""
import argparse
import hashlib


def serial(user: str, dct: int = 500) -> str:
    # getmd5 : b.ToString("") => octet en décimal, sans padding, concaténé
    h = "".join(str(b) for b in hashlib.md5((user + str(dct)).encode("ascii")).digest())
    n = len(user)
    s = h[n:n + 20].upper()
    if len(s) < 20:
        raise ValueError("username trop long / digest décimal trop court pour cet user")
    i = 4
    while i < len(s):          # la longueur de s grandit à chaque Insert
        s = s[:i] + "-" + s[i:]
        i += n
    return s


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", "--name", default="petik")
    ap.add_argument("--dct", type=int, default=500, help="DoubleClickTime (défaut Windows/Wine : 500)")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", help="serial à comparer")
    a = ap.parse_args()
    s = serial(a.user, a.dct)
    if a.check is not None:
        ok = a.check == s
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    print(s if a.q else f"user={a.user} dct={a.dct} serial={s}")


if __name__ == "__main__":
    main()
