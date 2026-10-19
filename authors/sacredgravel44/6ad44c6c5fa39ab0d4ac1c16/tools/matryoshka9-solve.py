#!/usr/bin/env python3
"""
sacredgravel44's matryoshka9 (crackmes.one 6ad44c6c5fa39ab0d4ac1c16)
-- PAS RESOLU, mis de cote (voir analysis/NOTES.md pour le detail complet).

Ce script ne retrouve PAS le serial. Il reproduit seulement la couche 1
(dechiffrement) de sub_140001030 : un cipher ARX maison type Speck
(31 rounds, cle/tweak par bloc de 16 octets) qui decrypte ~1.1 Mo de
code en memoire au runtime (VirtualAlloc RWX). C'est ce code decrypte
(flatten + obfusque MBA) qui contient le VRAI check du serial (76
caracteres A-Za-z0-9), compare in fine a la constante
0x23030D333EA5FEC6 -- aucun inverse connu a ce jour.

Usage:
    ./matryoshka9-solve.py --dump-layer1 out.bin   # extrait+dechiffre la couche 1 depuis le .exe
"""
import argparse
import os
import struct

DEFAULT_BIN = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "matryoshka9_cmo.exe")
MASK = (1 << 64) - 1

# offsets (file == VA - 0x140000000, pas de relocation : image chargee a son adresse preferee)
ENC_BLOB_RVA = 0x17530
ENC_BLOB_SIZE = 0x10EBC3
K_LO = 0xA959D8AEE80DA2D8
K_HI = 0xF0B93CECCC1BAC30


def ror64(x, r):
    x &= MASK
    return ((x >> r) | (x << (64 - r))) & MASK


def decrypt(enc: bytes, k_lo=K_LO, k_hi=K_HI) -> bytes:
    """sub_140001030's decrypt loop, byte for byte (see NOTES.md)."""
    size = len(enc)
    out = bytearray(size)
    for j in range(0, size, 16):
        v11, v12 = k_lo, k_hi
        v13 = (j >> 4) ^ k_lo
        v14 = (((8 * (j >> 4)) ^ (j >> 4)) & MASK) ^ k_lo
        for k in range(0x1F):
            v12 = (k ^ (v11 + ror64(v12, 8))) & MASK
            v11 = v12 ^ ror64(v11, 61)
            v13 = (v11 ^ (v14 + ror64(v13, 8))) & MASK
            v14 = v13 ^ ror64(v14, 61)
        for m in range(16):
            v17 = m + j
            if v17 >= size:
                break
            v18 = 8 * m
            v19 = v13 if m >= 8 else v14
            if m >= 8:
                v18 -= 64
            out[v17] = enc[v17] ^ ((v19 >> v18) & 0xFF)
    return bytes(out)


def rva_to_file_offset(pe_bytes: bytes, rva: int) -> int:
    # .rdata section covers this RVA directly in this binary (verified via
    # IDA): PointerToRawData 0x16200, VirtualAddress 0x17000.
    SECTION_VA, SECTION_RAW = 0x17000, 0x16200
    return rva - SECTION_VA + SECTION_RAW


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--binary", default=DEFAULT_BIN, help="chemin du .exe")
    ap.add_argument("--dump-layer1", metavar="OUT", help="extrait+dechiffre la couche 1 et l'ecrit dans OUT")
    args = ap.parse_args()

    with open(args.binary, "rb") as f:
        raw = f.read()

    off = rva_to_file_offset(raw, ENC_BLOB_RVA)
    enc = raw[off: off + ENC_BLOB_SIZE]
    dec = decrypt(enc)

    # sanity check: offset 0x33 should be a valid x64 prologue
    # (push r15; push r14; push r13; push r12; push rsi; push rdi; push rbp;
    #  push rbx; sub rsp, 0x2D8)
    expected = bytes.fromhex("415741564155415456575553")
    ok = dec[0x33:0x33 + len(expected)] == expected
    print(f"[+] couche 1 dechiffree ({len(dec)} octets) ; prologue x64 valide a +0x33 : {ok}")

    if args.dump_layer1:
        with open(args.dump_layer1, "wb") as f:
            f.write(dec)
        print(f"[+] ecrit dans {args.dump_layer1}")

    print("[-] pas de solveur au-dela de cette couche -- voir analysis/NOTES.md")


if __name__ == "__main__":
    main()
