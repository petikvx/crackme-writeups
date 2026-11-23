#!/usr/bin/env python3
"""crackme_l6_hard.exe (kamil123) : keygen name -> serial.

Le serial est constant (sortie de la VM, dérivée du hash 0x2b7f4dcc du nom) ;
le nom doit vérifier FNV1a(nom)+tail -> finalizer == 0x2b7f4dcc.
  l6-solve.py [--prefix petik] [-q] [--check <exe>]
"""
import argparse, itertools, string, subprocess, sys, os

M = 0xffffffff; P = 0x1000193; IP = pow(P, -1, 1 << 32)
TARGET = 0x2b7f4dcc
TAIL = bytes.fromhex('4b1ec3902a77d15f')   # qword @ 0x14000b530
SERIAL = '2774-8852-F1D9-648A'             # sortie VM (4 x u16 hex)

def fnv(s, h=0x811c9dc5):
    for c in s: h = ((h ^ c) * P) & M
    return h

def fin(x):
    x ^= x >> 16; x = x * 0x85ebca77 & M; x ^= x >> 13; x = x * 0xc2b2ae3d & M; return x ^ (x >> 16)

def inv_xs(x, s):
    r = x
    for _ in range(0, 32, s): r = x ^ (r >> s)
    return r

def name_hash(name):
    h = fnv(TAIL, fnv(name.encode()))
    h = (((h << 13) | (h >> 19)) & M) ^ 0xa5a5a5a5
    return fin((h - 0x61c88647) & M)

def state_needed():
    y = inv_xs(TARGET, 16); y = y * pow(0xc2b2ae3d, -1, 1 << 32) & M
    y = inv_xs(y, 13); y = y * pow(0x85ebca77, -1, 1 << 32) & M; y = inv_xs(y, 16)
    h = ((y + 0x61c88647) & M) ^ 0xa5a5a5a5
    h = ((h >> 13) | (h << 19)) & M
    for c in reversed(TAIL): h = ((h * IP) & M) ^ c
    return h

def make_name(prefix):
    S = state_needed(); al = string.ascii_letters + string.digits
    mid = fnv(prefix.encode()); fw = {}
    for t in itertools.product(al, repeat=3):
        s = ''.join(t); fw.setdefault(fnv(s.encode(), mid), s)
    for t in itertools.product(al, repeat=3):
        h = S
        for ch in reversed(t): h = ((h * IP) & M) ^ ord(ch)
        if h in fw: return prefix + fw[h] + ''.join(t)

def check(exe, name):
    for ser, want in ((SERIAL, 'SUCCESS'), (SERIAL[:-1] + 'B', 'FAILED')):
        out = subprocess.run(['xvfb-run', '-a', 'wine', exe], input=f'{name}\n{ser}\n\n'.encode(),
                             capture_output=True, timeout=60).stdout.decode(errors='replace')
        print(ser, '->', 'OK' if want in out else 'KO', want); 
        if want not in out: sys.exit(1)

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--prefix', default='petik'); ap.add_argument('-q', action='store_true')
    ap.add_argument('--check'); a = ap.parse_args()
    n = make_name(a.prefix); assert name_hash(n) == TARGET
    if a.q: print(n); print(SERIAL)
    else: print(f'name   = {n}\nserial = {SERIAL}')
    if a.check: check(a.check, n)
