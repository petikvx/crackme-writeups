#!/usr/bin/env python3
"""Copie de original/ avec en-tête PE nettoyé (Wine refuse l'original : champs d'en-tête volontairement corrompus).
Usage : fix-header.py <in.exe> <out.exe>   — l'original n'est jamais modifié ; le code .text est identique."""
import struct, sys
d = bytearray(open(sys.argv[1], 'rb').read())
pe = struct.unpack_from('<I', d, 0x3c)[0]; o = pe + 24
struct.pack_into('<H', d, pe + 22, 0x0022)          # Characteristics : EXE + large address aware
struct.pack_into('<I', d, o + 4, 0x7c00)            # SizeOfCode
struct.pack_into('<I', d, o + 8, 0x3000)            # SizeOfInitializedData
struct.pack_into('<I', d, o + 12, 0x1000)           # SizeOfUninitializedData
struct.pack_into('<I', d, o + 20, 0x1000)           # BaseOfCode
struct.pack_into('<Q', d, o + 72, 0x200000)         # SizeOfStackReserve
struct.pack_into('<Q', d, o + 80, 0x1000)           # SizeOfStackCommit
struct.pack_into('<I', d, o + 104, 0)               # LoaderFlags
struct.pack_into('<II', d, o + 112, 0, 0)           # DataDirectory[0] (export) bidon -> vide
struct.pack_into('<I', d, o + 112 + 8 + 4, 0x7b0)    # taille Import Directory (0xf07b0 -> 0x7b0)
struct.pack_into('<I', d, o + 112 + 16 + 4, 0x4e8)   # taille Resource Directory (0x94e8 -> 0x4e8)
# SizeOfRawData bidons : recalculés depuis les PointerToRawData successifs
nsec = struct.unpack_from('<H', d, pe + 6)[0]; sh = o + struct.unpack_from('<H', d, pe + 20)[0]
ptrs = [struct.unpack_from('<I', d, sh + 40 * i + 20)[0] for i in range(nsec)]
for i in range(nsec):
    if ptrs[i]:
        nxt = [p for p in ptrs[i + 1:] if p] + [len(d)]
        struct.pack_into('<I', d, sh + 40 * i + 16, nxt[0] - ptrs[i])
open(sys.argv[2], 'wb').write(d)
