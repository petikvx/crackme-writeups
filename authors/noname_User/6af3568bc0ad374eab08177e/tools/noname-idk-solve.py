#!/usr/bin/env python3
"""Solveur noname_User 'idk' (spidercff_crackme_x64.so).
Serial = 16 hex '-' 16 hex (33 car., '-' en position 16), passé en argv[1].
Usage : noname-idk-solve.py [-q] [--check ELF]   (pas de user : serial unique)"""
import argparse, subprocess, sys
M = (1 << 64) - 1
K = 0xbf58476d1ce4e5b9
Kinv = pow(K, -1, 1 << 64)
rol = lambda x, n: ((x << n) | (x >> (64 - n))) & M
ror = lambda x, n: rol(x, 64 - n)
# constantes de 0x44ca70(...) obtenues par émulation (tools/emu-consts.py)
A, B = 0xd7efe16dbc5bb020, 0x7dc1a562ae55e0e6
# chaîne de 4 ops (0x415410) : (xor c)*K / rol / (xor c)*K / ror
G1 = [('m', 0x9e3779b97f4a7c15), ('r', 17), ('m', 0xc3c3c3c3deadf00d), ('R', 31)]
G2 = [('m', 0x94d049bb133111eb), ('r', 23), ('m', 0x5ec1deadb00dc3c3), ('R', 23)]
def fwd(x, ops):
    for t, c in ops:
        x = ((x ^ c) * K) & M if t == 'm' else rol(x, c) if t == 'r' else ror(x, c)
    return x
def inv(y, ops):
    for t, c in reversed(ops):
        y = ((y * Kinv) & M) ^ c if t == 'm' else ror(y, c) if t == 'r' else rol(y, c)
    return y
def solve():
    r12 = 0xc3c3c3c35ec1dead
    x1 = inv((r12 - A) & M, G1)
    t = inv((0xdeadc0decafebabe - B) & M, G2)
    x2 = t ^ r12
    return '%016x-%016x' % (x1, x2)
def check(elf):
    s = solve()
    ok = subprocess.run([elf, s], capture_output=True, text=True)
    ko = subprocess.run([elf, s[:-1] + ('0' if s[-1] != '0' else '1')], capture_output=True, text=True)
    print('OK :', ok.returncode, ok.stdout.strip()); print('KO :', ko.returncode, ko.stdout.strip())
    return ok.returncode == 0 and 'GRANTED' in ok.stdout and ko.returncode != 0
if __name__ == '__main__':
    p = argparse.ArgumentParser(); p.add_argument('-q', action='store_true'); p.add_argument('--check')
    a = p.parse_args()
    if a.check: sys.exit(0 if check(a.check) else 1)
    print(solve() if a.q else 'serial : ' + solve())
