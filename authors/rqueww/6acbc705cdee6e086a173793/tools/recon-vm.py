#!/usr/bin/env python3
"""Recon : extrait et désassemble le bytecode de la mini-VM de hash d'AegisShield."""
import struct, sys
M = (1 << 64) - 1
exe = open(sys.argv[1] if len(sys.argv) > 1 else '../original/AegisShield_crackme_1.exe', 'rb').read()
base = 0x140000000
# .rdata : VA 0x14003d000 ; raw offset lu dans les section headers
pe = struct.unpack_from('<I', exe, 0x3c)[0]
nsec = struct.unpack_from('<H', exe, pe + 6)[0]
optsz = struct.unpack_from('<H', exe, pe + 20)[0]
secs = []
for i in range(nsec):
    o = pe + 24 + optsz + 40 * i
    vs, va, rs, ro = struct.unpack_from('<IIII', exe, o + 8)
    secs.append((va, vs, ro))
def rd(va, n):
    rva = va - base
    for sva, vs, ro in secs:
        if sva <= rva < sva + max(vs, 1):
            return exe[ro + rva - sva: ro + rva - sva + n]
    raise ValueError(hex(va))
tbl = struct.unpack('<72Q', rd(0x14003F2B0, 72 * 8))
def lcg(x): return (0x5851F42D4C957F2D * x + 0x14057B7EF767814F) & M
s = 0xDDEBA5ECAFEF00D
code = []
for i in range(71):
    s = lcg(s)
    code.append(s ^ tbl[i + 1])
if __name__ == '__main__':
    for i, q in enumerate(code):
        print(f'{i:02d} {q:016x} op={q>>56:2d} dst={(q>>48)&0xff} src={(q>>40)&0xff} imm={q&0xffffffffff:#x}')
