#!/usr/bin/env python3
"""rsame_v2 (rsacrackme2.exe) : serial tel que serial^65537 mod N == C (RSA-64).

N = 0x954338b7d20e11fd, e = 0x10001, C = 0x16069c61de505bd6 (immediates du binaire).
Factorisation de N (Pollard rho), d = e^-1 mod phi, serial = C^d mod N.

Usage : rsame-v2-solve.py [-q] [--check [chemin/rsacrackme2.exe]]
"""
import argparse, math, random, subprocess, sys

N = 0x954338B7D20E11FD
E = 0x10001
C = 0x16069C61DE505BD6


def is_prime(n):
    if n < 2:
        return False
    for p in (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37):
        if n % p == 0:
            return n == p
    d, s = n - 1, 0
    while d % 2 == 0:
        d //= 2
        s += 1
    for a in (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37):
        x = pow(a, d, n)
        if x in (1, n - 1):
            continue
        for _ in range(s - 1):
            x = x * x % n
            if x == n - 1:
                break
        else:
            return False
    return True


def rho(n):
    if n % 2 == 0:
        return 2
    while True:
        c = random.randrange(1, n)
        x = y = random.randrange(0, n)
        d = 1
        while d == 1:
            x = (x * x + c) % n
            y = (y * y + c) % n
            y = (y * y + c) % n
            d = math.gcd(abs(x - y), n)
        if d != n:
            return d


def factor(n, out=None):
    out = {} if out is None else out
    if n == 1:
        return out
    if is_prime(n):
        out[n] = out.get(n, 0) + 1
        return out
    d = rho(n)
    factor(d, out)
    factor(n // d, out)
    return out


def solve():
    f = factor(N)
    phi = 1
    for p, k in f.items():
        phi *= (p - 1) * p ** (k - 1)
    d = pow(E, -1, phi)
    return pow(C, d, N), f


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="original/rsacrackme2.exe")
    a = ap.parse_args()
    s, f = solve()
    assert pow(s, E, N) == C
    if a.q:
        print(s)
    else:
        print(f"N = {N} = {' * '.join(map(str, f))}\nserial = {s}")
    if a.check:
        for v in (s, s + 1):
            out = subprocess.run(["xvfb-run", "-a", "wine", a.check], input=f"{v}\n",
                                 capture_output=True, text=True).stdout
            print(v, "->", [l for l in out.splitlines() if "serial" in l.lower() and "Enter" not in l or "Correct" in l or "Wrong" in l])


if __name__ == "__main__":
    main()
