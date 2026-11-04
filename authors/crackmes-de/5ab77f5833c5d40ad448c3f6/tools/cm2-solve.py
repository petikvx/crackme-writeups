#!/usr/bin/env python3
"""Keygen pour cm2 (lagalopex, crackmes.de) : ./cm2 <name> <A> <B>

  python3 cm2-solve.py [name] [-q] [--check path/to/cm2]
Défaut name = petik.
"""
import argparse, subprocess, sys

V = 0x1679AFCC          # clé XOR qui déchiffre le bloc 0x8048688..0x80487a0
M = 0xFFFFFFFF


def make_A(v=V):
    # binaire : v = (A << 15) | (~A >> 17)  (32 bits)
    lo17 = v >> 15                    # bits 0..16 de A
    hi15 = (~v) & 0x7FFF              # bits 17..31 de A = ~(v & 0x7fff)
    a = (hi15 << 17) | lo17
    assert (((a << 15) & M) | ((~a & M) >> 17)) == v
    return a


def name_state(name):
    b = [c - 256 if c > 127 else c for c in name.encode()]
    di, w = 1, 0
    for i in range(0x400):
        t = (di & 0xFFFF) + b[i % len(b)]
        r = t - 0xFB * int(t / 0xFB)  # idiv signé
        di = r
        r16 = r & 0xFFFF
        w = (w + r16) % 0xFB
    return di & 0xFFFF, w


def make_B(name):
    if len(name) <= 3:
        sys.exit("le nom doit faire > 3 caractères")
    s1, s2 = name_state(name)
    if s1 > 0xFF:
        sys.exit("s1 hors octet")
    b2 = 0                    # octet libre (256 solutions) ; on prend 0
    b1 = b2 ^ 0x8A
    b0 = s1 ^ b2
    b3 = s2 ^ b1
    p = (b3 << 24) | (b2 << 16) | (b1 << 8) | b0
    return (~p) & M


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check")
    a = ap.parse_args()
    A, B = make_A(), make_B(a.name)
    if a.q:
        print(A, B)
    else:
        print(f"name={a.name}  A={A}  B={B}\n./cm2 {a.name} {A} {B}")
    if a.check:
        o = subprocess.run([a.check, a.name, str(A), str(B)], capture_output=True, text=True)
        print("--- sortie binaire ---\n" + o.stdout, "rc=", o.returncode)
        sys.exit(0 if o.stdout.strip() else 1)


main()
