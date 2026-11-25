#!/usr/bin/env python3
"""Keygen ray33ee shifty.exe : username -> serial XXXXXX-XXXXX-XXX-XX (hex).

Usage: shifty-solve.py [--user petik] [-q] [--check]
"""
import argparse, struct, subprocess, sys, os

M = (1 << 64) - 1
M32 = (1 << 32) - 1
EXE = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'original', 'shifty.exe')

def sbox_from_exe():
    d = open(EXE, 'rb').read()
    off = 0x11a00 + (0x1400140c0 - 0x140014000)   # .rdata, VA 0x1400140c0
    return list(d[off:off + 256])
SBOX = sbox_from_exe()
INV = [0] * 256
for i, v in enumerate(SBOX):
    INV[v] = i

def fnv1a(s):
    h = 0xcbf29ce484222325
    for b in s:
        h = ((h ^ b) * 0x100000001b3) & M
    return h

class Rng:  # splitmix64
    def __init__(s, st): s.s = st
    def next(s):
        s.s = (s.s + 0x9e3779b97f4a7c15) & M
        z = s.s
        z = ((z ^ (z >> 30)) * 0xbf58476d1ce4e5b9) & M
        z = ((z ^ (z >> 27)) * 0x94d049bb133111eb) & M
        return z ^ (z >> 31)

def rol(x, n): return ((x << n) | (x >> (64 - n))) & M
def fmix(h):
    h ^= h >> 16; h = (h * 0x85ebca6b) & M32
    h ^= h >> 13; h = (h * 0xc2b2ae35) & M32
    return h ^ (h >> 16)
def sh(a): return (a % 63) + 1

def op9(x):
    return ((x >> 40) & 0xff) | ((x >> 8) & 0xff00) | ((x >> 40) & 0xff0000) | ((x << 24) & M32) \
        | ((x >> 16) & 0xff00000000) | ((x << 16) & 0xff0000000000) \
        | ((x << 40) & 0xff000000000000) | ((x << 24) & 0xff00000000000000)
def op10(x):
    x = (x & 0xfffffffe07ffc0ff) | ((x << 19) & 0x1f8000000) | ((x >> 19) & 0x3f00)
    x = (x & 0xffffff03fffff81f) | ((x >> 29) & 0x7e0) | ((x << 29) & 0xfc00000000)
    return x
def op15(x):
    for s, m in ((1, 0x5555555555555555), (2, 0x3333333333333333), (4, 0x0f0f0f0f0f0f0f0f),
                 (8, 0x00ff00ff00ff00ff), (16, 0x0000ffff0000ffff)):
        x = ((x << s) & (~m & M)) | ((x >> s) & m)
    return rol(x, 32)
def sub_bytes(x, t):
    return sum(t[(x >> (8 * i)) & 0xff] << (8 * i) for i in range(8))

# permutations de bits (ops 9, 10, 15) : inverse par sondage bit à bit
def perm_inv(f):
    inv = {}
    for i in range(64):
        y = f(1 << i)
        assert y and y & (y - 1) == 0
        inv[y.bit_length() - 1] = i
    assert len(inv) == 64
    def g(y):
        r = 0
        for j in range(64):
            if (y >> j) & 1: r |= 1 << inv[j]
        return r
    return g
I9, I10, I15 = perm_inv(op9), perm_inv(op10), perm_inv(op15)

def fwd_op(i, x, a):
    if i == 0: return (x + a) & M
    if i == 1: return (x - a) & M
    if i == 2: return ((2 * a + 1) * x) & M
    if i == 3: return (-x) & M
    if i == 4: return ~x & M
    if i == 5: return x ^ a
    if i == 6: return (x * (2 * (a & M32) + 1) + (a >> 32)) & M
    if i == 7: return x ^ (x >> sh(a))
    if i == 8: return (x ^ (x << sh(a))) & M
    if i == 9: return op9(x)
    if i == 10: return op10(x)
    if i == 11: return sub_bytes(x, SBOX)
    if i == 12: return rol(x, 64 - 0x17)
    if i == 13: return rol(x, 7)
    if i == 14:
        hi, lo = x >> 32, x & M32
        f = fmix(lo ^ ((a & M32) ^ (a >> 32)))
        return (lo << 32) | (hi ^ f)
    if i == 15: return op15(x)
    if i == 16:
        hi, lo = x >> 32, x & M32
        hi = (hi + lo * ((a & M32) | 1)) & M32
        lo = (lo + hi * ((a >> 32) | 1)) & M32
        return (hi << 32) | lo

def inv_op(i, y, a):
    if i == 0: return (y - a) & M
    if i == 1: return (y + a) & M
    if i == 2: return (y * pow(2 * a + 1, -1, 1 << 64)) & M
    if i == 3: return (-y) & M
    if i == 4: return ~y & M
    if i == 5: return y ^ a
    if i == 6: return ((y - (a >> 32)) * pow(2 * (a & M32) + 1, -1, 1 << 64)) & M
    if i == 7:
        s = sh(a); x = y
        for _ in range(64 // s + 1): x = y ^ (x >> s)
        return x
    if i == 8:
        s = sh(a); x = y
        for _ in range(64 // s + 1): x = (y ^ (x << s)) & M
        return x
    if i == 9: return I9(y)
    if i == 10: return I10(y)
    if i == 11: return sub_bytes(y, INV)
    if i == 12: return rol(y, 0x17)
    if i == 13: return rol(y, 64 - 7)
    if i == 14:
        lo, r = y >> 32, y & M32
        f = fmix(lo ^ ((a & M32) ^ (a >> 32)))
        return ((r ^ f) << 32) | lo
    if i == 15: return I15(y)
    if i == 16:
        hi, lo = y >> 32, y & M32
        lo = (lo - hi * ((a >> 32) | 1)) & M32
        hi = (hi - lo * ((a & M32) | 1)) & M32
        return (hi << 32) | lo

PRE_ARG = 0x6d8c5a83e9463c96

def target_and_steps(user: bytes):
    r = Rng(fnv1a(user))
    target = r.next()
    steps = []
    for _ in range(10000):
        i = r.next() & 0xf
        steps.append((i, r.next()))
    return target, steps

def forward(x, user):
    t, steps = target_and_steps(user)
    x = fwd_op(16, x, PRE_ARG)
    for i, a in steps: x = fwd_op(i, x, a)
    return x, t

def keygen(user: bytes):
    t, steps = target_and_steps(user)
    y = t
    for i, a in reversed(steps): y = inv_op(i, y, a)
    y = inv_op(16, y, PRE_ARG)
    return y

def fmt(v):
    return '%06x-%05x-%03x-%02x' % (v >> 40, (v >> 20) & 0xfffff, (v >> 8) & 0xfff, v & 0xff)

def check_exe(user, serial):
    inp = f'{user}\n{serial}\n'
    out = subprocess.run(['xvfb-run', '-a', 'wine', EXE], input=inp, capture_output=True,
                         text=True, timeout=120, env={**os.environ, 'WINEDEBUG': '-all'}).stdout
    return out

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--user', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true', help='vérifie contre shifty.exe via wine')
    a = ap.parse_args()
    u = a.user.encode()
    assert 0 < len(u) <= 32
    v = keygen(u)
    assert forward(v, u)[0] == forward(v, u)[1]
    s = fmt(v)
    print(s if a.q else f'user={a.user} serial={s}')
    if a.check:
        out = check_exe(a.user, s)
        print(out)
        sys.exit(0 if 'keygen' in out else 1)
