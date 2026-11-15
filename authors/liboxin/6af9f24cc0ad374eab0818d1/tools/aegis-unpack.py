#!/usr/bin/env python3
"""Unpack statique du stub ".aegis" de vmcrack.protected.exe.

Usage: aegis-unpack.py <exe_protégé> <aegisd_live.bin> <out.exe>
aegisd_live.bin = dump mémoire de 0x14001d000..+0x1090 (table de pages déjà
déchiffrée par le stub) ; voir README.
"""
import struct, sys
M = (1 << 64) - 1
def mix(x):
    x ^= x >> 30; x = x * 0xbf58476d1ce4e5b9 & M
    x ^= x >> 27; x = x * 0x94d049bb133111eb & M
    return x ^ (x >> 31)
def ks(k, i):  # 0x14001aeee
    a = i * 0x9e3779b97f4a7c15 & M ^ k
    a = mix(a); a = (a + k) & M; a = mix(a); a ^= k
    a = (a + 0xd6e8feb86659fd93) & M
    a = ((a << 23) | (a >> 41)) & M
    a ^= k >> 7; a = a * 0xc2b2ae3d27d4eb4f & M
    return a ^ (a >> 29)
def main(exe, live, out):
    d = bytearray(open(exe, 'rb').read()); b = open(live, 'rb').read()
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    n = struct.unpack_from('<H', d, pe + 6)[0]; opt = struct.unpack_from('<H', d, pe + 20)[0]
    secs = [struct.unpack_from('<IIII', d, pe + 24 + opt + i * 40 + 8) for i in range(n)]
    def foff(rva):
        for vs, va, rs, ro in secs:
            if va <= rva < va + max(vs, rs): return ro + rva - va
    t = struct.unpack_from('<I', b, 0x6b8 + 0x18)[0] - 0x1d000
    cnt = struct.unpack_from('<I', b, 0x6b8 + 0x14)[0]
    for i in range(cnt):
        q0, rva, sz, q10, fl, d1c = struct.unpack_from('<QIIQII', b, t + i * 32)
        key = mix(q0 ^ q10 ^ d1c)          # [d084] == 0 à l'exécution
        o = foff(rva)
        for j in range(0, sz, 8):
            s = ks(key, j >> 3).to_bytes(8, 'little')
            for k in range(min(8, sz - j)): d[o + j + k] ^= s[k]
        print(f'page rva={rva:#x} size={sz:#x} déchiffrée')
    open(out, 'wb').write(d)
main(*sys.argv[1:4])
