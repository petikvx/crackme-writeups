#!/usr/bin/env python3
"""Coder_90's Crack It! — RSA jouet : le texte saisi, lu comme entier big-endian m,
doit vérifier m^65537 mod n == c.

n est factorisable (4 premiers) -> d = e^-1 mod phi(n), m = c^d mod n.
Usage : crack-it-solve.py [-q] [--check]
"""
import argparse

N = 2630492240428669223384232383096338562137
E = 65537
C = 1601640017009476007754247816372425531056
FACTORS = [98317, 5628631, 189985006751, 25019942076868181]


def solve():
    prod = 1
    phi = 1
    for p in FACTORS:
        prod *= p
        phi *= p - 1
    assert prod == N
    d = pow(E, -1, phi)
    return pow(C, d, N)


def password():
    m = solve()
    return m.to_bytes((m.bit_length() + 7) // 8, "big").decode("ascii")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    ap.add_argument("--check", action="store_true", help="vérifie m^e mod n == c")
    a = ap.parse_args()
    pw = password()
    if a.check:
        ok = pow(int.from_bytes(pw.encode(), "big"), E, N) == C
        print("OK" if ok else "KO")
        raise SystemExit(0 if ok else 1)
    print(pw if a.q else f"password = {pw}")


if __name__ == "__main__":
    main()
