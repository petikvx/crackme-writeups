#!/usr/bin/env python3
"""Keygen KKR Keygenme#1 (2015, MASM32) — crackmes.one 5ab77f5533c5d40ad448c22d.

Nom (octets c_1..c_n) :
  s1 = sum c_i            s2 = sum (c_i*i) ^ i            s3 = s1 + s2        (0x40115D)
Serial "X-Y-Z" en hexa (chiffres 0-9, A-F majuscules) -> mots 16 bits w0, w1, w2 (0x4011BA)
Test (0x40124C / 0x4012FD), tout modulo p = 499 (0x1F3) :
  (15 w0 + 18 w1 + 21 w2) = s1     (14 w0 + 17 w1 + 20 w2) = s2     (16 w0 + 18 w1 + 19 w2) = s3
=> système linéaire 3x3 inversible mod 499, solution unique (w0, w1, w2) dans [0, 498].

  ./kgm1-keygen.py petik
  ./kgm1-keygen.py --check petik 1A2-3B-4C
"""
import argparse, sys
P = 0x1F3
M = [[15, 18, 21], [14, 17, 20], [16, 18, 19]]

def name_sums(name):
    b = name.encode("latin-1")
    s1 = sum(b) & 0xFFFFFFFF
    s2 = sum((c * i) ^ i for i, c in enumerate(b, 1)) & 0xFFFFFFFF
    s3 = (s1 + s2) & 0xFFFFFFFF
    return s1 % P, s2 % P, s3 % P

def parse_serial(serial, words=(0, 0, 0, 0)):
    """Reproduit 0x4011BA : chaque groupe -> dword écrit en 0x403304 + 2k (seul le mot bas reste)."""
    w = list(words) + [0] * 4
    k = 0; acc = 0
    for ch in serial + "\0":
        c = ord(ch)
        if ch == "-" or ch == "\0":
            acc = (acc >> 4) & 0xFFFFFFFF
            w[k] = acc & 0xFFFF; w[k + 1] = (acc >> 16) & 0xFFFF
            k += 1; acc = 0
            if ch == "\0":
                break
            continue
        v = c - 0x30 if c <= 0x39 or c > 0x46 else c - 0x37   # 'A'..'F' -> 10..15, le reste : c-'0'
        acc = ((acc + v) << 4) & 0xFFFFFFFF
    return w[:3]

def m_values(w):
    return [sum((a * x) % P for a, x in zip(row, w)) % P for row in M]

def check(name, serial):
    return m_values(parse_serial(serial)) == list(name_sums(name))

def solve(n):
    # Gauss-Jordan mod P
    A = [row[:] + [n[i]] for i, row in enumerate(M)]
    for c in range(3):
        r = next(r for r in range(c, 3) if A[r][c] % P)
        A[c], A[r] = A[r], A[c]
        inv = pow(A[c][c], -1, P)
        A[c] = [(x * inv) % P for x in A[c]]
        for r in range(3):
            if r != c and A[r][c]:
                f = A[r][c]; A[r] = [(x - f * y) % P for x, y in zip(A[r], A[c])]
    return [A[i][3] for i in range(3)]

def keygen(name):
    return "-".join("%X" % x for x in solve(name_sums(name)))

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name"); ap.add_argument("serial", nargs="?")
    ap.add_argument("--check", action="store_true"); ap.add_argument("-q", action="store_true")
    a = ap.parse_args()
    if a.check:
        ok = check(a.name, a.serial or ""); print("OK" if ok else "KO"); sys.exit(0 if ok else 1)
    s = keygen(a.name)
    print(s if a.q else f"(s1, s2, s3) mod 499 = {name_sums(a.name)}\nserial = {s}")
