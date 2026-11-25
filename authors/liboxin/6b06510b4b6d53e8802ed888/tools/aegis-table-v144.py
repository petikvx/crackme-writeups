#!/usr/bin/env python3
"""Déchiffre et affiche la table de pages du protecteur « aegis » v144
(liboxin, easy vm v2 / supervm_v144_full_5mb.exe).

Primitives relevées statiquement dans `.aegis` :

    mix(x)              = finaliseur splitmix64                      (sub_14001A3DD)
      x ^= x>>30 ; x *= 0xBF58476D1CE4E5B9
      x ^= x>>27 ; x *= 0x94D049BB133111EB
      x ^= x>>31
    keystream(k, i)     = mix(k ^ 0x9E3779B97F4A7C15 * i)            (sub_14005BDBB)
    seed (qword_1400620D8) = 0 tant que le self-hash de `.aegis` est bon ;
      remplacé par `rdtsc` dans sub_140019F0E en cas de tamper, ce qui casse
      définitivement le déchiffrement (anti-patch).

Le header AGIS (magic "AGIS", dans `.aegisd`) donne :

    +0x14 u32  nombre de pages
    +0x18 u32  rva de la table de pages, chiffrée avec mix(hdr+0x4c ^ hdr+0x68)
    +0x28/+0x2c  rva/taille d'un gros blob (~1.3 Mo) dans `.aegisd`
    +0x40/+0x44  rva/compte d'une seconde table (17 entrées)
    +0x4c u32  sel du self-hash
    +0x60/+0x64  rva/compte de la table de constructeurs
    +0x68 u64  self-hash FNV-1a attendu de `.aegis` (0x49000 octets)
    +0x84/+0x88  rva/taille d'une région *chiffrée de `.aegis` lui-même*
    +0x90/+0x94  rva/taille de `.aeg`

Chaque entrée de la table fait 32 octets :

    +0x00 u64 key   +0x08 u32 rva   +0x0c u32 size
    +0x10 u64 k2    +0x18 u32 flags +0x1c u32 k3

et la clé de page est, d'après sub_14001AB40 (0x14001ab56..0x14001ab68) :

    pagekey = mix(key ^ k2 ^ (u32)k3) ^ seed

Usage: aegis-table-v144.py original/supervm_v144_full_5mb.exe
"""
import struct, sys

M = (1 << 64) - 1
GOLDEN = 0x9E3779B97F4A7C15

def mix(x):
    x &= M
    x ^= x >> 30; x = (x * 0xBF58476D1CE4E5B9) & M
    x ^= x >> 27; x = (x * 0x94D049BB133111EB) & M
    x ^= x >> 31
    return x

def xor_stream(buf, key):
    for i in range(0, len(buf), 8):
        k = mix(key ^ ((GOLDEN * (i >> 3)) & M))
        for j in range(min(8, len(buf) - i)):
            buf[i + j] ^= (k >> (8 * j)) & 0xFF

def main(path):
    d = open(path, 'rb').read()
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    nsec = struct.unpack_from('<H', d, pe + 6)[0]
    sect = pe + 24 + struct.unpack_from('<H', d, pe + 20)[0]

    def rva2off(r):
        for i in range(nsec):
            vs, va, rs, ro = struct.unpack_from('<IIII', d, sect + i * 40 + 8)
            if va <= r < va + max(vs, rs):
                return r - va + ro

    h = d.index(b'AGIS')
    cnt = struct.unpack_from('<I', d, h + 0x14)[0]
    tabrva = struct.unpack_from('<I', d, h + 0x18)[0]
    f4c = struct.unpack_from('<I', d, h + 0x4c)[0]
    f68 = struct.unpack_from('<Q', d, h + 0x68)[0]

    print("header AGIS @ file %#x" % h)
    for off, sz, lbl in [(0x14, 4, 'pages'), (0x18, 4, 'table rva'),
                         (0x28, 4, 'blob rva'), (0x2c, 4, 'blob size'),
                         (0x40, 4, 'table2 rva'), (0x44, 4, 'table2 cnt'),
                         (0x4c, 4, 'sel self-hash'), (0x60, 4, 'ctors rva'),
                         (0x64, 4, 'ctors cnt'), (0x68, 8, 'self-hash .aegis'),
                         (0x84, 4, '.aegis chiffré rva'), (0x88, 4, '.aegis chiffré size'),
                         (0x90, 4, '.aeg rva'), (0x94, 4, '.aeg size')]:
        v = struct.unpack_from('<Q' if sz == 8 else '<I', d, h + off)[0]
        print("  +%#04x = %#-14x %s" % (off, v, lbl))

    tabkey = mix(f4c ^ f68)
    print("\nclé de la table = %#x" % tabkey)
    tab = bytearray(d[rva2off(tabrva):rva2off(tabrva) + cnt * 32])
    xor_stream(tab, tabkey)

    print("\n %s" % ("idx key              rva     size   k2               flags      k3         pagekey"))
    for i in range(cnt):
        key, rva, size, k2, flags, k3 = struct.unpack_from('<QIIQII', tab, i * 32)
        print(" %2d  %016x %#07x %#06x %016x %#010x %#010x %016x"
              % (i, key, rva, size, k2, flags, k3, mix(key ^ k2 ^ k3)))
    print("\nLes rva/size couvrent `.text` (0x1000-0x8000) et les sections `.sNN`"
          "\n(0x12000-0x18000) : `.text` est donc chiffré, et les 10 « fonctions »"
          "\nque Hex-Rays y voit sont du chiffré mal interprété.")

if __name__ == '__main__':
    main(sys.argv[1])
