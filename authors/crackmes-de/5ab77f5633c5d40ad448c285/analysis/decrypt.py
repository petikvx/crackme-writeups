#!/usr/bin/env python3
"""Déchiffre (XOR 0xFF) la zone 0x401287..0x40131D du binaire dé-UPXé, comme le fait WinMain au démarrage."""
import struct, sys
src = sys.argv[1] if len(sys.argv) > 1 else "HyperCrackme2.unpacked.exe"
dst = sys.argv[2] if len(sys.argv) > 2 else "HyperCrackme2.decrypted.exe"
d = bytearray(open(src, "rb").read())
pe = struct.unpack_from("<I", d, 0x3C)[0]
sec = pe + 24 + struct.unpack_from("<H", d, pe + 20)[0]
for i in range(struct.unpack_from("<H", d, pe + 6)[0]):
    name, vs, va, rs, ro = struct.unpack_from("<8sIIII", d, sec + 40 * i)
    if name.startswith(b".text"):
        for a in range(0x401287, 0x40131E):
            d[a - 0x400000 - va + ro] ^= 0xFF
open(dst, "wb").write(d)
print("écrit", dst)
