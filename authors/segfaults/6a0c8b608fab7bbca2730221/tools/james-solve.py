#!/usr/bin/env python3
"""Jame's Cybersecurity Company (segfaults) — mot de passe pour un utilisateur.

password(user) = base64( bin( XOR(toupper(c) for c in user) ) )
  - bin() : écriture binaire MSB-first sans zéros de tête, "0" si le XOR vaut 0
  - base64 : alphabet standard A-Za-z0-9+/ avec padding '='
Le tri intermédiaire (std::sort) est sans effet sur un XOR.
Admin (bannière "YOU CRACKED!") : username exactement `john_doe`.

Usage : james-solve.py [user] [-q] [--list]
"""
import argparse, base64

USERS = ["will_smith", "marcus_vane", "john_doe", "jomes_sandin",
         "sarah_jenkins", "franklin_sierra"]

def password(user: str) -> str:
    x = 0
    for c in user.upper().encode():
        x ^= c - 256 if c > 127 else c   # char signé étendu en int
    bits = "0" if x == 0 else bin(x & 0xFFFFFFFF)[2:]
    return base64.b64encode(bits.encode()).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("user", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--list", action="store_true", help="database.jsonc users")
    a = ap.parse_args()
    if a.list:
        for u in USERS:
            print(f"{u:16} {password(u)}")
        return
    p = password(a.user)
    print(p if a.q else f"user={a.user}\npass={p}")

if __name__ == "__main__":
    main()
