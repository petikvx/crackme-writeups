#!/usr/bin/env python3
"""Keygen — crackmes.de's crackme_1 by rammy (RaMMy.exe, MASM + ASPack).

serial = 'R' + map(bytes LE de  4*sum*(fib(n)+1) + fib(200))   (n = sum, ou len si len > 19)
Usage : rammy1-solve.py [--name petik] [-q] [--check SERIAL]
"""
import argparse, struct

M = 0xFFFFFFFF

def fib(n):                      # 0x401702 : Fibonacci 32 bits (1,1,2,3...) puis >>1 tant que > 200, +1
    if n & M == 0:
        return 0x2c + 1
    a, b, c = 1, 1, 0
    for _ in range(n):
        c = (a + b) & M
        a, b = b, c
    while c > 200:
        c >>= 1
    return c + 1

def mapc(a):                     # 0x4016a8
    while True:
        if a < 0x30:
            a = (a * 3) & M
        elif a > 0x5a:
            a -= 0x59
        else:
            break
    if 0x3a <= a <= 0x40:
        a <<= 1
    return a & 0xff

def serial(name: str) -> str:
    nb = name.encode('latin-1')
    s = sum(nb)
    n = len(nb) if len(nb) > 0x13 else s
    fv = fib(n)
    v = (4 * ((s * (fv + 1)) & M) + fib(200)) & M     # boucle add + shl 2 + fib(0xc8)
    out = []
    for b in struct.pack('<I', v):
        if b == 0:
            break
        out.append(mapc(b))
    if len(out) == 4:
        raise SystemExit("valeur >= 2^24 : la chaîne déborde dans le buffer serial, nom non supporté")
    return 'R' + bytes(out).decode('latin-1')

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check')
    a = ap.parse_args()
    s = serial(a.name)
    if a.check is not None:
        ok = a.check == s
        print('OK' if ok else f'KO (attendu {s})'); raise SystemExit(0 if ok else 1)
    print(s if a.q else f'name={a.name}  serial={s}')
