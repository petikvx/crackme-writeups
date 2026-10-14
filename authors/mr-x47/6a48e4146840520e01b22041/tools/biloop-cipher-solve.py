#!/usr/bin/env python3
"""Mr.X47's BiLoop Cipher — keygen username -> password.

Fonction de dérivation @ 0x1238 (binaire PIE strippé) :
  buf = copie(username)
  boucle 1 : i = 0,2,4,...  < len : buf[i] ^= K[i]
  boucle 2 : j = 0,3,6,...  < len : buf[j] ^= K[31-j]
  boucle 3 : tout octet non imprimable (signed c <= 0x20 ou c == 0x7f) -> '*'
  main : strcmp(buf, password) == 0 -> "Access Status: Success"
K = 32 octets à .rodata 0x2020.
Username : 8..32 caractères dans 0x21..0x7e ("petik" = 5 car. trop court -> défaut "petik123").

Usage : biloop-cipher-solve.py [--user NAME] [-q] [--check]
"""
import argparse, os, subprocess, sys

K = bytes.fromhex("161d191d04180007" "1c18081b031c0719" "1c14012006111a0c" "10110a110e14180f")
HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "BiLoop_Cipher")


def keygen(user: str) -> str:
    b = bytearray(user.encode())
    n = len(b)
    if not (8 <= n <= 32) or any(not (0x20 < c < 0x7f) for c in b):
        raise ValueError("username : 8..32 caractères ASCII 0x21..0x7e")
    for i in range(0, n, 2):
        b[i] ^= K[i]
    for j in range(0, n, 3):
        b[j] ^= K[31 - j]
    for k in range(n):
        if not (0x20 < b[k] < 0x7f):   # signed char <= 0x20 (inclut >= 0x80) ou 0x7f
            b[k] = 0x2a
    return b.decode()


def run(user, pw):
    p = subprocess.run([BIN], input=f"{user}\n{pw}\n".encode(), capture_output=True, timeout=10)
    return p.stdout.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik123")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = keygen(a.user)
    print(pw if a.q else f"username : {a.user}\npassword : {pw}")
    if a.check:
        bad = 0
        users = [a.user, "petikpetik", "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", "~~~~~~~~~~~~", "petik_crackmes.one"]
        for u in users:
            p = keygen(u)
            out = run(u, p)
            ok = "Success" in out
            bad += not ok
            print(f"[{'OK' if ok else 'FAIL'}] {u!r} / {p!r} -> {'Success' if ok else out.strip()[-40:]}")
        out = run(a.user, pw + "x")   # KO volontaire
        ko = "Failure" in out
        bad += not ko
        print(f"[{'OK' if ko else 'FAIL'}] {a.user!r} / {pw + 'x'!r} -> {'Failure (attendu)' if ko else out}")
        sys.exit(1 if bad else 0)


if __name__ == "__main__":
    main()
