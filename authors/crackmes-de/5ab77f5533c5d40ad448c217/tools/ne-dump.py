#!/usr/bin/env python3
"""Dump NE (Win16) : segments -> analysis/segN.bin, relocations du segment 1 résolues via la table d'entrées
(appels far « 9A FFFF 0000 » vers la RTL Pascal du segment 3). Ensuite : ndisasm -b 16 analysis/seg1.bin"""
import struct, sys
f = sys.argv[1] if len(sys.argv) > 1 else 'original/SacredCrackme 5.0/SacredCrackme 5.0.exe'
d = open(f, 'rb').read(); ne = struct.unpack('<I', d[0x3c:0x40])[0]
nseg, segtab = struct.unpack('<H', d[ne+0x1c:ne+0x1e])[0], struct.unpack('<H', d[ne+0x22:ne+0x24])[0]
al = struct.unpack('<H', d[ne+0x32:ne+0x34])[0]
segs = []
for i in range(nseg):
    off, ln, fl, mn = struct.unpack('<HHHH', d[ne+segtab+8*i:ne+segtab+8*i+8]); segs.append((off << al, ln, fl))
    open(f'analysis/seg{i+1}.bin', 'wb').write(d[off << al:(off << al)+ln]); print(f'seg{i+1} file=0x{off<<al:x} len=0x{ln:x} flags=0x{fl:x}')
et = struct.unpack('<H', d[ne+4:ne+6])[0]; p = ne+et; o = 1; ents = {}
while d[p]:
    cnt, ind = d[p], d[p+1]; p += 2
    for _ in range(cnt):
        if ind == 0: o += 1; continue
        if ind == 0xff: fl, _, sg, off = struct.unpack('<BHBH', d[p:p+6]); p += 6
        else: fl, off = struct.unpack('<BH', d[p:p+3]); sg = ind; p += 3
        ents[o] = (sg, off); o += 1
base, ln, fl = segs[0]; r = base+ln; n = struct.unpack('<H', d[r:r+2])[0]
for i in range(n):
    st, rf, so, a, b = struct.unpack('<BBHHH', d[r+2+8*i:r+10+8*i])
    tgt = f'seg{a & 0xff}:{b:#x}' if a & 0xff != 0xff else 'seg%d:%#x (entry %#x)' % (*ents[b], b)
    print(f'  seg1+{so-1:#06x} call far -> {tgt}')
