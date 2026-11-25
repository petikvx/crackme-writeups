#!/usr/bin/env python3
"""SirCrackaLot v2 (TheSwedishLord) - keygen name -> XXXX-XXXX-XXXX-XXXX.

Usage: sircrackalot-solve.py [--name petik] [-q] [--check BIN]
--check BIN : lance le binaire (extrait du zip) avec name + clé et affiche la sortie.
Anti-debug du binaire : en exécution normale (pas de tracer, pas de lenteur rdtsc)
le "seed" vaut 0 ; c'est ce que suppose ce keygen.
"""
import argparse, subprocess, sys

M32 = 0xFFFFFFFF
MA = [(0x41c64e6d, 0x3039), (0xc2a29a69, 0xd3dc167e), (0x807dbcb5, 0xa70427df),
      (0xee067f11, 0xd6651c2c), (0xeba1483d, 0x0daa96f5), (0xd3dc57f9, 0xc21f1c8a),
      (0x9b355305, 0x3ead62fb), (0xcfdddf21, 0xcd1dcf18), (0x0ffa0f0d, 0xaf5aad71),
      (0xef1c5e89, 0x20da7756), (0x5ad7fe55, 0xafe533d7), (0xc8333031, 0x69acc4c4),
      (0x8d6072dd, 0x961bafad), (0x88fe3e19, 0x261eb2e2), (0xcb2c0ea5, 0x95933673)]


def rol16(x, n):
    x &= 0xFFFF
    return ((x << n) | (x >> (16 - n))) & 0xFFFF


def crc16_arc(data):  # table 0x5f60 = CRC-16/ARC (0xA001), init 0
    c = 0
    for b in data:
        c ^= b
        for _ in range(8):
            c = (c >> 1) ^ (0xA001 if c & 1 else 0)
    return c


def keygen(name, seed=0):
    nb = name.encode()
    n = len(nb)
    # seal 1 : hash FNV-like
    h = seed ^ 0xDEADBEEF
    for b in nb:
        h = (((h << 5) | (h >> 27)) & M32) ^ b
        h = (h * 0x1000193) & M32
    b8 = (n + ((h >> 16) ^ h)) & M32
    s1 = b8 & 0xFFFF
    # seal 2 : rol/add 16 bits
    si = s1
    for b in nb:
        si = rol16(si + b, 3)
    x = 0x1337 if (si ^ (seed & 0xFFFF)) == 0 else (si ^ seed) & 0xFFFF
    s2 = (x * pow(0x7a69, -1, 1 << 16)) & 0xFFFF
    # seed du shuffle : b = x ; b = b*31 + c ; ^ seed
    b = x
    for c in nb:
        b = (b * 31 + c) & M32
    b ^= seed
    arr = list(range(16))
    for i, (m, a) in zip(range(15, 0, -1), MA):
        j = ((((b * m) + a) & M32) >> 16) % (i + 1)
        arr[i], arr[j] = arr[j], arr[i]
    s3 = (sum(v * (k + 1) for k, v in enumerate(arr)) ^ x) & 0xFFFF
    # seal 4 : CRC16/ARC sur b8(16) | x | s3 (little endian), ^ seed
    data = b''.join(v.to_bytes(2, 'little') for v in (s1, x, s3))
    s4 = (crc16_arc(data) ^ seed) & 0xFFFF
    return '-'.join('%04X' % v for v in (s1, s2, s3, s4))


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check')
    a = ap.parse_args()
    k = keygen(a.name)
    print(k if a.q else f'name={a.name!r} key={k}')
    if a.check:
        r = subprocess.run([a.check], input=f'{a.name}\n{k}\n', capture_output=True, text=True, timeout=20)
        print(r.stdout, r.stderr, 'exit', r.returncode)
        sys.exit(r.returncode)
