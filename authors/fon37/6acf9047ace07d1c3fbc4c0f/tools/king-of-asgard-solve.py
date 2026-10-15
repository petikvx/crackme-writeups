#!/usr/bin/env python3
"""King of Asgard (fon37) — solveur.

Binaire packé UPX ; après `upx -d`, la fonction de vérif (0x1200) fait :
    rol8(key[i % 37] ^ flag[i], 3) == target[i]   pour i in 0..52
key = "I_kN0w_Wh4T_K1nD_0F_g0d_I_Need_TO_B3e" (37 octets ; GCC a propagé key[0]='I'=0x49
en immédiat avant la boucle).
On inverse : flag[i] = ror8(target[i], 3) ^ key[i % 37].
"""
import struct, sys, pathlib

ELF = pathlib.Path(__file__).resolve().parent.parent / "analysis" / "crackme.unpacked"

def solve(data: bytes) -> str:
    ro = lambda va, n: data[va:va + n]          # .rodata : offset fichier == VA ici
    # clé : 32 octets @0x2090 puis qword "d_TO_B3e" écrit à +0x1d -> 37 octets
    #   (le "1" visible avant, @0x208f, est le dernier octet de la cible, écrasé ensuite)
    key = bytearray(ro(0x2090, 0x20)) + bytearray(0x05)
    key[0x1d:0x25] = struct.pack("<Q", 0x6533425f4f545f64)
    key = key[:37]
    # cible : 48 octets @0x2060 puis qword 0xc958122179310ac0 écrit à +0x2d -> 53 octets
    tgt = bytearray(ro(0x2060, 0x30)) + bytearray(5)
    tgt[0x2d:0x35] = struct.pack("<Q", 0xc958122179310ac0)
    tgt = tgt[:53]
    ror = lambda b, r: ((b >> r) | (b << (8 - r))) & 0xFF
    out = []
    for i, t in enumerate(tgt):
        out.append(ror(t, 3) ^ key[i % 37])
    return bytes(out).decode()

if __name__ == "__main__":
    print(solve(ELF.read_bytes()))
