#!/usr/bin/env python3
"""Solveur oqra1 selfkey : le mot de passe est un point fixe de f(p)=blob^xor(p).
Usage : selfkey-solve.py [-q] [--check] [--all] [--bin PATH]"""
import argparse, os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "selfkey")

def blob(path):
    d = open(path, "rb").read()
    buf = bytearray(25)
    buf[0:16] = d[0x2060:0x2070]   # movups [rax], xmm0
    buf[9:25] = d[0x2070:0x2080]   # movups [rax+9], xmm0 (recouvre 9..15)
    return bytes(buf)

def fixed_points(buf):
    """k = XOR(p) et p = buf^k  =>  XOR(buf) ^ k == k (25 octets, impair) => XOR(buf)==0."""
    x = 0
    for c in buf: x ^= c
    if x: return []
    return [bytes(c ^ k for c in buf) for k in range(256)]

def printable(p): return all((c < 128 and chr(c).isalnum()) or c == 0x5f for c in p)  # [A-Za-z0-9_]

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    ap.add_argument("--all", action="store_true"); ap.add_argument("--bin", default=BIN)
    a = ap.parse_args()
    sols = fixed_points(blob(a.bin))
    if not sols: sys.exit("aucune solution")
    pw = next(p for p in sols if printable(p))
    if a.all:
        for p in sols:
            if printable(p): print(p.decode())
        return
    print(pw.decode() if a.q else f"password = {pw.decode()}")
    if a.check:
        r = subprocess.run([a.bin, pw.decode()], capture_output=True, text=True)
        print(r.stdout.strip()); sys.exit(0 if "cracked" in r.stdout else 1)

main()
