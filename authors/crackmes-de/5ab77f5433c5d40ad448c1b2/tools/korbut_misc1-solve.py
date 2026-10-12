#!/usr/bin/env python3
"""korbut_misc._crackme_1 : reconstruit les 3 conditions d'enregistrement."""
import struct
def build(start, deltas):                 # chaînes construites octet par octet (mov/add/sub bl)
    r = [start]
    for x in deltas: r.append((r[-1] + x) & 0xFF)
    return bytes(r)
ror = lambda x, n: ((x >> n) | (x << (32 - n))) & 0xFFFFFFFF
rol = lambda x, n: ror(x, 32 - n)
keyfile = build(0x5F, [-0x14, -6, 0xE, -8, 0xE, -0x18])
compname = build(0x5B, [-0x3B, 0x32, -9, -3, -0x26, 0x12, 0x39, -0x38, -0x13, 0x3D])
d1 = ror(0x61687C76, 1) ^ 0x17891789      # rol(d1 ^ k, 1) == 0x61687C76
d2 = rol(0x4A787167, 0x17) ^ 0x89891717   # ror(d2 ^ k, 0x17) == 0x4A787167
clip = struct.pack('<II', d1, d2)
print('fichier  :', keyfile.decode(), '(attributs = 0x20, archive seul)')
print('clipboard:', repr(clip.decode('cp1252')), clip.hex())
print('ComputerName commence par :', compname.decode())
