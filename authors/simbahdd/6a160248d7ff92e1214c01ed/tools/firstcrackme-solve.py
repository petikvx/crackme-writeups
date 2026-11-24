#!/usr/bin/env python3
"""SimbaHDD's FirstCrackMe (.NET WinForms) — solveur.

Deux voies d'acceptation (Button1Click) :
  * longueur(text) == longueur(text2) ET text contient "crackme"
    (text2 = base64 XOR 90 décodé en UTF-8 -> 22 octets invalides -> 20 caractères U+FFFD)
  * ou égalité de hash/XOR/base64 avec text2 (inatteignable au clavier : U+FFFD).

Usage : firstcrackme-solve.py [-q] [--check]
"""
import argparse, base64, sys

B64 = "wYCPjY+Oi8aOgMqJl4mXjZqCko+Plg=="
KEY = 90


def target_len():
    raw = bytes(b ^ KEY for b in base64.b64decode(B64))
    # même décodage que Encoding.UTF8.GetString (octets invalides -> U+FFFD)
    return len(raw.decode("utf-8", "replace"))


def solve():
    n = target_len()
    s = "crackme"
    return s + "1" * (n - len(s))


def check(pw):
    return len(pw) == target_len() and "crackme" in pw


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = solve()
    if a.check:
        ok = check(pw) and not check(pw[:-1]) and not check("x" * len(pw))
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    print(pw if a.q else f"password (20 chars, contient 'crackme') : {pw}")


if __name__ == "__main__":
    main()
