#!/usr/bin/env python3
"""Dépaquette le protecteur « aegis » v144 (liboxin, easy vm v2).

Deux primitives, toutes deux présentes dans le stub en clair de `.aegis`
(0x19000–0x1c000, le reste de la section étant chiffré) :

    mix(x)        = finaliseur splitmix64                      (sub_14001A3DD)
    ks(c, i)      = keystream du protecteur, déjà vu sur
                    unpack me v1 / hellgate1 du même auteur

Le header AGIS (magic "AGIS" dans `.aegisd`) donne la table de pages ; elle est
chiffrée avec `mix(selfhash ^ hdr+0x4c)` et un keystream `mix(k ^ GOLDEN*i)`
(boucle lisible en clair en 0x1400191b4–0x140019216).

Chaque entrée fait 32 octets :

    +0x00 u64 key   +0x08 u32 rva   +0x0c u32 size
    +0x10 u64 k2    +0x18 u32 flags +0x1c u32 k3

et chaque page est déchiffrée avec `ks(mix(key ^ k2 ^ k3), i)` — la clé est
lue en asm dans sub_14001AB40 (0x14001ab56–0x14001ab68) :

    mov rcx, r8 ; xor rcx,[rbp+0x10] ; xor rcx,[rbp+0x1c] ; call mix ; xor rbx,[seed]

`seed` (qword_1400620D8) vaut 0 tant que le self-hash FNV-1a de `.aegis`
(0x49000 octets, trou en hdr+0x84/+0x88) vaut hdr+0x68 : c'est l'anti-patch,
un octet modifié et `sub_140019F0E` remplace le seed par `rdtsc`.

Usage: aegis-unpack-v144.py original/supervm_v144_full_5mb.exe analysis/supervm.unpacked.exe
"""
import struct, sys

M = (1 << 64) - 1
GOLDEN = 0x9E3779B97F4A7C15

def rol(x, n):
    return ((x << n) | (x >> (64 - n))) & M

def mix(x):                                   # sub_14001A3DD
    x &= M
    x ^= x >> 30; x = (x * 0xBF58476D1CE4E5B9) & M
    x ^= x >> 27; x = (x * 0x94D049BB133111EB) & M
    x ^= x >> 31
    return x

def ks(c, i):                                 # keystream des pages
    a = (i * GOLDEN) & M; a ^= c
    a ^= a >> 30; a = (a * 0xBF58476D1CE4E5B9) & M
    a ^= a >> 27; a = (a * 0x94D049BB133111EB) & M
    a ^= a >> 31
    a = (a + c) & M
    a ^= a >> 30; a = (a * 0xBF58476D1CE4E5B9) & M
    a ^= a >> 27; a = (a * 0x94D049BB133111EB) & M
    a ^= a >> 31
    a ^= c
    a = (a + 0xD6E8FEB86659FD93) & M
    a = rol(a, 23); a ^= c >> 7
    a = (a * 0xC2B2AE3D27D4EB4F) & M; a ^= a >> 29
    return a

def fnv1a(b):
    h = 0xCBF29CE484222325
    for c in b:
        h = ((h ^ c) * 0x100000001B3) & M
    return h

def xor_with(buf, key, gen):
    for i in range(0, len(buf), 8):
        k = gen(key, i >> 3)
        for j in range(min(8, len(buf) - i)):
            buf[i + j] ^= (k >> (8 * j)) & 0xFF

def main(src, dst):
    d = bytearray(open(src, 'rb').read())
    pe = struct.unpack_from('<I', d, 0x3c)[0]
    nsec = struct.unpack_from('<H', d, pe + 6)[0]
    sect = pe + 24 + struct.unpack_from('<H', d, pe + 20)[0]

    def rva2off(r):
        for i in range(nsec):
            vs, va, rs, ro = struct.unpack_from('<IIII', d, sect + i * 40 + 8)
            if va <= r < va + max(vs, rs):
                return r - va + ro

    h = d.index(b'AGIS')
    f4c = struct.unpack_from('<I', d, h + 0x4c)[0]
    f68 = struct.unpack_from('<Q', d, h + 0x68)[0]
    cnt = struct.unpack_from('<I', d, h + 0x14)[0]
    tabrva = struct.unpack_from('<I', d, h + 0x18)[0]
    print("AGIS @ %#x : %d pages, table rva %#x" % (h, cnt, tabrva))

    to = rva2off(tabrva)
    tab = bytearray(d[to:to + cnt * 32])
    xor_with(tab, mix(f4c ^ f68), lambda k, i: mix(k ^ ((GOLDEN * i) & M)))

    ok = 0
    for i in range(cnt):
        key, rva, size, k2, flags, k3 = struct.unpack_from('<QIIQII', tab, i * 32)
        off = rva2off(rva)
        page = bytearray(d[off:off + size])
        xor_with(page, mix(key ^ k2 ^ k3), ks)
        d[off:off + size] = page
        ok += 1
        print("  page %2d rva %#07x size %#06x flag %#010x" % (i, rva, size, flags))
    print("%d/%d pages déchiffrées" % (ok, cnt))
    open(dst, 'wb').write(bytes(d))
    print("écrit:", dst)

if __name__ == '__main__':
    main(sys.argv[1], sys.argv[2])
