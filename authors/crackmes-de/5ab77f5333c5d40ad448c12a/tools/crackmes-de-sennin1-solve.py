#!/usr/bin/env python3
"""Solveur seNNin #1 (crackmes.de / sennin, MASM).

Serial = 10 caractères, buffer 0x403124 lu en 3 dwords :
  1. len == 10   : bswap((len ^ 0xDB) + 0x23) + 0x456F == 0xF400456F
  2. d0 = s[0:4] : ((((bswap(d0) + 0x6C6F7665) ^ 0x111) >> 2) + 0x35000035) ^ 0x393E7733 == d0
  3. d1 = s[4:8] : (sar(rol(d1,4),3)) & 0x45F == 0x40E
  4. s[8] == s[9] et s[8] + s[9] == 0x42  ->  '!!'

Usage : solve.py            -> imprime un serial (YES_G200!!)
        solve.py --check S  -> vérifie S
        solve.py --all      -> d0 possibles (brute force imprimable)
"""
import itertools, struct, sys

M = 0xFFFFFFFF
def bswap(x): return struct.unpack('<I', struct.pack('>I', x))[0]
def f0(d0): return ((((bswap(d0) + 0x6C6F7665) & M ^ 0x111) >> 2) + 0x35000035 & M) ^ 0x393E7733
def sar(x, n): return ((x - (1 << 32) if x >> 31 else x) >> n) & M
def rol(x, n): return ((x << n) | (x >> (32 - n))) & M

def check(s: bytes) -> bool:
    n = len(s)
    if not (0 < n <= 10): return False
    if (bswap(((n ^ 0xDB) + 0x23) & M) + 0x456F) & M != 0xF400456F: return False
    d0, d1 = struct.unpack('<II', s[:8])
    return f0(d0) == d0 and sar(rol(d1, 4), 3) & 0x45F == 0x40E and s[8] == s[9] and s[8] + s[9] == 0x42

def first_d1():
    for t in itertools.product(b'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ', repeat=4):
        b = bytes(t)
        if sar(rol(struct.unpack('<I', b)[0], 4), 3) & 0x45F == 0x40E: return b

if __name__ == '__main__':
    if len(sys.argv) > 2 and sys.argv[1] == '--check':
        ok = check(sys.argv[2].encode()); print('OK' if ok else 'KO'); sys.exit(0 if ok else 1)
    d0 = b'YES_'  # point fixe de f0 (brute force 94^4 -> YES_, mESR)
    assert f0(struct.unpack('<I', d0)[0]) == struct.unpack('<I', d0)[0]
    s = d0 + b'G200' + b'!!'
    assert check(s); print(s.decode())
