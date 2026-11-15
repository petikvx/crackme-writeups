#!/usr/bin/env python3
"""Solveur Tenzo Crackme (main @ 0x140003da0) : inverse la boucle de check 13 octets.

Usage : tenzo-crackme-solve.py [-q] [--check <TenzoCrackme.exe>]
(pas de user/login : mot de passe unique)
"""
import argparse, struct, subprocess, sys

A = struct.pack('<IIIB', 0x87654321, 0x4f3d2b19, 0x84736251, 0x95)  # [rbp-0x59]
B = struct.pack('<IIIB', 0xb3ac1de9, 0x22dcb5e6, 0x86f8a093, 0x56)  # [rbp-0x19]

def solve() -> str:
    out = bytearray()
    for i in range(13):
        x = B[i] ^ ((0xa5 - 7 * i) & 0xff)
        x = ((x << 5) | (x >> 3)) & 0xff          # inverse de ror 5
        x = (x - (i + 3) * 0x11) & 0xff
        out.append(x ^ A[i])
    return out.decode()

def forward(pw: str) -> bool:
    r = 0
    for i, c in enumerate(pw.encode()):
        d = c ^ A[i]
        d = (d + ((i + 3) * 0x11)) & 0xff
        d = ((d >> 5) | (d << 3)) & 0xff
        d ^= (0xa5 - 7 * i) & 0xff
        d ^= B[i]
        r |= d
    return len(pw) == 13 and r == 0

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', metavar='EXE', help='lance le binaire sous xvfb-run wine')
    a = ap.parse_args()
    pw = solve()
    assert forward(pw)
    print(pw if a.q else f'password = {pw}')
    if a.check:
        p = subprocess.run(['xvfb-run', '-a', 'wine', a.check], input=pw + '\n\n',
                           capture_output=True, text=True, timeout=60)
        ok = 'Access granted' in p.stdout
        print('check:', 'OK' if ok else 'KO', file=sys.stderr)
        sys.exit(0 if ok else 1)
